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
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * LogOperate
 * 操作日志实体类
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
@Table("log_operate")
public class LogOperate implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @Id(keyType = KeyType.Auto)
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
     * 模块标题
     */
    @ExcelProperty("模块标题")
    @Size(max = 50, message = "模块标题最大长度为{max}")
    @Column(value = "title", comment = "模块标题")
    private String title;

    /**
     * 方法名称
     */
    @ExcelProperty("方法名称")
    @Size(max = 100, message = "方法名称最大长度为{max}")
    @Column(value = "method", comment = "方法名称")
    private String method;

    /**
     * 请求方式
     */
    @ExcelProperty("请求方式")
    @Size(max = 10, message = "请求方式最大长度为{max}")
    @Column(value = "request_method", comment = "请求方式")
    private String requestMethod;

    /**
     * 请求URL
     */
    @ExcelProperty("请求URL")
    @Size(max = 255, message = "请求URL最大长度为{max}")
    @Column(value = "url", comment = "请求URL")
    private String url;

    /**
     * 主机地址
     */
    @ExcelProperty("主机地址")
    @Size(max = 128, message = "主机地址最大长度为{max}")
    @Column(value = "ip", comment = "主机地址")
    private String ip;

    /**
     * 操作地点
     */
    @ExcelProperty("操作地点")
    @Size(max = 255, message = "操作地点最大长度为{max}")
    @Column(value = "location", comment = "操作地点")
    private String location;

    /**
     * 请求参数
     */
    @ExcelProperty("请求参数")
    @Size(max = 2000, message = "请求参数最大长度为{max}")
    @Column(value = "param", comment = "请求参数")
    private String param;

    /**
     * 返回参数
     */
    @ExcelProperty("返回参数")
    @Size(max = 2000, message = "返回参数最大长度为{max}")
    @Column(value = "result", comment = "返回参数")
    private String result;

    /**
     * 操作状态
     */
    @ExcelProperty("操作状态")
    @Column(value = "status", comment = "操作状态")
    private Integer status;

    /**
     * 错误消息
     */
    @ExcelProperty("错误消息")
    @Size(max = 2000, message = "错误消息最大长度为{max}")
    @Column(value = "error_msg", comment = "错误消息")
    private String errorMsg;

    /**
     * 操作时间
     */
    @ExcelProperty("操作时间")
    @Column(value = "time", comment = "操作时间")
    private LocalDateTime time;

    /**
     * 消耗时间
     */
    @ExcelProperty("消耗时间")
    @Column(value = "cost_time", comment = "消耗时间")
    private Long costTime;

    /**
     * 操作时间开始
     */
    @Column(ignore = true)
    private LocalDateTime timeStart;

    /**
     * 操作时间结束
     */
    @Column(ignore = true)
    private LocalDateTime timeEnd;

}
