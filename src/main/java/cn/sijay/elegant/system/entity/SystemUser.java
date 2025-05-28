package cn.sijay.elegant.system.entity;

import cn.sijay.elegant.core.base.BaseEntity;
import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.time.LocalDate;
import java.util.List;

/**
 * SystemUser
 * 系统用户实体类
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
@Table("system_user")
public class SystemUser extends BaseEntity {

    /**
     * id
     */
    @Id(keyType = KeyType.Auto)
    @NotNull
    @Column(value = "id", comment = "id")
    private Long id;

    /**
     * 账号
     */
    @ExcelProperty("账号")
    @Size(max = 50, message = "账号最大长度为{max}")
    @NotNull
    @Column(value = "username", comment = "账号")
    private String username;

    /**
     * 部门
     */
    @ExcelProperty("部门")
    @Column(value = "dept_id", comment = "部门")
    private Long deptId;

    /**
     * 姓名
     */
    @ExcelProperty("姓名")
    @Size(max = 50, message = "姓名最大长度为{max}")
    @Column(value = "real_name", comment = "姓名")
    private String realName;

    /**
     * 邮箱
     */
    @ExcelProperty("邮箱")
    @Size(max = 100, message = "邮箱最大长度为{max}")
    @Column(value = "email", comment = "邮箱")
    private String email;

    /**
     * 手机号码
     */
    @ExcelProperty("手机号码")
    @Size(max = 11, message = "手机号码最大长度为{max}")
    @Column(value = "phone", comment = "手机号码")
    private String phone;

    /**
     * 性别
     */
    @ExcelProperty("性别")
    @Size(max = 10, message = "性别最大长度为{max}")
    @Column(value = "gender", comment = "性别")
    private String gender;

    /**
     * 头像
     */
    @ExcelProperty("头像")
    @Column(value = "avatar", comment = "头像")
    private Long avatar;

    /**
     * 密码
     */
    @JsonIgnore
    @Size(max = 60, message = "密码最大长度为{max}")
    @Column(value = "password", comment = "密码")
    private String password;

    /**
     * 角色
     */
    @Column(value = "roles", comment = "角色")
    private List<Long> roles;

    /**
     * 岗位
     */
    @Column(value = "posts", comment = "岗位")
    private List<Long> posts;

    /**
     * 模块
     */
    @Column(value = "modules", comment = "模块")
    private List<Long> modules;

    /**
     * 启用
     */
    @ExcelProperty("启用")
    @Column(value = "enable", comment = "启用")
    private Boolean enable;

    /**
     * 密码是否更改
     */
    @ExcelProperty("密码是否更改")
    @Column(value = "pwd_changed", comment = "密码是否更改")
    private Boolean pwdChanged;

    /**
     * 过期日期
     */
    @ExcelProperty("过期日期")
    @Column(value = "expiry_date", comment = "过期日期")
    private LocalDate expiryDate;

}
