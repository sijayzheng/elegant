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
 * SystemMessage
 * 系统消息实体类
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
@Table("system_message")
public class SystemMessage extends BaseEntity {

    /**
     * id
     */
    @Id(keyType = KeyType.Auto)
    @NotNull
    @Column(value = "id", comment = "id")
    private Long id;

    /**
     * 消息标题
     */
    @ExcelProperty("消息标题")
    @Size(max = 50, message = "消息标题最大长度为{max}")
    @NotNull
    @Column(value = "title", comment = "消息标题")
    private String title;

    /**
     * 消息类型
     */
    @ExcelProperty("消息类型")
    @Size(max = 10, message = "消息类型最大长度为{max}")
    @NotNull
    @Column(value = "type", comment = "消息类型")
    private String type;

    /**
     * 内容
     */
    @ExcelProperty("内容")
    @Size(max = 5000, message = "内容最大长度为{max}")
    @Column(value = "content", comment = "内容")
    private String content;

    /**
     * 状态
     */
    @ExcelProperty("状态")
    @Column(value = "closed", comment = "状态")
    private Boolean closed;

    /**
     * 发布人
     */
    @ExcelProperty("发布人")
    @Column(value = "publisher", comment = "发布人")
    private Long publisher;

    /**
     * 接收人
     */
    @ExcelProperty("接收人")
    @Column(value = "receiver", comment = "接收人")
    private List<Long> receiver;

}
