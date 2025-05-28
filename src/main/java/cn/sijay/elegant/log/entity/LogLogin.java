package cn.sijay.elegant.log.entity;

import com.alibaba.excel.annotation.ExcelIgnoreUnannotated;
import com.alibaba.excel.annotation.ExcelProperty;
import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * LogLogin
 * 登录日志实体类
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
@Table("log_login")
public class LogLogin implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @Id(keyType = KeyType.Auto)
    @ExcelProperty("id")
    @NotNull
    @Column(value = "id", comment = "id")
    private Long id;

    /**
     * 用户id
     */
    @ExcelProperty("用户id")
    @NotNull
    @Column(value = "user_id", comment = "用户id")
    private Long userId;

    /**
     * 账号
     */
    @ExcelProperty("账号")
    @Size(max = 50, message = "账号最大长度为{max}")
    @NotNull
    @Column(value = "username", comment = "账号")
    private String username;

    /**
     * 登录ip
     */
    @ExcelProperty("登录ip")
    @Size(max = 128, message = "登录ip最大长度为{max}")
    @Column(value = "ip", comment = "登录ip")
    private String ip;

    /**
     * 登录地点
     */
    @ExcelProperty("登录地点")
    @Size(max = 255, message = "登录地点最大长度为{max}")
    @Column(value = "location", comment = "登录地点")
    private String location;

    /**
     * 浏览器类型
     */
    @ExcelProperty("浏览器类型")
    @Size(max = 100, message = "浏览器类型最大长度为{max}")
    @Column(value = "browser", comment = "浏览器类型")
    private String browser;

    /**
     * 操作系统
     */
    @ExcelProperty("操作系统")
    @Size(max = 50, message = "操作系统最大长度为{max}")
    @Column(value = "os", comment = "操作系统")
    private String os;

    /**
     * 登录状态
     */
    @ExcelProperty("登录状态")
    @Column(value = "successful", comment = "登录状态")
    private Boolean successful;

    /**
     * 提示消息
     */
    @ExcelProperty("提示消息")
    @Size(max = 255, message = "提示消息最大长度为{max}")
    @Column(value = "msg", comment = "提示消息")
    private String msg;

    /**
     * 时间
     */
    @ExcelProperty("时间")
    @Column(value = "time", comment = "时间")
    private LocalDateTime time;

    /**
     * 时间开始
     */
    @Column(ignore = true)
    private LocalDateTime timeStart;

    /**
     * 时间结束
     */
    @Column(ignore = true)
    private LocalDateTime timeEnd;

}
