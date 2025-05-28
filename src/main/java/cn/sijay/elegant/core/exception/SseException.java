package cn.sijay.elegant.core.exception;

import cn.sijay.elegant.core.base.BaseException;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * SSE异常
 *
 * @author sijay
 * @since 2025-05-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
public final class SseException extends BaseException {

    public SseException(String message) {
        super("SSE", message);
    }

    public SseException(String message, Object... args) {
        super("SSE", message, args);
    }

}
