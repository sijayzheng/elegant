-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: elegant
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `file_storage`
--

DROP TABLE IF EXISTS `file_storage`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_storage`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`          varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
    `original_name` varchar(255) NOT NULL DEFAULT '' COMMENT '原名',
    `suffix`        varchar(10)  NOT NULL DEFAULT '' COMMENT '文件后缀名',
    `url`           varchar(255) NOT NULL DEFAULT '' COMMENT '文件访问地址',
    `store_path`    varchar(255) NOT NULL DEFAULT '' COMMENT '文件存储路径',
    `create_dept`   bigint                DEFAULT NULL COMMENT '创建部门',
    `create_by`     bigint                DEFAULT NULL COMMENT '创建者',
    `create_time`   datetime              DEFAULT NULL COMMENT '创建时间',
    `update_by`     bigint                DEFAULT NULL COMMENT '更新者',
    `update_time`   datetime              DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='文件存储表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_storage`
--

LOCK TABLES `file_storage` WRITE;
/*!40000 ALTER TABLE `file_storage`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `file_storage`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_column`
--

DROP TABLE IF EXISTS `gen_column`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_column`
(
    `id`             bigint       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `column_name`    varchar(64)  NOT NULL DEFAULT '' COMMENT '字段名',
    `column_comment` varchar(255) NOT NULL COMMENT '字段描述',
    `table_id`       bigint       NOT NULL COMMENT '表id',
    `pk`             bit(1)                DEFAULT b'0' COMMENT '是否主键',
    `sort`           int                   DEFAULT '0' COMMENT '排序',
    `nullable`       bit(1)                DEFAULT b'0' COMMENT '可空',
    `length`         bigint                DEFAULT NULL COMMENT '长度',
    `data_type`      varchar(32)  NOT NULL COMMENT '字段类型',
    `java_field`     varchar(64)  NOT NULL COMMENT 'java 属性名',
    `java_type`      varchar(20)           DEFAULT 'STRING' COMMENT 'java 属性类型',
    `listable`       bit(1)                DEFAULT b'0' COMMENT '可列出',
    `editable`       bit(1)                DEFAULT b'0' COMMENT '可编辑',
    `queryable`      bit(1)                DEFAULT b'0' COMMENT '可查询',
    `exportable`     bit(1)                DEFAULT b'0' COMMENT '可导出',
    `html_type`      varchar(20)           DEFAULT NULL COMMENT '显示类型',
    `query_type`     varchar(10)           DEFAULT NULL COMMENT '查询方式',
    `dict_type`      varchar(20)           DEFAULT NULL COMMENT '字典类型',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 170
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='代码生成列定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_column`
--

LOCK TABLES `gen_column` WRITE;
/*!40000 ALTER TABLE `gen_column`
    DISABLE KEYS */;
