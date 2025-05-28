package cn.sijay.elegant.system.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.CollectionUtil;
import cn.sijay.elegant.system.entity.SystemMessage;
import cn.sijay.elegant.system.mapper.SystemMessageMapper;
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
 * SystemMessageService
 * 系统消息逻辑处理层
 *
 * @author sijay
 * @since 2025-05-23
 */
@Slf4j
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Service
public class SystemMessageService extends ServiceImpl<SystemMessageMapper, SystemMessage> {

    /**
     * 分页查询系统消息
     *
     * @param entity    查询条件
     * @param pageQuery 分页查询条件
     * @return 分页结果
     */
    public Page<SystemMessage> page(SystemMessage entity, PageQuery pageQuery) {
        return page(pageQuery.build(), buildQueryWrapper(entity));
    }

    /**
     * 查询符合条件的系统消息列表
     *
     * @param entity 查询条件
     * @return 系统消息列表
     */
    public List<SystemMessage> list(SystemMessage entity) {
        return list(buildQueryWrapper(entity));
    }

    /**
     * 新增系统消息
     *
     * @param entity 系统消息
     * @return 是否新增成功
     */
    public boolean add(SystemMessage entity) {
        validate(entity);
        return save(entity);
    }

    /**
     * 修改系统消息
     *
     * @param entity 系统消息
     * @return 是否修改成功
     */
    public boolean update(SystemMessage entity) {
        validate(entity);
        return updateById(entity);
    }

    /**
     * 校验并批量删除系统系统消息
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
    public boolean importData(List<SystemMessage> list) {
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
     * @param entity 系统消息
     */
    private void validate(SystemMessage entity) {
    }

    private QueryWrapper buildQueryWrapper(SystemMessage entity) {
        if (ObjectUtils.isEmpty(entity)) {
            return QueryWrapper.create();
        }
        return QueryWrapper.create()
                           .like(SystemMessage::getTitle, entity.getTitle())
                           .like(SystemMessage::getType, entity.getType())
                           .eq(SystemMessage::getClosed, entity.getClosed())
                ;
    }
}
