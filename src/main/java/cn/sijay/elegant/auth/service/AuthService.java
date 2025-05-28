package cn.sijay.elegant.auth.service;

import cn.dev33.satoken.stp.StpUtil;
import cn.sijay.elegant.auth.entity.LoginParam;
import cn.sijay.elegant.auth.entity.LoginResult;
import cn.sijay.elegant.auth.entity.LoginUser;
import cn.sijay.elegant.auth.helper.LoginHelper;
import cn.sijay.elegant.common.constants.RedisConstants;
import cn.sijay.elegant.common.util.*;
import cn.sijay.elegant.core.exception.LoginException;
import cn.sijay.elegant.log.entity.LogLogin;
import cn.sijay.elegant.system.entity.SystemUser;
import cn.sijay.elegant.system.service.SystemConfigService;
import cn.sijay.elegant.system.service.SystemRoleService;
import cn.sijay.elegant.system.service.SystemUserService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * AuthService
 *
 * @author sijay
 * @since 2025-05-26
 */
@Slf4j
@RequiredArgsConstructor
@Service
public class AuthService {
    private final SystemUserService systemUserService;
    private final SystemConfigService systemConfigService;
    private final SystemRoleService systemRoleService;

    public LoginResult login(LoginParam loginParam) {
        SystemUser user = systemUserService.getByUsername(loginParam.getUsername());
        if (user == null) {
            log.error("用户不存在");
            throw new LoginException("用户不存在");
        }
        if (!user.getEnable()) {
            log.error("用户已被禁用");
            throw new LoginException("用户已被禁用");
        }
        String username = user.getUsername();
        String errorKey = RedisConstants.PWD_ERR_CNT_KEY + username;
        int maxRetryCount = Integer.parseInt(systemConfigService.getValueByCode("passwordMaxRetryCount").orElse("5"));
        long lockTime = Long.parseLong(systemConfigService.getValueByCode("passwordLockTime").orElse("10"));
        // 获取用户登录错误次数，默认为0
        Integer errorNumber = RedisUtil.get(errorKey);
        errorNumber = errorNumber == null ? 0 : errorNumber;
        // 锁定时间内登录 则踢出
        if (errorNumber >= maxRetryCount) {
            recordLoginInfo(user, false, "密码输入错误" + maxRetryCount + "次，帐户锁定" + lockTime + "分钟");
            throw new LoginException("密码输入错误" + maxRetryCount + "次，帐户锁定" + lockTime + "分钟");
        }
        if (!BCrypt.checkpw(loginParam.getPassword(), user.getPassword())) {
            // 错误次数递增
            errorNumber++;
            RedisUtil.set(errorKey, errorNumber, lockTime * 60);
            // 达到规定错误次数 则锁定登录
            if (errorNumber >= maxRetryCount) {
                recordLoginInfo(user, false, "密码输入错误" + maxRetryCount + "次，帐户锁定" + lockTime + "分钟");
                throw new LoginException("密码输入错误" + maxRetryCount + "次，帐户锁定" + lockTime + "分钟");
            } else {
                // 未达到规定错误次数
                recordLoginInfo(user, false, "密码输入错误" + errorNumber + "次");
                throw new LoginException("密码输入错误" + errorNumber + "次");
            }
        }

        // 登录成功 清空错误次数
        RedisUtil.delete(errorKey);

        // 此处可根据登录用户的数据不同 自行创建 loginUser
        LoginUser loginUser = new LoginUser();
        loginUser.setId(user.getId());
        loginUser.setDeptId(user.getDeptId());
        loginUser.setUsername(user.getUsername());
//        loginUser.setMenuPermission(permissionService.getMenuPermission(user.getId()));
//        loginUser.setRolePermission(permissionService.getRolePermission(user.getId()));
//        if (!Objects.isNull(user.getDeptId())) {
//            loginUser.setDeptName(deptRepository.findById(user.getDeptId()).orElse(new SystemDept()).getName());
//        }
//        loginUser.setRoles(systemRoleService.listByIds(user.getRoles()));
        // 生成token
        LoginHelper.login(loginUser);
        recordLoginInfo(user, true, "登录成功");
        LoginResult result = new LoginResult();
        result.setAccessToken(StpUtil.getTokenValue());
        result.setExpireIn(StpUtil.getTokenTimeout());
        return result;
    }

    private void recordLoginInfo(SystemUser user, boolean successful, String msg) {
        LogLogin logLogin = new LogLogin();
        logLogin.setUserId(user.getId());
        logLogin.setUsername(user.getUsername());
        HttpServletRequest request = ServletUtil.getRequest();
        logLogin.setIp(HttpUtil.getIp(request));
//        logLogin.setLocation();
        logLogin.setBrowser(HttpUtil.getBrowser(request));
        logLogin.setOs(HttpUtil.getOs(request));
        logLogin.setSuccessful(successful);
        logLogin.setMsg(msg);
        logLogin.setTime(LocalDateTime.now());
        SpringUtil.getApplicationContext().publishEvent(logLogin);
    }
}
