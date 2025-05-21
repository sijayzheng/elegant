package cn.sijay.elegant.gen.service;

import cn.sijay.elegant.gen.entity.GenColumn;
import cn.sijay.elegant.gen.mapper.GenColumnMapper;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

    private static QueryWrapper tableIdIn(List<Long> tableIds) {
        return QueryWrapper.create().in(GenColumn::getTableId, tableIds);
    }

    private static QueryWrapper tableIdEq(Long tableId) {
        return QueryWrapper.create().eq(GenColumn::getTableId, tableId);
    }

    public boolean removeByTableIds(List<Long> tableIds) {
        return remove(tableIdIn(tableIds));
    }

    public List<GenColumn> listByTableId(Long tableId) {
        return list(tableIdEq(tableId));
    }

    public List<GenColumn> listByTableId(List<Long> tableIds) {
        return list(tableIdIn(tableIds));
    }

    public boolean removeByTableId(Long tableId) {
        return remove(tableIdEq(tableId));
    }

    public List<GenColumn> listByTableName(String schemaName, String tableName) {
        return genColumnMapper.listByTableName(schemaName, tableName);
    }
}
