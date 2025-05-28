package cn.sijay.elegant.system.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.CollectionUtil;
import cn.sijay.elegant.system.entity.SystemConfig;
import cn.sijay.elegant.system.mapper.SystemConfigMapper;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * SystemConfigService
 * 系统配置逻辑处理层
 *
 * @author sijay
 * @since 2025-05-23
 */
@Slf4j
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Service
public class SystemConfigService extends ServiceImpl<SystemConfigMapper, SystemConfig> {

    /**
     * 分页查询系统配置
     *
     * @param entity    查询条件
     * @param pageQuery 分页查询条件
     * @return 分页结果
     */
    public Page<SystemConfig> page(SystemConfig entity, PageQuery pageQuery) {
        return page(pageQuery.build(), buildQueryWrapper(entity));
    }

    /**
     * 查询符合条件的系统配置列表
     *
     * @param entity 查询条件
     * @return 系统配置列表
     */
    public List<SystemConfig> list(SystemConfig entity) {
        return list(buildQueryWrapper(entity));
    }

    /**
     * 新增系统配置
     *
     * @param entity 系统配置
     * @return 是否新增成功
     */
    public boolean add(SystemConfig entity) {
        validate(entity);
        return save(entity);
    }

    /**
     * 修改系统配置
     *
     * @param entity 系统配置
     * @return 是否修改成功
     */
    public boolean update(SystemConfig entity) {
        validate(entity);
        return updateById(entity);
    }

    /**
     * 校验并批量删除系统系统配置
     *
     * @param ids 待删除的主键集合
     */
    public boolean remove(List<Long> ids) {
        return removeByIds(ids);
    }

    /**
     * 导入数据
     *
     * @param list 导入的数据
     */
    public boolean importData(List<SystemConfig> list) {
        if (CollectionUtil.isNotEmpty(list)) {
            list = list.stream()
                       .peek(item -> {
                       })
                       .toList();
            return saveBatch(list);
        }
        return false;
    }

    /**
     * 数据校验
     *
     * @param entity 系统配置
     */
    private void validate(SystemConfig entity) {
    }

    private QueryWrapper buildQueryWrapper(SystemConfig entity) {
        if (ObjectUtils.isEmpty(entity)) {
            return QueryWrapper.create();
        }
        return QueryWrapper.create()
                           .like(SystemConfig::getName, entity.getName())
                           .like(SystemConfig::getCode, entity.getCode());
    }

    public Optional<String> getValueByCode(String code) {
        SystemConfig one = getOne(QueryWrapper.create().eq(SystemConfig::getCode, code));
        return Optional.ofNullable(one.getValue());
    }
}
