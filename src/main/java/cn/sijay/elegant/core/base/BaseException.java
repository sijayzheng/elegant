package cn.sijay.elegant.core.base;

/**
 * BaseException
 *
 * @author sijay
 * @since 2025-05-13
 */
public class BaseException extends RuntimeException {
    public BaseException(String message) {
        super(message);
    }

    public BaseException(String type, String message) {
        super(type + "：" + message);
    }
}
