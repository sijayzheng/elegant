package cn.sijay.elegant.log.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.CollectionUtil;
import cn.sijay.elegant.log.entity.LogOperate;
import cn.sijay.elegant.log.mapper.LogOperateMapper;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.spring.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * LogOperateService
 * 操作日志逻辑处理层
 *
 * @author sijay
 * @since 2025-05-23
 */
@EnableAsync
@Slf4j
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Service
public class LogOperateService extends ServiceImpl<LogOperateMapper, LogOperate> {

    /**
     * 分页查询操作日志
     *
     * @param entity    查询条件
     * @param pageQuery 分页查询条件
     * @return 分页结果
     */
    public Page<LogOperate> page(LogOperate entity, PageQuery pageQuery) {
        return page(pageQuery.build(), buildQueryWrapper(entity));
    }

    /**
     * 查询符合条件的操作日志列表
     *
     * @param entity 查询条件
     * @return 操作日志列表
     */
    public List<LogOperate> list(LogOperate entity) {
        return list(buildQueryWrapper(entity));
    }

    /**
     * 新增操作日志
     *
     * @param entity 操作日志
     * @return 是否新增成功
     */
    public boolean add(LogOperate entity) {
        validate(entity);
        return save(entity);
    }

    /**
     * 修改操作日志
     *
     * @param entity 操作日志
     * @return 是否修改成功
     */
    public boolean update(LogOperate entity) {
        validate(entity);
        return updateById(entity);
    }

    /**
     * 校验并批量删除系统操作日志
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
    public boolean importData(List<LogOperate> list) {
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
     * @param entity 操作日志
     */
    private void validate(LogOperate entity) {
    }

    private QueryWrapper buildQueryWrapper(LogOperate entity) {
        if (ObjectUtils.isEmpty(entity)) {
            return QueryWrapper.create();
        }
        return QueryWrapper.create()
                           .between(LogOperate::getTime, entity.getTimeStart(), entity.getTimeEnd())
                ;
    }

    @Async
    @EventListener
    public void saveLogOperate(LogOperate logOperate) {
        log.info("saveLogOperate:{}", logOperate);
        add(logOperate);
    }
}
