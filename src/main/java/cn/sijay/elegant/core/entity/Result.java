package cn.sijay.elegant.core.entity;

import com.mybatisflex.core.paginate.Page;
import lombok.*;
import org.springframework.http.HttpStatus;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

/**
 * Result
 *
 * @author sijay
 * @since 2025-05-21
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Result<T> implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private T data;
    private Integer code;
    private String message;
    private List<T> rows;
    private long total;

    public Result(List<T> rows, long total) {
        this.rows = rows;
        this.total = total;
        this.code = HttpStatus.OK.value();
        this.message = "查询成功";
    }

    public Result(Integer code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static <T> Result<T> of(Integer status, String message, T body) {
        return new Result<>(status, message, body);
    }

    public static <T> Result<T> of(Integer status, String message) {
        return of(status, message, null);
    }

    public static <T> Result<T> of(Integer status) {
        return of(status, "操作成功", null);
    }

    public static <T> Result<T> of(Page<T> page) {
        return new Result<>(page.getRecords(), page.getTotalRow());
    }

    public static <T> Result<T> of(List<T> rows) {
        return new Result<>(rows, rows.size());
    }

    public static Result<Void> fail(String message) {
        return of(HttpStatus.INTERNAL_SERVER_ERROR.value(), message);
    }

    public static <T> Result<T> success() {
        return of(HttpStatus.OK.value(), "操作成功");
    }

}


