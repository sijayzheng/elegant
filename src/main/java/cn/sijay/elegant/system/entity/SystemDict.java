package cn.sijay.elegant.system.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

import cn.sijay.elegant.core.base.BaseEntity;

/**
 * SystemDict
 * 系统字典实体类
 *
 * @author sijay
 * @since 2025-05-23
 */
@ExcelIgnoreUnannotated
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Table("system_dict")
public class SystemDict extends BaseEntity {

    /**
     * id
     */
    @Id(keyType = KeyType.Auto)
    @NotNull
    @Column(value = "id", comment = "id")
    private Long id;

    /**
     * 编码
     */
    @ExcelProperty("编码")
    @Size(max = 100, message = "编码最大长度为{max}")
    @NotNull
    @Column(value = "code", comment = "编码")
    private String code;

    /**
     * 名称
     */
    @ExcelProperty("名称")
    @Size(max = 100, message = "名称最大长度为{max}")
    @NotNull
    @Column(value = "name", comment = "名称")
    private String name;

}
