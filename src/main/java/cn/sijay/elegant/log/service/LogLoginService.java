package cn.sijay.elegant.log.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.CollectionUtil;
import cn.sijay.elegant.log.entity.LogLogin;
import cn.sijay.elegant.log.mapper.LogLoginMapper;
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
 * LogLoginService
 * 登录日志逻辑处理层
 *
 * @author sijay
 * @since 2025-05-23
 */
@EnableAsync
@Slf4j
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Service
public class LogLoginService extends ServiceImpl<LogLoginMapper, LogLogin> {

    /**
     * 分页查询登录日志
     *
     * @param entity    查询条件
     * @param pageQuery 分页查询条件
     * @return 分页结果
     */
    public Page<LogLogin> page(LogLogin entity, PageQuery pageQuery) {
        return page(pageQuery.build(), buildQueryWrapper(entity));
    }

    /**
     * 查询符合条件的登录日志列表
     *
     * @param entity 查询条件
     * @return 登录日志列表
     */
    public List<LogLogin> list(LogLogin entity) {
        return list(buildQueryWrapper(entity));
    }

    /**
     * 新增登录日志
     *
     * @param entity 登录日志
     * @return 是否新增成功
     */
    public boolean add(LogLogin entity) {
        validate(entity);
        return save(entity);
    }

    /**
     * 修改登录日志
     *
     * @param entity 登录日志
     * @return 是否修改成功
     */
    public boolean update(LogLogin entity) {
        validate(entity);
        return updateById(entity);
    }

    /**
     * 校验并批量删除系统登录日志
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
    public boolean importData(List<LogLogin> list) {
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
     * @param entity 登录日志
     */
    private void validate(LogLogin entity) {
    }

    private QueryWrapper buildQueryWrapper(LogLogin entity) {
        if (ObjectUtils.isEmpty(entity)) {
            return QueryWrapper.create();
        }
        return QueryWrapper.create()
                           .eq(LogLogin::getUserId, entity.getUserId())
                           .between(LogLogin::getTime, entity.getTimeStart(), entity.getTimeEnd());
    }

    @Async
    @EventListener
    public void saveLogLogin(LogLogin logLogin) {
        log.info("保存登录信息:{}", logLogin);
        add(logLogin);
    }
}
