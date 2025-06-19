drop table if exists gen_table;
create table gen_table
(
    id              bigint auto_increment comment 'id' primary key,
    table_name      varchar(200) default '' not null comment '表名称',
    table_comment   varchar(500) default '' not null comment '表描述',
    module_name     varchar(30)  default '' null comment '生成模块名',
    class_name      varchar(100) default '' not null comment '类名称',
    class_comment   varchar(50)  default '' not null comment '类描述',
    tree_show       bit          default 0  null comment '树形',
    parent_menu_id  bigint                  null comment '父菜单编号',
    tree_key        varchar(20)             null comment '树节点标识',
    tree_label      varchar(20)             null comment '树节点标签',
    tree_parent_key varchar(20)             null comment '树父节点标识'
)
    comment '代码生成表定义';
drop table if exists gen_column;
create table gen_column
(
    id             bigint auto_increment comment 'id' primary key,
    column_name    varchar(64) default ''       not null comment '字段名',
    column_comment varchar(255)                 not null comment '字段描述',
    table_id       bigint                       not null comment '表id',
    pk             bit         default 0        null comment '是否主键',
    sort           int         default 0        null comment '排序',
    nullable       bit         default 0        null comment '可空',
    length         bigint                       null comment '长度',
    data_type      varchar(32)                  not null comment '字段类型',
    java_field     varchar(64)                  not null comment 'java 属性名',
    java_type      varchar(20) default 'STRING' null comment 'java 属性类型',
    listable       bit         default 0        null comment '可列出',
    editable       bit         default 0        null comment '可编辑',
    queryable      bit         default 0        null comment '可查询',
    exportable     bit         default 0        null comment '可导出',
    html_type      varchar(20)                  null comment '显示类型',
    query_type     varchar(10)                  null comment '查询方式',
    dict_type      varchar(20)                  null comment '字典类型'
)
    comment '代码生成列定义';

drop table if exists file_storage;
create table file_storage
(
    id            bigint auto_increment comment 'id' primary key,
    name          varchar(255) default '' not null comment '文件名',
    original_name varchar(255) default '' not null comment '原名',
    suffix        varchar(10)  default '' not null comment '文件后缀名',
    url           varchar(255) default '' not null comment '文件访问地址',
    store_path    varchar(255) default '' not null comment '文件存储路径',
    create_dept   bigint                  null comment '创建部门',
    create_by     bigint                  null comment '创建者',
    create_time   datetime                null comment '创建时间',
    update_by     bigint                  null comment '更新者',
    update_time   datetime                null comment '更新时间',
    constraint name
        unique (name)
)
    comment '文件存储表';
drop table if exists log_login;
create table log_login
(
    id         bigint auto_increment comment 'id' primary key,
    user_id    bigint                             not null comment '用户id',
    username   varchar(50)                        not null comment '用户名',
    ip         varchar(128)                       null comment '登录ip',
    location   varchar(255)                       null comment '登录地点',
    browser    varchar(100)                       null comment '浏览器类型',
    os         varchar(50)                        null comment '操作系统',
    successful bit      default 0                 null comment '登录状态',
    msg        varchar(255)                       null comment '提示消息',
    time       datetime default CURRENT_TIMESTAMP null comment '时间'
)
    comment '登录日志表';
create index idx_log_login_successful
    on log_login (successful);
create index idx_log_login_time
    on log_login (time);
drop table if exists log_operate;
create table log_operate
(
    id             bigint auto_increment comment 'id' primary key,
    user_id        bigint                             not null comment '用户id',
    title          varchar(50)                        null comment '模块标题',
    method         varchar(100)                       null comment '方法名称',
    request_method varchar(10)                        null comment '请求方式',
    url            varchar(255)                       null comment '请求URL',
    ip             varchar(128)                       null comment '主机地址',
    location       varchar(255)                       null comment '操作地点',
    param          varchar(2000)                      null comment '请求参数',
    result         varchar(2000)                      null comment '返回参数',
    status         int      default 200               null comment '操作状态',
    error_msg      varchar(2000)                      null comment '错误消息',
    time           datetime default CURRENT_TIMESTAMP null comment '操作时间',
    cost_time      bigint   default 0                 null comment '消耗时间'
)
    comment '操作日志表';
