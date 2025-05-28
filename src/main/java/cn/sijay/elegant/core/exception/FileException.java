package cn.sijay.elegant.core.exception;

import cn.sijay.elegant.core.base.BaseException;

/**
 * 文件异常
 *
 * @author sijay
 * @since 2025-05-13
 */
public class FileException extends BaseException {

    public FileException(String message) {
        super("文件", message);
    }

    public FileException(String message, Object... args) {
        super("文件", message, args);
    }
}
