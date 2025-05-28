package cn.sijay.elegant.system.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.CollectionUtil;
import cn.sijay.elegant.system.entity.SystemRole;
import cn.sijay.elegant.system.mapper.SystemRoleMapper;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * SystemRoleService
 * 系统权限逻辑处理层
 *
 * @author sijay
 * @since 2025-05-23
 */
@Slf4j
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Service
public class SystemRoleService extends ServiceImpl<SystemRoleMapper, SystemRole> {

    /**
     * 分页查询系统权限
     *
     * @param entity    查询条件
     * @param pageQuery 分页查询条件
     * @return 分页结果
     */
    public Page<SystemRole> page(SystemRole entity, PageQuery pageQuery) {
        return page(pageQuery.build(), buildQueryWrapper(entity));
    }

    /**
     * 查询符合条件的系统权限列表
     *
     * @param entity 查询条件
     * @return 系统权限列表
     */
    public List<SystemRole> list(SystemRole entity) {
        return list(buildQueryWrapper(entity));
    }

    /**
     * 新增系统权限
     *
     * @param entity 系统权限
     * @return 是否新增成功
     */
    public boolean add(SystemRole entity) {
        validate(entity);
        return save(entity);
    }

    /**
     * 修改系统权限
     *
     * @param entity 系统权限
     * @return 是否修改成功
     */
    public boolean update(SystemRole entity) {
        validate(entity);
        return updateById(entity);
    }

    /**
     * 校验并批量删除系统系统权限
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
    public boolean importData(List<SystemRole> list) {
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
     * @param entity 系统权限
     */
    private void validate(SystemRole entity) {
    }

    private QueryWrapper buildQueryWrapper(SystemRole entity) {
        if (ObjectUtils.isEmpty(entity)) {
            return QueryWrapper.create();
        }
        return QueryWrapper.create()
                           .like(SystemRole::getCode, entity.getCode())
                           .like(SystemRole::getName, entity.getName())
                ;
    }
}
