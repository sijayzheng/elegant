package cn.sijay.elegant.system.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.CollectionUtil;
import cn.sijay.elegant.system.entity.SystemDept;
import cn.sijay.elegant.system.mapper.SystemDeptMapper;
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
 * SystemDeptService
 * 系统部门逻辑处理层
 *
 * @author sijay
 * @since 2025-05-23
 */
@Slf4j
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Service
public class SystemDeptService extends ServiceImpl<SystemDeptMapper, SystemDept> {

    /**
     * 查询符合条件的系统部门列表
     *
     * @param entity 查询条件
     * @return 系统部门列表
     */
    public List<SystemDept> list(SystemDept entity) {
        return list(buildQueryWrapper(entity));
    }

    /**
     * 新增系统部门
     *
     * @param entity 系统部门
     * @return 是否新增成功
     */
    public boolean add(SystemDept entity) {
        validate(entity);
        return save(entity);
    }

    /**
     * 修改系统部门
     *
     * @param entity 系统部门
     * @return 是否修改成功
     */
    public boolean update(SystemDept entity) {
        validate(entity);
        return updateById(entity);
    }

    /**
     * 校验并批量删除系统系统部门
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
    public boolean importData(List<SystemDept> list) {
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
     * @param entity 系统部门
     */
    private void validate(SystemDept entity) {
    }

    private QueryWrapper buildQueryWrapper(SystemDept entity) {
        if (ObjectUtils.isEmpty(entity)) {
            return QueryWrapper.create();
        }
        return QueryWrapper.create()
                           .like(SystemDept::getName, entity.getName())
                           .like(SystemDept::getPhone, entity.getPhone())
                           .like(SystemDept::getEmail, entity.getEmail())
                           .eq(SystemDept::getEnable, entity.getEnable())
                ;
    }
}
