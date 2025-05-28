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

import java.util.List;

import cn.sijay.elegant.core.base.BaseEntity;

/**
 * SystemRole
 * 系统权限实体类
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
@Table("system_role")
public class SystemRole extends BaseEntity {

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
    @Size(max = 50, message = "编码最大长度为{max}")
    @NotNull
    @Column(value = "code", comment = "编码")
    private String code;

    /**
     * 名称
     */
    @ExcelProperty("名称")
    @Size(max = 50, message = "名称最大长度为{max}")
    @NotNull
    @Column(value = "name", comment = "名称")
    private String name;

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

    /**
     * 菜单
     */
    @ExcelProperty("菜单")
    @Column(value = "menus", comment = "菜单")
    private List<Long> menus;

    /**
     * 菜单树关联显示
     */
    @ExcelProperty("菜单树关联显示")
    @Column(value = "menu_check_strictly", comment = "菜单树关联显示")
    private Boolean menuCheckStrictly;

    /**
     * 部门
     */
    @ExcelProperty("部门")
    @Column(value = "departments", comment = "部门")
    private List<Long> departments;

    /**
     * 部门树关联显示
     */
    @ExcelProperty("部门树关联显示")
    @Column(value = "dept_check_strictly", comment = "部门树关联显示")
    private Boolean deptCheckStrictly;

    /**
     * 数据权限范围
     */
    @ExcelProperty("数据权限范围")
    @Size(max = 10, message = "数据权限范围最大长度为{max}")
    @Column(value = "data_scope", comment = "数据权限范围")
    private String dataScope;

}
