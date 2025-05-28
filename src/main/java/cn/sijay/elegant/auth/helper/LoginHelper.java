package cn.sijay.elegant.auth.helper;

import cn.dev33.satoken.session.SaSession;
import cn.dev33.satoken.stp.StpUtil;
import cn.dev33.satoken.stp.parameter.SaLoginParameter;
import cn.sijay.elegant.auth.entity.LoginUser;
import cn.sijay.elegant.common.constants.UserConstants;
import cn.sijay.elegant.common.util.ConvertUtil;
import cn.sijay.elegant.core.exception.LoginException;
import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.ObjectUtils;

/**
 * LoginHelper
 *
 * @author sijay
 * @since 2025-05-27
 */
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class LoginHelper {

    public static final String LOGIN_USER = "loginUser";
    public static final String USER_NAME = "username";
    public static final String DEPT_ID = "deptId";
    public static final String DEPT_NAME = "deptName";

    /**
     * @param loginUser 登录用户信息
     */
    public static void login(LoginUser loginUser) {
        StpUtil.login(loginUser.getId(), new SaLoginParameter()
                .setExtra(USER_NAME, loginUser.getUsername())
                .setExtra(DEPT_ID, loginUser.getDeptId())
                .setExtra(DEPT_NAME, loginUser.getDeptName()));
        StpUtil.getTokenSession().set(LOGIN_USER, loginUser);
    }

    /**
     * 获取用户(多级缓存)
     */
    public static LoginUser getLoginUser() {
        SaSession session = StpUtil.getTokenSession();
        if (ObjectUtils.isEmpty(session)) {
            throw new LoginException("用户登录已过期");
        }
        return session.getModel(LOGIN_USER, LoginUser.class);
    }

    /**
     * 获取用户基于token
     */
    public static LoginUser getLoginUser(String token) {
        SaSession session = StpUtil.getTokenSessionByToken(token);
        if (ObjectUtils.isEmpty(session)) {
            throw new LoginException("用户登录已过期");
        }
        return session.getModel(LOGIN_USER, LoginUser.class);
    }

    /**
     * 获取用户id
     */
    public static Long getUserId() {
        return StpUtil.getLoginIdAsLong();
    }

    /**
     * 获取用户账户
     */
    public static String getUsername() {
        return getExtra(USER_NAME, String.class);
    }

    /**
     * 获取部门ID
     */
    public static Long getDeptId() {
        return getExtra(DEPT_ID, Long.class);
    }

    /**
     * 获取部门名
     */
    public static String getDeptName() {
        return getExtra(DEPT_NAME, String.class);
    }

    /**
     * 获取当前 Token 的扩展信息
     *
     * @param key 键值
     * @return 对应的扩展数据
     */
    private static <T> T getExtra(String key, Class<T> clazz) {
        return ConvertUtil.convert(StpUtil.getExtra(key), clazz);
    }

    /**
     * 是否为超级管理员
     *
     * @param userId 用户ID
     * @return 结果
     */
    public static boolean isSuperAdmin(Long userId) {
        return UserConstants.ADMIN_ROLE_ID.equals(userId);
    }

    /**
     * 是否为超级管理员
     *
     * @return 结果
     */
    public static boolean isSuperAdmin() {
        return isSuperAdmin(getUserId());
    }

    /**
     * 检查当前用户是否已登录
     *
     * @return 结果
     */
    public static boolean isLogin() {
        return StpUtil.isLogin();
    }

}

