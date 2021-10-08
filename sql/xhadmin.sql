/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100505
 Source Host           : localhost:3306
 Source Schema         : eladmin

 Target Server Type    : MySQL
 Target Server Version : 100505
 File Encoding         : 65001

 Date: 05/09/2020 10:49:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for code_column_config
-- ----------------------------
DROP TABLE IF EXISTS `code_column_config`;
CREATE TABLE `code_column_config` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(255) DEFAULT NULL,
  `column_name` varchar(255) DEFAULT NULL,
  `column_type` varchar(255) DEFAULT NULL,
  `dict_name` varchar(255) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `form_show` bit(1) DEFAULT NULL,
  `form_type` varchar(255) DEFAULT NULL,
  `key_type` varchar(255) DEFAULT NULL,
  `list_show` bit(1) DEFAULT NULL,
  `not_null` bit(1) DEFAULT NULL,
  `query_type` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `date_annotation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`column_id`) USING BTREE,
  KEY `idx_table_name` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成字段信息存储';

-- ----------------------------
-- Table structure for code_gen_config
-- ----------------------------
DROP TABLE IF EXISTS `code_gen_config`;
CREATE TABLE `code_gen_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(255) DEFAULT NULL COMMENT '表名',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `cover` bit(1) DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `pack` varchar(255) DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) DEFAULT NULL COMMENT '前端Api文件路径',
  `prefix` varchar(255) DEFAULT NULL COMMENT '表前缀',
  `api_alias` varchar(255) DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`config_id`) USING BTREE,
  KEY `idx_table_name` (`table_name`(100))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='代码生成器配置';

