package ${packageName}.${moduleName}.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.CollectionUtil;
import ${packageName}.${moduleName}.entity.${ClassName};
import ${packageName}.${moduleName}.mapper.${ClassName}Mapper;
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
 * ${ClassName}Service
 * ${classComment}逻辑处理层
 *
 * @author ${author}
 * @since ${date}
 */
@Slf4j
@RequiredArgsConstructor
@Transactional(rollbackFor = Exception.class)
@Service
public class ${ClassName}Service extends ServiceImpl<${ClassName}Mapper, ${ClassName}> {

<#if !isTree>
    /**
     * 分页查询${classComment}
     *
     * @param entity    查询条件
     * @param pageQuery 分页查询条件
     * @return 分页结果
     */
    public Page<${ClassName}> page(${ClassName} entity, PageQuery pageQuery) {
        return page(pageQuery.build(), buildQueryWrapper(entity));
    }

</#if>
    /**
     * 查询符合条件的${classComment}列表
     *
     * @param entity 查询条件
     * @return ${classComment}列表
     */
    public List<${ClassName}> list(${ClassName} entity) {
        return list(buildQueryWrapper(entity));
    }

    /**
    * 新增${classComment}
    *
    * @param entity ${classComment}
    * @return 是否新增成功
    */
    public boolean add(${ClassName} entity) {
        validate(entity);
        return save(entity);
    }

    /**
     * 修改${classComment}
     *
     * @param entity ${classComment}
     * @return 是否修改成功
     */
    public boolean update(${ClassName} entity) {
        validate(entity);
        return updateById(entity);
    }


    /**
     * 校验并批量删除系统${classComment}
     *
     * @param ids 待删除的主键集合
     */
    public boolean remove(List<${pkColumn.javaType.value}> ids) {
        return removeByIds(ids);
    }

    /**
     * 导入数据
     *
     * @param list 导入的数据
     */
    public boolean importData(List<${ClassName}> list) {
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
     * @param entity ${classComment}
     */
    private void validate(${ClassName} entity) {
    }

    private QueryWrapper buildQueryWrapper(${ClassName} entity) {
        if (ObjectUtils.isEmpty(entity)) {
            return QueryWrapper.create();
        }
        return QueryWrapper.create()
        <#list columns as column>
            <#if column.queryable>
                <#if column.queryType=="EQUAL">
                           .eq(${ClassName}::${column.getter}, entity.${column.getter}())
                <#elseif column.queryType=="BETWEEN">
                           .between(${ClassName}::${column.getter}, entity.${column.getter}Start(), entity.${column.getter}End())
                <#elseif column.queryType=="LIKE">
                           .like(${ClassName}::${column.getter}, entity.${column.getter}())
                </#if>
            </#if>
        </#list>;
    }
}
