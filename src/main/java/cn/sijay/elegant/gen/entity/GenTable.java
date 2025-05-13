package cn.sijay.elegant.gen.entity;

import com.mybatisflex.annotation.Column;
import com.mybatisflex.annotation.Id;
import com.mybatisflex.annotation.KeyType;
import com.mybatisflex.annotation.Table;
import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.util.List;

/**
 * GenTable
 *
 * @author sijay
 * @since 2025-05-09
 */
@Data
@Table("gen_table")
public class GenTable implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    @Id(keyType = KeyType.Auto)
    private Long id;
    private String tableName;
    private String tableComment;
    private String moduleName;
    private String className;
    private String classComment;
    private Boolean isTree;
    private Long parentMenuId;
    private String treeKey;
    private String treeLabel;
    private String treeParentKey;

    @Column(ignore = true)
    private List<GenColumn> columns;

    @Column(ignore = true)
    private GenColumn pk;
}