-- ----------------------------
-- Table structure for mnt_app
-- ----------------------------
DROP TABLE IF EXISTS `mnt_app`;
CREATE TABLE `mnt_app` (
  `app_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) DEFAULT NULL COMMENT '应用名称',
  `upload_path` varchar(255) DEFAULT NULL COMMENT '上传目录',
  `deploy_path` varchar(255) DEFAULT NULL COMMENT '部署路径',
  `backup_path` varchar(255) DEFAULT NULL COMMENT '备份路径',
  `port` int(255) DEFAULT NULL COMMENT '应用端口',
  `start_script` varchar(4000) DEFAULT NULL COMMENT '启动脚本',
  `deploy_script` varchar(4000) DEFAULT NULL COMMENT '部署脚本',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='应用管理';

-- ----------------------------
-- Records of mnt_app
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mnt_database
-- ----------------------------
DROP TABLE IF EXISTS `mnt_database`;
CREATE TABLE `mnt_database` (
  `db_id` varchar(50) NOT NULL COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `jdbc_url` varchar(255) NOT NULL COMMENT 'jdbc连接',
  `user_name` varchar(255) NOT NULL COMMENT '账号',
  `pwd` varchar(255) NOT NULL COMMENT '密码',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`db_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据库管理';

-- ----------------------------
-- Records of mnt_database
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mnt_deploy
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy`;
CREATE TABLE `mnt_deploy` (
  `deploy_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_id` bigint(20) DEFAULT NULL COMMENT '应用编号',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`deploy_id`) USING BTREE,
  KEY `FK6sy157pseoxx4fmcqr1vnvvhy` (`app_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部署管理';

-- ----------------------------
-- Records of mnt_deploy
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mnt_deploy_history
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy_history`;
CREATE TABLE `mnt_deploy_history` (
  `history_id` varchar(50) NOT NULL COMMENT 'ID',
  `app_name` varchar(255) NOT NULL COMMENT '应用名称',
  `deploy_date` datetime NOT NULL COMMENT '部署日期',
  `deploy_user` varchar(50) NOT NULL COMMENT '部署用户',
  `ip` varchar(20) NOT NULL COMMENT '服务器IP',
  `deploy_id` bigint(20) DEFAULT NULL COMMENT '部署编号',
  PRIMARY KEY (`history_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部署历史管理';

-- ----------------------------
-- Records of mnt_deploy_history
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mnt_deploy_server
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy_server`;
CREATE TABLE `mnt_deploy_server` (
  `deploy_id` bigint(20) NOT NULL COMMENT '部署ID',
  `server_id` bigint(20) NOT NULL COMMENT '服务ID',
  PRIMARY KEY (`deploy_id`,`server_id`) USING BTREE,
  KEY `FKeaaha7jew9a02b3bk9ghols53` (`server_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='应用与服务器关联';

-- ----------------------------
-- Records of mnt_deploy_server
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mnt_server
-- ----------------------------
DROP TABLE IF EXISTS `mnt_server`;
CREATE TABLE `mnt_server` (
  `server_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account` varchar(50) DEFAULT NULL COMMENT '账号',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`server_id`) USING BTREE,
  KEY `idx_ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='服务器管理';

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级部门',
  `sub_count` int(5) DEFAULT 0 COMMENT '子部门数目',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `dept_sort` int(5) DEFAULT 999 COMMENT '排序',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  KEY `inx_pid` (`pid`),
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (2, 7, 1, '研发部', 3, b'1', 'admin', 'admin', '2019-03-25 09:15:32', '2020-08-02 14:48:47');
INSERT INTO `sys_dept` VALUES (5, 7, 0, '运维部', 4, b'1', 'admin', 'admin', '2019-03-25 09:20:44', '2020-05-17 14:27:27');
INSERT INTO `sys_dept` VALUES (6, 8, 0, '测试部', 6, b'1', 'admin', 'admin', '2019-03-25 09:52:18', '2020-06-08 11:59:21');
INSERT INTO `sys_dept` VALUES (7, NULL, 2, '华南分部', 0, b'1', 'admin', 'admin', '2019-03-25 11:04:50', '2020-06-08 12:08:56');
INSERT INTO `sys_dept` VALUES (8, NULL, 2, '华北分部', 1, b'1', 'admin', 'admin', '2019-03-25 11:04:53', '2020-05-14 12:54:00');
INSERT INTO `sys_dept` VALUES (15, 8, 0, 'UI部门', 7, b'1', 'admin', 'admin', '2020-05-13 22:56:53', '2020-05-14 12:54:13');
INSERT INTO `sys_dept` VALUES (17, 2, 0, '研发一组', 999, b'1', 'admin', 'admin', '2020-08-02 14:49:07', '2020-08-02 14:49:07');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '字典名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES (1, 'user_status', '用户状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict` VALUES (4, 'dept_status', '部门状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict` VALUES (5, 'job_status', '岗位状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail` (
  `detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint(11) DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) NOT NULL COMMENT '字典标签',
  `value` varchar(255) NOT NULL COMMENT '字典值',
  `dict_sort` int(5) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  KEY `FK5tpkputc6d9nboxojdbgnpmyb` (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典详情';

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_detail` VALUES (1, 1, '激活', 'true', 1, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail` VALUES (2, 1, '禁用', 'false', 2, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (3, 4, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (4, 4, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `sys_dict_detail` VALUES (5, 5, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (6, 5, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int(5) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='岗位';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (8, '人事专员', b'1', 3, NULL, NULL, '2019-03-29 14:52:28', NULL);
INSERT INTO `sys_job` VALUES (10, '产品经理', b'1', 4, NULL, NULL, '2019-03-29 14:55:51', NULL);
INSERT INTO `sys_job` VALUES (11, '全栈开发', b'1', 2, NULL, 'admin', '2019-03-31 13:39:30', '2020-05-05 11:33:43');
INSERT INTO `sys_job` VALUES (12, '软件测试', b'1', 5, NULL, 'admin', '2019-03-31 13:39:43', '2020-05-10 19:56:26');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `description` varchar(255) DEFAULT NULL,
  `log_type` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `params` text DEFAULT NULL,
  `request_ip` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `exception_detail` text DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  KEY `log_create_time_index` (`create_time`),
  KEY `inx_log_type` (`log_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3537 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统日志';

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int(5) DEFAULT 0 COMMENT '子菜单数目',
  `type` int(11) DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(255) DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(255) DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `menu_sort` int(5) DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `path` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) DEFAULT b'0' COMMENT '隐藏',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE KEY `uniq_title` (`title`),
  UNIQUE KEY `uniq_name` (`name`),
  KEY `inx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, NULL, 7, 0, '系统管理', NULL, NULL, 1, 'system', 'system', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:11:29', NULL);
INSERT INTO `sys_menu` VALUES (2, 1, 3, 1, '用户管理', 'User', 'system/user/index', 2, 'peoples', 'user', b'0', b'0', b'0', 'user:list', NULL, NULL, '2018-12-18 15:14:44', NULL);
INSERT INTO `sys_menu` VALUES (3, 1, 3, 1, '角色管理', 'Role', 'system/role/index', 3, 'role', 'role', b'0', b'0', b'0', 'roles:list', NULL, NULL, '2018-12-18 15:16:07', NULL);
INSERT INTO `sys_menu` VALUES (5, 1, 3, 1, '菜单管理', 'Menu', 'system/menu/index', 5, 'menu', 'menu', b'0', b'0', b'0', 'menu:list', NULL, NULL, '2018-12-18 15:17:28', NULL);
INSERT INTO `sys_menu` VALUES (6, NULL, 5, 0, '系统监控', NULL, NULL, 10, 'monitor', 'monitor', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:17:48', NULL);
INSERT INTO `sys_menu` VALUES (7, 6, 0, 1, '操作日志', 'Log', 'monitor/log/index', 11, 'log', 'logs', b'0', b'1', b'0', NULL, NULL, 'admin', '2018-12-18 15:18:26', '2020-06-06 13:11:57');
INSERT INTO `sys_menu` VALUES (9, 6, 0, 1, 'SQL监控', 'Sql', 'monitor/sql/index', 18, 'sqlMonitor', 'druid', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:19:34', NULL);
INSERT INTO `sys_menu` VALUES (10, NULL, 5, 0, '组件管理', NULL, NULL, 50, 'zujian', 'components', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-19 13:38:16', NULL);
INSERT INTO `sys_menu` VALUES (11, 10, 0, 1, '图标库', 'Icons', 'components/icons/index', 51, 'icon', 'icon', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-19 13:38:49', NULL);
INSERT INTO `sys_menu` VALUES (14, 36, 0, 1, '邮件工具', 'Email', 'tools/email/index', 35, 'email', 'email', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-27 10:13:09', NULL);
INSERT INTO `sys_menu` VALUES (15, 10, 0, 1, '富文本', 'Editor', 'components/Editor', 52, 'fwb', 'tinymce', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-27 11:58:25', NULL);
INSERT INTO `sys_menu` VALUES (18, 36, 3, 1, '存储管理', 'Storage', 'tools/storage/index', 34, 'qiniu', 'storage', b'0', b'0', b'0', 'storage:list', NULL, NULL, '2018-12-31 11:12:15', NULL);
INSERT INTO `sys_menu` VALUES (19, 36, 0, 1, '支付宝工具', 'AliPay', 'tools/aliPay/index', 37, 'alipay', 'aliPay', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-31 14:52:38', NULL);
INSERT INTO `sys_menu` VALUES (21, NULL, 2, 0, '多级菜单', NULL, '', 900, 'menu', 'nested', b'0', b'0', b'0', NULL, NULL, 'admin', '2019-01-04 16:22:03', '2020-06-21 17:27:35');
INSERT INTO `sys_menu` VALUES (22, 21, 2, 0, '二级菜单1', NULL, '', 999, 'menu', 'menu1', b'0', b'0', b'0', NULL, NULL, 'admin', '2019-01-04 16:23:29', '2020-06-21 17:27:20');
INSERT INTO `sys_menu` VALUES (23, 21, 0, 1, '二级菜单2', NULL, 'nested/menu2/index', 999, 'menu', 'menu2', b'0', b'0', b'0', NULL, NULL, NULL, '2019-01-04 16:23:57', NULL);
INSERT INTO `sys_menu` VALUES (24, 22, 0, 1, '三级菜单1', 'Test', 'nested/menu1/menu1-1', 999, 'menu', 'menu1-1', b'0', b'0', b'0', NULL, NULL, NULL, '2019-01-04 16:24:48', NULL);
INSERT INTO `sys_menu` VALUES (27, 22, 0, 1, '三级菜单2', NULL, 'nested/menu1/menu1-2', 999, 'menu', 'menu1-2', b'0', b'0', b'0', NULL, NULL, NULL, '2019-01-07 17:27:32', NULL);
INSERT INTO `sys_menu` VALUES (28, 1, 3, 1, '任务调度', 'Timing', 'system/timing/index', 999, 'timing', 'timing', b'0', b'0', b'0', 'timing:list', NULL, NULL, '2019-01-07 20:34:40', NULL);
INSERT INTO `sys_menu` VALUES (30, 36, 0, 1, '代码生成', 'GeneratorIndex', 'generator/index', 32, 'dev', 'generator', b'0', b'1', b'0', NULL, NULL, NULL, '2019-01-11 15:45:55', NULL);
INSERT INTO `sys_menu` VALUES (32, 6, 0, 1, '异常日志', 'ErrorLog', 'monitor/log/errorLog', 12, 'error', 'errorLog', b'0', b'0', b'0', NULL, NULL, NULL, '2019-01-13 13:49:03', NULL);
INSERT INTO `sys_menu` VALUES (33, 10, 0, 1, 'Markdown', 'Markdown', 'components/MarkDown', 53, 'markdown', 'markdown', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-08 13:46:44', NULL);
INSERT INTO `sys_menu` VALUES (34, 10, 0, 1, 'Yaml编辑器', 'YamlEdit', 'components/YamlEdit', 54, 'dev', 'yaml', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-08 15:49:40', NULL);
INSERT INTO `sys_menu` VALUES (35, 1, 3, 1, '部门管理', 'Dept', 'system/dept/index', 6, 'dept', 'dept', b'0', b'0', b'0', 'dept:list', NULL, NULL, '2019-03-25 09:46:00', NULL);
INSERT INTO `sys_menu` VALUES (36, NULL, 7, 0, '系统工具', NULL, '', 30, 'sys-tools', 'sys-tools', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-29 10:57:35', NULL);
INSERT INTO `sys_menu` VALUES (37, 1, 3, 1, '岗位管理', 'Job', 'system/member/index', 7, 'Steve-Jobs', 'member', b'0', b'0', b'0', 'member:list', NULL, NULL, '2019-03-29 13:51:18', NULL);
INSERT INTO `sys_menu` VALUES (38, 36, 0, 1, '接口文档', 'Swagger', 'tools/swagger/index', 36, 'swagger', 'swagger2', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-29 19:57:53', NULL);
INSERT INTO `sys_menu` VALUES (39, 1, 3, 1, '字典管理', 'Dict', 'system/dict/index', 8, 'dictionary', 'dict', b'0', b'0', b'0', 'dict:list', NULL, NULL, '2019-04-10 11:49:04', NULL);
INSERT INTO `sys_menu` VALUES (41, 6, 0, 1, '在线用户', 'OnlineUser', 'monitor/online/index', 10, 'Steve-Jobs', 'online', b'0', b'0', b'0', NULL, NULL, NULL, '2019-10-26 22:08:43', NULL);
INSERT INTO `sys_menu` VALUES (44, 2, 0, 2, '用户新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'user:add', NULL, NULL, '2019-10-29 10:59:46', NULL);
INSERT INTO `sys_menu` VALUES (45, 2, 0, 2, '用户编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'user:edit', NULL, NULL, '2019-10-29 11:00:08', NULL);
INSERT INTO `sys_menu` VALUES (46, 2, 0, 2, '用户删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'user:del', NULL, NULL, '2019-10-29 11:00:23', NULL);
INSERT INTO `sys_menu` VALUES (48, 3, 0, 2, '角色创建', NULL, '', 2, '', '', b'0', b'0', b'0', 'roles:add', NULL, NULL, '2019-10-29 12:45:34', NULL);
INSERT INTO `sys_menu` VALUES (49, 3, 0, 2, '角色修改', NULL, '', 3, '', '', b'0', b'0', b'0', 'roles:edit', NULL, NULL, '2019-10-29 12:46:16', NULL);
INSERT INTO `sys_menu` VALUES (50, 3, 0, 2, '角色删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'roles:del', NULL, NULL, '2019-10-29 12:46:51', NULL);
INSERT INTO `sys_menu` VALUES (52, 5, 0, 2, '菜单新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'menu:add', NULL, NULL, '2019-10-29 12:55:07', NULL);
INSERT INTO `sys_menu` VALUES (53, 5, 0, 2, '菜单编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'menu:edit', NULL, NULL, '2019-10-29 12:55:40', NULL);
INSERT INTO `sys_menu` VALUES (54, 5, 0, 2, '菜单删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'menu:del', NULL, NULL, '2019-10-29 12:56:00', NULL);
INSERT INTO `sys_menu` VALUES (56, 35, 0, 2, '部门新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dept:add', NULL, NULL, '2019-10-29 12:57:09', NULL);
INSERT INTO `sys_menu` VALUES (57, 35, 0, 2, '部门编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dept:edit', NULL, NULL, '2019-10-29 12:57:27', NULL);
INSERT INTO `sys_menu` VALUES (58, 35, 0, 2, '部门删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dept:del', NULL, NULL, '2019-10-29 12:57:41', NULL);
INSERT INTO `sys_menu` VALUES (60, 37, 0, 2, '岗位新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'member:add', NULL, NULL, '2019-10-29 12:58:27', NULL);
INSERT INTO `sys_menu` VALUES (61, 37, 0, 2, '岗位编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'member:edit', NULL, NULL, '2019-10-29 12:58:45', NULL);
INSERT INTO `sys_menu` VALUES (62, 37, 0, 2, '岗位删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'member:del', NULL, NULL, '2019-10-29 12:59:04', NULL);
INSERT INTO `sys_menu` VALUES (64, 39, 0, 2, '字典新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dict:add', NULL, NULL, '2019-10-29 13:00:17', NULL);
INSERT INTO `sys_menu` VALUES (65, 39, 0, 2, '字典编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dict:edit', NULL, NULL, '2019-10-29 13:00:42', NULL);
INSERT INTO `sys_menu` VALUES (66, 39, 0, 2, '字典删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dict:del', NULL, NULL, '2019-10-29 13:00:59', NULL);
INSERT INTO `sys_menu` VALUES (73, 28, 0, 2, '任务新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'timing:add', NULL, NULL, '2019-10-29 13:07:28', NULL);
INSERT INTO `sys_menu` VALUES (74, 28, 0, 2, '任务编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'timing:edit', NULL, NULL, '2019-10-29 13:07:41', NULL);
INSERT INTO `sys_menu` VALUES (75, 28, 0, 2, '任务删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'timing:del', NULL, NULL, '2019-10-29 13:07:54', NULL);
INSERT INTO `sys_menu` VALUES (77, 18, 0, 2, '上传文件', NULL, '', 2, '', '', b'0', b'0', b'0', 'storage:add', NULL, NULL, '2019-10-29 13:09:09', NULL);
INSERT INTO `sys_menu` VALUES (78, 18, 0, 2, '文件编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'storage:edit', NULL, NULL, '2019-10-29 13:09:22', NULL);
INSERT INTO `sys_menu` VALUES (79, 18, 0, 2, '文件删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'storage:del', NULL, NULL, '2019-10-29 13:09:34', NULL);
INSERT INTO `sys_menu` VALUES (80, 6, 0, 1, '服务监控', 'ServerMonitor', 'monitor/server/index', 14, 'codeConsole', 'server', b'0', b'0', b'0', 'monitor:list', NULL, 'admin', '2019-11-07 13:06:39', '2020-05-04 18:20:50');
INSERT INTO `sys_menu` VALUES (82, 36, 0, 1, '生成配置', 'GeneratorConfig', 'generator/config', 33, 'dev', 'generator/config/:tableName', b'0', b'1', b'1', '', NULL, NULL, '2019-11-17 20:08:56', NULL);
INSERT INTO `sys_menu` VALUES (83, 10, 0, 1, '图表库', 'Echarts', 'components/Echarts', 50, 'chart', 'echarts', b'0', b'1', b'0', '', NULL, NULL, '2019-11-21 09:04:32', NULL);
INSERT INTO `sys_menu` VALUES (90, NULL, 5, 1, '运维管理', 'Mnt', '', 20, 'mnt', 'mnt', b'0', b'0', b'0', NULL, NULL, NULL, '2019-11-09 10:31:08', NULL);
INSERT INTO `sys_menu` VALUES (92, 90, 3, 1, '服务器', 'ServerDeploy', 'mnt/server/index', 22, 'server', 'mnt/serverDeploy', b'0', b'0', b'0', 'serverDeploy:list', NULL, NULL, '2019-11-10 10:29:25', NULL);
INSERT INTO `sys_menu` VALUES (93, 90, 3, 1, '应用管理', 'App', 'mnt/app/index', 23, 'app', 'mnt/app', b'0', b'0', b'0', 'app:list', NULL, NULL, '2019-11-10 11:05:16', NULL);
INSERT INTO `sys_menu` VALUES (94, 90, 3, 1, '部署管理', 'Deploy', 'mnt/deploy/index', 24, 'deploy', 'mnt/deploy', b'0', b'0', b'0', 'deploy:list', NULL, NULL, '2019-11-10 15:56:55', NULL);
INSERT INTO `sys_menu` VALUES (97, 90, 1, 1, '部署备份', 'DeployHistory', 'mnt/deployHistory/index', 25, 'backup', 'mnt/deployHistory', b'0', b'0', b'0', 'deployHistory:list', NULL, NULL, '2019-11-10 16:49:44', NULL);
INSERT INTO `sys_menu` VALUES (98, 90, 3, 1, '数据库管理', 'Database', 'mnt/database/index', 26, 'database', 'mnt/database', b'0', b'0', b'0', 'database:list', NULL, NULL, '2019-11-10 20:40:04', NULL);
INSERT INTO `sys_menu` VALUES (102, 97, 0, 2, '删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'deployHistory:del', NULL, NULL, '2019-11-17 09:32:48', NULL);
INSERT INTO `sys_menu` VALUES (103, 92, 0, 2, '服务器新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'serverDeploy:add', NULL, NULL, '2019-11-17 11:08:33', NULL);
INSERT INTO `sys_menu` VALUES (104, 92, 0, 2, '服务器编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'serverDeploy:edit', NULL, NULL, '2019-11-17 11:08:57', NULL);
INSERT INTO `sys_menu` VALUES (105, 92, 0, 2, '服务器删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'serverDeploy:del', NULL, NULL, '2019-11-17 11:09:15', NULL);
INSERT INTO `sys_menu` VALUES (106, 93, 0, 2, '应用新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'app:add', NULL, NULL, '2019-11-17 11:10:03', NULL);
INSERT INTO `sys_menu` VALUES (107, 93, 0, 2, '应用编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'app:edit', NULL, NULL, '2019-11-17 11:10:28', NULL);
INSERT INTO `sys_menu` VALUES (108, 93, 0, 2, '应用删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'app:del', NULL, NULL, '2019-11-17 11:10:55', NULL);
INSERT INTO `sys_menu` VALUES (109, 94, 0, 2, '部署新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'deploy:add', NULL, NULL, '2019-11-17 11:11:22', NULL);
INSERT INTO `sys_menu` VALUES (110, 94, 0, 2, '部署编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'deploy:edit', NULL, NULL, '2019-11-17 11:11:41', NULL);
INSERT INTO `sys_menu` VALUES (111, 94, 0, 2, '部署删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'deploy:del', NULL, NULL, '2019-11-17 11:12:01', NULL);
INSERT INTO `sys_menu` VALUES (112, 98, 0, 2, '数据库新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'database:add', NULL, NULL, '2019-11-17 11:12:43', NULL);
INSERT INTO `sys_menu` VALUES (113, 98, 0, 2, '数据库编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'database:edit', NULL, NULL, '2019-11-17 11:12:58', NULL);
INSERT INTO `sys_menu` VALUES (114, 98, 0, 2, '数据库删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'database:del', NULL, NULL, '2019-11-17 11:13:14', NULL);
INSERT INTO `sys_menu` VALUES (116, 36, 0, 1, '生成预览', 'Preview', 'generator/preview', 999, 'java', 'generator/preview/:tableName', b'0', b'1', b'1', NULL, NULL, NULL, '2019-11-26 14:54:36', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_job`;
CREATE TABLE `sys_quartz_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) DEFAULT NULL COMMENT '参数',
  `description` varchar(255) DEFAULT NULL COMMENT '备注',
  `person_in_charge` varchar(100) DEFAULT NULL COMMENT '负责人',
  `email` varchar(100) DEFAULT NULL COMMENT '报警邮箱',
  `sub_task` varchar(100) DEFAULT NULL COMMENT '子任务ID',
  `pause_after_failure` bit(1) DEFAULT NULL COMMENT '任务失败后是否暂停',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  KEY `inx_is_pause` (`is_pause`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务';

-- ----------------------------
-- Records of sys_quartz_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_quartz_job` VALUES (2, 'testTask', '0/5 * * * * ?', b'1', '测试1', 'run1', 'test', '带参测试，多参使用json', '测试', NULL, NULL, NULL, NULL, 'admin', '2019-08-22 14:08:29', '2020-05-24 13:58:33');
INSERT INTO `sys_quartz_job` VALUES (3, 'testTask', '0/5 * * * * ?', b'1', '测试', 'run', '', '不带参测试', 'Zheng Jie', '', '5,6', b'1', NULL, 'admin', '2019-09-26 16:44:39', '2020-05-24 14:48:12');
INSERT INTO `sys_quartz_job` VALUES (5, 'Test', '0/5 * * * * ?', b'1', '任务告警测试', 'run', NULL, '测试', 'test', '', NULL, b'1', 'admin', 'admin', '2020-05-05 20:32:41', '2020-05-05 20:36:13');
INSERT INTO `sys_quartz_job` VALUES (6, 'testTask', '0/5 * * * * ?', b'1', '测试3', 'run2', NULL, '测试3', 'Zheng Jie', '', NULL, b'1', 'admin', 'admin', '2020-05-05 20:35:41', '2020-05-05 20:36:07');
COMMIT;

-- ----------------------------
-- Table structure for sys_quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_log`;
CREATE TABLE `sys_quartz_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `cron_expression` varchar(255) DEFAULT NULL,
  `exception_detail` text DEFAULT NULL,
  `is_success` bit(1) DEFAULT NULL,
  `job_name` varchar(255) DEFAULT NULL,
  `method_name` varchar(255) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务日志';

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `level` int(255) DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `role_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 1, '-', '全部', NULL, 'admin', '2018-11-23 11:04:37', '2020-08-06 16:10:24');
INSERT INTO `sys_role` VALUES (2, '普通用户', 2, '-', '本级', NULL, 'admin', '2018-11-23 13:09:06', '2020-09-05 10:45:12');
COMMIT;

-- ----------------------------
-- Table structure for sys_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_depts`;
CREATE TABLE `sys_roles_depts` (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE,
  KEY `FK7qg6itn5ajdoa9h9o78v9ksur` (`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色部门关联';

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE,
  KEY `FKcngg2qadojhi3a651a5adkvbq` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='角色菜单关联';

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
BEGIN;
INSERT INTO `sys_roles_menus` VALUES (1, 1);
INSERT INTO `sys_roles_menus` VALUES (2, 1);
INSERT INTO `sys_roles_menus` VALUES (3, 1);
INSERT INTO `sys_roles_menus` VALUES (5, 1);
INSERT INTO `sys_roles_menus` VALUES (6, 1);
INSERT INTO `sys_roles_menus` VALUES (7, 1);
INSERT INTO `sys_roles_menus` VALUES (9, 1);
INSERT INTO `sys_roles_menus` VALUES (10, 1);
INSERT INTO `sys_roles_menus` VALUES (11, 1);
INSERT INTO `sys_roles_menus` VALUES (14, 1);
INSERT INTO `sys_roles_menus` VALUES (15, 1);
INSERT INTO `sys_roles_menus` VALUES (18, 1);
INSERT INTO `sys_roles_menus` VALUES (19, 1);
INSERT INTO `sys_roles_menus` VALUES (21, 1);
INSERT INTO `sys_roles_menus` VALUES (22, 1);
INSERT INTO `sys_roles_menus` VALUES (23, 1);
INSERT INTO `sys_roles_menus` VALUES (24, 1);
INSERT INTO `sys_roles_menus` VALUES (27, 1);
INSERT INTO `sys_roles_menus` VALUES (28, 1);
INSERT INTO `sys_roles_menus` VALUES (30, 1);
INSERT INTO `sys_roles_menus` VALUES (32, 1);
INSERT INTO `sys_roles_menus` VALUES (33, 1);
INSERT INTO `sys_roles_menus` VALUES (34, 1);
INSERT INTO `sys_roles_menus` VALUES (35, 1);
INSERT INTO `sys_roles_menus` VALUES (36, 1);
INSERT INTO `sys_roles_menus` VALUES (37, 1);
INSERT INTO `sys_roles_menus` VALUES (38, 1);
INSERT INTO `sys_roles_menus` VALUES (39, 1);
INSERT INTO `sys_roles_menus` VALUES (41, 1);
INSERT INTO `sys_roles_menus` VALUES (44, 1);
INSERT INTO `sys_roles_menus` VALUES (45, 1);
INSERT INTO `sys_roles_menus` VALUES (46, 1);
INSERT INTO `sys_roles_menus` VALUES (48, 1);
INSERT INTO `sys_roles_menus` VALUES (49, 1);
INSERT INTO `sys_roles_menus` VALUES (50, 1);
INSERT INTO `sys_roles_menus` VALUES (52, 1);
INSERT INTO `sys_roles_menus` VALUES (53, 1);
INSERT INTO `sys_roles_menus` VALUES (54, 1);
INSERT INTO `sys_roles_menus` VALUES (56, 1);
INSERT INTO `sys_roles_menus` VALUES (57, 1);
INSERT INTO `sys_roles_menus` VALUES (58, 1);
INSERT INTO `sys_roles_menus` VALUES (60, 1);
INSERT INTO `sys_roles_menus` VALUES (61, 1);
INSERT INTO `sys_roles_menus` VALUES (62, 1);
INSERT INTO `sys_roles_menus` VALUES (64, 1);
INSERT INTO `sys_roles_menus` VALUES (65, 1);
INSERT INTO `sys_roles_menus` VALUES (66, 1);
INSERT INTO `sys_roles_menus` VALUES (73, 1);
INSERT INTO `sys_roles_menus` VALUES (74, 1);
INSERT INTO `sys_roles_menus` VALUES (75, 1);
INSERT INTO `sys_roles_menus` VALUES (77, 1);
INSERT INTO `sys_roles_menus` VALUES (78, 1);
INSERT INTO `sys_roles_menus` VALUES (79, 1);
INSERT INTO `sys_roles_menus` VALUES (80, 1);
INSERT INTO `sys_roles_menus` VALUES (82, 1);
INSERT INTO `sys_roles_menus` VALUES (83, 1);
INSERT INTO `sys_roles_menus` VALUES (90, 1);
INSERT INTO `sys_roles_menus` VALUES (92, 1);
INSERT INTO `sys_roles_menus` VALUES (93, 1);
INSERT INTO `sys_roles_menus` VALUES (94, 1);
INSERT INTO `sys_roles_menus` VALUES (97, 1);
INSERT INTO `sys_roles_menus` VALUES (98, 1);
INSERT INTO `sys_roles_menus` VALUES (102, 1);
INSERT INTO `sys_roles_menus` VALUES (103, 1);
INSERT INTO `sys_roles_menus` VALUES (104, 1);
INSERT INTO `sys_roles_menus` VALUES (105, 1);
INSERT INTO `sys_roles_menus` VALUES (106, 1);
INSERT INTO `sys_roles_menus` VALUES (107, 1);
INSERT INTO `sys_roles_menus` VALUES (108, 1);
INSERT INTO `sys_roles_menus` VALUES (109, 1);
INSERT INTO `sys_roles_menus` VALUES (110, 1);
INSERT INTO `sys_roles_menus` VALUES (111, 1);
INSERT INTO `sys_roles_menus` VALUES (112, 1);
INSERT INTO `sys_roles_menus` VALUES (113, 1);
INSERT INTO `sys_roles_menus` VALUES (114, 1);
INSERT INTO `sys_roles_menus` VALUES (116, 1);
INSERT INTO `sys_roles_menus` VALUES (120, 1);
INSERT INTO `sys_roles_menus` VALUES (1, 2);
INSERT INTO `sys_roles_menus` VALUES (2, 2);
INSERT INTO `sys_roles_menus` VALUES (6, 2);
INSERT INTO `sys_roles_menus` VALUES (7, 2);
INSERT INTO `sys_roles_menus` VALUES (9, 2);
INSERT INTO `sys_roles_menus` VALUES (10, 2);
INSERT INTO `sys_roles_menus` VALUES (11, 2);
INSERT INTO `sys_roles_menus` VALUES (14, 2);
INSERT INTO `sys_roles_menus` VALUES (15, 2);
INSERT INTO `sys_roles_menus` VALUES (19, 2);
INSERT INTO `sys_roles_menus` VALUES (21, 2);
INSERT INTO `sys_roles_menus` VALUES (22, 2);
INSERT INTO `sys_roles_menus` VALUES (23, 2);
INSERT INTO `sys_roles_menus` VALUES (24, 2);
INSERT INTO `sys_roles_menus` VALUES (27, 2);
INSERT INTO `sys_roles_menus` VALUES (30, 2);
INSERT INTO `sys_roles_menus` VALUES (32, 2);
INSERT INTO `sys_roles_menus` VALUES (33, 2);
INSERT INTO `sys_roles_menus` VALUES (34, 2);
INSERT INTO `sys_roles_menus` VALUES (36, 2);
INSERT INTO `sys_roles_menus` VALUES (80, 2);
INSERT INTO `sys_roles_menus` VALUES (82, 2);
INSERT INTO `sys_roles_menus` VALUES (83, 2);
INSERT INTO `sys_roles_menus` VALUES (116, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门名称',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `is_admin` bit(1) DEFAULT b'0' COMMENT '是否为admin账号',
  `enabled` bigint(20) DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新着',
  `pwd_reset_time` datetime DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE KEY `UK_kpubos9gc2cvtkb0thktkbkes` (`email`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`),
  KEY `FK5rwmryny6jthaaxkogownknqp` (`dept_id`) USING BTREE,
  KEY `FKpq2dhypk2qgt68nauh2by22jb` (`avatar_name`) USING BTREE,
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 2, 'admin', '管理员', '男', '18888888888', '201507802@qq.com', 'avatar-20200806032259161.png', '/Users/jie/Documents/work/me/admin/eladmin/~/avatar/avatar-20200806032259161.png', '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'1', 1, NULL, 'admin', '2020-05-03 16:38:31', '2018-08-23 09:11:56', '2020-09-05 10:43:31');
INSERT INTO `sys_user` VALUES (2, 2, 'test', '测试', '男', '19999999999', '231@qq.com', NULL, NULL, '$2a$10$4XcyudOYTSz6fue6KFNMHeUQnCX5jbBQypLEnGk1PmekXt5c95JcK', b'0', 1, 'admin', 'admin', NULL, '2020-05-05 11:15:49', '2020-09-05 10:43:38');
COMMIT;

-- ----------------------------
-- Table structure for sys_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_jobs`;
CREATE TABLE `sys_users_jobs` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `job_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_users_jobs
-- ----------------------------
BEGIN;
INSERT INTO `sys_users_jobs` VALUES (1, 11);
INSERT INTO `sys_users_jobs` VALUES (2, 12);
COMMIT;

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `FKq4eq273l04bpu4efj0jd0jb98` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色关联';

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
BEGIN;
INSERT INTO `sys_users_roles` VALUES (1, 1);
INSERT INTO `sys_users_roles` VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for tool_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_alipay_config`;
CREATE TABLE `tool_alipay_config` (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `app_id` varchar(255) DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) DEFAULT NULL COMMENT '编码',
  `format` varchar(255) DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '异步回调',
  `private_key` text DEFAULT NULL COMMENT '私钥',
  `public_key` text DEFAULT NULL COMMENT '公钥',
  `return_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='支付宝配置类';

-- ----------------------------
-- Records of tool_alipay_config
-- ----------------------------
BEGIN;
INSERT INTO `tool_alipay_config` VALUES (1, '2016091700532697', 'utf-8', 'JSON', 'https://openapi.alipaydev.com/gateway.do', 'http://api.auauz.net/api/aliPay/notify', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5js8sInU10AJ0cAQ8UMMyXrQ+oHZEkVt5lBwsStmTJ7YikVYgbskx1YYEXTojRsWCb+SH/kDmDU4pK/u91SJ4KFCRMF2411piYuXU/jF96zKrADznYh/zAraqT6hvAIVtQAlMHN53nx16rLzZ/8jDEkaSwT7+HvHiS+7sxSojnu/3oV7BtgISoUNstmSe8WpWHOaWv19xyS+Mce9MY4BfseFhzTICUymUQdd/8hXA28/H6osUfAgsnxAKv7Wil3aJSgaJczWuflYOve0dJ3InZkhw5Cvr0atwpk8YKBQjy5CdkoHqvkOcIB+cYHXJKzOE5tqU7inSwVbHzOLQ3XbnAgMBAAECggEAVJp5eT0Ixg1eYSqFs9568WdetUNCSUchNxDBu6wxAbhUgfRUGZuJnnAll63OCTGGck+EGkFh48JjRcBpGoeoHLL88QXlZZbC/iLrea6gcDIhuvfzzOffe1RcZtDFEj9hlotg8dQj1tS0gy9pN9g4+EBH7zeu+fyv+qb2e/v1l6FkISXUjpkD7RLQr3ykjiiEw9BpeKb7j5s7Kdx1NNIzhkcQKNqlk8JrTGDNInbDM6inZfwwIO2R1DHinwdfKWkvOTODTYa2MoAvVMFT9Bec9FbLpoWp7ogv1JMV9svgrcF9XLzANZ/OQvkbe9TV9GWYvIbxN6qwQioKCWO4GPnCAQKBgQDgW5MgfhX8yjXqoaUy/d1VjI8dHeIyw8d+OBAYwaxRSlCfyQ+tieWcR2HdTzPca0T0GkWcKZm0ei5xRURgxt4DUDLXNh26HG0qObbtLJdu/AuBUuCqgOiLqJ2f1uIbrz6OZUHns+bT/jGW2Ws8+C13zTCZkZt9CaQsrp3QOGDx5wKBgQDTul39hp3ZPwGNFeZdkGoUoViOSd5Lhowd5wYMGAEXWRLlU8z+smT5v0POz9JnIbCRchIY2FAPKRdVTICzmPk2EPJFxYTcwaNbVqL6lN7J2IlXXMiit5QbiLauo55w7plwV6LQmKm9KV7JsZs5XwqF7CEovI7GevFzyD3w+uizAQKBgC3LY1eRhOlpWOIAhpjG6qOoohmeXOphvdmMlfSHq6WYFqbWwmV4rS5d/6LNpNdL6fItXqIGd8I34jzql49taCmi+A2nlR/E559j0mvM20gjGDIYeZUz5MOE8k+K6/IcrhcgofgqZ2ZED1ksHdB/E8DNWCswZl16V1FrfvjeWSNnAoGAMrBplCrIW5xz+J0Hm9rZKrs+AkK5D4fUv8vxbK/KgxZ2KaUYbNm0xv39c+PZUYuFRCz1HDGdaSPDTE6WeWjkMQd5mS6ikl9hhpqFRkyh0d0fdGToO9yLftQKOGE/q3XUEktI1XvXF0xyPwNgUCnq0QkpHyGVZPtGFxwXiDvpvgECgYA5PoB+nY8iDiRaJNko9w0hL4AeKogwf+4TbCw+KWVEn6jhuJa4LFTdSqp89PktQaoVpwv92el/AhYjWOl/jVCm122f9b7GyoelbjMNolToDwe5pF5RnSpEuDdLy9MfE8LnE3PlbE7E5BipQ3UjSebkgNboLHH/lNZA5qvEtvbfvQ==', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut9evKRuHJ/2QNfDlLwvN/S8l9hRAgPbb0u61bm4AtzaTGsLeMtScetxTWJnVvAVpMS9luhEJjt+Sbk5TNLArsgzzwARgaTKOLMT1TvWAK5EbHyI+eSrc3s7Awe1VYGwcubRFWDm16eQLv0k7iqiw+4mweHSz/wWyvBJVgwLoQ02btVtAQErCfSJCOmt0Q/oJQjj08YNRV4EKzB19+f5A+HQVAKy72dSybTzAK+3FPtTtNen/+b5wGeat7c32dhYHnGorPkPeXLtsqqUTp1su5fMfd4lElNdZaoCI7osZxWWUo17vBCZnyeXc9fk0qwD9mK6yRAxNbrY72Xx5VqIqwIDAQAB', 'http://api.auauz.net/api/aliPay/return', 'RSA2', '2088102176044281');
COMMIT;

-- ----------------------------
-- Table structure for tool_email_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_email_config`;
CREATE TABLE `tool_email_config` (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `from_user` varchar(255) DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) DEFAULT NULL COMMENT '密码',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `user` varchar(255) DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱配置';

-- ----------------------------
-- Table structure for tool_local_storage
-- ----------------------------
DROP TABLE IF EXISTS `tool_local_storage`;
CREATE TABLE `tool_local_storage` (
  `storage_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `real_name` varchar(255) DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `size` varchar(100) DEFAULT NULL COMMENT '大小',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='本地存储';

-- ----------------------------
-- Records of tool_local_storage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tool_qiniu_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_qiniu_config`;
CREATE TABLE `tool_qiniu_config` (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `access_key` text DEFAULT NULL COMMENT 'accessKey',
  `bucket` varchar(255) DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) NOT NULL COMMENT '外链域名',
  `secret_key` text DEFAULT NULL COMMENT 'secretKey',
  `type` varchar(255) DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) DEFAULT NULL COMMENT '机房',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='七牛云配置';

-- ----------------------------
-- Table structure for tool_qiniu_content
-- ----------------------------
DROP TABLE IF EXISTS `tool_qiniu_content`;
CREATE TABLE `tool_qiniu_content` (
  `content_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bucket` varchar(255) DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型：私有或公开',
  `url` varchar(255) DEFAULT NULL COMMENT '文件url',
  `suffix` varchar(255) DEFAULT NULL COMMENT '文件后缀',
  `update_time` datetime DEFAULT NULL COMMENT '上传或同步的时间',
  PRIMARY KEY (`content_id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='七牛云文件存储';

-- ----------------------------
-- Records of tool_qiniu_content
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;





-- ----------------------------
-- customer of system
-- ----------------------------
DROP TABLE IF EXISTS `ts_member`;
CREATE TABLE `ts_member`
(
    `member_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `member_customer_id` varchar(32)  NOT NULL comment '会员业务Id',
    `mobile_number`      varchar(32)  NOT NULL comment '手机号',
    `password`           varchar(200) NOT NULL comment '密码',
    `identity_type`      varchar(50)  comment '证件类型',
    `identity_number`    varchar(64)  comment '证件号',
    `name`               varchar(200) comment '姓名',
    `nick_name`          varchar(200) comment '昵称',
    `user_name`          varchar(200) comment '系统生成会员名',
    `user_channel`       varchar(200) DEFAULT NULL comment '渠道(SELF:自营)',
    `sex`                varchar(20)  comment '性别',
    `email`              varchar(200) comment '邮箱',
    `birthday_date`      date COMMENT '出生日期(生日)',
    `user_type`          varchar(45)  DEFAULT NULL comment '用户类型(EU:企业用户;CU:个人用户)',
    `status`             varchar(20)  NOT NULL COMMENT '状态 ENABLE:有效;DISABLE:无效',
    `wc_union_id`        varchar(100) COMMENT '微信union_id',
    `al_union_id`        varchar(100) COMMENT '支付宝union_id',
    `create_time`        datetime     NOT NULL COMMENT '创建时间',
    `create_by`         varchar(100) NOT NULL COMMENT '创建人',
    `update_time`       datetime     NOT NULL COMMENT '修改时间',
    `update_by`         varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='会员';

-- ----------------------------
-- account of customer
-- ----------------------------
DROP TABLE IF EXISTS `ts_account`;
CREATE TABLE `ts_account`
(
    `account_id`          bigint(20)                  NOT NULL AUTO_INCREMENT,
    `account_customer_id` varchar(32)                 NOT NULL comment '账户业务Id',
    `pay_password`        varchar(200)                NOT NULL comment '支付密码',
    `member_id`           bigint(20)                  NOT NULL comment '会员Id',
    `balance`             decimal(12, 2) default 0.00 not null comment '余额',
    `frozen_amount`       decimal(12, 2) default 0.00 not null comment '冻结金额',
    `account_type`        varchar(45)    DEFAULT NULL comment '账户类型(POOL基本账户;RP:红包账户;IG:积分账户)',
    `create_time`         datetime                    NOT NULL COMMENT '创建时间',
    `create_by`          varchar(100)                NOT NULL COMMENT '创建人',
    `update_time`        datetime                    NOT NULL COMMENT '修改时间',
    `update_by`          varchar(100)                NOT NULL COMMENT '修改人',
    PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='账户';





-- ----------------------------
-- 业务表开始 包括t_member,t_account
-- ----------------------------



-- ----------------------------
-- customer of system 流水(充值，积分增加等等)
-- ----------------------------
DROP TABLE IF EXISTS `ts_transaction_record`;
CREATE TABLE `ts_transaction_record`
(
    `transaction_record_id`   bigint(20)               NOT NULL AUTO_INCREMENT,
    `transaction_customer_id` varchar(32)              NOT NULL comment '流水记录id',
    `member_id`               bigint(20)               NOT NULL comment '会员id',
    `member_name`             varchar(200)             NOT NULL comment '会员姓名',
    `transaction_type`        varchar(20)              NOT NULL comment '流水类型',
    `fund_type`               varchar(20)    default 1 NOT NULL comment '流水明细类型(细化类型)',
    `direction_type`          varchar(20)    default 1 NOT NULL comment '流水方向',
    `level_desc`              varchar(200) comment '会员等级描述',
    `transaction_value`       decimal(20, 2) default 0.00 comment '变化值',
    `account_value`           decimal(20, 2) default 0.00 comment '变化后值',
    `remark`                  varchar(200)   default 1 NOT NULL comment '备注',
    `operator_id`             bigint(20)               NOT NULL comment '操作人id',
    `operator_name`           varchar(200)             NOT NULL comment '操作人姓名',
    `create_time`             datetime                 NOT NULL COMMENT '创建时间',
    `create_by`               varchar(100)             NOT NULL COMMENT '创建人',
    `update_time`             datetime                 NOT NULL COMMENT '修改时间',
    `update_by`               varchar(100)             NOT NULL COMMENT '修改人',
    PRIMARY KEY (`transaction_record_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='流水(充值，积分增加等等)';



-- ----------------------------
-- customer of system 会员等级
-- ----------------------------
DROP TABLE IF EXISTS `ts_member_level`;
CREATE TABLE `ts_member_level`
(
    `level_id`          bigint(20)               NOT NULL AUTO_INCREMENT,
    `level_customer_id` varchar(32)              NOT NULL comment '会员等级业务Id',
    `member_id`         bigint(20)               NOT NULL comment '会员id',
    `level_config_id`   bigint(20)               NOT NULL comment '会员等级配置Id',
    `level`             bigint(20)     default 1 NOT NULL comment '会员等级',
    `discount_rate`     decimal(19, 6)           NOT NULL comment '会员折扣',
    `level_desc`        varchar(200) comment '会员等级描述',
    `integral`          decimal(20, 2) default 0.00 comment '积分值',
    `create_time`       datetime                 NOT NULL COMMENT '创建时间',
    `create_by`         varchar(100)             NOT NULL COMMENT '创建人',
    `update_time`       datetime                 NOT NULL COMMENT '修改时间',
    `update_by`         varchar(100)             NOT NULL COMMENT '修改人',
    PRIMARY KEY (`level_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='会员等级';


-- ----------------------------
-- customer of system 会员等级配置
-- ----------------------------
DROP TABLE IF EXISTS `ts_member_level_config`;
CREATE TABLE `ts_member_level_config`
(
    `level_config_id`    bigint(20)           NOT NULL AUTO_INCREMENT,
    `config_customer_id` varchar(32)          NOT NULL comment '会员等级配置业务Id',
    `level`              bigint(20)           NOT NULL comment '会员等级',
    `level_desc`         bigint(20) default 1 NOT NULL comment '会员等级描述',
    `integral_min_value` decimal(20, 2) comment '等级最小区间值',
    `integral_max_value` decimal(20, 2) comment '等级最大区间值',
    `discount_rate`      decimal(20, 6) comment '会员等级对应折扣',
    `status`             varchar(20) comment '状态 OPEN:开启;CLOSED:关闭',
    `create_time`        datetime             NOT NULL COMMENT '创建时间',
    `create_by`          varchar(100)         NOT NULL COMMENT '创建人',
    `update_time`        datetime             NOT NULL COMMENT '修改时间',
    `update_by`          varchar(100)         NOT NULL COMMENT '修改人',
    PRIMARY KEY (`level_config_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='会员等级配置';


-- ----------------------------
-- customer of system 会员标签
-- ----------------------------
DROP TABLE IF EXISTS `ts_member_tag`;
CREATE TABLE `ts_member_tag`
(
    `member_tag_id`          bigint(20)           NOT NULL AUTO_INCREMENT,
    `member_tag_customer_id` varchar(32)          NOT NULL comment '会员等级配置业务Id',
    `member_id`              bigint(20)           NOT NULL comment '会员id',
    `tag_code`               bigint(20)           NOT NULL comment 'tag_code',
    `tag_value`              bigint(20) default 1 NOT NULL comment 'tag描述',
    `create_time`            datetime             NOT NULL COMMENT '创建时间',
    `create_by`              varchar(100)         NOT NULL COMMENT '创建人',
    `update_time`            datetime             NOT NULL COMMENT '修改时间',
    `update_by`              varchar(100)         NOT NULL COMMENT '修改人',
    PRIMARY KEY (`member_tag_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='会员标签';


-- ----------------------------
-- customer of system 系统消息
-- ----------------------------
DROP TABLE IF EXISTS `ts_system_message`;
CREATE TABLE `ts_system_message`
(
    `system_message_id`    bigint(20)   NOT NULL AUTO_INCREMENT,
    `message_customer_id` varchar(32)  NOT NULL comment '系统消息业务Id',
    `message_type`         varchar(20)  NOT NULL comment '消息类型',
    `message_content`      blob         NOT NULL comment '消息内容',
    `target_user_type`     varchar(20)  NOT NULL comment '目标用户类型',
    `target_member_id`     varchar(32) COMMENT '目标用户Id',
    `create_time`          datetime     NOT NULL COMMENT '创建时间',
    `create_by`            varchar(100) NOT NULL COMMENT '创建人',
    `update_time`          datetime     NOT NULL COMMENT '修改时间',
    `update_by`            varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`system_message_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='系统消息';



-- ----------------------------
-- customer of system 订单表
-- ----------------------------
DROP TABLE IF EXISTS `ts_customer_order`;
CREATE TABLE `ts_customer_order`
(
    `order_id`            bigint(20)               NOT NULL AUTO_INCREMENT,
    `customer_order_id`   varchar(32)              NOT NULL comment '订单业务Id',
    `member_id`           bigint(20)               NOT NULL comment '客户id',
    `member_name`         varchar(200) comment '客户名字',
    `member_nick_name`    varchar(200) comment '客户昵称',
    `member_mobile`       varchar(20) comment '客户手机号',
    `discount_voucher_id` bigint(20) comment '抵扣券id',
    `discount_amount`     decimal(20, 2) default 0 comment '抵扣金额',
    `red_package_id`      bigint(20) comment '红包id',
    `red_amount`          decimal(20, 2) default 0 comment '红包金额',
    `ext_discount_amount` decimal(20, 2) default 0 comment '其他抵扣金额',
    `order_amount`        decimal(20, 2) default 0 NOT NULL comment '订单金额(下单金额(实际价格+红包金额+抵扣券金额))',
    `order_actual_amount` decimal(20, 2) default 0 NOT NULL comment '实际金额',
    `pay_type`            varchar(20) COMMENT '支付方式(BALANCE:余额支付...)',
    `target_member_id`    varchar(32)              NOT NULL COMMENT '目标用户Id',
    `server_member_id`    bigint(20) COMMENT '客服id',
    `server_member_name`  varchar(32) COMMENT '客服姓名',
    `order_no`            varchar(200) COMMENT '订单编号',
    `delivery_no`         varchar(200) COMMENT '快递单号',
    `delivery_count`      integer        default 1 COMMENT '包裹件数',
    `delivery_type`       varchar(20) COMMENT '快递类型(INNER_COUNTRY:国内;OUTER_COUNTRY:国外)',
    `image_url`           varchar(200) COMMENT '发货图',
    `protection_status`   varchar(200) COMMENT '维权状态:INIT:初始化;PROTECTING:维权中;PROTECTION_REFUSED:已拒绝;COMPLETE:维权成功，退款完成',
    `status`              varchar(20) COMMENT 'INIT:初始化;WAITING_ORDER:待下单;ORDERING:下单中;WAITING_PAY:待付款;PAYING:付款中;PAYED:已付款;TRANSFERRING:运输中;APPLYED:已签收;REFUSED:拒收',
    `order_time`          datetime COMMENT '下单时间',
    `pay_time`            datetime COMMENT '付款时间',
    `send_time`           datetime COMMENT '发货时间',
    `complete_time`       datetime COMMENT '订单完成时间',
    `pack_time`           datetime COMMENT '申请打包时间',
    `remark`              varchar(400) COMMENT '备注',
    `create_time`         datetime                 NOT NULL COMMENT '创建时间',
    `create_by`           varchar(100)             NOT NULL COMMENT '创建人',
    `update_time`         datetime                 NOT NULL COMMENT '修改时间',
    `update_by`           varchar(100)             NOT NULL COMMENT '修改人',
    PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='订单表';


-- ----------------------------
-- customer of system 订单评论表
-- ----------------------------
DROP TABLE IF EXISTS `ts_order_comment`;
CREATE TABLE `ts_order_comment`
(
    `order_comment_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `order_comment_customer_id` varchar(32)  NOT NULL comment '物流业务id',
    `order_id`                  bigint(20) comment '订单id',
    `router_id`                 bigint(20) comment '专线id',
    `comment_member_id`         bigint(20) comment '评论用户id',
    `comment_member_name`       varchar(100) comment '评论用户姓名',
    `audit_status`              varchar(20) comment '审核状态: WAITING_AUDIT:待审核;AUDITED:已审核;REFUSED:审核拒绝:',
    `approve_num`               bigint(20) comment '评论点赞数量',
    `server_evaluate`           varchar(45) comment '客服评价',
    `logistics_evaluate`        varchar(45) comment '物流评价',
    `integrated_evaluate`       varchar(45) comment '包括完整度评价',
    `content`                   bigint(20) comment '评论内容',
    `remark`                    varchar(400) comment '备注',
    `status`                    varchar(20) comment '状态:ENABLE:启用;DISABLE:删除',
    `create_time`               datetime     NOT NULL COMMENT '创建时间',
    `create_by`                 varchar(100) NOT NULL COMMENT '创建人',
    `update_time`               datetime     NOT NULL COMMENT '修改时间',
    `update_by`                 varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`order_comment_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='订单评论表';


-- ----------------------------
-- customer of system 订单收货表
-- ----------------------------
DROP TABLE IF EXISTS `ts_receipt`;
CREATE TABLE `ts_receipt`
(
    `receipt_id`            bigint(20)   NOT NULL AUTO_INCREMENT,
    `receipt_customer_id`   varchar(32)  NOT NULL comment '收货业务Id',
    `order_id`              bigint(20)   NOT NULL comment '订单id',
    `receipt_member_name`   varchar(200) comment '收货人名字',
    `receipt_member_mobile` varchar(200) comment '收货人手机号',
    `area`                  varchar(100) comment '区域',
    `post`                  varchar(20) comment '邮编',
    `province`              varchar(200) comment '省/州',
    `city`                  varchar(20) comment '城市',
    `detail_address`        varchar(400) comment '详细地址',
    `remark`                varchar(400) NOT NULL COMMENT '备注',
    `create_time`           datetime     NOT NULL COMMENT '创建时间',
    `create_by`             varchar(100) NOT NULL COMMENT '创建人',
    `update_time`           datetime     NOT NULL COMMENT '修改时间',
    `update_by`             varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`receipt_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='订单收货表';


-- ----------------------------
-- customer of system 订单包裹表
-- ----------------------------
DROP TABLE IF EXISTS `ts_package`;
CREATE TABLE `ts_package`
(
    `package_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `package_customer_id` varchar(32)  NOT NULL comment '收货业务Id',
    `member_id`           bigint(20) comment '报备人id',
    `member_name`         varchar(200) comment '报备人名字',
    `member_mobile`       varchar(200) comment '报备人手机',

    `store_id`            bigint(20) comment '仓库id',
    `store_name`          varchar(200) comment '仓库名字',
    `shelf_id`            bigint(20) comment '货架id',
    `shelf_name`          varchar(200) comment '货架名字',
    `floor_id`            bigint(20) comment '层数id',
    `floor_name`          varchar(200) comment '层数名字',

    `weight`              decimal(20, 6) comment '重量(单位kg)',

    `delivery_no`         varchar(100) comment '快递单号',
    `delivery_id`         bigint(20) comment '快递商id',
    `delivery_name`       varchar(200) comment '快递商',

    `merchant_type_id`    bigint(200) comment '品类id(商品还是物品todo 待定)',
    `merchant_type_name`  varchar(200) comment '品类名字',

    `length`              decimal(20, 6) comment '货物长(单位cm)',
    `width`               decimal(20, 6) comment '货物宽(单位cm)',
    `height`              decimal(20, 6) comment '货物高(单位cm)',
    `goods_price`         decimal(20, 2) comment '货值(单位:元)',

    `order_id`            bigint(20) comment '订单id',
    `package_no`          varchar(200) comment '包裹单号',

    `type`                varchar(20) comment '类型 NORMAL:普货;SENSITIVE:敏货',
    `sign_flag`           varchar(20) comment 'SIGNED:已签收;UN_SIGNED:未签收',
    `status`              varchar(20) default 'WAITING_STORE' comment '状态 WAITING_STORE:待入库;STORED:已入库;CANCELLED:已取消',

    `report_record_id`    bigint(20) comment '报备id',
    `report_record_time`  datetime comment '报备时间',
    `store_time`          datetime comment '入库时间',
    `order`               bigint(20) comment '排序序号',
    `create_time`         datetime     NOT NULL COMMENT '创建时间',
    `create_by`           varchar(100) NOT NULL COMMENT '创建人',
    `update_time`         datetime     NOT NULL COMMENT '修改时间',
    `update_by`           varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`package_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='订单包裹表';


-- ----------------------------
-- customer of system 报备记录表
-- ----------------------------
DROP TABLE IF EXISTS `ts_report_record`;
CREATE TABLE `ts_report_record`
(
    `report_record_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `report_record_customer_id` varchar(32)  NOT NULL comment '报备记录业务id',
    `member_id`                 bigint(20) comment '报备人id',
    `member_name`               varchar(200) comment '报备人名字',
    `member_mobile`             varchar(200) comment '报备人手机',
    `package_id`                bigint(20) comment '包裹id',
    `server_id`                 bigint(20) comment '客服id',
    `server_name`               varchar(200) comment '客服名字',
    `store_id`                  bigint(20) comment '仓库id',
    `store_name`                varchar(200) comment '仓库名字',
    `shelf_id`                  bigint(20) comment '货架id',
    `shelf_name`                varchar(200) comment '货架名字',
    `floor_id`                  bigint(20) comment '层数id',
    `floor_name`                varchar(200) comment '层数名字',
    `weight`                    decimal(20, 6) comment '重量(单位kg)',
    `order_id`                  bigint(20) comment '订单id',
    `delivery_no`               varchar(100) comment '快递单号',
    `delivery_id`               bigint(20) comment '快递商id',
    `delivery_name`             varchar(200) comment '快递商',
    `merchant_id`               bigint(20) comment '品类id',
    `merchant_name`             varchar(200) comment '品类名',
    `goods_price`               decimal(20, 4) comment '货值(单位:元)',
    `length`                    decimal(20, 6) comment '货物长(单位cm)',
    `width`                     decimal(20, 6) comment '货物宽(单位cm)',
    `height`                    decimal(20, 6) comment '货物高(单位cm)',
    `type`                      varchar(20) comment '类型 NORMAL:普货;SENSITIVE:敏货',
    `sign_flag`                 varchar(20) comment 'SIGNED:已签收;UN_SIGNED:未签收',
    `remark`                    varchar(400) comment '备注',
    `payer_remark`              varchar(400) comment '买家备注',
    `image_url`                 varchar(400) comment '货物图片',
    `report_status`             varchar(20) comment '报备状态 WAITING_REPORT:待报价;REPORTED:(报价之后)已报价;WAITING_SENDING:(支付状态已支付之后)待发货;WAITING_RECEIVE:(发货之后变为)待收货;COMPLETE:(用户收货之后变为)已完成',
    `pay_status`                varchar(20) comment '支付状态 WAITING_PAY:待支付;PAYED:已支付',
    `sign_status`               varchar(20) comment '签收状态 UN_SIGN:未签收;SIGNED:已签收',
    `status`                    varchar(20) default 'WAITING_STORE' comment '状态 WAITING_STORE:待入库;STORED:已入库;CANCELLED:已取消',
    `report_time`               datetime COMMENT '报备时间',
    `store_time`                datetime COMMENT '入库时间',
    `apply_package_time`        datetime COMMENT '申请打包时间',
    `send_time`                 datetime COMMENT '发货时间',
    `create_time`               datetime     NOT NULL COMMENT '创建时间',
    `create_by`                 varchar(100) NOT NULL COMMENT '创建人',
    `update_time`               datetime     NOT NULL COMMENT '修改时间',
    `update_by`                 varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`report_record_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='报备记录表';


-- ----------------------------
-- customer of system 订单商品表(有可能一个订单对应多个商品，这里算商品打包一起)
-- ----------------------------
DROP TABLE IF EXISTS `ts_tracking_goods`;
CREATE TABLE `ts_tracking_goods`
(
    `goods_id`           bigint(20)   NOT NULL AUTO_INCREMENT,
    `googds_customer_id` varchar(32)  NOT NULL comment '订单商品表业务id',
    `order_id`           bigint(20)   NOT NULL comment '订单Id',
    `weight`             decimal(20, 2) comment '重量（kg）',
    `volume`             varchar(200)   default 0 comment '体积（长*宽*高cm）',
    `volume_weight`      decimal(20, 2) default 0 comment '体积重(长*宽*高cm/6000 单位:kg 四舍五入)',
    `iamge_url`          varchar(400) comment '商品图片链接',
    `create_time`        datetime     NOT NULL COMMENT '创建时间',
    `create_by`          varchar(100) NOT NULL COMMENT '创建人',
    `update_time`        datetime     NOT NULL COMMENT '修改时间',
    `update_by`          varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='订单商品表';


-- ----------------------------
-- customer of system 地区管理表
-- ----------------------------
DROP TABLE IF EXISTS `ts_area`;
CREATE TABLE `ts_area`
(
    `area_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `area_customer_id` varchar(32)  NOT NULL comment '地区业务id',
    `area_code`        varchar(45)   NOT NULL comment '地区code',
    `area_desc`        varchar(400) comment '地区描述',
    `area_remark`      varchar(1000) comment '地区备注',
    `route`            varchar(200) comment '支持线路',
    `status`           varchar(20) default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `recommend_flag`   varchar(20) default 'UN_RECOMMEND' comment '是否推荐(RECOMMEND:推荐;UN_RECOMMEND:不推荐)',
    `order`            bigint(20) comment '排序序号',
    `create_time`      datetime     NOT NULL COMMENT '创建时间',
    `create_by`        varchar(100) NOT NULL COMMENT '创建人',
    `update_time`      datetime     NOT NULL COMMENT '修改时间',
    `update_by`        varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`area_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='地区管理';


-- ----------------------------
-- customer of system 城市表
-- ----------------------------
DROP TABLE IF EXISTS `ts_city`;
CREATE TABLE `ts_city`
(
    `city_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `city_customer_id` varchar(32)  NOT NULL comment '城市业务id',
    `city_code`        varchar(45)  NOT NULL comment '城市code',
    `city_desc`        varchar(1000) comment '城市描述',
    `area_id`          bigint(20)   NOT NULL comment '地区id',
    `city_remark`      varchar(400) comment '城市备注',
    `order`            bigint(20) comment '排序',
    `status`           varchar(20) default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `create_time`      datetime     NOT NULL COMMENT '创建时间',
    `create_by`        varchar(100) NOT NULL COMMENT '创建人',
    `update_time`      datetime     NOT NULL COMMENT '修改时间',
    `update_by`        varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`city_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='城市表';


-- ----------------------------
-- customer of system 快递商表
-- ----------------------------
DROP TABLE IF EXISTS `ts_delivery`;
CREATE TABLE `ts_delivery`
(
    `delivery_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `delivery_customer_id` varchar(32)  NOT NULL comment '快递商业务id',
    `logo`                 varchar(200) comment '快递logo',
    `name`                 varchar(200) comment '快递名称',
    `business_code`        varchar(45)  NOT NULL comment '物流商简码',
    `type`                 varchar(20) comment '类型 NORMAL:普货;SENSITIVE:敏货',
    `limit_weight`         decimal(20, 6) comment '限重(单位kg)',
    `support_type_id`      bigint(20) comment '支持类别id',
    `support_type`         varchar(20) comment '支持类别',
    `feature`              varchar(200) comment '特点',
    `limit_goods`          varchar(450) comment '物品限制',
    `length_goods`         varchar(450) comment '长度限制',
    `order`                bigint(20) comment '排序',
    `status`               varchar(20) default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `create_time`          datetime     NOT NULL COMMENT '创建时间',
    `create_by`            varchar(100) NOT NULL COMMENT '创建人',
    `update_time`          datetime     NOT NULL COMMENT '修改时间',
    `update_by`            varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`delivery_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='快递商表';


-- ----------------------------
-- customer of system 路线表  todo edit
-- ----------------------------
DROP TABLE IF EXISTS `ts_route`;
CREATE TABLE `ts_route`
(
    `route_id`                  bigint(20)   NOT NULL AUTO_INCREMENT,
    `route_customer_id`         varchar(32)  NOT NULL comment '路线业务id',
    `area_id`                   bigint(20)   NOT NULL comment '地区id',
    `area_code`                 varchar(20) comment '城市code',
    `area_desc`                 varchar(400) comment '城市描述',
    `delivery_id`               bigint(20) comment '快递商id',
    `delivery_name`             varchar(200) comment '快递商名称',
    `billing_type`              varchar(40) comment '计费方式 100g:100克;500g:500克;1000g:1000克',
    `first_weight_cost`         decimal(20, 4) comment '首重价(单位:元)',
    `first_weight_cost_contain` decimal(20, 6) comment '首重额外包含重量(单位g)',
    `standard_add_weight`       decimal(20, 6) comment '每超出重量(单位g)',
    `standard_add_cost`         decimal(20, 6) comment '每超出重量增加费用(单位元)',
    `evaluate_day`              decimal(20, 2) comment '评估时间(实际为评估天数)',
    `limit_weight`              decimal(20, 6) comment '限重(单位kg)',
    `operate_fee`               decimal(20, 6) comment ' 操作费用(单位元)',
    `support_unpack_flag`       varchar(40) comment '支持拆包标记 Y:支持;N:不支持',
    `unpack_fee`                decimal(20, 6) comment ' 拆包费用(单位元)',
    `status`                    varchar(20) default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `create_time`               datetime     NOT NULL COMMENT '创建时间',
    `create_by`                 varchar(100) NOT NULL COMMENT '创建人',
    `update_time`               datetime     NOT NULL COMMENT '修改时间',
    `update_by`                 varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`route_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='路线表';


-- ----------------------------
-- customer of system 国际快递商表
-- ----------------------------
DROP TABLE IF EXISTS `ts_internal_delivery`;
CREATE TABLE `ts_internal_delivery`
(
    `internal_delivery_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `internal_delivery_customer_id` varchar(32)  NOT NULL comment '国际快递商业务id',
    `logo`                 varchar(200) comment '快递logo',
    `name`                 varchar(200) comment '快递名称',
    `business_code`        varchar(45)  NOT NULL comment '物流商简码',
    `mobile`               varchar(20)  NOT NULL comment '物流商电话',
    `type`                 varchar(20) comment '类型 NORMAL:普货;SENSITIVE:敏货',
    `limit_weight`         decimal(20, 6) comment '限重(单位kg)',
    `support_type_id`      bigint(20) comment '支持类别id',
    `support_type`         varchar(20) comment '支持类别',
    `order`                bigint(20) comment '排序',
    `status`               varchar(20) default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `create_time`          datetime     NOT NULL COMMENT '创建时间',
    `create_by`            varchar(100) NOT NULL COMMENT '创建人',
    `update_time`          datetime     NOT NULL COMMENT '修改时间',
    `update_by`            varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`internal_delivery_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='国际快递商表';


-- ----------------------------
-- customer of system 商品品类
-- ----------------------------
DROP TABLE IF EXISTS `ts_merchant_type`;
CREATE TABLE `ts_merchant_type`
(
    `merchant_type_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `merchant_type_customer_id` varchar(32)  NOT NULL comment '商品品类业务id',
    `type_name`                 varchar(200) comment '类别名称',
    `goods_remark`              varchar(400) NOT NULL comment '物品说明',
    `common_product_name`       varchar(400) NOT NULL comment '常见品名',
    `order`                     bigint(20) comment '排序',
    `status`                    varchar(20) default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `create_time`               datetime     NOT NULL COMMENT '创建时间',
    `create_by`                 varchar(100) NOT NULL COMMENT '创建人',
    `update_time`               datetime     NOT NULL COMMENT '修改时间',
    `update_by`                 varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`merchant_type_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='商品品类';


-- ----------------------------
-- customer of system 货物品类
-- ----------------------------
DROP TABLE IF EXISTS `ts_goods_type`;
CREATE TABLE `ts_goods_type`
(
    `goods_type_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `goods_type_customer_id` varchar(32)  NOT NULL comment '货物品类业务id',
    `goods_name`             varchar(200) comment '货物品名',
    `goods_remark`           varchar(400) comment '物品说明',
    `merchant_id`            bigint(20)   NOT NULL comment '商品品类id',
    `merchant_remark`        varchar(400) NOT NULL comment '品类说明(常见品名)',
    `order`                  bigint(20) comment '排序',
    `status`                 varchar(20) default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `create_time`            datetime     NOT NULL COMMENT '创建时间',
    `create_by`              varchar(100) NOT NULL COMMENT '创建人',
    `update_time`            datetime     NOT NULL COMMENT '修改时间',
    `update_by`              varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`goods_type_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='货物品类';



-- ----------------------------
-- customer of system 货架表
-- ----------------------------
DROP TABLE IF EXISTS `ts_goods_shelf`;
CREATE TABLE `ts_goods_shelf`
(
    `goods_shelf_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `goods_shelf_customer_id` varchar(32)  NOT NULL comment '货物品类业务id',
    `self_name`               varchar(200) comment '名字',
    `area`                    varchar(200) comment '区域',
    `floor`                   bigint(20) comment '层数',
    `package_num`             bigint(20)  default 0 comment '包裹数',
    `store_id`                bigint(20) comment '仓库id',
    `store_house`             varchar(200) comment '所属仓库',
    `self_remark`             varchar(400) comment '货架说明',
    `order`                   bigint(20) comment '排序',
    `status`                  varchar(20) default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `create_time`             datetime     NOT NULL COMMENT '创建时间',
    `create_by`               varchar(100) NOT NULL COMMENT '创建人',
    `update_time`             datetime     NOT NULL COMMENT '修改时间',
    `update_by`               varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`goods_shelf_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='货架表';


-- ----------------------------
-- customer of system 基础设置 结算，体现等等 可以设置在 sys_dict 字典表 todo 后面再看
-- ----------------------------


-- ----------------------------
-- customer of system 支持银行表
-- ----------------------------
DROP TABLE IF EXISTS `ts_bank`;
CREATE TABLE `ts_bank`
(
    `bank_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `bank_customer_id` varchar(32)  NOT NULL comment '银行业务id',
    `bank_code`        varchar(45) comment '银行code',
    `bank_name`        varchar(200) comment '银行名称',
    `branch_bank_code` varchar(45) comment '支行code',
    `branch_bank_name` varchar(200) default 0 comment '支行名称',
    `bank_remark`      varchar(400) comment '银行备注',
    `order`            bigint(20) comment '排序',
    `status`           varchar(20)  default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `create_time`      datetime     NOT NULL COMMENT '创建时间',
    `create_by`        varchar(100) NOT NULL COMMENT '创建人',
    `update_time`      datetime     NOT NULL COMMENT '修改时间',
    `update_by`        varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`bank_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='支持银行表';


-- ----------------------------
-- customer of system 提现申请表
-- ----------------------------
DROP TABLE IF EXISTS `ts_withdraw_apply`;
CREATE TABLE `ts_withdraw_apply`
(
    `withdraw_apply_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `withdraw_apply_customer_id` varchar(32)  NOT NULL comment '提现业务id',
    `withdraw_no`                varchar(100) comment '提现单号',
    `withdraw_third_no`          varchar(100) comment '三方提现单号',
    `member_id`                  bigint(20) comment '会员id',
    `member_name`                varchar(200) comment '会员名字',
    `withdraw_type`              varchar(200) comment '提现方式',
    `withdraw_apply_amount`      decimal(20, 4) comment '提现金额',
    `actual_amount`              decimal(20, 4) default 0 comment '实际到账金额(包括红包)',
    `fee`                        decimal(20, 4) comment '提现手续费',
    `pay_time`                   datetime comment '支付时间',
    `pay_actual_time`            datetime comment '实际支付时间',
    `status`                     varchar(20)    default 'WAITING_AUDIT' comment '状态 WAITING_AUDIT:待审核;AUDITED:已审核;WAITING_PAY:待支付;PAYED:已支付;AUDIT_REFUSED:审批已拒绝;PAY_REFUSED:支付已拒绝;PAY_FAILED:支付失败;',
    `create_time`                datetime     NOT NULL COMMENT '创建时间',
    `create_by`                  varchar(100) NOT NULL COMMENT '创建人',
    `update_time`                datetime     NOT NULL COMMENT '修改时间',
    `update_by`                  varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`withdraw_apply_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='提现申请表';

-- ----------------------------
-- customer of system 充值记录表
-- ----------------------------
DROP TABLE IF EXISTS `ts_recharge_record`;
CREATE TABLE `ts_recharge_record`
(
    `recharge_record_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `recharge_record_customer_id` varchar(32)  NOT NULL comment '充值业务id',
    `recharge_no`                 varchar(100) comment '充值单号',
    `recharge_third_no`           varchar(100) comment '三方充值单号',
    `member_id`                   bigint(20) comment '会员(粉丝)id',
    `member_name`                 varchar(200) comment '会员(粉丝)名字',
    `recharge_type`               varchar(20) comment '充值方式(ZFB:支付宝;WX:微信)',
    `recharge_amount`             decimal(20, 4) comment '充值金额',
    `actual_amount`               decimal(20, 4) default 0 comment '实际到账金额(包括红包)',
    `recharge_time`               datetime comment '充值时间',
    `pay_actual_time`             datetime comment '实际到账时间',
    `status`                      varchar(20)    default 'INIT' comment '状态 INIT:申请充值;SUCCESS:充值成功;RECHARGING:充值中;CANCELLED:已取消;',
    `create_time`                 datetime     NOT NULL COMMENT '创建时间',
    `create_by`                   varchar(100) NOT NULL COMMENT '创建人',
    `update_time`                 datetime     NOT NULL COMMENT '修改时间',
    `update_by`                   varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`recharge_record_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='充值记录表';


-- ----------------------------
-- customer of system 活动表
-- ----------------------------
DROP TABLE IF EXISTS `ts_activity`;
CREATE TABLE `ts_activity`
(
    `activity_id`             bigint(20)   NOT NULL AUTO_INCREMENT,
    `activity_customer_id`    varchar(32)  NOT NULL comment '活动业务id',
    `activity_type`           varchar(45) comment '活动类型 [RED_PACKAGE,COUPON:红包,FULL_REBATE_COUPON:满返券,MANAGEMENT_FUND:投资券,FULL_DEDUCTION_COUPON:满抵券]',
    `activity_user_type`      varchar(45) comment '获取福利时用户类型 [REGISTERED_BUT_UN_USE注册未使用用户，USED:已使用用户] ',
    `event`                   varchar(45) comment '活动事件(REGISTER:注册奖励;RECHARGE_WELFARE:充值奖励 等等)',
    `activity_amount`         decimal(20, 4) comment '活动福利金额',
    `activity_num`            bigint(20) comment '福利数量',
    `validate_period`         bigint(20) comment '活动有效天数',
    `start_time`              datetime COMMENT '活动开始时间',
    `end_time`                datetime COMMENT '活动结束时间',
    `status`                  varchar(20) default 'DISABLE' comment '状态 DISABLE:禁用;ENABLE:启用',
    `prize_background_url`    varchar(450) comment '活动奖品背景URL',
    `activity_background_url` varchar(450) comment '活动品背景URL',
    `share_title`             varchar(450) comment '分享标题(todo不懂干嘛)',
    `create_time`             datetime     NOT NULL COMMENT '创建时间',
    `create_by`               varchar(100) NOT NULL COMMENT '创建人',
    `update_time`             datetime     NOT NULL COMMENT '修改时间',
    `update_by`               varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`activity_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='活动表';

-- ----------------------------
-- customer of system 福利奖励类型表
-- ----------------------------
DROP TABLE IF EXISTS `ts_category`;
CREATE TABLE `ts_category`
(
    `category_id`           bigint(20)   NOT NULL AUTO_INCREMENT,
    `category_customer_id`  varchar(32)  NOT NULL comment '活动业务id',
    `category_type`         varchar(45) comment '奖励类型 [RED_PACKAGE,COUPON:红包,FULL_REBATE_COUPON:满返券,MANAGEMENT_FUND:投资券,FULL_DEDUCTION_COUPON:满抵券]',
    `category_name`         varchar(45) comment '奖励类型名称(可参照奖励类型名称)',
    `category_title`        varchar(45) comment '奖励类型标题(用于列表显示或头信息展示)',
    `event`                 varchar(45) comment '活动事件(REGISTER:注册奖励;RECHARGE_WELFARE:充值奖励 等等)',
    `send_type`             varchar(45) comment '发送类型 [TARGET_USER:指定用户发放，USER_LEVEL:用户分组等级发送,ALL:全员发送] ',
    `min_invest_amount`     decimal(20, 4) comment '最小达到发放金额',
    `amount`                decimal(20, 4) comment '活动福利金额',
    `category_num`          bigint(20) comment '发放份数，-1即无限制',
    `category_everyone_num` bigint(20) comment '每人发放张数',
    `receive_start_time`    datetime COMMENT '可领取开始时间',
    `receive_end_time`      datetime COMMENT '可领取结束时间',
    `validate_period`       bigint(20) comment '福利有效天数',
    `start_time`            datetime COMMENT '福利开始时间',
    `end_time`              datetime COMMENT '福利结束时间',
    `order`                 bigint(20) comment '排序',
    `status`                varchar(20) default 'DISABLE' comment '状态 DISABLE:禁用;ENABLE:启用',
    `create_time`           datetime     NOT NULL COMMENT '创建时间',
    `create_by`             varchar(100) NOT NULL COMMENT '创建人',
    `update_time`           datetime     NOT NULL COMMENT '修改时间',
    `update_by`             varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='福利奖励类型表';


-- ----------------------------
-- customer of system 票券表
-- ----------------------------
DROP TABLE IF EXISTS `ts_coupon`;
CREATE TABLE `ts_coupon`
(
    `coupon_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `coupon_customer_id` varchar(32)  NOT NULL comment '活动业务id',
    `category_id`        bigint(20) comment '奖励类型id',
    `category_type`      varchar(20) comment '奖励类型 [RED_PACKAGE,COUPON:红包,FULL_REBATE_COUPON:满返券,MANAGEMENT_FUND:投资券,FULL_DEDUCTION_COUPON:满抵券]',
    `category_name`      varchar(100) comment '奖励类型名称(可参照奖励类型名称)',
    `category_title`     varchar(200) comment '奖励类型标题(用于列表显示或头信息展示)',
    `event`              varchar(45) comment '活动事件(REGISTER:注册奖励;RECHARGE_WELFARE:充值奖励 等等)',
    `member_id`          bigint(20) comment '会员id',
    `member_name`        varchar(100) comment '会员名',
    `validate_period`    bigint(20) comment '福利有效天数',
    `start_time`         datetime COMMENT '票券有效期开始时间',
    `end_time`           datetime COMMENT '票券有效期结束时间',
    `order_id`           bigint(20) comment '使用单号(订单号)',
    `status`             varchar(20) default 'UN_USE' comment '状态 UN_USE:未使用;USED:已使用;INVALID:已失效',
    `create_time`        datetime     NOT NULL COMMENT '创建时间',
    `create_by`          varchar(100) NOT NULL COMMENT '创建人',
    `update_time`        datetime     NOT NULL COMMENT '修改时间',
    `update_by`          varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`coupon_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='票券表';



-- ----------------------------
-- customer of system 客服表 放在后台管理用户 TODO 需要修改后台管理用户表
-- ----------------------------


-- ----------------------------
-- customer of system 仓库表
-- ----------------------------
DROP TABLE IF EXISTS `ts_store`;
CREATE TABLE `ts_store`
(
    `store_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `store_customer_id` varchar(32)  NOT NULL comment '仓库业务id',
    `store_name`        varchar(200) comment '仓库名字',
    `receiver`          varchar(45) comment '收件人',
    `mobile`            varchar(20) comment '联系电话',
    `address`           varchar(200) comment '详细收货地址',
    `province_code`     varchar(45) comment '省份code',
    `province_name`     varchar(100) comment '省份名称',
    `city_code`         varchar(45) comment '城市code',
    `city_name`         varchar(100) comment '城市名称',
    `area_code`         varchar(45) comment '地区code',
    `area_name`         varchar(100) comment '地区name',
    `longitude`         varchar(100) comment '经度',
    `latitude`          varchar(100) comment '纬度',
    `post`              bigint(20) comment '邮编',
    `order`             bigint(20) comment '排序',
    `status`            varchar(20) default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `create_time`       datetime     NOT NULL COMMENT '创建时间',
    `create_by`         varchar(100) NOT NULL COMMENT '创建人',
    `update_time`       datetime     NOT NULL COMMENT '修改时间',
    `update_by`         varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`store_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='仓库表';






-- ----------------------------
-- customer of system 物流信息表
-- ----------------------------
DROP TABLE IF EXISTS `ts_logistics`;
CREATE TABLE `ts_logistics`
(
    `logistics_id`          bigint(20)   NOT NULL AUTO_INCREMENT,
    `logistics_customer_id` varchar(32)  NOT NULL comment '物流业务id',
    `order_id`              bigint(20) comment '订单id',
    `receive_member_name`   varchar(200) comment '收货人名字',
    `receive_member_mobile` varchar(200) comment '收货人手机',
    `area`                  bigint(20) comment '区域',
    `post`                  varchar(200) comment '邮编',
    `city`                  bigint(20) comment '城市',
    `detail_address`        varchar(200) comment '详细地址',
    `delivery_no`           varchar(45) comment '快递单号',
    `route_id`              bigint(20) comment '线路id',
    `remark`                varchar(400) comment '备注',
    `create_time`           datetime     NOT NULL COMMENT '创建时间',
    `create_by`             varchar(100) NOT NULL COMMENT '创建人',
    `update_time`           datetime     NOT NULL COMMENT '修改时间',
    `update_by`             varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`logistics_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='物流信息表';



-- ----------------------------
-- customer of system 地址表  包括1，2，3，4级地址
-- 1.省份/直辖市:江苏省(100)/上海市(020)
-- 2.地级市(省会等)/区:南京市(025)/上海市(021)
-- 3.区/县:鼓楼区(05)/徐汇区(03)
-- 4.乡镇/街道:太阳乡(07)/正阳街道(07)
-- ----------------------------
DROP TABLE IF EXISTS `ts_address`;
CREATE TABLE `ts_address`
(
    `address_id`                 bigint(20)   NOT NULL AUTO_INCREMENT,
    `address_customer_id`        varchar(32)  NOT NULL comment '地址业务id',
    `receive_address_id`         varchar(200) comment '区域编码',
    `receive_address_pid`        varchar(45) comment '父级区域编码',
    `receive_address_level`      varchar(20) comment '级别 1.省;2.市;3.区/县;4.镇',
    `receive_address_name`       varchar(200) comment '名称',
    `receive_address_second_pid` varchar(45) comment 'level为4-镇时，有值(对应的市区域编码，此字段可不用)',
    `receive_address_snid`       varchar(100) comment 'snid+level为唯一标识(此字段可不用)',
    `status`                     varchar(20) default 'DISABLE' comment '状态 ENABLE:启用;DISABLE:禁用',
    `create_time`                datetime     NOT NULL COMMENT '创建时间',
    `create_by`                  varchar(100) NOT NULL COMMENT '创建人',
    `update_time`                datetime     NOT NULL COMMENT '修改时间',
    `update_by`                  varchar(100) NOT NULL COMMENT '修改人',
    PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  DEFAULT CHARSET = utf8
  ROW_FORMAT = COMPACT COMMENT ='地址表';