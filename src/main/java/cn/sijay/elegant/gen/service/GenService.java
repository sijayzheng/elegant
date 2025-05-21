package cn.sijay.elegant.gen.service;

import cn.sijay.elegant.common.entity.PageQuery;
import cn.sijay.elegant.common.enums.HtmlTypeEnum;
import cn.sijay.elegant.common.enums.JavaTypeEnum;
import cn.sijay.elegant.common.enums.QueryTypeEnum;
import cn.sijay.elegant.common.util.FileUtil;
import cn.sijay.elegant.common.util.NameUtil;
import cn.sijay.elegant.core.exception.ServiceException;
import cn.sijay.elegant.gen.entity.GenColumn;
import cn.sijay.elegant.gen.entity.GenTable;
import com.mybatisflex.core.paginate.Page;
import com.mybatisflex.core.query.QueryWrapper;
import com.mybatisflex.core.util.CollectionUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.springframework.boot.autoconfigure.jdbc.DataSourceProperties;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import static cn.sijay.elegant.gen.entity.table.GenTableTableDef.GEN_TABLE;

/**
 * GenService
 *
 * @author sijay
 * @since 2025-05-09
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class GenService {
    private final GenTableService tableService;
    private final GenColumnService columnService;

    private final DataSourceProperties dataSourceProperties;

    public Page<GenTable> page(GenTable genTable, PageQuery pageQuery) {
        return tableService.page(pageQuery.build(), buildQueryWrapper(genTable));
    }

    /**
     * 查询业务字段列表
     *
     * @param tableId 业务字段编号
     * @return 业务字段集合
     */
    public List<GenColumn> listColumnByTableId(Long tableId) {
        return columnService.listByTableId(tableId);
    }

    /**
     * 查询数据库列表
     *
     * @param tableName 表名
     * @return 包含分页结果的ResponseResult对象
     */
    public List<GenTable> selectTableList(String tableName) {
        return tableService.listTable(dataSourceProperties.getName(), tableName);
    }

    /**
     * 查询业务信息
     *
     * @param id 业务ID
     * @return 业务信息
     */
    public GenTable getById(Long id) {
        return tableService.getById(id);
    }

    /**
     * 修改业务
     *
     * @param genTable 业务信息
     */
    @Transactional(rollbackFor = Exception.class)
    public void updateGenTable(GenTable genTable) {
        tableService.save(genTable);
        columnService.saveBatch(genTable.getColumns());
    }

    /**
     * 删除业务对象
     *
     * @param ids 需要删除的数据ID
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean deleteGenTableByIds(List<Long> ids) {
        if (tableService.removeByIds(ids)) {
            return columnService.removeByTableIds(ids);
        } else {
            return false;
        }
    }

    /**
     * 导入表结构
     *
     * @param tableNames 导入表列表
     */
    @Transactional
    public void importGenTable(List<String> tableNames) {
        List<GenTable> tableList = tableService.listTableInTableNames(dataSourceProperties.getName(), tableNames);
        Set<String> set = tableService.list().parallelStream().map(GenTable::getTableName).collect(Collectors.toSet());
        tableList.stream()
                 .filter(genTable -> !set.contains(genTable.getTableName()))
                 .forEach(table -> {
                     String tableName = table.getTableName();
                     log.info(tableName);
                     table.setModuleName(StringUtils.substringBefore(tableName, "_"));
                     table.setClassName(NameUtil.snakeToUpperCamel(table.getTableName()));
                     table.setClassComment(table.getTableComment().replaceAll("表$", ""));
                     table.setTreeShow(false);
                     boolean save = tableService.save(table);
                     if (save) {
                         // 保存列信息
                         Long tableId = table.getId();
                         List<GenColumn> columns = listColumnByTableName(tableName)
                                 .parallelStream()
                                 .map(genColumn -> initColumn(tableId, genColumn))
                                 .sorted(Comparator.comparing(GenColumn::getSort))
                                 .toList();
                         columnService.saveBatch(columns);
                     }
                 });
    }

    /**
     * 预览代码
     *
     * @param tableId 表编号
     * @return 预览数据列表
     */
    public Map<String, String> previewCode(Long tableId) {
        return genCode(tableId);
    }

    /**
     * 生成代码（自定义路径）
     *
     * @param tableId 表名称
     */
    public void generatorCode(Long tableId) {
        genCode(tableId).forEach((path, content) -> FileUtil.writeFile(FileUtil.concatPath(System.getProperty("user.dir"), path), content));
    }

    /**
     * 生成代码（下载方式）
     *
     * @param tableId 表名称
     * @return 数据
     */
    public byte[] downloadCode(Long tableId) {
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream(); ZipOutputStream zip = new ZipOutputStream(outputStream)) {
            for (Map.Entry<String, String> entry : genCode(tableId).entrySet()) {
                zip.putNextEntry(new ZipEntry(entry.getKey()));
                zip.write(entry.getValue().getBytes(StandardCharsets.UTF_8));
            }
            return outputStream.toByteArray();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 同步数据库
     *
     * @param tableId 表名称
     */
    @Transactional
    public void syncDb(Long tableId) {
        GenTable table = tableService.getById(tableId);
        String tableName = table.getTableName();
        List<GenColumn> columns = listColumnByTableName(tableName);
        if (CollectionUtil.isEmpty(columns)) {
            throw new ServiceException("同步数据失败，原表结构不存在");
        }
        // 保存列信息
        columns = columns
                .parallelStream()
                .map(genColumn -> initColumn(tableId, genColumn))
                .sorted(Comparator.comparing(GenColumn::getSort))
                .toList();
        if (columnService.removeByTableId(tableId)) {
            columnService.saveBatch(columns);
        }
    }

    /**
     * 批量生成代码（下载方式）
     *
     * @param tableIds 表ID数组
     * @return 数据
     */
    public byte[] downloadCode(List<Long> tableIds) {
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream(); ZipOutputStream zip = new ZipOutputStream(outputStream)) {
            for (Long tableId : tableIds) {
                for (Map.Entry<String, String> entry : genCode(tableId).entrySet()) {
                    zip.putNextEntry(new ZipEntry(entry.getKey()));
                    zip.write(entry.getValue().getBytes(StandardCharsets.UTF_8));
                }
            }
            return outputStream.toByteArray();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private GenColumn initColumn(Long tableId, GenColumn column) {
        column.setTableId(tableId);
        column.setJavaField(NameUtil.snakeToCamel(column.getColumnName()));
        column.setJavaType(switch (column.getDataType()) {
            case "tinyint" -> column.getLength() == 1 ? JavaTypeEnum.BOOLEAN : JavaTypeEnum.INTEGER;
            case "smallint", "mediumint", "int", "integer", "year" -> JavaTypeEnum.INTEGER;
            case "bigint" -> JavaTypeEnum.LONG;
            case "float" -> JavaTypeEnum.FLOAT;
            case "double" -> JavaTypeEnum.DOUBLE;
            case "decimal", "numeric" -> JavaTypeEnum.BIG_DECIMAL;
            case "date" -> JavaTypeEnum.LOCAL_DATE;
            case "time" -> JavaTypeEnum.LOCAL_TIME;
            case "datetime", "timestamp" -> JavaTypeEnum.LOCAL_DATE_TIME;
            case "bit" -> JavaTypeEnum.BOOLEAN;
            case "json" -> JavaTypeEnum.LIST_LONG;
            case "binary", "varbinary", "tinyblob", "blob", "mediumblob", "longblob" -> JavaTypeEnum.BYTE_ARRAY;
            default -> JavaTypeEnum.STRING;
        });
        String columnName = column.getColumnName();
        column.setExportable(false);
        column.setEditable(false);
        column.setListable(false);
        column.setQueryable(false);
        column.setQueryType(QueryTypeEnum.NONE);
        List<String> noEdit = List.of("create_dept", "create_by", "create_time", "update_by", "update_time", "deleted", "version");
        if (!noEdit.contains(columnName)) {
            column.setListable(true);
            if (!column.getPk()) {
                column.setExportable(true);
                column.setEditable(true);
            } else {
                column.setListable(false);
            }
        }
        List<String> notQuery = List.of("id", "remark");
        if (!noEdit.contains(columnName) && !notQuery.contains(columnName) && !column.getPk()) {
            column.setQueryable(true);
            column.setQueryType(switch (column.getJavaType()) {
                case LOCAL_DATE, LOCAL_DATE_TIME, LOCAL_TIME -> QueryTypeEnum.BETWEEN;
                case STRING -> QueryTypeEnum.LIKE;
                case BOOLEAN -> QueryTypeEnum.EQUAL;
                default -> QueryTypeEnum.NONE;
            });
        }
        column.setHtmlType(column.getEditable() ? switch (column.getJavaType()) {
            case BOOLEAN -> HtmlTypeEnum.RADIO;
            case INTEGER, LONG, BIG_DECIMAL, FLOAT, DOUBLE -> HtmlTypeEnum.INPUT_NUMBER;
            case BYTE_ARRAY -> HtmlTypeEnum.FILE_UPLOAD;
            case LOCAL_DATE -> HtmlTypeEnum.DATE_PICKER;
            case LOCAL_DATE_TIME -> HtmlTypeEnum.DATETIME_PICKER;
            case LOCAL_TIME -> HtmlTypeEnum.TIME_PICKER;
            case STRING -> (column.getLength() != null && column.getLength() > 500) || column.getDataType().contains("text")
                    ? HtmlTypeEnum.TEXTAREA : HtmlTypeEnum.INPUT;
            case LIST_STRING, LIST_LONG -> HtmlTypeEnum.SELECT;
        } : null);
        return column;
    }

    /**
     * 根据列类型获取字典组
     *
     * @param genTable 业务表对象
     * @return 返回字典组
     */
    private String getDicts(GenTable genTable) {
        List<GenColumn> columns = genTable.getColumns();
        Set<String> dicts = new HashSet<>();
//        for (GenColumn column : columns) {
//            if (!column.isSuperColumn() && StringUtil.isNotEmpty(column.getDictType()) &&
//                    List.of(HtmlTypeEnum.SELECT, HtmlTypeEnum.RADIO, HtmlTypeEnum.CHECKBOX).contains(column.getHtmlType())) {
//                dicts.add("'" + column.getDictType() + "'");
//            }
//        }
        return StringUtils.join(dicts, ",");
    }

    private QueryWrapper buildQueryWrapper(GenTable genTable) {
        return QueryWrapper.create()
                           .select()
                           .where(GEN_TABLE.TABLE_NAME.like(genTable.getTableName())
                                                      .and(GEN_TABLE.TABLE_COMMENT.like(genTable.getTableComment()))
                           );
    }

    private Map<String, String> genCode(Long tableId) {
        try {
            Properties p = new Properties();
            // 加载classpath目录下的vm文件
            p.setProperty("resource.loader.file.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
            // 定义字符集
            p.setProperty(Velocity.INPUT_ENCODING, StandardCharsets.UTF_8.name());
            // 初始化Velocity引擎，指定配置Properties
            Velocity.init(p);
        } catch (Exception e) {
            throw new ServiceException("初始化Velocity引擎错误");
        }
        Map<String, String> dataMap = new LinkedHashMap<>();
        GenTable table = tableService.getById(tableId);
        Set<String> baseEntityColumns = Set.of("create_dept", "create_by", "create_time", "update_by", "update_time");
        List<GenColumn> tableColumns = columnService.listByTableId(tableId);
        for (GenColumn column : tableColumns) {
            if (column.getPk()) {
                table.setPk(column);
                break;
            }
        }
        if (Objects.isNull(table.getPk())) {
            table.setPk(tableColumns.getFirst());
        }
        Map<String, GenColumn> columnMap = tableColumns
                .parallelStream()
                .collect(Collectors.toMap(GenColumn::getColumnName, item -> item));
        String superEntityClass = null;
        if (columnMap.keySet().containsAll(baseEntityColumns)) {
            for (String column : baseEntityColumns) {
                columnMap.remove(column);
            }
            superEntityClass = "BaseEntity";
            if (baseEntityColumns.contains("deleted") && baseEntityColumns.contains("version")) {
                columnMap.remove("deleted");
                columnMap.remove("version");
                superEntityClass = "BaseEntity";
            }
        }
        List<GenColumn> columns = columnMap.values().parallelStream()
                                           .peek(column -> column.setGetter("get" + StringUtils.capitalize(column.getJavaField())))
                                           .sorted(Comparator.comparing(GenColumn::getSort))
                                           .toList();
        table.setColumns(columns);
        Set<String> imports = columns.stream().map(column -> column.getJavaType().getPackageName())
                                     .filter(StringUtils::isNoneBlank)
                                     .collect(Collectors.toSet());
        if (superEntityClass != null) {
            imports.add("cn.sijay.elegant.core.base." + superEntityClass);
        }
        VelocityContext context = new VelocityContext();
        context.put("superEntityClass", superEntityClass);
        context.put("isTree", table.getTreeShow());
        context.put("tableName", table.getTableName());
        context.put("classComment", StringUtils.defaultIfBlank(table.getClassComment(), "XXX"));
        context.put("ClassName", table.getClassName());
        String businessName = StringUtils.uncapitalize(table.getClassName());
        context.put("className", businessName);
        context.put("moduleName", table.getModuleName());
        context.put("packageName", "cn.sijay.elegant");
        context.put("author", "Sijay");
        context.put("date", LocalDate.now().toString());
        context.put("pkColumn", table.getPk());
        context.put("imports", imports);
        context.put("columns", table.getColumns());

        context.put("permPrefix", businessName + ":");
        context.put("dicts", getDicts(table));
        context.put("parentMenuId", table.getParentMenuId());

        if (table.getTreeShow()) {
            context.put("treeKey", table.getTreeKey());
            context.put("treeLabel", table.getTreeLabel());
            context.put("treeParentKey", table.getTreeParentKey());
        }

        // 获取模板列表
        List<String> templates = new ArrayList<>();
//        templates.add("entity.java.vm");
//        templates.add("mapper.java.vm");
//        templates.add("mapper.xml.vm");
//        templates.add("service.java.vm");
//        templates.add("controller.java.vm");
//        templates.add("sql.vm");
        templates.add("api.ts.vm");
//        if (!table.getIsTree()) {
//            templates.add("index.vue.vm");
//        } else {
//            templates.add("index-tree.vue.vm");
//        }
        for (String template : templates) {
            // 渲染模板
            StringWriter sw = new StringWriter();
            Template tpl = Velocity.getTemplate("vm/" + template, StandardCharsets.UTF_8.name());
            tpl.merge(context, sw);
            // 模块名
            String moduleName = table.getModuleName();
            // 大写类名
            String className = table.getClassName();
            // 业务名称
            String javaPath = FileUtil.concatPath("src", "main", "java", "cn", "sijay", "elegant");
            String xmlPath = FileUtil.concatPath("src", "main", "resources");
            String vuePath = FileUtil.concatPath("src", "main", "vue", "src");
            dataMap.put(switch (template) {
                case "entity.java.vm" -> FileUtil.concatPath(javaPath, moduleName, "entity", className + ".java");
                case "controller.java.vm" -> FileUtil.concatPath(javaPath, moduleName, "controller", className + "Controller.java");
                case "service.java.vm" -> FileUtil.concatPath(javaPath, moduleName, "service", className + "Service.java");
                case "mapper.java.vm" -> FileUtil.concatPath(javaPath, moduleName, "mapper", className + "Mapper.java");
                case "mapper.xml.vm" -> FileUtil.concatPath(xmlPath, "mapper", moduleName, className + "Mapper.xml");
                case "sql.vm" -> FileUtil.concatPath("sql", businessName + "Menu.sql");
                case "api.ts.vm" -> FileUtil.concatPath(vuePath, "api", moduleName, businessName + ".ts");
                case "index.vue.vm", "index-tree.vue.vm" -> FileUtil.concatPath(vuePath, "views", moduleName, businessName + ".vue");
                default -> "";
            }, sw.toString().replace("￥", "$"));
        }
        return dataMap;
    }

    /**
     * 查询数据库列表
     *
     * @param tableName 表名称
     * @return 数据库表集合
     */
    private List<GenColumn> listColumnByTableName(String tableName) {
        return columnService.listByTableName(dataSourceProperties.getName(), tableName);
    }

}
