package cn.sijay.elegant.core.base;

import cn.sijay.elegant.core.entity.Result;
import com.mybatisflex.core.paginate.Page;
import org.springframework.http.HttpStatus;

import java.util.List;

/**
 * BaseController
 *
 * @author sijay
 * @since 2025-05-21
 */
public class BaseController {
    public <T> Result<T> success(Page<T> page) {
        return Result.of(page);
    }

    public <T> Result<T> success(List<T> list) {
        return Result.of(list);
    }

    public <T> Result<T> success() {
        return Result.of(HttpStatus.OK.value());
    }

    public <T> Result<T> success(String message, T body) {
        return Result.of(HttpStatus.OK.value(), message, body);
    }

    public <T> Result<T> success(T body) {
        if (body instanceof String s) {
            return Result.of(HttpStatus.OK.value(), s, null);
        }
        return Result.of(HttpStatus.OK.value(), "操作成功", body);
    }

    public Result<String> of(Boolean flag, String opt) {
        return flag ? success(opt + "成功") : fail(opt + "失败");
    }

    public <T> Result<T> fail() {
        return Result.of(HttpStatus.INTERNAL_SERVER_ERROR.value());
    }

    public <T> Result<T> fail(String message) {
        return Result.of(HttpStatus.INTERNAL_SERVER_ERROR.value(), message);
    }
}
