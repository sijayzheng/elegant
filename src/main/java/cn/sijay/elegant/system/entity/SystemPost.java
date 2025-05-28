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
 * SystemPost
 * 系统岗位实体类
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
@Table("system_post")
public class SystemPost extends BaseEntity {

    /**
     * id
     */
    @Id(keyType = KeyType.Auto)
    @NotNull
    @Column(value = "id", comment = "id")
    private Long id;

    /**
     * 名称
     */
    @ExcelProperty("名称")
    @Size(max = 50, message = "名称最大长度为{max}")
    @NotNull
    @Column(value = "name", comment = "名称")
    private String name;

    /**
     * 编码
     */
    @ExcelProperty("编码")
    @Size(max = 50, message = "编码最大长度为{max}")
    @NotNull
    @Column(value = "code", comment = "编码")
    private String code;

    /**
     * 部门id
     */
    @ExcelProperty("部门id")
    @NotNull
    @Column(value = "dept_id", comment = "部门id")
    private Long deptId;

    /**
     * 排序
     */
    @ExcelProperty("排序")
    @Column(value = "sort", comment = "排序")
    private Integer sort;

    /**
     * 启用
     */
    @ExcelProperty("启用")
    @Column(value = "enable", comment = "启用")
    private Boolean enable;

}
