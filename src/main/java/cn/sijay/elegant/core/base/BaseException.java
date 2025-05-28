package cn.sijay.elegant.core.base;

import cn.sijay.elegant.common.util.StringUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.slf4j.helpers.MessageFormatter;

import java.io.Serial;

/**
 * BaseException
 *
 * @author sijay
 * @since 2025-05-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
public class BaseException extends RuntimeException {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 所属模块
     */
    private String type;

    /**
     * 错误码
     */
    private String message;

    /**
     * 错误码对应的参数
     */
    private Object[] args;

    public BaseException(String type, String message) {
        this(type, message, null);
    }

    public BaseException(String message, Object[] args) {
        this(null, message, args);
    }

    public BaseException(String message) {
        this(null, message);
    }

    @Override
    public String getMessage() {
        String message = null;
        if (!StringUtil.isEmpty(this.message)) {
            message = MessageFormatter.arrayFormat(this.message, args).getMessage();
        }
        if (message == null) {
            message = message;
        }
        return message;
    }
}
