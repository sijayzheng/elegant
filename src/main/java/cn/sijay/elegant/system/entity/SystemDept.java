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
 * SystemDept
 * 系统部门实体类
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
@Table("system_dept")
public class SystemDept extends BaseEntity {

    /**
     * id
     */
    @Id(keyType = KeyType.Auto)
    @NotNull
    @Column(value = "id", comment = "id")
    private Long id;

    /**
     * 部门名称
     */
    @ExcelProperty("部门名称")
    @Size(max = 50, message = "部门名称最大长度为{max}")
    @NotNull
    @Column(value = "name", comment = "部门名称")
    private String name;

    /**
     * 父部门id
     */
    @ExcelProperty("父部门id")
    @Column(value = "parent_id", comment = "父部门id")
    private Long parentId;

    /**
     * 祖级列表
     */
    @Column(value = "ancestors", comment = "祖级列表")
    private List<Long> ancestors;

    /**
     * 后代列表
     */
    @Column(value = "descendants", comment = "后代列表")
    private List<Long> descendants;

    /**
     * 排序
     */
    @ExcelProperty("排序")
    @Column(value = "sort", comment = "排序")
    private Integer sort;

    /**
     * 负责人
     */
    @ExcelProperty("负责人")
    @Column(value = "leader", comment = "负责人")
    private Long leader;

    /**
     * 联系电话
     */
    @ExcelProperty("联系电话")
    @Size(max = 11, message = "联系电话最大长度为{max}")
    @Column(value = "phone", comment = "联系电话")
    private String phone;

    /**
     * 邮箱
     */
    @ExcelProperty("邮箱")
    @Size(max = 100, message = "邮箱最大长度为{max}")
    @Column(value = "email", comment = "邮箱")
    private String email;

    /**
     * 启用
     */
    @ExcelProperty("启用")
    @Column(value = "enable", comment = "启用")
    private Boolean enable;

}
