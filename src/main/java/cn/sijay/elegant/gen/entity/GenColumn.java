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
@Table("gen_column")
public class GenColumn implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id(keyType = KeyType.Auto)
    @Column("id")
    private Long id;
    @Column("column_name")
    private String columnName;
    @Column("column_comment")
    private String columnComment;
    @Column("table_id")
    private Long tableId;
    @Column("pk")
    private Boolean pk;
    @Column("sort")
    private Integer sort;
    @Column("nullable")
    private Boolean nullable;
    @Column("length")
    private Long length;
    @Column("data_type")
    private String dataType;
    @Column("java_field")
    private String javaField;
    @Column("java_type")
    private JavaTypeEnum javaType;
    @Column("listable")
    private Boolean listable;
    @Column("editable")
    private Boolean editable;
    @Column("queryable")
    private Boolean queryable;
    @Column("exportable")
    private Boolean exportable;
    @Column("html_type")
    private HtmlTypeEnum htmlType;
    @Column("query_type")
    private QueryTypeEnum queryType;
    @Column("dict_type")
    private String dictType;

    @Column(ignore = true)
    private String getter;
}
