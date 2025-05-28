package cn.sijay.elegant.core.exception;

import cn.sijay.elegant.core.base.BaseException;

/**
 * 登录异常
 *
 * @author sijay
 * @since 2025-05-13
 */
public class LoginException extends BaseException {
    public LoginException(String message) {
        super("登录", message);
    }

    public LoginException(String message, Object... args) {
        super("登录", message, args);
    }
}
