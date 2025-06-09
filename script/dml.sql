INSERT INTO system_menu (id, parent_id, name, perms_code, sort, path, component, type, external_link, cacheable, visible, enable, icon,
                         create_dept, create_by, create_time, update_by, update_time)
VALUES (11, 7, '系统部门删除', 'system:systemDept:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (2, 1, '系统用户查询', 'system:systemUser:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (3, 1, '系统用户新增', 'system:systemUser:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (4, 1, '系统用户修改', 'system:systemUser:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (5, 1, '系统用户删除', 'system:systemUser:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (6, 1, '系统用户导出', 'system:systemUser:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (77, 73, '系统权限删除', 'system:systemRole:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (8, 7, '系统部门查询', 'system:systemDept:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (9, 7, '系统部门新增', 'system:systemDept:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (10, 7, '系统部门修改', 'system:systemDept:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (21, 19, '登录日志新增', 'log:logLogin:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (12, 7, '系统部门导出', 'system:systemDept:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (78, 73, '系统权限导出', 'system:systemRole:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (14, 13, '文件存储查询', 'file:fileStorage:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (15, 13, '文件存储新增', 'file:fileStorage:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (16, 13, '文件存储修改', 'file:fileStorage:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (17, 13, '文件存储删除', 'file:fileStorage:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (18, 13, '文件存储导出', 'file:fileStorage:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (80, 79, '用户头像查询', 'system:systemUserAvatar:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (20, 19, '登录日志查询', 'log:logLogin:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (81, 79, '用户头像新增', 'system:systemUserAvatar:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (22, 19, '登录日志修改', 'log:logLogin:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (23, 19, '登录日志删除', 'log:logLogin:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (24, 19, '登录日志导出', 'log:logLogin:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (82, 79, '用户头像修改', 'system:systemUserAvatar:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (26, 25, '操作日志查询', 'log:logOperate:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (27, 25, '操作日志新增', 'log:logOperate:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (28, 25, '操作日志修改', 'log:logOperate:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (29, 25, '操作日志删除', 'log:logOperate:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (30, 25, '操作日志导出', 'log:logOperate:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (83, 79, '用户头像删除', 'system:systemUserAvatar:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (32, 31, '系统配置查询', 'system:systemConfig:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (33, 31, '系统配置新增', 'system:systemConfig:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (34, 31, '系统配置修改', 'system:systemConfig:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (35, 31, '系统配置删除', 'system:systemConfig:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (36, 31, '系统配置导出', 'system:systemConfig:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (84, 79, '用户头像导出', 'system:systemUserAvatar:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (38, 37, '系统字典数据查询', 'system:systemDictData:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (39, 37, '系统字典数据新增', 'system:systemDictData:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (40, 37, '系统字典数据修改', 'system:systemDictData:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (41, 37, '系统字典数据删除', 'system:systemDictData:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (42, 37, '系统字典数据导出', 'system:systemDictData:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (53, 49, '系统菜单删除', 'system:systemMenu:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (44, 43, '系统字典查询', 'system:systemDict:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (45, 43, '系统字典新增', 'system:systemDict:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (46, 43, '系统字典修改', 'system:systemDict:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (47, 43, '系统字典删除', 'system:systemDict:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (48, 43, '系统字典导出', 'system:systemDict:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (50, 49, '系统菜单查询', 'system:systemMenu:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (51, 49, '系统菜单新增', 'system:systemMenu:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (52, 49, '系统菜单修改', 'system:systemMenu:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (54, 49, '系统菜单导出', 'system:systemMenu:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (56, 55, '系统消息查询', 'system:systemMessage:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (57, 55, '系统消息新增', 'system:systemMessage:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (58, 55, '系统消息修改', 'system:systemMessage:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (59, 55, '系统消息删除', 'system:systemMessage:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (60, 55, '系统消息导出', 'system:systemMessage:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (62, 61, '系统模块查询', 'system:systemModule:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (63, 61, '系统模块新增', 'system:systemModule:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (64, 61, '系统模块修改', 'system:systemModule:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (65, 61, '系统模块删除', 'system:systemModule:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (66, 61, '系统模块导出', 'system:systemModule:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (68, 67, '系统岗位查询', 'system:systemPost:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (69, 67, '系统岗位新增', 'system:systemPost:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (70, 67, '系统岗位修改', 'system:systemPost:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (71, 67, '系统岗位删除', 'system:systemPost:remove', 4, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (72, 67, '系统岗位导出', 'system:systemPost:export', 5, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (74, 73, '系统权限查询', 'system:systemRole:query', 1, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (75, 73, '系统权限新增', 'system:systemRole:add', 2, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (76, 73, '系统权限修改', 'system:systemRole:edit', 3, null, null, 'B', 0, 1, 1, 1, '', null, null, null, null, null),
       (7, 1, '系统部门', 'system:systemDept:list', 1, 'systemDept', 'system/systemDept', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (13, 1, '文件存储', 'file:fileStorage:list', 1, 'fileStorage', 'file/fileStorage', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (19, 1, '登录日志', 'log:logLogin:list', 1, 'logLogin', 'log/logLogin', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (1, 1, '系统用户', 'system:systemUser:list', 1, 'systemUser', 'system/systemUser', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (25, 1, '操作日志', 'log:logOperate:list', 1, 'logOperate', 'log/logOperate', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (31, 1, '系统配置', 'system:systemConfig:list', 1, 'systemConfig', 'system/systemConfig', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (37, 1, '系统字典数据', 'system:systemDictData:list', 1, 'systemDictData', 'system/systemDictData', 'M', 0, 1, 1, 1, null, null, null, null,
        null, null),
       (67, 1, '系统岗位', 'system:systemPost:list', 1, 'systemPost', 'system/systemPost', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (79, 1, '用户头像', 'system:systemUserAvatar:list', 1, 'systemUserAvatar', 'system/systemUserAvatar', 'M', 0, 1, 1, 1, null, null, null, null,
        null, null),
       (73, 1, '系统权限', 'system:systemRole:list', 1, 'systemRole', 'system/systemRole', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (43, 1, '系统字典', 'system:systemDict:list', 1, 'systemDict', 'system/systemDict', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (49, 1, '系统菜单', 'system:systemMenu:list', 1, 'systemMenu', 'system/systemMenu', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (61, 1, '系统模块', 'system:systemModule:list', 1, 'systemModule', 'system/systemModule', 'M', 0, 1, 1, 1, null, null, null, null, null, null),
       (55, 1, '系统消息', 'system:systemMessage:list', 1, 'systemMessage', 'system/systemMessage', 'M', 0, 1, 1, 1, null, null, null, null, null,
        null);
INSERT INTO system_module (id, code, name, roles, menus, enable, create_dept, create_by, create_time, update_by, update_time)
VALUES (1, 'system', '系统管理', null, null, 1, null, null, null, null, null),
       (2, 'oa', 'OA', null, null, 1, null, null, null, null, null);
INSERT INTO system_user (username, dept_id, real_name, email, phone, gender, avatar, password, roles, posts, modules, enable, pwd_changed,
                         create_dept, create_by, create_time, update_by, update_time)
VALUES ('admin', null, '管理员', 'admin@example.com', '13800138000', 'MALE', 1,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', null, null, null, 1, 0, null, null, null, null,
        null),
       ('user01', 2, '张三', 'zhangsan@example.com', '13900139001', 'MALE', 2,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         1,
         2,
         3,
         4,
         5,
         6,
         7,
         8
       ]', '[
         3,
         4,
         5,
         6,
         7,
         8
       ]', '[
         4,
         5,
         6,
         7,
         8
       ]', 1, 1, 1, 1, '2023-01-02 00:00:00', 1, '2023-01-02 00:00:00'),
       ('user02', 2, '李四', 'lisi@example.com', '13900139002', 'MALE', 3,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         2
       ]', '[
         3
       ]', '[
         2,
         3,
         4
       ]', 1, 1, 1, 1, '2023-01-03 00:00:00', 1, '2023-01-03 00:00:00'),
       ('user03', 3, '王五', 'wangwu@example.com', '13900139003', 'MALE', 4,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         3
       ]', '[
         4
       ]', '[
         3,
         4
       ]', 1, 1, 1, 1, '2023-01-04 00:00:00', 1, '2023-01-04 00:00:00'),
       ('user04', 3, '赵六', 'zhaoliu@example.com', '13900139004', 'MALE', 5,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         3
       ]', '[
         5
       ]', '[
         3,
         4
       ]', 1, 1, 1, 1, '2023-01-05 00:00:00', 1, '2023-01-05 00:00:00'),
       ('user05', 4, '孙七', 'sunqi@example.com', '13900139005', 'MALE', 6,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         4
       ]', '[
         6
       ]', '[
         4,
         5
       ]', 1, 1, 1, 1, '2023-01-06 00:00:00', 1, '2023-01-06 00:00:00'),
       ('user06', 4, '周八', 'zhouba@example.com', '13900139006', 'MALE', 7,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         4
       ]', '[
         7
       ]', '[
         4,
         5
       ]', 1, 1, 1, 1, '2023-01-07 00:00:00', 1, '2023-01-07 00:00:00'),
       ('user07', 5, '吴九', 'wujiu@example.com', '13900139007', 'MALE', 8,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         5
       ]', '[
         8
       ]', '[
         5
       ]', 1, 1, 1, 1, '2023-01-08 00:00:00', 1, '2023-01-08 00:00:00'),
       ('user08', 5, '郑十', 'zhengshi@example.com', '13900139008', 'MALE', 9,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         5
       ]', '[
         9
       ]', '[
         5
       ]', 1, 1, 1, 1, '2023-01-09 00:00:00', 1, '2023-01-09 00:00:00'),
       ('user09', 6, '钱十一', 'qian11@example.com', '13900139009', 'FEMALE', 10,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         6
       ]', '[
         10
       ]', '[
         6
       ]', 1, 1, 1, 1, '2023-01-10 00:00:00', 1, '2023-01-10 00:00:00'),
       ('user10', 6, '孙十二', 'sun12@example.com', '13900139010', 'FEMALE', 11,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         6
       ]', '[
         11
       ]', '[
         6
       ]', 1, 1, 1, 1, '2023-01-11 00:00:00', 1, '2023-01-11 00:00:00'),
       ('user11', 7, '周十三', 'zhou13@example.com', '13900139011', 'FEMALE', 12,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         7
       ]', '[
         12
       ]', '[
         7
       ]', 1, 1, 1, 1, '2023-01-12 00:00:00', 1, '2023-01-12 00:00:00'),
       ('user12', 7, '吴十四', 'wu14@example.com', '13900139012', 'FEMALE', 13,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         7
       ]', '[
         13
       ]', '[
         7
       ]', 1, 1, 1, 1, '2023-01-13 00:00:00', 1, '2023-01-13 00:00:00'),
       ('user13', 8, '郑十五', 'zheng15@example.com', '13900139013', 'FEMALE', 14,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         8
       ]', '[
         14
       ]', '[
         8
       ]', 1, 1, 1, 1, '2023-01-14 00:00:00', 1, '2023-01-14 00:00:00'),
       ('user14', 8, '王十六', 'wang16@example.com', '13900139014', 'FEMALE', 15,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         8
       ]', '[
         15
       ]', '[
         8
       ]', 1, 1, 1, 1, '2023-01-15 00:00:00', 1, '2023-01-15 00:00:00'),
       ('user15', 9, '李十七', 'li17@example.com', '13900139015', 'FEMALE', 16,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         9
       ]', '[
         16
       ]', '[
         9
       ]', 1, 1, 1, 1, '2023-01-16 00:00:00', 1, '2023-01-16 00:00:00'),
       ('user16', 9, '赵十八', 'zhao18@example.com', '13900139016', 'FEMALE', 17,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         9
       ]', '[
         17
       ]', '[
         9
       ]', 1, 1, 1, 1, '2023-01-17 00:00:00', 1, '2023-01-17 00:00:00'),
       ('user17', 10, '孙十九', 'sun19@example.com', '13900139017', 'UNKNOWN', 18,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         10
       ]', '[
         18
       ]', '[
         10
       ]', 1, 1, 1, 1, '2023-01-18 00:00:00', 1, '2023-01-18 00:00:00'),
       ('user18', 10, '周二十', 'zhou20@example.com', '13900139018', 'UNKNOWN', 19,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         10
       ]', '[
         19
       ]', '[
         10
       ]', 1, 1, 1, 1, '2023-01-19 00:00:00', 1, '2023-01-19 00:00:00'),
       ('user19', 11, '吴二一', 'wu21@example.com', '13900139019', 'UNKNOWN', 20,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         11
       ]', '[
         20
       ]', '[
         10,
         11
       ]', 1, 1, 1, 1, '2023-01-20 00:00:00', 1, '2023-01-20 00:00:00'),
       ('user20', 11, '郑二二', 'zheng22@example.com', '13900139020', 'UNKNOWN', 21,
        'OGQ5NjllZWY2ZWNhZDNjMjlhM2E2MjkyODBlNjg2Y2YwYzNmNWQ1YTg2YWZmM2NhMTIwMjBjOTIzYWRjNmM5Mg==', '[
         11
       ]', '[
         21
       ]', '[
         10,
         11
       ]', 0, 0, 1, 1, '2023-01-21 00:00:00', 1, '2023-01-21 00:00:00');