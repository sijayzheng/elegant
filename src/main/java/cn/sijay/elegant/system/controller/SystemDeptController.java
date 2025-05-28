package cn.sijay.elegant.system.controller;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.util.ExcelUtil;
import cn.sijay.elegant.core.base.BaseController;
import cn.sijay.elegant.core.entity.Result;
import cn.sijay.elegant.system.entity.SystemDept;
import cn.sijay.elegant.system.service.SystemDeptService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * SystemDeptController
 * 系统部门请求控制层
 *
 * @author sijay
 * @since 2025-05-23
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/systemDept")
public class SystemDeptController extends BaseController {
    private final SystemDeptService systemDeptService;

    /**
     * 查询系统部门
     *
     * @param id 主键
     * @return 系统部门
     */
    @GetMapping("/getById")
    public Result<SystemDept> getById(@RequestParam("id") Long id) {
        return success(systemDeptService.getById(id));
    }

    /**
     * 查询符合条件的系统部门列表
     *
     * @param entity 查询条件
     * @return 系统部门列表
     */
    @GetMapping("/list")
    public Result<SystemDept> list(SystemDept entity) {
        return success(systemDeptService.list(entity));
    }

    /**
     * 保存系统部门
     *
     * @param entity 系统部门
     */
    @PostMapping("/add")
    public Result<String> add(@RequestBody SystemDept entity) {
        return of(systemDeptService.add(entity), "保存");
    }

    /**
     * 更新系统部门
     *
     * @param entity 系统部门
     */
    @PostMapping("/update")
    public Result<String> update(@RequestBody SystemDept entity) {
        return of(systemDeptService.update(entity), "更新");
    }

    /**
     * 校验并批量删除系统部门信息
     *
     * @param ids 待删除的主键集合
     */
    @DeleteMapping("/remove")
    public Result<String> remove(@RequestBody List<Long> ids) {
        systemDeptService.remove(ids);
        return success("删除成功");
    }

    /**
     * 导出系统部门
     */
    @GetMapping("/export")
    public void export(SystemDept entity, HttpServletResponse response) {
        ExcelUtil.exportExcel(systemDeptService.list(entity), "系统部门数据", SystemDept.class, response);
    }

    /**
     * 导入系统部门数据
     *
     * @param file 导入文件
     */
    @GetMapping(value = "/importData", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public Result<String> importData(@RequestPart("file") MultipartFile file) throws Exception {
        return of(systemDeptService.importData(ExcelUtil.importExcel(file.getInputStream(), SystemDept.class)), "导入");
    }

    /**
     * 获取系统部门导入模板
     */
    @GetMapping("/downloadTemplate")
    public void downloadTemplate(HttpServletResponse response) {
        ExcelUtil.exportExcel(new ArrayList<>(), "系统部门数据模板", SystemDept.class, response);
    }
}