INSERT INTO `gen_column`
VALUES (1, 'id', 'id', 1, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (2, 'name', '文件名', 1, _binary '\0', 2, _binary '\0', 255, 'varchar', 'name', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '\0', 'INPUT', 'NONE', NULL),
       (3, 'original_name', '原名', 1, _binary '\0', 3, _binary '\0', 255, 'varchar', 'originalName', 'STRING', _binary '', _binary '\0',
        _binary '', _binary '\0', 'INPUT', 'LIKE', NULL),
       (4, 'suffix', '文件后缀名', 1, _binary '\0', 4, _binary '\0', 10, 'varchar', 'suffix', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '\0', 'INPUT', 'NONE', NULL),
       (5, 'url', '文件访问地址', 1, _binary '\0', 5, _binary '\0', 255, 'varchar', 'url', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '\0', 'INPUT', 'NONE', NULL),
       (6, 'store_path', '文件存储路径', 1, _binary '\0', 6, _binary '\0', 255, 'varchar', 'storePath', 'STRING', _binary '', _binary '\0',
        _binary '\0', _binary '\0', 'INPUT', 'NONE', NULL),
       (7, 'create_dept', '创建部门', 1, _binary '\0', 7, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (8, 'create_by', '创建者', 1, _binary '\0', 8, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (9, 'create_time', '创建时间', 1, _binary '\0', 9, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0', _binary '\0',
        _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (10, 'update_by', '更新者', 1, _binary '\0', 10, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (11, 'update_time', '更新时间', 1, _binary '\0', 11, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (12, 'id', 'id', 2, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '', NULL,
        'NONE', NULL),
       (13, 'user_id', '用户id', 2, _binary '\0', 2, _binary '\0', 19, 'bigint', 'userId', 'LONG', _binary '', _binary '\0', _binary '',
        _binary '', NULL, 'NONE', NULL),
       (14, 'ip', '登录ip', 2, _binary '\0', 3, _binary '', 128, 'varchar', 'ip', 'STRING', _binary '', _binary '\0', _binary '\0', _binary '',
        NULL, 'LIKE', NULL),
       (15, 'location', '登录地点', 2, _binary '\0', 4, _binary '', 255, 'varchar', 'location', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'LIKE', NULL),
       (16, 'browser', '浏览器类型', 2, _binary '\0', 5, _binary '', 100, 'varchar', 'browser', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'NONE', NULL),
       (17, 'os', '操作系统', 2, _binary '\0', 6, _binary '', 50, 'varchar', 'os', 'STRING', _binary '', _binary '\0', _binary '\0', _binary '',
        NULL, 'NONE', NULL),
       (18, 'successful', '登录状态', 2, _binary '\0', 7, _binary '', 1, 'bit', 'successful', 'BOOLEAN', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'EQUAL', NULL),
       (19, 'msg', '提示消息', 2, _binary '\0', 8, _binary '', 255, 'varchar', 'msg', 'STRING', _binary '', _binary '\0', _binary '\0', _binary '',
        NULL, 'NONE', NULL),
       (20, 'time', '时间', 2, _binary '\0', 9, _binary '', NULL, 'datetime', 'time', 'LOCAL_DATE_TIME', _binary '', _binary '\0', _binary '',
        _binary '', NULL, 'BETWEEN', NULL),
       (21, 'id', 'id', 3, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (22, 'user_id', '用户id', 3, _binary '\0', 2, _binary '\0', 19, 'bigint', 'userId', 'LONG', _binary '', _binary '\0', _binary '',
        _binary '', NULL, 'NONE', NULL),
       (23, 'title', '模块标题', 3, _binary '\0', 3, _binary '', 50, 'varchar', 'title', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'LIKE', NULL),
       (24, 'method', '方法名称', 3, _binary '\0', 4, _binary '', 100, 'varchar', 'method', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'LIKE', NULL),
       (25, 'request_method', '请求方式', 3, _binary '\0', 5, _binary '', 10, 'varchar', 'requestMethod', 'STRING', _binary '', _binary '\0',
        _binary '\0', _binary '', NULL, 'NONE', NULL),
       (26, 'url', '请求URL', 3, _binary '\0', 6, _binary '', 255, 'varchar', 'url', 'STRING', _binary '', _binary '\0', _binary '\0', _binary '',
        NULL, 'LIKE', NULL),
       (27, 'ip', '主机地址', 3, _binary '\0', 7, _binary '', 128, 'varchar', 'ip', 'STRING', _binary '', _binary '\0', _binary '\0', _binary '',
        NULL, 'NONE', NULL),
       (28, 'location', '操作地点', 3, _binary '\0', 8, _binary '', 255, 'varchar', 'location', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'LIKE', NULL),
       (29, 'param', '请求参数', 3, _binary '\0', 9, _binary '', 2000, 'varchar', 'param', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'NONE', NULL),
       (30, 'result', '返回参数', 3, _binary '\0', 10, _binary '', 2000, 'varchar', 'result', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'NONE', NULL),
       (31, 'status', '操作状态', 3, _binary '\0', 11, _binary '', 10, 'int', 'status', 'INTEGER', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'NONE', NULL),
       (32, 'error_msg', '错误消息', 3, _binary '\0', 12, _binary '', 2000, 'varchar', 'errorMsg', 'STRING', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'NONE', NULL),
       (33, 'time', '操作时间', 3, _binary '\0', 13, _binary '', NULL, 'datetime', 'time', 'LOCAL_DATE_TIME', _binary '', _binary '\0', _binary '',
        _binary '', NULL, 'BETWEEN', NULL),
       (34, 'cost_time', '消耗时间', 3, _binary '\0', 14, _binary '', 19, 'bigint', 'costTime', 'LONG', _binary '', _binary '\0', _binary '\0',
        _binary '', NULL, 'NONE', NULL),
       (35, 'id', 'id', 4, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (36, 'name', '名称', 4, _binary '\0', 2, _binary '\0', 100, 'varchar', 'name', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (37, 'code', '编码', 4, _binary '\0', 3, _binary '\0', 100, 'varchar', 'code', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (38, 'value', '值', 4, _binary '\0', 4, _binary '\0', 500, 'varchar', 'value', 'STRING', _binary '', _binary '', _binary '\0', _binary '',
        'INPUT', 'NONE', NULL),
       (39, 'internal', '内置', 4, _binary '\0', 5, _binary '', 1, 'bit', 'internal', 'BOOLEAN', _binary '', _binary '', _binary '\0', _binary '',
        'RADIO', 'NONE', NULL),
       (40, 'create_dept', '创建部门', 4, _binary '\0', 6, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (41, 'create_by', '创建者', 4, _binary '\0', 7, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (42, 'create_time', '创建时间', 4, _binary '\0', 8, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0', _binary '\0',
        _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (43, 'update_by', '更新者', 4, _binary '\0', 9, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (44, 'update_time', '更新时间', 4, _binary '\0', 10, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (45, 'id', 'id', 5, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (46, 'name', '部门名称', 5, _binary '\0', 2, _binary '\0', 50, 'varchar', 'name', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (47, 'parent_id', '父部门id', 5, _binary '\0', 3, _binary '', 19, 'bigint', 'parentId', 'LONG', _binary '', _binary '', _binary '',
        _binary '', 'SELECT', 'NONE', NULL),
       (48, 'ancestors', '祖级列表', 5, _binary '\0', 4, _binary '', NULL, 'json', 'ancestors', 'LIST_LONG', _binary '', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (49, 'descendants', '后代列表', 5, _binary '\0', 5, _binary '', NULL, 'json', 'descendants', 'LIST_LONG', _binary '', _binary '\0',
        _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (50, 'sort', '排序', 5, _binary '\0', 6, _binary '', 10, 'int', 'sort', 'INTEGER', _binary '', _binary '', _binary '\0', _binary '',
        'INPUT_NUMBER', 'NONE', NULL),
       (51, 'leader', '负责人', 5, _binary '\0', 7, _binary '', 19, 'bigint', 'leader', 'LONG', _binary '', _binary '', _binary '', _binary '',
        'SELECT', 'NONE', NULL),
       (52, 'phone', '联系电话', 5, _binary '\0', 8, _binary '', 11, 'varchar', 'phone', 'STRING', _binary '', _binary '', _binary '',
        _binary '', 'INPUT', 'LIKE', NULL),
       (53, 'email', '邮箱', 5, _binary '\0', 9, _binary '', 100, 'varchar', 'email', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (54, 'enable', '启用', 5, _binary '\0', 10, _binary '', 1, 'bit', 'enable', 'BOOLEAN', _binary '', _binary '', _binary '', _binary '',
        'RADIO', 'EQUAL', NULL),
       (55, 'create_dept', '创建部门', 5, _binary '\0', 11, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (56, 'create_by', '创建者', 5, _binary '\0', 12, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (57, 'create_time', '创建时间', 5, _binary '\0', 13, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (58, 'update_by', '更新者', 5, _binary '\0', 14, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (59, 'update_time', '更新时间', 5, _binary '\0', 15, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (60, 'id', 'id', 6, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (61, 'code', '编码', 6, _binary '\0', 2, _binary '\0', 100, 'varchar', 'code', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (62, 'name', '名称', 6, _binary '\0', 3, _binary '\0', 100, 'varchar', 'name', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (63, 'create_dept', '创建部门', 6, _binary '\0', 4, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (64, 'create_by', '创建者', 6, _binary '\0', 5, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (65, 'create_time', '创建时间', 6, _binary '\0', 6, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0', _binary '\0',
        _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (66, 'update_by', '更新者', 6, _binary '\0', 7, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (67, 'update_time', '更新时间', 6, _binary '\0', 8, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0', _binary '\0',
        _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (68, 'id', 'id', 7, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (69, 'dict_id', '字典', 7, _binary '\0', 2, _binary '\0', 19, 'bigint', 'dictId', 'LONG', _binary '', _binary '', _binary '', _binary '',
        'SELECT', 'NONE', NULL),
       (70, 'label', '标签', 7, _binary '\0', 3, _binary '\0', 100, 'varchar', 'label', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (71, 'value', '键值', 7, _binary '\0', 4, _binary '\0', 100, 'varchar', 'value', 'STRING', _binary '', _binary '', _binary '\0', _binary '',
        'INPUT', 'LIKE', NULL),
       (72, 'sort', '排序', 7, _binary '\0', 5, _binary '', 10, 'int', 'sort', 'INTEGER', _binary '', _binary '', _binary '\0', _binary '',
        'INPUT_NUMBER', 'NONE', NULL),
       (73, 'class_name', '样式属性', 7, _binary '\0', 6, _binary '', 100, 'varchar', 'className', 'STRING', _binary '', _binary '', _binary '\0',
        _binary '', 'INPUT', 'LIKE', NULL),
       (74, 'show_type', '表格回显样式', 7, _binary '\0', 7, _binary '', 10, 'varchar', 'showType', 'STRING', _binary '', _binary '', _binary '\0',
        _binary '', 'INPUT', 'LIKE', NULL),
       (75, 'default_value', '是否默认', 7, _binary '\0', 8, _binary '', 1, 'bit', 'defaultValue', 'BOOLEAN', _binary '', _binary '', _binary '\0',
        _binary '', 'RADIO', 'EQUAL', NULL),
       (76, 'create_dept', '创建部门', 7, _binary '\0', 9, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (77, 'create_by', '创建者', 7, _binary '\0', 10, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (78, 'create_time', '创建时间', 7, _binary '\0', 11, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (79, 'update_by', '更新者', 7, _binary '\0', 12, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (80, 'update_time', '更新时间', 7, _binary '\0', 13, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (81, 'id', 'id', 8, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (82, 'parent_id', '父菜单id', 8, _binary '\0', 2, _binary '', 19, 'bigint', 'parentId', 'LONG', _binary '', _binary '', _binary '',
        _binary '', 'INPUT_NUMBER', 'NONE', NULL),
       (83, 'name', '菜单名称', 8, _binary '\0', 3, _binary '\0', 50, 'varchar', 'name', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (84, 'perms_code', '权限编码', 8, _binary '\0', 4, _binary '\0', 100, 'varchar', 'permsCode', 'STRING', _binary '', _binary '', _binary '',
        _binary '', 'INPUT', 'LIKE', NULL),
       (85, 'sort', '排序', 8, _binary '\0', 5, _binary '', 10, 'int', 'sort', 'INTEGER', _binary '', _binary '', _binary '\0', _binary '',
        'INPUT_NUMBER', 'NONE', NULL),
       (86, 'path', '路由地址', 8, _binary '\0', 6, _binary '', 200, 'varchar', 'path', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (87, 'component', '组件路径', 8, _binary '\0', 7, _binary '', 255, 'varchar', 'component', 'STRING', _binary '', _binary '', _binary '\0',
        _binary '', 'INPUT', 'LIKE', NULL),
       (88, 'type', '菜单类型', 8, _binary '\0', 8, _binary '\0', 1, 'varchar', 'type', 'STRING', _binary '', _binary '', _binary '\0', _binary '',
        'INPUT', 'LIKE', NULL),
       (89, 'external_link', '是否外链', 8, _binary '\0', 9, _binary '', 1, 'bit', 'externalLink', 'BOOLEAN', _binary '', _binary '', _binary '\0',
        _binary '', 'RADIO', 'EQUAL', NULL),
       (90, 'cacheable', '可缓存', 8, _binary '\0', 10, _binary '', 1, 'bit', 'cacheable', 'BOOLEAN', _binary '', _binary '', _binary '\0',
        _binary '', 'RADIO', 'EQUAL', NULL),
       (91, 'visible', '可显示', 8, _binary '\0', 11, _binary '', 1, 'bit', 'visible', 'BOOLEAN', _binary '', _binary '', _binary '\0',
        _binary '', 'RADIO', 'EQUAL', NULL),
       (92, 'enable', '启用', 8, _binary '\0', 12, _binary '', 1, 'bit', 'enable', 'BOOLEAN', _binary '', _binary '', _binary '\0', _binary '',
        'RADIO', 'EQUAL', NULL),
       (93, 'icon', '菜单图标', 8, _binary '\0', 13, _binary '', 100, 'varchar', 'icon', 'STRING', _binary '', _binary '', _binary '\0',
        _binary '', 'INPUT', 'LIKE', NULL),
       (94, 'create_dept', '创建部门', 8, _binary '\0', 14, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (95, 'create_by', '创建者', 8, _binary '\0', 15, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (96, 'create_time', '创建时间', 8, _binary '\0', 16, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (97, 'update_by', '更新者', 8, _binary '\0', 17, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (98, 'update_time', '更新时间', 8, _binary '\0', 18, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (99, 'id', 'id', 9, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (100, 'title', '消息标题', 9, _binary '\0', 2, _binary '\0', 50, 'varchar', 'title', 'STRING', _binary '', _binary '', _binary '',
        _binary '', 'INPUT', 'LIKE', NULL),
       (101, 'type', '消息类型', 9, _binary '\0', 3, _binary '\0', 10, 'varchar', 'type', 'STRING', _binary '', _binary '', _binary '',
        _binary '', 'INPUT', 'LIKE', NULL),
       (102, 'content', '内容', 9, _binary '\0', 4, _binary '', 5000, 'varchar', 'content', 'STRING', _binary '', _binary '', _binary '\0',
        _binary '', 'TEXTAREA', 'LIKE', NULL),
       (103, 'closed', '状态', 9, _binary '\0', 5, _binary '', 1, 'bit', 'closed', 'BOOLEAN', _binary '', _binary '', _binary '', _binary '',
        'RADIO', 'EQUAL', NULL),
       (104, 'publisher', '发布人', 9, _binary '\0', 6, _binary '', 19, 'bigint', 'publisher', 'LONG', _binary '', _binary '', _binary '',
        _binary '', 'SELECT', 'NONE', NULL),
       (105, 'receiver', '接收人', 9, _binary '\0', 7, _binary '', NULL, 'json', 'receiver', 'LIST_LONG', _binary '', _binary '', _binary '\0',
        _binary '', 'SELECT', 'NONE', NULL),
       (106, 'create_dept', '创建部门', 9, _binary '\0', 8, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (107, 'create_by', '创建者', 9, _binary '\0', 9, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (108, 'create_time', '创建时间', 9, _binary '\0', 10, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (109, 'update_by', '更新者', 9, _binary '\0', 11, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (110, 'update_time', '更新时间', 9, _binary '\0', 12, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (111, 'id', 'id', 10, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (112, 'code', '编码', 10, _binary '\0', 2, _binary '\0', 50, 'varchar', 'code', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (113, 'name', '名称', 10, _binary '\0', 3, _binary '\0', 50, 'varchar', 'name', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (114, 'roles', '角色', 10, _binary '\0', 4, _binary '', NULL, 'json', 'roles', 'LIST_LONG', _binary '', _binary '', _binary '\0',
        _binary '', 'SELECT', 'NONE', NULL),
       (115, 'menus', '菜单', 10, _binary '\0', 5, _binary '', NULL, 'json', 'menus', 'LIST_LONG', _binary '', _binary '', _binary '\0',
        _binary '', 'SELECT', 'NONE', NULL),
       (116, 'enable', '启用', 10, _binary '\0', 6, _binary '', 1, 'bit', 'enable', 'BOOLEAN', _binary '', _binary '', _binary '\0', _binary '',
        'RADIO', 'EQUAL', NULL),
       (117, 'create_dept', '创建部门', 10, _binary '\0', 7, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0',
        _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (118, 'create_by', '创建者', 10, _binary '\0', 8, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (119, 'create_time', '创建时间', 10, _binary '\0', 9, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (120, 'update_by', '更新者', 10, _binary '\0', 10, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (121, 'update_time', '更新时间', 10, _binary '\0', 11, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (122, 'id', 'id', 11, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (123, 'name', '名称', 11, _binary '\0', 2, _binary '\0', 50, 'varchar', 'name', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (124, 'code', '编码', 11, _binary '\0', 3, _binary '\0', 50, 'varchar', 'code', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (125, 'dept_id', '部门id', 11, _binary '\0', 4, _binary '\0', 19, 'bigint', 'deptId', 'LONG', _binary '', _binary '', _binary '',
        _binary '', 'SELECT', 'NONE', NULL),
       (126, 'sort', '排序', 11, _binary '\0', 5, _binary '', 10, 'int', 'sort', 'INTEGER', _binary '', _binary '', _binary '\0', _binary '',
        'INPUT_NUMBER', 'NONE', NULL),
       (127, 'enable', '启用', 11, _binary '\0', 6, _binary '', 1, 'bit', 'enable', 'BOOLEAN', _binary '', _binary '', _binary '\0', _binary '',
        'RADIO', 'EQUAL', NULL),
       (128, 'create_dept', '创建部门', 11, _binary '\0', 7, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0',
        _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (129, 'create_by', '创建者', 11, _binary '\0', 8, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (130, 'create_time', '创建时间', 11, _binary '\0', 9, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (131, 'update_by', '更新者', 11, _binary '\0', 10, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (132, 'update_time', '更新时间', 11, _binary '\0', 11, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (133, 'id', 'id', 12, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (134, 'code', '编码', 12, _binary '\0', 2, _binary '\0', 50, 'varchar', 'code', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (135, 'name', '名称', 12, _binary '\0', 3, _binary '\0', 50, 'varchar', 'name', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (136, 'sort', '排序', 12, _binary '\0', 4, _binary '', 10, 'int', 'sort', 'INTEGER', _binary '', _binary '', _binary '\0', _binary '',
        'INPUT_NUMBER', 'NONE', NULL),
       (137, 'enable', '启用', 12, _binary '\0', 5, _binary '', 1, 'bit', 'enable', 'BOOLEAN', _binary '', _binary '', _binary '\0', _binary '',
        'RADIO', 'EQUAL', NULL),
       (138, 'menus', '菜单', 12, _binary '\0', 6, _binary '', NULL, 'json', 'menus', 'LIST_LONG', _binary '', _binary '', _binary '\0',
        _binary '', 'SELECT', 'NONE', NULL),
       (139, 'menu_check_strictly', '菜单树关联显示', 12, _binary '\0', 7, _binary '', 1, 'bit', 'menuCheckStrictly', 'BOOLEAN', _binary '',
        _binary '', _binary '\0', _binary '', 'RADIO', 'EQUAL', NULL),
       (140, 'departments', '部门', 12, _binary '\0', 8, _binary '', NULL, 'json', 'departments', 'LIST_LONG', _binary '', _binary '',
        _binary '\0', _binary '', 'SELECT', 'NONE', NULL),
       (141, 'dept_check_strictly', '部门树关联显示', 12, _binary '\0', 9, _binary '', 1, 'bit', 'deptCheckStrictly', 'BOOLEAN', _binary '',
        _binary '', _binary '\0', _binary '', 'RADIO', 'EQUAL', NULL),
       (142, 'data_scope', '数据权限范围', 12, _binary '\0', 10, _binary '', 10, 'varchar', 'dataScope', 'STRING', _binary '', _binary '',
        _binary '\0', _binary '', 'SELECT', 'NONE', NULL),
       (143, 'create_dept', '创建部门', 12, _binary '\0', 11, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0',
        _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (144, 'create_by', '创建者', 12, _binary '\0', 12, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (145, 'create_time', '创建时间', 12, _binary '\0', 13, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (146, 'update_by', '更新者', 12, _binary '\0', 14, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (147, 'update_time', '更新时间', 12, _binary '\0', 15, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (148, 'id', 'id', 13, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (149, 'username', '账号', 13, _binary '\0', 2, _binary '\0', 20, 'varchar', 'username', 'STRING', _binary '', _binary '', _binary '',
        _binary '', 'INPUT', 'LIKE', NULL),
       (150, 'dept_id', '部门', 13, _binary '\0', 3, _binary '', 19, 'bigint', 'deptId', 'LONG', _binary '', _binary '', _binary '', _binary '',
        'SELECT', 'NONE', NULL),
       (151, 'real_name', '姓名', 13, _binary '\0', 4, _binary '', 50, 'varchar', 'realName', 'STRING', _binary '', _binary '', _binary '',
        _binary '', 'INPUT', 'LIKE', NULL),
       (152, 'email', '邮箱', 13, _binary '\0', 5, _binary '', 100, 'varchar', 'email', 'STRING', _binary '', _binary '', _binary '', _binary '',
        'INPUT', 'LIKE', NULL),
       (153, 'phone', '手机号码', 13, _binary '\0', 6, _binary '', 11, 'varchar', 'phone', 'STRING', _binary '', _binary '', _binary '',
        _binary '', 'INPUT', 'LIKE', NULL),
       (154, 'gender', '性别', 13, _binary '\0', 7, _binary '', 10, 'varchar', 'gender', 'STRING', _binary '', _binary '', _binary '\0',
        _binary '', 'INPUT', 'LIKE', NULL),
       (155, 'avatar', '头像', 13, _binary '\0', 8, _binary '', 19, 'bigint', 'avatar', 'LONG', _binary '', _binary '', _binary '\0', _binary '',
        'INPUT_NUMBER', 'NONE', NULL),
       (156, 'password', '密码', 13, _binary '\0', 9, _binary '', 255, 'varchar', 'password', 'STRING', _binary '', _binary '', _binary '\0',
        _binary '\0', 'INPUT', 'NONE', NULL),
       (157, 'roles', '角色', 13, _binary '\0', 10, _binary '', NULL, 'json', 'roles', 'LIST_LONG', _binary '', _binary '', _binary '\0',
        _binary '\0', 'SELECT', 'NONE', NULL),
       (158, 'posts', '岗位', 13, _binary '\0', 11, _binary '', NULL, 'json', 'posts', 'LIST_LONG', _binary '', _binary '', _binary '\0',
        _binary '\0', 'SELECT', 'NONE', NULL),
       (159, 'modules', '模块', 13, _binary '\0', 12, _binary '', NULL, 'json', 'modules', 'LIST_LONG', _binary '', _binary '', _binary '\0',
        _binary '\0', 'SELECT', 'NONE', NULL),
       (160, 'enable', '启用', 13, _binary '\0', 13, _binary '', 1, 'bit', 'enable', 'BOOLEAN', _binary '', _binary '', _binary '\0', _binary '',
        'RADIO', 'EQUAL', NULL),
       (161, 'pwd_changed', '密码是否更改', 13, _binary '\0', 14, _binary '', 1, 'bit', 'pwdChanged', 'BOOLEAN', _binary '', _binary '',
        _binary '\0', _binary '', 'RADIO', 'EQUAL', NULL),
       (162, 'expiry_date', '过期日期', 13, _binary '\0', 15, _binary '', NULL, 'date', 'expiryDate', 'LOCAL_DATE', _binary '', _binary '',
        _binary '\0', _binary '', 'DATE_PICKER', 'BETWEEN', NULL),
       (163, 'create_dept', '创建部门', 13, _binary '\0', 16, _binary '', 19, 'bigint', 'createDept', 'LONG', _binary '\0', _binary '\0',
        _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (164, 'create_by', '创建者', 13, _binary '\0', 17, _binary '', 19, 'bigint', 'createBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (165, 'create_time', '创建时间', 13, _binary '\0', 18, _binary '', NULL, 'datetime', 'createTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (166, 'update_by', '更新者', 13, _binary '\0', 19, _binary '', 19, 'bigint', 'updateBy', 'LONG', _binary '\0', _binary '\0', _binary '\0',
        _binary '\0', NULL, 'NONE', NULL),
       (167, 'update_time', '更新时间', 13, _binary '\0', 20, _binary '', NULL, 'datetime', 'updateTime', 'LOCAL_DATE_TIME', _binary '\0',
        _binary '\0', _binary '\0', _binary '\0', NULL, 'NONE', NULL),
       (168, 'id', 'id', 14, _binary '', 1, _binary '\0', 19, 'bigint', 'id', 'LONG', _binary '\0', _binary '\0', _binary '\0', _binary '\0', NULL,
        'NONE', NULL),
       (169, 'avatar', '头像', 14, _binary '\0', 2, _binary '', 65535, 'blob', 'avatar', 'BYTE_ARRAY', _binary '', _binary '', _binary '\0',
        _binary '\0', 'FILE_UPLOAD', 'NONE', NULL);
/*!40000 ALTER TABLE `gen_column`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table`
(
    `id`              bigint       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `table_name`      varchar(200) NOT NULL DEFAULT '' COMMENT '表名称',
    `table_comment`   varchar(500) NOT NULL DEFAULT '' COMMENT '表描述',
    `module_name`     varchar(30)           DEFAULT '' COMMENT '生成模块名',
    `class_name`      varchar(100) NOT NULL DEFAULT '' COMMENT '类名称',
    `class_comment`   varchar(50)  NOT NULL DEFAULT '' COMMENT '类描述',
    `tree_show`       bit(1)                DEFAULT b'0' COMMENT '树形',
    `parent_menu_id`  bigint                DEFAULT NULL COMMENT '父菜单编号',
    `tree_key`        varchar(20)           DEFAULT NULL COMMENT '树节点标识',
    `tree_label`      varchar(20)           DEFAULT NULL COMMENT '树节点标签',
    `tree_parent_key` varchar(20)           DEFAULT NULL COMMENT '树父节点标识',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='代码生成表定义';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table`
    DISABLE KEYS */;
INSERT INTO `gen_table`
VALUES (1, 'file_storage', '文件存储表', 'file', 'FileStorage', '文件存储', _binary '\0', NULL, NULL, NULL, NULL),
       (2, 'log_login', '登录日志表', 'log', 'LogLogin', '登录日志', _binary '\0', NULL, NULL, NULL, NULL),
       (3, 'log_operate', '操作日志表', 'log', 'LogOperate', '操作日志', _binary '\0', NULL, NULL, NULL, NULL),
       (4, 'system_config', '系统配置', 'system', 'SystemConfig', '系统配置', _binary '\0', NULL, NULL, NULL, NULL),
       (5, 'system_dept', '系统部门', 'system', 'SystemDept', '系统部门', _binary '', NULL, NULL, NULL, NULL),
       (6, 'system_dict', '系统字典', 'system', 'SystemDict', '系统字典', _binary '\0', NULL, NULL, NULL, NULL),
       (7, 'system_dict_data', '系统字典数据', 'system', 'SystemDictData', '系统字典数据', _binary '\0', NULL, NULL, NULL, NULL),
       (8, 'system_menu', '系统菜单', 'system', 'SystemMenu', '系统菜单', _binary '', NULL, NULL, NULL, NULL),
       (9, 'system_message', '系统消息', 'system', 'SystemMessage', '系统消息', _binary '\0', NULL, NULL, NULL, NULL),
       (10, 'system_module', '系统模块', 'system', 'SystemModule', '系统模块', _binary '\0', NULL, NULL, NULL, NULL),
       (11, 'system_post', '系统岗位', 'system', 'SystemPost', '系统岗位', _binary '\0', NULL, NULL, NULL, NULL),
       (12, 'system_role', '系统权限', 'system', 'SystemRole', '系统权限', _binary '\0', NULL, NULL, NULL, NULL),
       (13, 'system_user', '系统用户', 'system', 'SystemUser', '系统用户', _binary '\0', NULL, NULL, NULL, NULL),
       (14, 'system_user_avatar', '用户头像表', 'system', 'SystemUserAvatar', '用户头像', _binary '\0', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `gen_table`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_login`
--

DROP TABLE IF EXISTS `log_login`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_login`
(
    `id`         bigint      NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`    bigint      NOT NULL COMMENT '用户id',
    `username`   varchar(50) NOT NULL COMMENT '用户名',
    `ip`         varchar(128) DEFAULT NULL COMMENT '登录ip',
    `location`   varchar(255) DEFAULT NULL COMMENT '登录地点',
    `browser`    varchar(100) DEFAULT NULL COMMENT '浏览器类型',
    `os`         varchar(50)  DEFAULT NULL COMMENT '操作系统',
    `successful` bit(1)       DEFAULT b'0' COMMENT '登录状态',
    `msg`        varchar(255) DEFAULT NULL COMMENT '提示消息',
    `time`       datetime     DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 36
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='登录日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_login`
--

LOCK TABLES `log_login` WRITE;
/*!40000 ALTER TABLE `log_login`
    DISABLE KEYS */;
INSERT INTO `log_login`
VALUES (2, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-28 16:50:35'),
       (3, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Chrome Mobile WebView 123', 'Android 14', _binary '', '登录成功', '2025-05-28 16:51:59'),
       (4, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-28 16:58:36'),
       (5, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-28 17:06:10'),
       (6, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-28 17:21:57'),
       (7, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-28 17:24:29'),
       (8, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:03:07'),
       (9, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:08:58'),
       (10, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:10:06'),
       (11, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:12:09'),
       (12, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:13:01'),
       (13, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:22:11'),
       (14, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:29:18'),
       (15, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:33:28'),
       (16, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:37:37'),
       (17, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:45:05'),
       (18, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '退出成功', '2025-05-29 10:45:05'),
       (19, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:46:32'),
       (20, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '退出成功', '2025-05-29 10:46:32'),
       (21, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:46:57'),
       (22, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '退出成功', '2025-05-29 10:46:58'),
       (23, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:48:01'),
       (24, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '退出成功', '2025-05-29 10:50:22'),
       (25, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:52:25'),
       (26, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '退出成功', '2025-05-29 10:52:25'),
       (27, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 10:53:20'),
       (28, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 15:39:49'),
       (29, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 16:30:34'),
       (30, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 16:30:47'),
       (31, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 17:04:46'),
       (32, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '退出成功', '2025-05-29 17:05:45'),
       (33, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 17:11:52'),
       (34, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '退出成功', '2025-05-29 17:14:11'),
       (35, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, 'Edge 136', 'Windows 10', _binary '', '登录成功', '2025-05-29 17:14:15');
/*!40000 ALTER TABLE `log_login`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_operate`
--

DROP TABLE IF EXISTS `log_operate`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_operate`
(
    `id`             bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `user_id`        bigint NOT NULL COMMENT '用户id',
    `title`          varchar(50)   DEFAULT NULL COMMENT '模块标题',
    `method`         varchar(100)  DEFAULT NULL COMMENT '方法名称',
    `request_method` varchar(10)   DEFAULT NULL COMMENT '请求方式',
    `url`            varchar(255)  DEFAULT NULL COMMENT '请求URL',
    `ip`             varchar(128)  DEFAULT NULL COMMENT '主机地址',
    `location`       varchar(255)  DEFAULT NULL COMMENT '操作地点',
    `param`          varchar(2000) DEFAULT NULL COMMENT '请求参数',
    `result`         varchar(2000) DEFAULT NULL COMMENT '返回参数',
    `status`         int           DEFAULT '200' COMMENT '操作状态',
    `error_msg`      varchar(2000) DEFAULT NULL COMMENT '错误消息',
    `time`           datetime      DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
    `cost_time`      bigint        DEFAULT '0' COMMENT '消耗时间',
    PRIMARY KEY (`id`),
    KEY `idx_log_operate_status` (`status`),
    KEY `idx_log_operate_time` (`time`),
    KEY `idx_log_operate_user_id` (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_operate`
--

LOCK TABLES `log_operate` WRITE;
/*!40000 ALTER TABLE `log_operate`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `log_operate`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_config`
--

DROP TABLE IF EXISTS `system_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_config`
(
    `id`          bigint       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`        varchar(100) NOT NULL COMMENT '名称',
    `code`        varchar(100) NOT NULL COMMENT '编码',
    `value`       varchar(500) NOT NULL COMMENT '值',
    `internal`    bit(1)   DEFAULT b'0' COMMENT '内置',
    `create_dept` bigint   DEFAULT NULL COMMENT '创建部门',
    `create_by`   bigint   DEFAULT NULL COMMENT '创建者',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint   DEFAULT NULL COMMENT '更新者',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='系统配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_config`
--

LOCK TABLES `system_config` WRITE;
/*!40000 ALTER TABLE `system_config`
    DISABLE KEYS */;
INSERT INTO `system_config`
VALUES (1, '初始密码', 'initPassword', '123456', _binary '', NULL, NULL, NULL, NULL, NULL),
       (2, '密码最大重试次数', 'passwordMaxRetryCount', '5', _binary '', NULL, NULL, NULL, NULL, NULL),
       (3, '重试锁定时间(分钟)', 'passwordLockTime', '10', _binary '', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `system_config`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dept`
--

DROP TABLE IF EXISTS `system_dept`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dept`
(
    `id`          bigint      NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`        varchar(50) NOT NULL COMMENT '部门名称',
    `parent_id`   bigint       DEFAULT NULL COMMENT '父部门id',
    `ancestors`   json         DEFAULT NULL COMMENT '祖级列表',
    `descendants` json         DEFAULT NULL COMMENT '后代列表',
    `sort`        int          DEFAULT NULL COMMENT '排序',
    `leader`      bigint       DEFAULT NULL COMMENT '负责人',
    `phone`       varchar(11)  DEFAULT NULL COMMENT '联系电话',
    `email`       varchar(100) DEFAULT NULL COMMENT '邮箱',
    `enable`      bit(1)       DEFAULT b'1' COMMENT '启用',
    `create_dept` bigint       DEFAULT NULL COMMENT '创建部门',
    `create_by`   bigint       DEFAULT NULL COMMENT '创建者',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint       DEFAULT NULL COMMENT '更新者',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='系统部门';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dept`
--

LOCK TABLES `system_dept` WRITE;
/*!40000 ALTER TABLE `system_dept`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `system_dept`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dict`
--

DROP TABLE IF EXISTS `system_dict`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dict`
(
    `id`          bigint       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `code`        varchar(100) NOT NULL COMMENT '编码',
    `name`        varchar(100) NOT NULL COMMENT '名称',
    `create_dept` bigint   DEFAULT NULL COMMENT '创建部门',
    `create_by`   bigint   DEFAULT NULL COMMENT '创建者',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint   DEFAULT NULL COMMENT '更新者',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='系统字典';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dict`
--

LOCK TABLES `system_dict` WRITE;
/*!40000 ALTER TABLE `system_dict`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `system_dict`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_dict_data`
--

DROP TABLE IF EXISTS `system_dict_data`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_dict_data`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `dict_id`       bigint       NOT NULL COMMENT '字典',
    `label`         varchar(100) NOT NULL COMMENT '标签',
    `value`         varchar(100) NOT NULL COMMENT '键值',
    `sort`          int          DEFAULT '0' COMMENT '排序',
    `class_name`    varchar(100) DEFAULT NULL COMMENT '样式属性',
    `show_type`     varchar(10)  DEFAULT 'NONE' COMMENT '表格回显样式',
    `default_value` bit(1)       DEFAULT b'0' COMMENT '是否默认',
    `create_dept`   bigint       DEFAULT NULL COMMENT '创建部门',
    `create_by`     bigint       DEFAULT NULL COMMENT '创建者',
    `create_time`   datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`     bigint       DEFAULT NULL COMMENT '更新者',
    `update_time`   datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    KEY `idx_system_dict_data_dict_id` (`dict_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='系统字典数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_dict_data`
--

LOCK TABLES `system_dict_data` WRITE;
/*!40000 ALTER TABLE `system_dict_data`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `system_dict_data`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_menu`
--

DROP TABLE IF EXISTS `system_menu`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_menu`
(
    `id`            bigint       NOT NULL AUTO_INCREMENT COMMENT 'id',
    `parent_id`     bigint       DEFAULT '0' COMMENT '父菜单id',
    `name`          varchar(50)  NOT NULL COMMENT '菜单名称',
    `perms_code`    varchar(100) NOT NULL COMMENT '权限编码',
    `sort`          int          DEFAULT '0' COMMENT '排序',
    `path`          varchar(200) DEFAULT NULL COMMENT '路由地址',
    `component`     varchar(255) DEFAULT NULL COMMENT '组件路径',
    `type`          varchar(1)   NOT NULL COMMENT '菜单类型',
    `external_link` bit(1)       DEFAULT b'0' COMMENT '是否外链',
    `cacheable`     bit(1)       DEFAULT b'1' COMMENT '可缓存',
    `visible`       bit(1)       DEFAULT b'1' COMMENT '可显示',
    `enable`        bit(1)       DEFAULT b'1' COMMENT '启用',
    `icon`          varchar(100) DEFAULT NULL COMMENT '菜单图标',
    `create_dept`   bigint       DEFAULT NULL COMMENT '创建部门',
    `create_by`     bigint       DEFAULT NULL COMMENT '创建者',
    `create_time`   datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`     bigint       DEFAULT NULL COMMENT '更新者',
    `update_time`   datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 102
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='系统菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_menu`
--

LOCK TABLES `system_menu` WRITE;
/*!40000 ALTER TABLE `system_menu`
    DISABLE KEYS */;
INSERT INTO `system_menu`
VALUES (1, 0, '系统管理', 'sys_manage', 1, 'sysManage', NULL, 'M', _binary '\0', _binary '', _binary '', _binary '', NULL, 1, NULL, NULL, NULL,
        NULL),
       (2, 0, '系统工具', 'sys_tool', 2, 'sysTool', NULL, 'M', _binary '\0', _binary '', _binary '', _binary '', NULL, 1, NULL, NULL, NULL, NULL),
       (3, 0, '系统监控', 'sys_monitor', 3, 'sysMonitor', NULL, 'M', _binary '\0', _binary '', _binary '', _binary '', NULL, 1, NULL, NULL, NULL,
        NULL),
       (4, 1, '文件存储', 'file:fileStorage:list', 1, 'fileStorage', 'file/fileStorage', 'M', _binary '\0', _binary '', _binary '', _binary '',
        NULL, NULL, NULL, NULL, NULL, NULL),
       (5, 4, '文件存储查询', 'file:fileStorage:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (6, 4, '文件存储新增', 'file:fileStorage:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL, NULL,
        NULL, NULL),
       (7, 4, '文件存储修改', 'file:fileStorage:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (8, 4, '文件存储删除', 'file:fileStorage:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (9, 4, '文件存储导入', 'file:fileStorage:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (10, 4, '文件存储导出', 'file:fileStorage:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (11, 1, '登录日志', 'log:logLogin:list', 1, 'logLogin', 'log/logLogin', 'M', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (12, 11, '登录日志查询', 'log:logLogin:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL, NULL,
        NULL, NULL),
       (13, 11, '登录日志新增', 'log:logLogin:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL, NULL,
        NULL, NULL),
       (14, 11, '登录日志修改', 'log:logLogin:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL, NULL,
        NULL, NULL),
       (15, 11, '登录日志删除', 'log:logLogin:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (16, 11, '登录日志导入', 'log:logLogin:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (17, 11, '登录日志导出', 'log:logLogin:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (18, 1, '操作日志', 'log:logOperate:list', 1, 'logOperate', 'log/logOperate', 'M', _binary '\0', _binary '', _binary '', _binary '', NULL,
        NULL, NULL, NULL, NULL, NULL),
       (19, 18, '操作日志查询', 'log:logOperate:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (20, 18, '操作日志新增', 'log:logOperate:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL, NULL,
        NULL, NULL),
       (21, 18, '操作日志修改', 'log:logOperate:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (22, 18, '操作日志删除', 'log:logOperate:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (23, 18, '操作日志导入', 'log:logOperate:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (24, 18, '操作日志导出', 'log:logOperate:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (25, 1, '系统配置', 'system:systemConfig:list', 1, 'systemConfig', 'system/systemConfig', 'M', _binary '\0', _binary '', _binary '',
        _binary '', NULL, NULL, NULL, NULL, NULL, NULL),
       (26, 25, '系统配置查询', 'system:systemConfig:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (27, 25, '系统配置新增', 'system:systemConfig:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (28, 25, '系统配置修改', 'system:systemConfig:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (29, 25, '系统配置删除', 'system:systemConfig:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (30, 25, '系统配置导入', 'system:systemConfig:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (31, 25, '系统配置导出', 'system:systemConfig:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (32, 1, '系统部门', 'system:systemDept:list', 1, 'systemDept', 'system/systemDept', 'M', _binary '\0', _binary '', _binary '', _binary '',
        NULL, NULL, NULL, NULL, NULL, NULL),
       (33, 32, '系统部门查询', 'system:systemDept:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (34, 32, '系统部门新增', 'system:systemDept:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (35, 32, '系统部门修改', 'system:systemDept:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (36, 32, '系统部门删除', 'system:systemDept:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (37, 32, '系统部门导入', 'system:systemDept:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (38, 32, '系统部门导出', 'system:systemDept:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (39, 1, '系统字典数据', 'system:systemDictData:list', 1, 'systemDictData', 'system/systemDictData', 'M', _binary '\0', _binary '',
        _binary '', _binary '', NULL, NULL, NULL, NULL, NULL, NULL),
       (40, 39, '系统字典数据查询', 'system:systemDictData:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL,
        NULL, NULL, NULL, NULL, NULL),
       (41, 39, '系统字典数据新增', 'system:systemDictData:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (42, 39, '系统字典数据修改', 'system:systemDictData:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (43, 39, '系统字典数据删除', 'system:systemDictData:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL,
        NULL, NULL, NULL, NULL, NULL),
       (44, 39, '系统字典数据导入', 'system:systemDictData:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL,
        NULL, NULL, NULL, NULL, NULL),
       (45, 39, '系统字典数据导出', 'system:systemDictData:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL,
        NULL, NULL, NULL, NULL, NULL),
       (46, 1, '系统字典', 'system:systemDict:list', 1, 'systemDict', 'system/systemDict', 'M', _binary '\0', _binary '', _binary '', _binary '',
        NULL, NULL, NULL, NULL, NULL, NULL),
       (47, 46, '系统字典查询', 'system:systemDict:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (48, 46, '系统字典新增', 'system:systemDict:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (49, 46, '系统字典修改', 'system:systemDict:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (50, 46, '系统字典删除', 'system:systemDict:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (51, 46, '系统字典导入', 'system:systemDict:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (52, 46, '系统字典导出', 'system:systemDict:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (53, 1, '系统菜单', 'system:systemMenu:list', 1, 'systemMenu', 'system/systemMenu', 'M', _binary '\0', _binary '', _binary '', _binary '',
        NULL, NULL, NULL, NULL, NULL, NULL),
       (54, 53, '系统菜单查询', 'system:systemMenu:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (55, 53, '系统菜单新增', 'system:systemMenu:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (56, 53, '系统菜单修改', 'system:systemMenu:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (57, 53, '系统菜单删除', 'system:systemMenu:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (58, 53, '系统菜单导入', 'system:systemMenu:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (59, 53, '系统菜单导出', 'system:systemMenu:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (60, 1, '系统消息', 'system:systemMessage:list', 1, 'systemMessage', 'system/systemMessage', 'M', _binary '\0', _binary '', _binary '',
        _binary '', NULL, NULL, NULL, NULL, NULL, NULL),
       (61, 60, '系统消息查询', 'system:systemMessage:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (62, 60, '系统消息新增', 'system:systemMessage:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (63, 60, '系统消息修改', 'system:systemMessage:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (64, 60, '系统消息删除', 'system:systemMessage:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (65, 60, '系统消息导入', 'system:systemMessage:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (66, 60, '系统消息导出', 'system:systemMessage:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (67, 1, '系统模块', 'system:systemModule:list', 1, 'systemModule', 'system/systemModule', 'M', _binary '\0', _binary '', _binary '',
        _binary '', NULL, NULL, NULL, NULL, NULL, NULL),
       (68, 67, '系统模块查询', 'system:systemModule:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (69, 67, '系统模块新增', 'system:systemModule:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (70, 67, '系统模块修改', 'system:systemModule:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (71, 67, '系统模块删除', 'system:systemModule:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (72, 67, '系统模块导入', 'system:systemModule:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (73, 67, '系统模块导出', 'system:systemModule:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (74, 1, '系统岗位', 'system:systemPost:list', 1, 'systemPost', 'system/systemPost', 'M', _binary '\0', _binary '', _binary '', _binary '',
        NULL, NULL, NULL, NULL, NULL, NULL),
       (75, 74, '系统岗位查询', 'system:systemPost:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (76, 74, '系统岗位新增', 'system:systemPost:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (77, 74, '系统岗位修改', 'system:systemPost:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (78, 74, '系统岗位删除', 'system:systemPost:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (79, 74, '系统岗位导入', 'system:systemPost:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (80, 74, '系统岗位导出', 'system:systemPost:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (81, 1, '系统权限', 'system:systemRole:list', 1, 'systemRole', 'system/systemRole', 'M', _binary '\0', _binary '', _binary '', _binary '',
        NULL, NULL, NULL, NULL, NULL, NULL),
       (82, 81, '系统权限查询', 'system:systemRole:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (83, 81, '系统权限新增', 'system:systemRole:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (84, 81, '系统权限修改', 'system:systemRole:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (85, 81, '系统权限删除', 'system:systemRole:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (86, 81, '系统权限导入', 'system:systemRole:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (87, 81, '系统权限导出', 'system:systemRole:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (88, 1, '用户头像', 'system:systemUserAvatar:list', 1, 'systemUserAvatar', 'system/systemUserAvatar', 'M', _binary '\0', _binary '',
        _binary '', _binary '', NULL, NULL, NULL, NULL, NULL, NULL),
       (89, 88, '用户头像查询', 'system:systemUserAvatar:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (90, 88, '用户头像新增', 'system:systemUserAvatar:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (91, 88, '用户头像修改', 'system:systemUserAvatar:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (92, 88, '用户头像删除', 'system:systemUserAvatar:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (93, 88, '用户头像导入', 'system:systemUserAvatar:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (94, 88, '用户头像导出', 'system:systemUserAvatar:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (95, 1, '系统用户', 'system:systemUser:list', 1, 'systemUser', 'system/systemUser', 'M', _binary '\0', _binary '', _binary '', _binary '',
        NULL, NULL, NULL, NULL, NULL, NULL),
       (96, 95, '系统用户查询', 'system:systemUser:query', 1, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (97, 95, '系统用户新增', 'system:systemUser:add', 2, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (98, 95, '系统用户修改', 'system:systemUser:edit', 3, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (99, 95, '系统用户删除', 'system:systemUser:remove', 4, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL, NULL,
        NULL, NULL, NULL),
       (100, 95, '系统用户导入', 'system:systemUser:import', 5, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL),
       (101, 95, '系统用户导出', 'system:systemUser:export', 6, NULL, NULL, 'B', _binary '\0', _binary '', _binary '', _binary '', NULL, NULL,
        NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `system_menu`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_message`
--

DROP TABLE IF EXISTS `system_message`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_message`
(
    `id`          bigint      NOT NULL AUTO_INCREMENT COMMENT 'id',
    `title`       varchar(50) NOT NULL COMMENT '消息标题',
    `type`        varchar(10) NOT NULL DEFAULT 'NOTICE' COMMENT '消息类型',
    `content`     varchar(5000)        DEFAULT NULL COMMENT '内容',
    `closed`      bit(1)               DEFAULT b'0' COMMENT '状态',
    `publisher`   bigint               DEFAULT NULL COMMENT '发布人',
    `receiver`    json                 DEFAULT NULL COMMENT '接收人',
    `create_dept` bigint               DEFAULT NULL COMMENT '创建部门',
    `create_by`   bigint               DEFAULT NULL COMMENT '创建者',
    `create_time` datetime             DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint               DEFAULT NULL COMMENT '更新者',
    `update_time` datetime             DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='系统消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_message`
--

LOCK TABLES `system_message` WRITE;
/*!40000 ALTER TABLE `system_message`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `system_message`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_module`
--

DROP TABLE IF EXISTS `system_module`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_module`
(
    `id`          bigint      NOT NULL AUTO_INCREMENT COMMENT 'id',
    `code`        varchar(50) NOT NULL COMMENT '编码',
    `name`        varchar(50) NOT NULL COMMENT '名称',
    `roles`       json     DEFAULT NULL COMMENT '角色',
    `menus`       json     DEFAULT NULL COMMENT '菜单',
    `enable`      bit(1)   DEFAULT b'1' COMMENT '启用',
    `create_dept` bigint   DEFAULT NULL COMMENT '创建部门',
    `create_by`   bigint   DEFAULT NULL COMMENT '创建者',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint   DEFAULT NULL COMMENT '更新者',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='系统模块';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_module`
--

LOCK TABLES `system_module` WRITE;
/*!40000 ALTER TABLE `system_module`
    DISABLE KEYS */;
INSERT INTO `system_module`
VALUES (1, 'system', '系统管理', NULL, NULL, _binary '', NULL, NULL, NULL, NULL, NULL),
       (2, 'oa', 'OA', NULL, NULL, _binary '', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `system_module`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_post`
--

DROP TABLE IF EXISTS `system_post`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_post`
(
    `id`          bigint      NOT NULL AUTO_INCREMENT COMMENT 'id',
    `name`        varchar(50) NOT NULL COMMENT '名称',
    `code`        varchar(50) NOT NULL COMMENT '编码',
    `dept_id`     bigint      NOT NULL COMMENT '部门id',
    `sort`        int      DEFAULT '0' COMMENT '排序',
    `enable`      bit(1)   DEFAULT b'1' COMMENT '启用',
    `create_dept` bigint   DEFAULT NULL COMMENT '创建部门',
    `create_by`   bigint   DEFAULT NULL COMMENT '创建者',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint   DEFAULT NULL COMMENT '更新者',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='系统岗位';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_post`
--

LOCK TABLES `system_post` WRITE;
/*!40000 ALTER TABLE `system_post`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `system_post`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_role`
--

DROP TABLE IF EXISTS `system_role`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_role`
(
    `id`                  bigint      NOT NULL AUTO_INCREMENT COMMENT 'id',
    `code`                varchar(50) NOT NULL COMMENT '编码',
    `name`                varchar(50) NOT NULL COMMENT '名称',
    `sort`                int      DEFAULT '0' COMMENT '排序',
    `enable`              bit(1)   DEFAULT b'1' COMMENT '启用',
    `menus`               json     DEFAULT NULL COMMENT '菜单',
    `menu_check_strictly` bit(1)   DEFAULT b'1' COMMENT '菜单树关联显示',
    `departments`         json     DEFAULT NULL COMMENT '部门',
    `dept_check_strictly` bit(1)   DEFAULT b'1' COMMENT '部门树关联显示',
    `data_scope`          int      DEFAULT '1' COMMENT '数据权限范围',
    `create_dept`         bigint   DEFAULT NULL COMMENT '创建部门',
    `create_by`           bigint   DEFAULT NULL COMMENT '创建者',
    `create_time`         datetime DEFAULT NULL COMMENT '创建时间',
    `update_by`           bigint   DEFAULT NULL COMMENT '更新者',
    `update_time`         datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='系统权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_role`
--

LOCK TABLES `system_role` WRITE;
/*!40000 ALTER TABLE `system_role`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `system_role`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user`
--

DROP TABLE IF EXISTS `system_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user`
(
    `id`          bigint      NOT NULL AUTO_INCREMENT COMMENT 'id',
    `username`    varchar(50) NOT NULL COMMENT '账号',
    `dept_id`     bigint       DEFAULT NULL COMMENT '部门',
    `real_name`   varchar(50)  DEFAULT NULL COMMENT '姓名',
    `email`       varchar(100) DEFAULT NULL COMMENT '邮箱',
    `phone`       varchar(11)  DEFAULT NULL COMMENT '手机号码',
    `gender`      varchar(10)  DEFAULT 'UNKNOWN' COMMENT '性别',
    `avatar`      bigint       DEFAULT NULL COMMENT '头像',
    `password`    varchar(60)  DEFAULT NULL COMMENT '密码',
    `roles`       json         DEFAULT NULL COMMENT '角色',
    `posts`       json         DEFAULT NULL COMMENT '岗位',
    `modules`     json         DEFAULT NULL COMMENT '模块',
    `enable`      bit(1)       DEFAULT b'1' COMMENT '启用',
    `pwd_changed` bit(1)       DEFAULT b'0' COMMENT '密码是否更改',
    `expiry_date` date         DEFAULT NULL COMMENT '过期日期',
    `create_dept` bigint       DEFAULT NULL COMMENT '创建部门',
    `create_by`   bigint       DEFAULT NULL COMMENT '创建者',
    `create_time` datetime     DEFAULT NULL COMMENT '创建时间',
    `update_by`   bigint       DEFAULT NULL COMMENT '更新者',
    `update_time` datetime     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='系统用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user`
--

LOCK TABLES `system_user` WRITE;
/*!40000 ALTER TABLE `system_user`
    DISABLE KEYS */;
INSERT INTO `system_user`
VALUES (1, 'admin', 1, '管理员', 'admin@example.com', '13800138000', 'MALE', 1, '$2a$10$MrO.icD3sxzr2BuQBqNDjOBPRhy5CNuW1GIShHoUQPVT/t4OSp3cC', '[
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
]', _binary '', _binary '\0', '2025-06-23', NULL, NULL, NULL, NULL, NULL),
       (2, 'user01', 1, '张三', 'zhangsan@example.com', '13900139001', 'MALE', 2, '', '[
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
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-02 00:00:00', 1, '2023-01-02 00:00:00'),
       (3, 'user02', 1, '李四', 'lisi@example.com', '13900139002', 'MALE', 3, '', '[
         2
       ]', '[
         3
       ]', '[
         2,
         3,
         4
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-03 00:00:00', 1, '2023-01-03 00:00:00'),
       (4, 'user03', 1, '王五', 'wangwu@example.com', '13900139003', 'MALE', 4, '', '[
         3
       ]', '[
         4
       ]', '[
         3,
         4
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-04 00:00:00', 1, '2023-01-04 00:00:00'),
       (5, 'user04', 1, '赵六', 'zhaoliu@example.com', '13900139004', 'MALE', 5, '', '[
         3
       ]', '[
         5
       ]', '[
         3,
         4
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-05 00:00:00', 1, '2023-01-05 00:00:00'),
       (6, 'user05', 1, '孙七', 'sunqi@example.com', '13900139005', 'MALE', 6, '', '[
         4
       ]', '[
         6
       ]', '[
         4,
         5
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-06 00:00:00', 1, '2023-01-06 00:00:00'),
       (7, 'user06', 1, '周八', 'zhouba@example.com', '13900139006', 'MALE', 7, '', '[
         4
       ]', '[
         7
       ]', '[
         4,
         5
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-07 00:00:00', 1, '2023-01-07 00:00:00'),
       (8, 'user07', 1, '吴九', 'wujiu@example.com', '13900139007', 'MALE', 8, '', '[
         5
       ]', '[
         8
       ]', '[
         5
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-08 00:00:00', 1, '2023-01-08 00:00:00'),
       (9, 'user08', 1, '郑十', 'zhengshi@example.com', '13900139008', 'MALE', 9, '', '[
         5
       ]', '[
         9
       ]', '[
         5
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-09 00:00:00', 1, '2023-01-09 00:00:00'),
       (10, 'user09', 1, '钱十一', 'qian11@example.com', '13900139009', 'FEMALE', 10, '', '[
         6
       ]', '[
         10
       ]', '[
         6
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-10 00:00:00', 1, '2023-01-10 00:00:00'),
       (11, 'user10', 1, '孙十二', 'sun12@example.com', '13900139010', 'FEMALE', 11, '', '[
         6
       ]', '[
         11
       ]', '[
         6
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-11 00:00:00', 1, '2023-01-11 00:00:00'),
       (12, 'user11', 1, '周十三', 'zhou13@example.com', '13900139011', 'FEMALE', 12, '', '[
         7
       ]', '[
         12
       ]', '[
         7
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-12 00:00:00', 1, '2023-01-12 00:00:00'),
       (13, 'user12', 1, '吴十四', 'wu14@example.com', '13900139012', 'FEMALE', 13, '', '[
         7
       ]', '[
         13
       ]', '[
         7
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-13 00:00:00', 1, '2023-01-13 00:00:00'),
       (14, 'user13', 1, '郑十五', 'zheng15@example.com', '13900139013', 'FEMALE', 14, '', '[
         8
       ]', '[
         14
       ]', '[
         8
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-14 00:00:00', 1, '2023-01-14 00:00:00'),
       (15, 'user14', 1, '王十六', 'wang16@example.com', '13900139014', 'FEMALE', 15, '', '[
         8
       ]', '[
         15
       ]', '[
         8
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-15 00:00:00', 1, '2023-01-15 00:00:00'),
       (16, 'user15', 1, '李十七', 'li17@example.com', '13900139015', 'FEMALE', 16, '', '[
         9
       ]', '[
         16
       ]', '[
         9
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-16 00:00:00', 1, '2023-01-16 00:00:00'),
       (17, 'user16', 1, '赵十八', 'zhao18@example.com', '13900139016', 'FEMALE', 17, '', '[
         9
       ]', '[
         17
       ]', '[
         9
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-17 00:00:00', 1, '2023-01-17 00:00:00'),
       (18, 'user17', 1, '孙十九', 'sun19@example.com', '13900139017', 'UNKNOWN', 18, '', '[
         10
       ]', '[
         18
       ]', '[
         10
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-18 00:00:00', 1, '2023-01-18 00:00:00'),
       (19, 'user18', 1, '周二十', 'zhou20@example.com', '13900139018', 'UNKNOWN', 19, '', '[
         10
       ]', '[
         19
       ]', '[
         10
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-19 00:00:00', 1, '2023-01-19 00:00:00'),
       (20, 'user19', 1, '吴二一', 'wu21@example.com', '13900139019', 'UNKNOWN', 20, '', '[
         11
       ]', '[
         20
       ]', '[
         10,
         11
       ]', _binary '', _binary '', '2025-06-23', 1, 1, '2023-01-20 00:00:00', 1, '2023-01-20 00:00:00'),
       (21, 'user20', 1, '郑二二', 'zheng22@example.com', '13900139020', 'UNKNOWN', 21, '', '[
         11
       ]', '[
         21
       ]', '[
         10,
         11
       ]', _binary '\0', _binary '\0', '2025-06-23', 1, 1, '2023-01-21 00:00:00', 1, '2023-01-21 00:00:00');
/*!40000 ALTER TABLE `system_user`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_user_avatar`
--

DROP TABLE IF EXISTS `system_user_avatar`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_user_avatar`
(
    `id`     bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
    `avatar` blob COMMENT '头像',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT ='用户头像表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_user_avatar`
--

LOCK TABLES `system_user_avatar` WRITE;
/*!40000 ALTER TABLE `system_user_avatar`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `system_user_avatar`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2025-06-09 20:53:05
