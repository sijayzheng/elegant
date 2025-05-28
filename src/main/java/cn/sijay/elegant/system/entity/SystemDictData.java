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
 * SystemDictData
 * 系统字典数据实体类
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
@Table("system_dict_data")
public class SystemDictData extends BaseEntity {

    /**
     * id
     */
    @Id(keyType = KeyType.Auto)
    @NotNull
    @Column(value = "id", comment = "id")
    private Long id;

    /**
     * 字典
     */
    @ExcelProperty("字典")
    @NotNull
    @Column(value = "dict_id", comment = "字典")
    private Long dictId;

    /**
     * 标签
     */
    @ExcelProperty("标签")
    @Size(max = 100, message = "标签最大长度为{max}")
    @NotNull
    @Column(value = "label", comment = "标签")
    private String label;

    /**
     * 键值
     */
    @ExcelProperty("键值")
    @Size(max = 100, message = "键值最大长度为{max}")
    @NotNull
    @Column(value = "value", comment = "键值")
    private String value;

    /**
     * 排序
     */
    @ExcelProperty("排序")
    @Column(value = "sort", comment = "排序")
    private Integer sort;

    /**
     * 样式属性
     */
    @ExcelProperty("样式属性")
    @Size(max = 100, message = "样式属性最大长度为{max}")
    @Column(value = "class_name", comment = "样式属性")
    private String className;

    /**
     * 表格回显样式
     */
    @ExcelProperty("表格回显样式")
    @Size(max = 10, message = "表格回显样式最大长度为{max}")
    @Column(value = "show_type", comment = "表格回显样式")
    private String showType;

    /**
     * 是否默认
     */
    @ExcelProperty("是否默认")
    @Column(value = "default_value", comment = "是否默认")
    private Boolean defaultValue;

}
