insert into system_menu(parent_id, name, perms_code, sort, path, component, type)
values (1, '${classComment}', '${moduleName}:${className}:list', 1, '${className}', '${moduleName}/${className}', 'M');

SELECT @parentId := LAST_INSERT_ID();

insert into system_menu(parent_id, name, perms_code, sort, type)
values (@parentId, '${classComment}查询', '${moduleName}:${className}:query', '1', 'B'),
(@parentId, '${classComment}新增', '${moduleName}:${className}:add', '2', 'B'),
(@parentId, '${classComment}修改', '${moduleName}:${className}:edit', '3', 'B'),
(@parentId, '${classComment}删除', '${moduleName}:${className}:remove', '4', 'B'),
(@parentId, '${classComment}导入', '${moduleName}:${className}:import', '5', 'B'),
(@parentId, '${classComment}导出', '${moduleName}:${className}:export', '6', 'B');