create index idx_log_operate_status
    on log_operate (status);
create index idx_log_operate_time
    on log_operate (time);
create index idx_log_operate_user_id
    on log_operate (user_id);
drop table if exists system_config;
create table system_config
(
    id          bigint auto_increment comment 'id' primary key,
    name        varchar(100)  not null comment '名称',
    code        varchar(100)  not null comment '编码',
    value       varchar(500)  not null comment '值',
    internal    bit default 0 null comment '内置',
    create_dept bigint        null comment '创建部门',
    create_by   bigint        null comment '创建者',
    create_time datetime      null comment '创建时间',
    update_by   bigint        null comment '更新者',
    update_time datetime      null comment '更新时间',
    constraint code
        unique (code)
)
    comment '系统配置';
drop table if exists system_dept;
create table system_dept
(
    id          bigint auto_increment comment 'id' primary key,
    name        varchar(50)   not null comment '部门名称',
    parent_id   bigint        null comment '父部门id',
    ancestors   json          null comment '祖级列表',
    descendants json          null comment '后代列表',
    sort        int           null comment '排序',
    leader      bigint        null comment '负责人',
    phone       varchar(11)   null comment '联系电话',
    email       varchar(100)  null comment '邮箱',
    enable      bit default 1 null comment '启用',
    create_dept bigint        null comment '创建部门',
    create_by   bigint        null comment '创建者',
    create_time datetime      null comment '创建时间',
    update_by   bigint        null comment '更新者',
    update_time datetime      null comment '更新时间'
)
    comment '系统部门';
drop table if exists system_dict;
create table system_dict
(
    id          bigint auto_increment comment 'id' primary key,
    code        varchar(100) not null comment '编码',
    name        varchar(100) not null comment '名称',
    create_dept bigint       null comment '创建部门',
    create_by   bigint       null comment '创建者',
    create_time datetime     null comment '创建时间',
    update_by   bigint       null comment '更新者',
    update_time datetime     null comment '更新时间'
)
    comment '系统字典';
drop table if exists system_dict_data;
create table system_dict_data
(
    id            bigint auto_increment comment 'id' primary key,
    dict_id       bigint                     not null comment '字典',
    label         varchar(100)               not null comment '标签',
    value         varchar(100)               not null comment '键值',
    sort          int         default 0      null comment '排序',
    class_name    varchar(100)               null comment '样式属性',
    show_type     varchar(10) default 'NONE' null comment '表格回显样式',
    default_value bit         default 0      null comment '是否默认',
    create_dept   bigint                     null comment '创建部门',
    create_by     bigint                     null comment '创建者',
    create_time   datetime                   null comment '创建时间',
    update_by     bigint                     null comment '更新者',
    update_time   datetime                   null comment '更新时间'
)
    comment '系统字典数据';
create index idx_system_dict_data_dict_id
    on system_dict_data (dict_id);
drop table if exists system_menu;
create table system_menu
(
    id            bigint auto_increment comment 'id' primary key,
    parent_id     bigint default 0 null comment '父菜单id',
    name          varchar(50)      not null comment '菜单名称',
    perms_code    varchar(100)     not null comment '权限编码',
    sort          int    default 0 null comment '排序',
    path          varchar(200)     null comment '路由地址',
    component     varchar(255)     null comment '组件路径',
    type          varchar(1)       not null comment '菜单类型',
    external_link bit    default 0 null comment '是否外链',
    cacheable     bit    default 1 null comment '可缓存',
    visible       bit    default 1 null comment '可显示',
    enable        bit    default 1 null comment '启用',
    icon          varchar(100)     null comment '菜单图标',
    create_dept   bigint           null comment '创建部门',
    create_by     bigint           null comment '创建者',
    create_time   datetime         null comment '创建时间',
    update_by     bigint           null comment '更新者',
    update_time   datetime         null comment '更新时间'
)
    comment '系统菜单';
