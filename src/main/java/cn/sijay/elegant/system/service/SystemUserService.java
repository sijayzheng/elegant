package cn.sijay.elegant.system.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.CollectionUtil;
import cn.sijay.elegant.system.entity.SystemUser;
import cn.sijay.elegant.system.mapper.SystemUserMapper;
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
 * SystemUserService
 * 系统用户逻辑处理层
 *
 * @author sijay
 * @since 2025-05-23
 */
@Slf4j
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Service
public class SystemUserService extends ServiceImpl<SystemUserMapper, SystemUser> {

    /**
     * 分页查询系统用户
     *
     * @param entity    查询条件
     * @param pageQuery 分页查询条件
     * @return 分页结果
     */
    public Page<SystemUser> page(SystemUser entity, PageQuery pageQuery) {
        return page(pageQuery.build(), buildQueryWrapper(entity));
    }

    /**
     * 查询符合条件的系统用户列表
     *
     * @param entity 查询条件
     * @return 系统用户列表
     */
    public List<SystemUser> list(SystemUser entity) {
        return list(buildQueryWrapper(entity));
    }

    /**
     * 新增系统用户
     *
     * @param entity 系统用户
     * @return 是否新增成功
     */
    public boolean add(SystemUser entity) {
        validate(entity);
        return save(entity);
    }

    /**
     * 修改系统用户
     *
     * @param entity 系统用户
     * @return 是否修改成功
     */
    public boolean update(SystemUser entity) {
        validate(entity);
        return updateById(entity);
    }

    /**
     * 校验并批量删除系统系统用户
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
    public boolean importData(List<SystemUser> list) {
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
     * @param entity 系统用户
     */
    private void validate(SystemUser entity) {
    }

    private QueryWrapper buildQueryWrapper(SystemUser entity) {
        if (ObjectUtils.isEmpty(entity)) {
            return QueryWrapper.create();
        }
        return QueryWrapper.create()
                           .like(SystemUser::getUsername, entity.getUsername())
                           .like(SystemUser::getRealName, entity.getRealName())
                           .like(SystemUser::getEmail, entity.getEmail())
                           .like(SystemUser::getPhone, entity.getPhone());
    }

    public SystemUser getByUsername(String username) {
        return getOne(QueryWrapper.create().like(SystemUser::getUsername, username));
    }
}
