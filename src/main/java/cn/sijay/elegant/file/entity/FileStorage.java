package cn.sijay.elegant.file.entity;

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
 * FileStorage
 * 文件存储实体类
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
@Table("file_storage")
public class FileStorage extends BaseEntity {

    /**
     * id
     */
    @Id(keyType = KeyType.Auto)
    @NotNull
    @Column(value = "id", comment = "id")
    private Long id;

    /**
     * 文件名
     */
    @Size(max = 255, message = "文件名最大长度为{max}")
    @NotNull
    @Column(value = "name", comment = "文件名")
    private String name;

    /**
     * 原名
     */
    @Size(max = 255, message = "原名最大长度为{max}")
    @NotNull
    @Column(value = "original_name", comment = "原名")
    private String originalName;

    /**
     * 文件后缀名
     */
    @Size(max = 10, message = "文件后缀名最大长度为{max}")
    @NotNull
    @Column(value = "suffix", comment = "文件后缀名")
    private String suffix;

    /**
     * 文件访问地址
     */
    @Size(max = 255, message = "文件访问地址最大长度为{max}")
    @NotNull
    @Column(value = "url", comment = "文件访问地址")
    private String url;

    /**
     * 文件存储路径
     */
    @Size(max = 255, message = "文件存储路径最大长度为{max}")
    @NotNull
    @Column(value = "store_path", comment = "文件存储路径")
    private String storePath;

}