drop table if exists system_message;
create table system_message
(
    id          bigint auto_increment comment 'id' primary key,
    title       varchar(50)                  not null comment '消息标题',
    type        varchar(10) default 'NOTICE' not null comment '消息类型',
    content     varchar(5000)                null comment '内容',
    closed      bit         default 0        null comment '状态',
    publisher   bigint                       null comment '发布人',
    receiver    json                         null comment '接收人',
    create_dept bigint                       null comment '创建部门',
    create_by   bigint                       null comment '创建者',
    create_time datetime                     null comment '创建时间',
    update_by   bigint                       null comment '更新者',
    update_time datetime                     null comment '更新时间'
)
    comment '系统消息';
drop table if exists system_module;
create table system_module
(
    id          bigint auto_increment comment 'id' primary key,
    code        varchar(50)   not null comment '编码',
    name        varchar(50)   not null comment '名称',
    roles       json          null comment '角色',
    menus       json          null comment '菜单',
    enable      bit default 1 null comment '启用',
    create_dept bigint        null comment '创建部门',
    create_by   bigint        null comment '创建者',
    create_time datetime      null comment '创建时间',
    update_by   bigint        null comment '更新者',
    update_time datetime      null comment '更新时间',
    constraint code
        unique (code)
)
    comment '系统模块';
drop table if exists system_post;
create table system_post
(
    id          bigint auto_increment comment 'id' primary key,
    name        varchar(50)   not null comment '名称',
    code        varchar(50)   not null comment '编码',
    dept_id     bigint        not null comment '部门id',
    sort        int default 0 null comment '排序',
    enable      bit default 1 null comment '启用',
    create_dept bigint        null comment '创建部门',
    create_by   bigint        null comment '创建者',
    create_time datetime      null comment '创建时间',
    update_by   bigint        null comment '更新者',
    update_time datetime      null comment '更新时间',
    constraint code
        unique (code)
)
    comment '系统岗位';
drop table if exists system_role;
create table system_role
(
    id                  bigint auto_increment comment 'id' primary key,
    code                varchar(50)               not null comment '编码',
    name                varchar(50)               not null comment '名称',
    sort                int         default 0     null comment '排序',
    enable              bit         default 1     null comment '启用',
    menus               json                      null comment '菜单',
    menu_check_strictly bit         default 1     null comment '菜单树关联显示',
    departments         json                      null comment '部门',
    dept_check_strictly bit         default 1     null comment '部门树关联显示',
    data_scope          varchar(10) default 'ALL' null comment '数据权限范围',
    create_dept         bigint                    null comment '创建部门',
    create_by           bigint                    null comment '创建者',
    create_time         datetime                  null comment '创建时间',
    update_by           bigint                    null comment '更新者',
    update_time         datetime                  null comment '更新时间',
    constraint code
        unique (code)
)
    comment '系统权限';
drop table if exists system_user;
create table system_user
(
    id          bigint auto_increment comment 'id' primary key,
    username    varchar(50)                   not null comment '账号',
    dept_id     bigint                        null comment '部门',
    real_name   varchar(50)                   null comment '姓名',
    email       varchar(100)                  null comment '邮箱',
    phone       varchar(11)                   null comment '手机号码',
    gender      varchar(10) default 'UNKNOWN' null comment '性别',
    avatar      bigint                        null comment '头像',
    password    varchar(60)                   null comment '密码',
    salt        varchar(30)                   null comment '密码盐值',
    roles       json                          null comment '角色',
    posts       json                          null comment '岗位',
    modules     json                          null comment '模块',
    enable      bit         default 1         null comment '启用',
    pwd_changed bit         default 0         null comment '密码是否更改',
    expiry_date date                          null comment '过期日期',
    create_dept bigint                        null comment '创建部门',
    create_by   bigint                        null comment '创建者',
    create_time datetime                      null comment '创建时间',
    update_by   bigint                        null comment '更新者',
    update_time datetime                      null comment '更新时间',
    constraint username
        unique (username)
)
    comment '系统用户';
drop table if exists system_user_avatar;
create table system_user_avatar
(
    id     bigint auto_increment comment 'id' primary key,
    avatar blob null comment '头像'
)
    comment '用户头像表';




