package cn.sijay.elegant.gen.service;

import cn.sijay.elegant.common.util.StringUtil;
import cn.sijay.elegant.gen.entity.GenTable;
import cn.sijay.elegant.gen.mapper.GenTableMapper;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * GenTableService
 *
 * @author sijay
 * @since 2025-05-13
 */
@RequiredArgsConstructor
@Service
public class GenTableService extends ServiceImpl<GenTableMapper, GenTable> {
    private final GenTableMapper genTableMapper;

    public List<GenTable> listTable(String schemaName, String tableName) {
        List<String> exists = list().stream().map(GenTable::getTableName).toList();
        return list(QueryWrapper.create()
                                .select("table_name", "table_comment")
                                .from("information_schema.TABLES")
                                .where("TABLE_SCHEMA = '" + schemaName + "' and TABLE_NAME not like 'gen_%'" +
                                        (StringUtil.isNotBlank(tableName) ? " and TABLE_NAME like '" + tableName + "' " : "")
                                        + (exists.isEmpty() ? "" : " and TABLE_NAME not in ('" + String.join("', '", exists) + "')")
                                )
        );
    }

    public List<GenTable> listTableInTableNames(String schemaName, List<String> tableNames) {
        return list(QueryWrapper.create()
                                .select("table_name", "table_comment")
                                .from("information_schema.TABLES")
                                .where("TABLE_SCHEMA = ?" + (tableNames.isEmpty() ? "" : " and TABLE_NAME in ('" + String.join("','", tableNames) + "')"), schemaName)
        );

    }
}
