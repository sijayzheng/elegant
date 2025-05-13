package cn.sijay.elegant.gen.service;

import cn.sijay.elegant.gen.entity.GenColumn;
import cn.sijay.elegant.gen.mapper.GenColumnMapper;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

import static cn.sijay.elegant.gen.entity.table.GenColumnTableDef.GEN_COLUMN;

/**
 * GenColumnService
 *
 * @author sijay
 * @since 2025-05-13
 */
@RequiredArgsConstructor
@Service
public class GenColumnService extends ServiceImpl<GenColumnMapper, GenColumn> {
    private final GenColumnMapper genColumnMapper;

    public boolean removeByTableIds(List<Long> tableIds) {
        return remove(QueryWrapper.create().where(GEN_COLUMN.TABLE_ID.in(tableIds)));
    }

    public List<GenColumn> listByTableId(Long tableId) {
        return list(QueryWrapper.create().select().where(GEN_COLUMN.TABLE_ID.eq(tableId)));
    }

    public List<GenColumn> listByTableId(List<Long> tableIds) {
        return list(QueryWrapper.create().select().where(GEN_COLUMN.TABLE_ID.in(tableIds)));
    }

    public boolean removeByTableId(Long tableId) {
        return remove(QueryWrapper.create().where(GEN_COLUMN.TABLE_ID.eq(tableId)));
    }

    public List<GenColumn> listByTableName(String schemaName, String tableName) {
        return genColumnMapper.listByTableName(schemaName, tableName);
    }
}
