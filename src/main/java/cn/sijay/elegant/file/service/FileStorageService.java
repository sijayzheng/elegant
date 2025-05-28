package cn.sijay.elegant.file.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.CollectionUtil;
import cn.sijay.elegant.file.entity.FileStorage;
import cn.sijay.elegant.file.mapper.FileStorageMapper;
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
 * FileStorageService
 * 文件存储逻辑处理层
 *
 * @author sijay
 * @since 2025-05-23
 */
@Slf4j
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Service
public class FileStorageService extends ServiceImpl<FileStorageMapper, FileStorage> {

    /**
     * 分页查询文件存储
     *
     * @param entity    查询条件
     * @param pageQuery 分页查询条件
     * @return 分页结果
     */
    public Page<FileStorage> page(FileStorage entity, PageQuery pageQuery) {
        return page(pageQuery.build(), buildQueryWrapper(entity));
    }

    /**
     * 查询符合条件的文件存储列表
     *
     * @param entity 查询条件
     * @return 文件存储列表
     */
    public List<FileStorage> list(FileStorage entity) {
        return list(buildQueryWrapper(entity));
    }

    /**
     * 新增文件存储
     *
     * @param entity 文件存储
     * @return 是否新增成功
     */
    public boolean add(FileStorage entity) {
        validate(entity);
        return save(entity);
    }

    /**
     * 修改文件存储
     *
     * @param entity 文件存储
     * @return 是否修改成功
     */
    public boolean update(FileStorage entity) {
        validate(entity);
        return updateById(entity);
    }

    /**
     * 校验并批量删除系统文件存储
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
    public boolean importData(List<FileStorage> list) {
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
     * @param entity 文件存储
     */
    private void validate(FileStorage entity) {
    }

    private QueryWrapper buildQueryWrapper(FileStorage entity) {
        if (ObjectUtils.isEmpty(entity)) {
            return QueryWrapper.create();
        }
        return QueryWrapper.create()
                           .like(FileStorage::getOriginalName, entity.getOriginalName())
                ;
    }
}
