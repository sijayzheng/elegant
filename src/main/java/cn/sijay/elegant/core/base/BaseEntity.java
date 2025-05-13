package cn.sijay.elegant.core.base;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * BaseEntity
 *
 * @author sijay
 * @since 2025-05-09
 */
@Data
public class BaseEntity {
    private Long createDept;
    private Long createBy;
    private LocalDateTime createTime;
    private Long updateBy;
    private LocalDateTime updateTime;

}
