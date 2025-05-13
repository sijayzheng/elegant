package cn.sijay.elegant.gen.entity;

import cn.sijay.elegant.common.enums.HtmlTypeEnum;
import cn.sijay.elegant.common.enums.JavaTypeEnum;
import cn.sijay.elegant.common.enums.QueryTypeEnum;
import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * GenColumn
 *
 * @author sijay
 * @since 2025-05-09
 */

@Data
@Table("gen_table")
public class GenColumn implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id(keyType = KeyType.Auto)
    private Long id;
    private String columnName;
    private String columnComment;
    private Long tableId;
    private Boolean isPk;
    private Integer sort;
    private Boolean nullable;
    private Long length;
    private String dataType;
    private String javaField;
    private JavaTypeEnum javaType;
    private Boolean listable;
    private Boolean editable;
    private Boolean queryable;
    private Boolean exportable;
    private HtmlTypeEnum htmlType;
    private QueryTypeEnum queryType;
    private String dictType;

    @Column(ignore = true)
    private String getter;
}
