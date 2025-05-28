package cn.sijay.elegant.core.exception;

import cn.sijay.elegant.core.base.BaseException;

/**
 * ServiceException
 *
 * @author sijay
 * @since 2025-05-13
 */
public class ServiceException extends BaseException {
    public ServiceException(String message) {
        super("服务", message);
    }

    public ServiceException(String message, Object... args) {
        super("服务", message, args);
    }
}
