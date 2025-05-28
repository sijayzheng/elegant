package cn.sijay.elegant.auth.controller;

import cn.dev33.satoken.annotation.SaIgnore;
import cn.dev33.satoken.stp.StpUtil;
import cn.sijay.elegant.auth.entity.LoginParam;
import cn.sijay.elegant.auth.entity.LoginResult;
import cn.sijay.elegant.auth.entity.UserInfo;
import cn.sijay.elegant.auth.service.AuthService;
import cn.sijay.elegant.core.base.BaseController;
import cn.sijay.elegant.core.entity.Result;
import cn.sijay.elegant.system.entity.SystemUser;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * AuthController
 *
 * @author sijay
 * @since 2025-05-23
 */
@SaIgnore
@RequiredArgsConstructor
@RestController
@RequestMapping("/auth")
public class AuthController extends BaseController {
    private final AuthService authService;

    /**
     * 登录
     */
    @PostMapping("/login")
    public Result<LoginResult> login(@RequestBody LoginParam loginParam) {
        return success("登录成功", authService.login(loginParam));
    }

    /**
     * 退出
     */
    @PostMapping("/logout")
    public Result<String> logout() {
        StpUtil.logout();
        return success("退出成功");
    }

    /**
     * 获取用户信息
     */
    @GetMapping("/userinfo")
    public Result<UserInfo> userinfo() {
        UserInfo userInfo = new UserInfo();
        long id = StpUtil.getLoginIdAsLong();
        SystemUser systemUser = new SystemUser();
        systemUser.setId(id);
        userInfo.setUser(systemUser);
        userInfo.setRoles(new String[]{"admin"});
        userInfo.setPermissions(new String[]{"*"});

        return success(userInfo);
    }

    /**
     * 获取验证码
     */
    @GetMapping("/code")
    public Result<String> code() {
        return success("code");
    }
}
