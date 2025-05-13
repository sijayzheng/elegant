package cn.sijay.elegant.common.entity;

import com.mybatisflex.core.paginate.Page;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * PageQuery
 *
 * @author sijay
 * @since 2025-05-13
 */
@Data
public class PageQuery implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * 分页大小
     */
    private int size;
    /**
     * 当前页数
     */
    private int current;

    public <T> Page<T> build() {
        return Page.of(current == 0 ? 1 : current, size == 0 ? Integer.MAX_VALUE : size);
    }
}
