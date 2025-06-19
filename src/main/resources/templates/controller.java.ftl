package ${packageName}.${moduleName}.controller;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.ExcelUtil;
import cn.sijay.elegant.core.base.BaseController;
import cn.sijay.elegant.core.entity.Result;
import ${packageName}.${moduleName}.entity.${ClassName};
import ${packageName}.${moduleName}.service.${ClassName}Service;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * ${ClassName}Controller
 * ${classComment}请求控制层
 *
 * @author ${author}
 * @since ${date}
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/${className}")
public class ${ClassName}Controller extends BaseController {
    private final ${ClassName}Service ${className}Service;

    /**
     * 查询${classComment}
     *
     * @param id 主键
     * @return ${classComment}
     */
    @GetMapping("/getById")
    public Result<${ClassName}> getById(@RequestParam("id") ${pkColumn.javaType.value} id) {
        return success(${className}Service.getById(id));
    }

<#if !isTree>
    /**
     * 分页查询${classComment}列表
     *
     * @param entity 查询条件
     * @param pageQuery 分页参数
     * @return ${classComment}分页列表
     */
    @GetMapping("/page")
    public Result<${ClassName}> page(${ClassName} entity, PageQuery pageQuery) {
        return success(${className}Service.page(entity, pageQuery));
    }

</#if>
    /**
     * 查询符合条件的${classComment}列表
     *
     * @param entity 查询条件
     * @return ${classComment}列表
     */
    @GetMapping("/list")
    public Result<${ClassName}> list(${ClassName} entity) {
        return success(${className}Service.list(entity));
    }

    /**
      * 保存${classComment}
      *
      * @param entity ${classComment}
      */
    @PostMapping("/add")
    public Result<String> add(@RequestBody ${ClassName} entity) {
        return of(${className}Service.add(entity), "保存");
    }

    /**
     * 更新${classComment}
     *
     * @param entity ${classComment}
     */
    @PostMapping("/update")
    public Result<String> update(@RequestBody ${ClassName} entity) {
        return of(${className}Service.update(entity), "更新");
    }

    /**
     * 校验并批量删除${classComment}信息
     *
     * @param ids 待删除的主键集合
     */
    @DeleteMapping("/remove")
    public Result<String> remove(@RequestBody List<${pkColumn.javaType.value}> ids) {
            ${className}Service.remove(ids);
        return success("删除成功");
    }

    /**
     * 导出${classComment}
     */
    @GetMapping("/export")
    public void export(${ClassName} entity, HttpServletResponse response) {
        ExcelUtil.exportExcel(${className}Service.list(entity), "${classComment}数据", ${ClassName}. class,response);
    }

    /**
     * 导入${classComment}数据
     *
     * @param file 导入文件
     */
    @GetMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public Result<String> importData(@RequestPart("file") MultipartFile file) throws Exception {
        return of(${className}Service.importData(ExcelUtil.importExcel(file.getInputStream(), ${ClassName}. class)), "导入");
    }

    /**
     * 获取${classComment}导入模板
     */
    @GetMapping("/downloadTemplate")
    public void downloadTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "${classComment}数据模板", ${ClassName}. class,response);
    }
}
