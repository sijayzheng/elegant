package cn.sijay.elegant.core.exception;

import cn.sijay.elegant.core.base.BaseException;

/**
 * 用户异常
 *
 * @author sijay
 * @since 2025-05-13
 */
public class UserException extends BaseException {
    public UserException(String message) {
        super("用户", message);
    }

    public UserException(String message, Object... args) {
        super("用户", message, args);
    }
}
