package cn.sijay.elegant.core.base;

import com.mybatisflex.annotation.Column;
import lombok.Data;

/**
 * BaseLogicVersionEntity
 *
 * @author sijay
 * @since 2025-05-09
 */
@Data
public class BaseLogicVersionEntity extends BaseEntity {
    @Column(isLogicDelete = true)
    private Boolean deleted;
    @Column(version = true)
    private Long version;
}
