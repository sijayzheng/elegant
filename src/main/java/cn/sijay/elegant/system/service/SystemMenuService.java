package cn.sijay.elegant.system.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.CollectionUtil;
import cn.sijay.elegant.system.entity.SystemMenu;
import cn.sijay.elegant.system.mapper.SystemMenuMapper;
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
 * SystemMenuService
 * 系统菜单逻辑处理层
 *
 * @author sijay
 * @since 2025-05-23
 */
@Slf4j
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Service
public class SystemMenuService extends ServiceImpl<SystemMenuMapper, SystemMenu> {

    /**
     * 查询符合条件的系统菜单列表
     *
     * @param entity 查询条件
     * @return 系统菜单列表
     */
    public List<SystemMenu> list(SystemMenu entity) {
        return list(buildQueryWrapper(entity));
    }

    /**
     * 新增系统菜单
     *
     * @param entity 系统菜单
     * @return 是否新增成功
     */
    public boolean add(SystemMenu entity) {
        validate(entity);
        return save(entity);
    }

    /**
     * 修改系统菜单
     *
     * @param entity 系统菜单
     * @return 是否修改成功
     */
    public boolean update(SystemMenu entity) {
        validate(entity);
        return updateById(entity);
    }

    /**
     * 校验并批量删除系统系统菜单
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
    public boolean importData(List<SystemMenu> list) {
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
     * @param entity 系统菜单
     */
    private void validate(SystemMenu entity) {
    }

    private QueryWrapper buildQueryWrapper(SystemMenu entity) {
        if (ObjectUtils.isEmpty(entity)) {
            return QueryWrapper.create();
        }
        return QueryWrapper.create()
                           .like(SystemMenu::getName, entity.getName())
                           .like(SystemMenu::getPermsCode, entity.getPermsCode())
                           .like(SystemMenu::getPath, entity.getPath())
                ;
    }
}
