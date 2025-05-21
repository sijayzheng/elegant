package cn.sijay.elegant.core.base;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * BaseEntity
 *
 * @author sijay
 * @since 2025-05-09
 */
@Data
public abstract class BaseEntity implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    private Long createDept;
    private Long createBy;
    private LocalDateTime createTime;
    private Long updateBy;
    private LocalDateTime updateTime;

}
