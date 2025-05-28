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
 * SystemMenu
 * 系统菜单实体类
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
@Table("system_menu")
public class SystemMenu extends BaseEntity {

    /**
     * id
     */
    @Id(keyType = KeyType.Auto)
    @NotNull
    @Column(value = "id", comment = "id")
    private Long id;

    /**
     * 父菜单id
     */
    @ExcelProperty("父菜单id")
    @Column(value = "parent_id", comment = "父菜单id")
    private Long parentId;

    /**
     * 菜单名称
     */
    @ExcelProperty("菜单名称")
    @Size(max = 50, message = "菜单名称最大长度为{max}")
    @NotNull
    @Column(value = "name", comment = "菜单名称")
    private String name;

    /**
     * 权限编码
     */
    @ExcelProperty("权限编码")
    @Size(max = 100, message = "权限编码最大长度为{max}")
    @NotNull
    @Column(value = "perms_code", comment = "权限编码")
    private String permsCode;

    /**
     * 排序
     */
    @ExcelProperty("排序")
    @Column(value = "sort", comment = "排序")
    private Integer sort;

    /**
     * 路由地址
     */
    @ExcelProperty("路由地址")
    @Size(max = 200, message = "路由地址最大长度为{max}")
    @Column(value = "path", comment = "路由地址")
    private String path;

    /**
     * 组件路径
     */
    @ExcelProperty("组件路径")
    @Size(max = 255, message = "组件路径最大长度为{max}")
    @Column(value = "component", comment = "组件路径")
    private String component;

    /**
     * 菜单类型
     */
    @ExcelProperty("菜单类型")
    @Size(max = 1, message = "菜单类型最大长度为{max}")
    @NotNull
    @Column(value = "type", comment = "菜单类型")
    private String type;

    /**
     * 是否外链
     */
    @ExcelProperty("是否外链")
    @Column(value = "external_link", comment = "是否外链")
    private Boolean externalLink;

    /**
     * 可缓存
     */
    @ExcelProperty("可缓存")
    @Column(value = "cacheable", comment = "可缓存")
    private Boolean cacheable;

    /**
     * 可显示
     */
    @ExcelProperty("可显示")
    @Column(value = "visible", comment = "可显示")
    private Boolean visible;

    /**
     * 启用
     */
    @ExcelProperty("启用")
    @Column(value = "enable", comment = "启用")
    private Boolean enable;

    /**
     * 菜单图标
     */
    @ExcelProperty("菜单图标")
    @Size(max = 100, message = "菜单图标最大长度为{max}")
    @Column(value = "icon", comment = "菜单图标")
    private String icon;

}
