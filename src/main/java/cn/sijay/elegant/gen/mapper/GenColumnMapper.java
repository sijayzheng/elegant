package cn.sijay.elegant.gen.mapper;

import cn.sijay.elegant.gen.entity.GenColumn;
import com.mybatisflex.core.BaseMapper;

import java.util.List;

/**
 * GenColumnMapper
 *
 * @author sijay
 * @since 2025-05-09
 */
public interface GenColumnMapper extends BaseMapper<GenColumn> {
    List<GenColumn> listByTableName(String schemaName, String tableName);
}
