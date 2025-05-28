package cn.sijay.elegant.core.exception;

import cn.sijay.elegant.core.base.BaseException;

/**
 * UtilException
 *
 * @author sijay
 * @since 2025-05-13
 */
public class UtilException extends BaseException {
    public UtilException(String message) {
        super("工具", message);
    }

    public UtilException(String message, Object... args) {
        super("工具", message, args);
    }
}
