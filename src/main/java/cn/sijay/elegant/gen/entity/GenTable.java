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
    @Column("id")
    private Long id;
    @Column("table_name")
    private String tableName;
    @Column("table_comment")
    private String tableComment;
    @Column("module_name")
    private String moduleName;
    @Column("class_name")
    private String className;
    @Column("class_comment")
    private String classComment;
    @Column("tree_show")
    private Boolean treeShow;
    @Column("parent_menu_id")
    private Long parentMenuId;
    @Column("tree_key")
    private String treeKey;
    @Column("tree_label")
    private String treeLabel;
    @Column("tree_parent_key")
    private String treeParentKey;

    @Column(ignore = true)
    private List<GenColumn> columns;

    @Column(ignore = true)
    private GenColumn pk;
}
