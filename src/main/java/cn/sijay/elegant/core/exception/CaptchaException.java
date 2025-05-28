package cn.sijay.elegant.core.exception;

import cn.sijay.elegant.core.base.BaseException;

/**
 * 验证码异常
 *
 * @author sijay
 * @since 2025-05-13
 */
public class CaptchaException extends BaseException {
    public CaptchaException(String message) {
        super("验证码", message);
    }

    public CaptchaException(String message, Object... args) {
        super("验证码", message, args);
    }
}
