/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 20/02/2019 15:36:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for w_check_code
-- ----------------------------
DROP TABLE IF EXISTS `w_check_code`;
CREATE TABLE `w_check_code`  (
  `code_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '短信验证码ID',
  `code_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户手机号',
  `code_number` int(11) DEFAULT NULL COMMENT '验证码',
  `code_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '1用户注册 2更换手机号码 3变更密码',
  `code_time` datetime(0) DEFAULT NULL COMMENT '短信发送时间',
  PRIMARY KEY (`code_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_check_code
-- ----------------------------
INSERT INTO `w_check_code` VALUES ('0ac13e45347142728cfb9d81afcb7cf4', '18683789594', 30560, '1', '2019-01-30 15:15:31');
INSERT INTO `w_check_code` VALUES ('583dbc1a67d045db8ba65358dba9c95e', '18683789594', 74564, '2', '2019-01-30 15:18:47');
INSERT INTO `w_check_code` VALUES ('c5b911d15a9e45adacbc9e93352a0d4a', '18683789594', 53789, '2', '2019-01-02 15:43:16');

-- ----------------------------
-- Table structure for w_company
-- ----------------------------
DROP TABLE IF EXISTS `w_company`;
CREATE TABLE `w_company`  (
  `company_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司组织架构ID',
  `company_org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司所属单位ID',
  `company_parent_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级ID',
  `company_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司组织架构名称',
  `company_has_child` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '有无子部门(0否,1是)',
  `company_level` int(8) DEFAULT NULL COMMENT '层级（0顶级）',
  `company_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '类型（0总公司，1直属部门，2分公司，3分公司部门）',
  `company_is_valid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否有效（0无效，1有效）',
  `company_cretate_userid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人ID',
  `company_create_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `company_ceeate_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `company_last_update_userid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人ID',
  `company_last_update_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人名称',
  `company_last_update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`company_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司组织架构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_company
-- ----------------------------
INSERT INTO `w_company` VALUES ('10', '10', NULL, '色色科技有限公司', '1', 0, '0', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 14:57:26', NULL, NULL, NULL);
INSERT INTO `w_company` VALUES ('10.1', '10.1', '10', '网络科技有限分公司', '1', 1, '2', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 14:57:26', NULL, NULL, NULL);
INSERT INTO `w_company` VALUES ('10.1.1', '10.1', '10.1', '分公司财务部', '0', 2, '3', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 14:57:26', NULL, NULL, NULL);
INSERT INTO `w_company` VALUES ('10.2', '10.2', '10', '总公司财务部', '0', 1, '1', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 14:57:26', NULL, NULL, NULL);
INSERT INTO `w_company` VALUES ('1000', '1000', NULL, '色色科技集团', '0', 0, '0', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 14:57:26', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for w_constant
-- ----------------------------
DROP TABLE IF EXISTS `w_constant`;
CREATE TABLE `w_constant`  (
  `constant_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '常量ID',
  `constant_org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司ID',
  `constant_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '常量类型',
  `constant_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '常量类型名称',
  `contants_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '常量名称',
  `constant_value` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '常量对应值',
  `contants_level` int(11) DEFAULT NULL COMMENT '常量层级',
  `contants_has_child` int(11) DEFAULT NULL COMMENT '常量是否有子级',
  `contants_order` int(11) DEFAULT NULL COMMENT '常量排序',
  `contants_parent_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '常量父级ID',
  `constant_is_valid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否有效（0无效，1有效）',
  `constant_create_userid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人ID',
  `constant_create_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `constant_create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `constant_last_update_userid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最后修改人ID',
  `constant_last_update_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最后修改人名称',
  `constant_last_update_time` datetime(0) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`constant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '下拉列表常量值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_constant
-- ----------------------------
INSERT INTO `w_constant` VALUES ('2ddc1951fe274e64b4e4cbcdd8ca3383', NULL, 'roleType', '角色类型', NULL, NULL, 0, 1, 1, NULL, '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('a1459e332d2943c6ab4faa5c04d2bde9', NULL, 'roleType', '角色类型', '平台管理员', '2', 1, 0, 2, '2ddc1951fe274e64b4e4cbcdd8ca3383', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('ae40e12d661e44da9d1baa884caec15b', NULL, 'roleType', '角色类型', '普通角色', '3', 1, 0, 3, '2ddc1951fe274e64b4e4cbcdd8ca3383', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('b56c6135a2d34db28a4227dd64425816', NULL, 'roleType', '角色类型', '超级管理员', '1', 1, 0, 1, '2ddc1951fe274e64b4e4cbcdd8ca3383', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for w_job
-- ----------------------------
DROP TABLE IF EXISTS `w_job`;
CREATE TABLE `w_job`  (
  `job_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位ID',
  `job_org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位公司ID',
  `job_dep_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职工部门ID',
  `job_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位名称',
  `job_create_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人ID',
  `job_create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `job_update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `job_update_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人ID',
  `job_is_valid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否生效',
  `job_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位类型(1超级管理,2平台管理,3普通职位)',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_job
-- ----------------------------
INSERT INTO `w_job` VALUES ('403f7e439f75438788b6746b099e71ff', '10', '10.1', '后端工程师', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:20:10', NULL, NULL, '1', '3');
INSERT INTO `w_job` VALUES ('63a60fef9680488d8969e4baeb7a430b', '10', '10.1', '前端工程师', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:20:13', NULL, NULL, '1', '3');
INSERT INTO `w_job` VALUES ('6cc4239ecb2943a7973820a563508b74', '10', '10.2', '软件销售', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:20:46', NULL, NULL, '1', '3');
INSERT INTO `w_job` VALUES ('8a8628ba2aa34456a6c51f0e4f537ecc', '1000', '1000', '超级管理员', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-28 09:34:21', NULL, NULL, '1', '1');
INSERT INTO `w_job` VALUES ('e0cd5eb7b3d84c1a9da08fdb238c5b69', '1000', '1000', '平台管理员', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-12-29 14:20:55', NULL, NULL, '1', '2');

-- ----------------------------
-- Table structure for w_menu
-- ----------------------------
DROP TABLE IF EXISTS `w_menu`;
CREATE TABLE `w_menu`  (
  `menu_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `menu_org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司ID',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `menu_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单标识码',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单路径',
  `menu_pid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '父级ID',
  `menu_order` int(11) DEFAULT NULL COMMENT '菜单排序',
  `menu_has_child` int(11) DEFAULT NULL COMMENT '是否有子级(0否,1是)',
  `menu_level` int(11) DEFAULT NULL COMMENT '菜单层级',
  `menu_create_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人ID',
  `menu_create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `menu_update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `menu_update_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人ID',
  `menu_is_valid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否生效',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_menu
-- ----------------------------
INSERT INTO `w_menu` VALUES ('2616b17fc3f347659594eef947d33471', NULL, '角色设置', 'MENU_ROLE', '/role/index', '8397433445af4659970698c3019ca2d0', 2, 0, 2, '430196a10298435a89e261cc9df9a437', '2019-01-03 09:32:49', NULL, NULL, '1');
INSERT INTO `w_menu` VALUES ('337b5b2753b1450db5a747fd4b260230', NULL, '首页', 'MENU_HOME', '/home/index', NULL, 1, 0, 1, '430196a10298435a89e261cc9df9a437', '2018-12-24 17:11:05', NULL, NULL, '1');
INSERT INTO `w_menu` VALUES ('39dbd2c3dbf040b7929823ea50d25bc4', NULL, '菜单设置', 'MENU_MENU', '/menu/index', '8397433445af4659970698c3019ca2d0', 1, 0, 2, '430196a10298435a89e261cc9df9a437', '2019-01-03 09:28:19', NULL, NULL, '1');
INSERT INTO `w_menu` VALUES ('8397433445af4659970698c3019ca2d0', NULL, '平台系统设置', 'MENU_SYSTEM', '/platformSet/index', NULL, 4, 1, 1, '430196a10298435a89e261cc9df9a437', '2018-12-29 13:54:53', NULL, NULL, '1');
INSERT INTO `w_menu` VALUES ('9618b57230fc4deab308bc445031dc06', NULL, '菜单授权', 'MENU_AUTHORIZATION', '/menuAuthorization/index', '8397433445af4659970698c3019ca2d0', 3, 0, 2, '430196a10298435a89e261cc9df9a437', '2019-01-03 09:30:17', NULL, NULL, '1');
INSERT INTO `w_menu` VALUES ('9eb004dc226b4cbabf627fe69f68cb6d', NULL, '日志管理', 'MENU_LOG', '/log/index', NULL, 5, 0, 1, '430196a10298435a89e261cc9df9a437', '2019-01-22 11:31:26', '2019-01-22 16:45:40', '430196a10298435a89e261cc9df9a437', '1');

-- ----------------------------
-- Table structure for w_pt_job
-- ----------------------------
DROP TABLE IF EXISTS `w_pt_job`;
CREATE TABLE `w_pt_job`  (
  `pt_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工职位ID',
  `pt_org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司ID',
  `pt_dep_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门ID',
  `pt_job_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位ID',
  `pt_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户ID',
  `pt_job_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位类型(1主职位,2兼职职位)',
  `pt_create_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人ID',
  `pt_create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `pt_update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `pt_update_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人ID',
  `pt_is_valid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否生效',
  PRIMARY KEY (`pt_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_pt_job
-- ----------------------------
INSERT INTO `w_pt_job` VALUES ('00fb7aad21c6499aaa6883f1365ea403', '10', '10', 'e0cd5eb7b3d84c1a9da08fdb238c5b69', '728e957eb3344ac593d118b67fbff683', '1', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:21:54', NULL, NULL, '1');
INSERT INTO `w_pt_job` VALUES ('1bcf2bf18acf44afbf97b4806ceefab3', '10', '10.2', '6cc4239ecb2943a7973820a563508b74', '905cbdcb8fc446babf6b5bfec3538a72', '1', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:26:57', NULL, NULL, '1');
INSERT INTO `w_pt_job` VALUES ('3396415112874ef6acb258029c9584fa', '10', '10.1', '63a60fef9680488d8969e4baeb7a430b', 'bbdbf895c1e24b59bf88ee984cd07f28', '1', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-12-24 17:09:29', NULL, NULL, '1');
INSERT INTO `w_pt_job` VALUES ('ba08cc1c3bb042c2b7fd8722764c53d1', '1000', '1000', '8a8628ba2aa34456a6c51f0e4f537ecc', '430196a10298435a89e261cc9df9a437', '1', NULL, '2018-11-22 09:36:39', NULL, NULL, '1');
INSERT INTO `w_pt_job` VALUES ('cd4843e43869408c98174b08f058c55e', '10', '10.1', '403f7e439f75438788b6746b099e71ff', 'bbdbf895c1e24b59bf88ee984cd07f28', '2', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:21:31', NULL, NULL, '1');
INSERT INTO `w_pt_job` VALUES ('f5e6046ca3da4a5bb5927ef0b0ac5f7b', '10', '10.2', '6cc4239ecb2943a7973820a563508b74', 'd64bb17fe452491481932a59d360b67d', '1', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:26:30', NULL, NULL, '1');

-- ----------------------------
-- Table structure for w_role
-- ----------------------------
DROP TABLE IF EXISTS `w_role`;
CREATE TABLE `w_role`  (
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `role_org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司ID',
  `role_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '层级（1超级管理员,2平台管理员,3普通角色）',
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色标识码',
  `role_create_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人ID',
  `role_create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `role_update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `role_update_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人ID',
  `role_is_valid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否生效',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_role
-- ----------------------------
INSERT INTO `w_role` VALUES ('29269ebeac54477bb6d269fe1d4af6ca', '1000', 'b56c6135a2d34db28a4227dd64425816', '所有权限', 'ROLE_ADMIN', '430196a10298435a89e261cc9df9a437', '2018-11-27 17:30:13', '2019-02-15 13:18:54', '430196a10298435a89e261cc9df9a437', '1');
INSERT INTO `w_role` VALUES ('2dd795f6de62477985acafae201e2076', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '平台管理员权限', 'ROLE_PING', '430196a10298435a89e261cc9df9a437', '2018-11-28 09:31:02', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('fac692c5042f4b5d9b9c2a200588a8dc', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '平台管理员部分权限', 'ROLE_201902151550202289', '430196a10298435a89e261cc9df9a437', '2019-02-15 11:44:49', '2019-02-15 12:47:46', '430196a10298435a89e261cc9df9a437', '1');

-- ----------------------------
-- Table structure for w_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `w_role_menu`;
CREATE TABLE `w_role_menu`  (
  `relation_menu_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `relation_role_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `relation_is_valid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否生效'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_role_menu
-- ----------------------------
INSERT INTO `w_role_menu` VALUES ('9618b57230fc4deab308bc445031dc06', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('337b5b2753b1450db5a747fd4b260230', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('39dbd2c3dbf040b7929823ea50d25bc4', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('2616b17fc3f347659594eef947d33471', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('8397433445af4659970698c3019ca2d0', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('9eb004dc226b4cbabf627fe69f68cb6d', '29269ebeac54477bb6d269fe1d4af6ca', '1');

-- ----------------------------
-- Table structure for w_system_log
-- ----------------------------
DROP TABLE IF EXISTS `w_system_log`;
CREATE TABLE `w_system_log`  (
  `log_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志主键',
  `log_table` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '被操作表名字',
  `log_business` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '被操作业务名字',
  `log_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作类型(1新增,2修改,3删除)',
  `log_create_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人ID',
  `log_create_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '操作人姓名',
  `log_create_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  `log_params` text CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '参数',
  `log_method_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '日志类型(1业务,2异常)',
  `log_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'ip',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_system_log
-- ----------------------------
INSERT INTO `w_system_log` VALUES ('000571765a394064aa27a41745593984', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0129623b0c4041e9990eb86aeb89c480', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('01ebd970a6624b9992bd72ecbcc7e5ac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:40:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0256cd3510824cd9a9385da4c1a0aa11', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('02d0092684614ef880a000cfa52911a6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('047f6ab34fb841fd8b823fd36b897341', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:41:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('048e999e234a485aa27a6293a4ad0fbb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:48:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('04cf3aee1602419fa26e31cd83a4bd2c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:01:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('053d0c0a0c8145f5b5d93c39691473cb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:36:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0770f2970b274feaaf9fb30d7858f8be', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:14:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('07fdb8ed9a544ba3b03e754db1cc3285', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:43:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('08210e210e73491180382fac96701aac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('09526821a5434d44a40acba9745e979b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('09b8f925e58c41fdbc7d7f5476adb233', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:23:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('09eb17308f6e45fdaf769dce2d8cea21', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:23:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0ab3fcf531884bac8d3f90034aa1baa4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0b957bb68ff04ea3897381d3e9717762', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:20:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0c64b402cf0f4106add2df8655e76fb0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:17:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0c68f222ef0143c0bd4e473433f5aef5', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0db372bf931b44a39dd170729d686314', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:01:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0df8346379234b48920818ec19ca6a08', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:30:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0e02523585c343be8208cc9e865e9f03', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0e9fb939f5f54b38bb163c1e964a5601', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:30:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0f16d400ac4e49819006e8a5c27fac73', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0f6d4235150846078269528a301ff5ef', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:45:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0fb5a331479148d393b721ffaa8f936c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:56:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('10793309bd0a447a828ef5d73f1f8507', 'update', '修改角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:37:54', 'roleName:部分管理员新;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('116c7b0b68c840b4aa1bbfcc293b485c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:51:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('11752b7b2e6345c392f2777142af754f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:30:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('11a318444d5a461884e9eedc1a03a51d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:13:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('12392664d7ca415cb130906c31a059f0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:45:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('131fc3d0a2d84f4a8031f115847bc590', 'update', '修改角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:44:54', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员新;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('133501da50134d0fbca322a825a01a43', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:05:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('139e10dfd907446abbca34c0c3278d2c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('141e5d5c38ae455bba8804744d6df79d', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:21:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('14613c0c06b841ab948bbbaeb7badf51', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1469b976faed43738201234bc90bb519', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:25:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('146e8e4c8bb14cf3a882c91fd2edd57c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('14be1724b3e149c6a24793913e78120f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1584cbb90ef74f7ab5a28a1268a59486', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:22:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('161a50551042454eade36a487e79834d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:25:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1872869646754b0ab54eb199d6de057d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:47:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('18b1e1665c484d7ea26a9601ff3bf42c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('19aa4698a87c46daaaf80a4174b92006', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:22:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('19e23e1cf82f4ea3a101f72e72de9c28', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:48:25', 'roleName:部门管理员3;target:com.csd.system.role.po.Role@3ed886c3;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1a18da63f0f34d7cb6a636689288fbf4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1a42a8c4caef40cc9ba4027f23c4201f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:38:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1a55f6d47c5242a4885fb279a5e34199', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1ad27cefbcc74a66ac0259e3e574d5c3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:57:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1b9334191d5144f5b0ff37f06a026436', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:39:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1c2327f1db9c49209a837c4caa18331f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:00:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1c4b4c66c17b4938811f9c924995c6fb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:02:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1d089b3008ed4d0f94fb963e0184d025', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:30:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1daecfa0a73c47dc85700c1a216556a5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:43:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1db099aeb4b5407f92cc690e22707250', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:01:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1df1ceec37f04bb280352871b30521a3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:27:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1e2551964f984309b15a8d6e22ff2225', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:01:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1e594a853cb34936bca76fb75fefdf46', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1e5f7bc7b3e64f4495e136a5ca3f3384', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:00:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('210580c2f37d41d59c93b6e4fe8c7e42', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:02:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('21e4973a2e734b8eb760d70e3c58b2c5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:50:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('22cb23e060984b18b423fdfb19db1f1e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('233d9d2730604b2fa67ab03cf68dd972', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:27:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('23f30639b6fa4687a40a11346371a33c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:35:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('23f49e29ae014fd7a4fa4d05b6c32aa2', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:48:19', 'roleName:部门管理员1;target:com.csd.system.role.po.Role@7416bcf2;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2410f5e0b6764665b3c47a8f585c0118', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:41:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2449e08ba31e4fa2a9135ff9f045644c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:41:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('24dba39db3424cff9cf933d6630a923c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('24dfb8ca400249b79117b19eed8b6082', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2502fda343c74a4097394a4a59b7a033', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:59:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('251c677ac72145a6b26d53903ab5ead0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:59:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('264588bb8f5347738d8a3581e8b8ba0c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:40:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('26643e85b86a4fa294ebd4f093debcad', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:59:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('26983978e7464f9883b43511d8d17450', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('271d75b6fe7c41cabc03acb579e2706c', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2836b4e3c2ae47b1a5092e6853953d1f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:08:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('283d2b96c07640b683bd68671d89f6a7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:23:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('288d8c93fa094debbd8590d5018c2d9e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:41:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('28b72c3fa91242ed948a88fe39c044eb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:00:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('29474ed4fb1e4f0495c6e6bf69e650fc', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:15:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('295fe91cff7b43e4a56b6171bdb8f7e5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:56:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('298fff78c9474700971d8c926ac9424e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:37:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('29e78b6c39664145a362319cff997803', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:40:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2b2aac4a595547878dd6729c5d688254', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2cba1a1ab4484b04b0c0ca9fe793a0d2', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:02:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2db540ef04d4433cbe6b4ae795d02549', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:14:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2f2629ffd6194341819af64a7ec4e0a7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2fb69db4defd4ee3af87f6cf7b6c9b24', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:52:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('301cbab894944495b63fe11dfd82a3d7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3068515a9d5a4e50b5ba3ec706cf28fd', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:23:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('30af3e95f18a42be8faf37f67d100ce7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('31f3b61eeebe4a04b8bd3fdb121e1324', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:01:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3285d18848414738b95b95fd68ffaf84', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:21:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('32d6b5daae544746bfdc049969137b59', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:37:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('32ecb20d88fc438dad93e8de6b827df4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:38:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3313084c0f834b2dada4358fd536d000', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:22:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3334b435b1fd45e08e9211cace7c8277', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('353bfcb904a74421b59933d1eee7584d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:03:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3560e41c71c441ceaba820cbc8b647cd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:10:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('35884a4591cc4871bcfb1a72ed2fad9f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:08:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('35f9f00d258f46f48cfa541899bc9081', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 16:41:40', 'target:com.csd.system.role.po.Role@16ea15ef;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('362814f540e14bf99217933174a4c231', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:44:50', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员新;target:com.csd.system.role.po.Role@4d146043;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('363be24b58064204a194f8acf6d0da85', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:29:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('365d22d36d8a4506ae1f03ca0fe72c85', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:19:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('368b4c958d444e0dba6f959b76547d0b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:47:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('371d6615cc944123a8182fd5b17ff7ac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:42:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('37d4c212e03d4db89d26ecbcf4dc142a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:05:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3940ccc47bd44848aaeb2e738daf5f9a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:59:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3ab52c091d7641e5a24c45a7434c8d35', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:22:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3b502c5c22cc437d8c7bfd5d59fdf516', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3bfcc856dd1446569fbbd50ad71c83e3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:04:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3def9011b42747b197f7b44a66dfc3bb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3e3adb9998ac4849af373195ceb88e6b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:14:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3fe2826036eb4a28b7fb782af8a950e3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:23:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3fff0b9329f94af89375a9e26cf8b18e', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:21:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('405224e64df74651b11fea28d33990a0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:30:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('40e65317b0314dd592d0e07665bb5506', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:40:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('417ec7ce1ef547669fed53a556ceff2b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:59:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('419aeb4f56354f87b82dbcca47b7a9ca', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:29:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('41dc817705024e14bf041b0a93606246', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:47:43', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员;target:com.csd.system.role.po.Role@67dda7a3;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('42a7f25dc6a44a87bc6bb0ba83bc6186', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('42c3f119f05741b0a8aa676857dd5617', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:02:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('42cf93c0d4f84ed99a5679ba60da66f0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('430b5069272e4b058219daeb6cdc8981', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 16:35:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('439b8415a2a5406f9fd320a7e46f120d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('441d1a3a7bae4eef842544be31e6b449', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:52:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('447a492560cb4465914025ad138faf4b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:11:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4502b6729fe640fdbac408d5e8d9182c', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('451b87ab3fcf4ef6a48c1a5f589353c2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('452efe25f3a44311807ab66dd00c0a03', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:59:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('457b8fcf92ca4207bf14e85e48dca068', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:35:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('45e0ff96735b4ba59468c3b6170b25c4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('46affe5c18684193aa09962254d1c29a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:08:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('473c9bc4dfc14020aba0802e6f859b62', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:47:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('482735f685d047469092eee51827dfd8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('48625040009c4120afce237f4af6d15f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:35:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('48834190f5fe4541bd69955ec6abe056', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('48d21ad6c6fc4683a50928de2d04791f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4930f355a57e49ce89a7c82cf87ea4d0', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:20:43', 'roleName:平台管理员部分;target:com.csd.system.role.po.Role@347f7141;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('49a6f1957a5c4f42b032ad95c47a2f8e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:42:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4a837a75bebb4e6d9f1f8b28e8a8eb51', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:01:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4abb84e8316044539b9b46f997b615c6', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4d2537f7e737490db0a8aaa0f2d986d6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:48:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4d8067876db94279847d6795e2254ba6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:03:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4e8181d9e57942aa9514193022ad0b10', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:49', 'roleName:部分管理员4;target:com.csd.system.role.po.Role@2f045487;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4eae8be935274cccb6e471d46755f28c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4eb62a0db153459280ca30f7a500e5f1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:14:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4f36e15e41e94f0d9389ccdcfe7150fa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:36:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4f5be6178169464eae08e184b06ccae4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:01:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4fccc497898d4b91a7409d737a876d8e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:49:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5085936c86f84fdaa10b9be15cc231da', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:19:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5136f3e9a5c24e21ab4f4ff814d89526', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:37:47', 'roleName:部分管理员新;target:com.csd.system.role.po.Role@3d02f0b5;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5173e1c3551d4411826cebc92ad0bb8d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:41:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('51d82cfc8a1846f38d581f4f2e51ab82', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:01:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('521f03a354a841218d65a25798f3fc56', 'save', '新增角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:19:40', 'roleName:平台管理员部分;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5252bee9e2f74f49860a183b774ec249', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:27:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('52934cdf3e744eee962ea35910a30462', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('539e2144603c4d11bfb8db4c1af7b783', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:19:23', 'roleName:平台管理员部分;target:com.csd.system.role.po.Role@23cec6a2;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5415db0592c4418a8bd9e28b2745873f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:24:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('54ce008a89764dd59c7620b31cf11c73', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:59:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('54f6c01ea8974282ab2c1ce365aaef48', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:36:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('561cb14bd10e4cbdbdac9f8b89cd08e8', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 16:46:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('56a2dcf9e04445ef8abf699efe359f8f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('56b16e2030594909a916456619332a94', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:53:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('572738da4fcd4e30ab1e98932cede376', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:06:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5791c189d2bf4ee68a5fae58a506c1b8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:24:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('58a0683986504bf6965dc1504fddc50a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('59195e438ffe4ca483fc8076f4337602', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5b12e464ffd346c6a7a356d960987512', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:11:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5b366bc2b1324e6692eaa0febaa0df10', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:30:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5b3ba04eb9044499b1e601c31e201aa6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5b9569a37de04301a998f3ff54bce15d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5bdfd4ef060d43ee9ce670beb12742d1', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5bf1e6d4fa784c50b91ac9b47feaf6f0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:32:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5c30758532364bda9a65c2a19a9cc136', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5d5e29eee60e44b0b6efef571396fbe3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:07:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5e83ff531de04bd682bb6797360e51d3', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:47:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5ec96884884248a1a7495121bcc966d6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5f0c125b99a04a7e8830ca6cf428c44f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:00:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6054cd0c3d1b479b92a589b4dea039fa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:32:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('60c1decd84994c39976517baea093edb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('610c03a2098c4ddfa403186e8261059d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('615b7af8ef184a359b18b65da7f61a3e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('61cd729861cd4b97bd2a162369c5b1d1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:40:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('620ec9a4e2da4a3db6700b87047c199c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:08:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('637ba358c23f43c19b939c47d2f39baa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('640304735dac4970b704522af2cd02a0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:37:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('64a5f7dadfe24d0d918cef24a96cbeff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('64ab90103e5747df9ff8c02562f4bbc8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:07:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('65a91e1f71524a348b3c8bb0f7d061c1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:27:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('666684d29fd540cc9931b20f756cb22b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:19:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('667b1094f6f144f5ae678782068894d7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:03:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('68000d32cd334899b78aeccb982065d6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6844c5c7621a420b95de32259ffefd0c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:51:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('68adebeee2024f39b70c1d061ab03956', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:02:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('68af250cd7734160aa73a3cb62c62a91', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('68d02b1fc36c4d5d88890d2af8db25b9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:59:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('697aa4ff63ab4e47b5c54aef42a48644', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6a84005a431a49b6b2fd238792b70741', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:35:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6aef81e037254bcd9966cdb3fab3148c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6af4cff434c14318a82640e43b704737', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:41:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6b05962679554dfab09793be4c9dea93', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:34:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6b8322b9563a45b1aa7ed7fe8530e534', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:41:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6bf2d60414f548479333152be12b23ed', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:14:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6c799eb76a2942b5a79d04a706a4374f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6ca444b2aa4741998eea023b39699b50', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6d3887e8ca4b41f19743309c601d4bee', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:20:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6dffdb61a55a4e52bb27a096c1918f4f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:54:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6e42830481cb4dcba4623ee690b948b0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:01:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6e974c886db843aa94c12df4e1fa3463', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:14:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6edf0ced11504c739c9cce8b885fe022', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:19:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6f65e1ff0c924bf7aeecf4d6c4d31ec6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:39:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6fc17821da5142eda50f0a6a10e9fb0e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:56:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('72195d572faf422bb79c9fb71688e6ee', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:44:21', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员新;target:com.csd.system.role.po.Role@5382bffb;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74a2ff1b0f8a4af3b083e5e5b44b6ea2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:36:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74e8c8e726d94a7f880b7e9e4517116c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:06:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('759e7d5409ee45df9ea0f46a689bf9ec', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:59:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('75f49a9fc67b448f8e94504a705ffece', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:48:13', 'target:com.csd.system.role.po.Role@732f2925;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('76bab3b58955450ca1f34ee9e257c461', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:17:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('76cafe1b2f664929a54d0abb375694af', 'update', '修改角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:44:26', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员新;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('76e8c24e0ed64cfd8332fd4c4dd017ff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:22:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('785e9edf0abd4529a44cd54a8445ea20', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:30:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('786a0cde58004be1b0fcd6c576a001f9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:12:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('78dbe2ad3f554fdca28cb6434aeb09a0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:07:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('78f5ce26b0fb49749e25264edf4785b6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:41:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('79226d16c4b04733acff1bbb850586b5', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:48:22', 'roleName:部门管理员2;target:com.csd.system.role.po.Role@7affc00e;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7a2469a5251e43578e97d75ee8ab171e', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:29', 'roleName:部分管理员1;target:com.csd.system.role.po.Role@61ae362c;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7a6f6da7ef9946598cb05b49feb464a8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:56:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7b6e1ca28cf942158fa14ae85414bf1b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:20:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7c2a9c8b35a941eea9698b99acea6496', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7d5bce0e92b74d23be840105c99997ff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7d65b9c587b1415887ff9dc25184c92e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:55:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7e6d177bec0c4f4388096cd7cceb67a2', 'save', '新增角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:18:43', 'roleName:平台管理员部分;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7ee1332f5cda49a4829ae66933c798a9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:37:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7efd9c3e19ad4384a6958307a11a4b04', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:41:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7f93f83897d04d078764599e17cbee40', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7fd9a12f0ae14fcd9285d7dd11bdd0bc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7feec3c2369042d59ddd206166e1b1b1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:08:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('805e538bf50b47589a79ba182107cf40', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:38:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('816a59b695be41c9b22e1f4b324c9049', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:24:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('817f66ca71364540b3a4810a943d7490', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:07:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('81d4c7f845504d2aabc8a521b313e441', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:07:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('82a92130f8624ed3b9c3c2d8caf12937', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:19:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('82f0e4c51de94eb59fdff905eb66fa30', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('83972b71e1c84679bb0f73760c6b937a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:32:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('83da8b9c8a504441982c23f12a01fee3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:30:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('846e61f03f6d4b97b046602504d99173', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:24:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('846eaa41d88f48f2a20508ab389c1eda', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:18:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('849e6d47187949f8b5424023e24e9b99', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('84f79bfe52034a8abfd3e4cb7c54515b', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:44:44', 'roleName:部分管理员;target:com.csd.system.role.po.Role@2467319f;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8621f523053d44e98a0d67cbfaedc919', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:12:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8676bb0befe44780aaa61eb7691d9036', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8680ac9724de4735a9c179850eac5ab9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:50:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('868c2fe0df3b40c6bc5017fe579a6b15', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:53:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('86c4c53add7449b19ff7970899ed1f99', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:59:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('871f09c48cea4b6ca88cc2d4b5cb885e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:33:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('878672a8f4ef46aaabd6fb1c8cf2c45b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:14:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8801181e995f4dac9fa673706dcffc71', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:17:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('886d018eb66843c6a9ee4a449ede381c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:00:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('88aea16be0b242779a7c921b9da04156', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:18:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('88d637adbc594c14a6284ecb6bbe6f40', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:10:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('892a8f17d1db4e67ac48de0c3fd7219c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:59:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89bb274e725a463385aa17b93e026321', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:07:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89df0f1def7a4569a53163816c7a2503', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:07:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89f8e2cecce14a1c98b527c57c784437', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:43:12', 'roleName:部分管理员;target:com.csd.system.role.po.Role@2e3e6ac6;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89fd51669744486093543d84182a7c5d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8adfd8f9f1f4428b90fa799cc40bb61e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8af380e8898549ab814850a94cce4911', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:56:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8af6e21988a048ecbacf39f2dfd5f43f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:24:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8b3cc2b704ee4136b3308cddf95b8403', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:40:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8b9fed6290754f058f2213e7d258351c', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8d70bc4c93394f5a85cf4b6b7911067a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8fcd20cfc94d4831971a01ff547634e0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:59:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8fe8b87c92554880b67a226a7fb0c6c2', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('90f4edfc9dfa40a79f2bbf0d5d9c8e39', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:28:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9174bf08f3404900a8bf2dac3b0a32bb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('923505e7fcc7475b801822268d82adc6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:01:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9239c161b25240e5a7948060732754de', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:52:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('92ada92ef0f54fed9a32f333891a7ddf', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:12:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('92c35d3a0d0543d6a542f09795301eff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:30:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('944b13e24262494a86627b8eb1fb3528', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('953b72066b9741d29d70af0c91752611', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('962f5ed9825d4e2da829493983bef449', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:45:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9677f842f6954e03a1886c6bc48fcce6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:40:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('96c7c59b52724509b29016f31a700c56', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:01:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('97fa4575ee754b9c854d0903a2800d28', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:52:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9818df9810274d7eb862c38e9a202cac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9832d5ff0b5246359f55b72e27e2e838', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:30:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('988c9df6c8094c2aafcb45218e848217', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:07:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('98be9f54bc214723a6df2999ef1351e4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:40:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('98ca154f387b4ea0bbac1b46bbdd4353', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:39', 'roleName:部分管理员3;target:com.csd.system.role.po.Role@793b75eb;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('99212a078b09443a87d2c151214617fc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9a01d52595e3499bad45b82de47b8043', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9a90566ee95e44dabbff9eff47379405', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:29:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9b1529271b7a44eaa453c09edf68c2bc', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:21:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9b24ca2aec4f478ca2d364fa98d69600', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:52:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9b7cd3687b484011b3f3d8721602c663', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 14:29:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9c5482668cca4511b586b5018e7f97fb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:34:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9c67dd8247c147cd89a9f0db56b468ce', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9c7183cd72714475a206d62757d94940', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:01:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9e2a4cbbfdb7498c966a7fbed71aed38', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:24:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9e4b2733da424eb6b13250238735b6de', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9e91688abe584eddbf2eb4d62437127e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:40:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9f36e9aac55d462caaa934573d851c32', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:05:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9f5cf05b2ee745b48c6d4d2d84253fa0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:48:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9fcdb4348fab46c091ae7f3ab3c0468d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a0225da6b1c44f91b9202680351d15bb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a050f2f6d9954138a2ec0bc659b6b2b0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:24:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a058718a220e4e9da714daf19d2bbe73', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:02:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a08a3e1febd34aeaa976ac3b1a631aab', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:38:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a0cd37b1b3304587bea9d5ddd8e6a10b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:22:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a15cbc828ff4441694b769017f210591', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:52:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a1b3814f9efb4e198e57fd2b9a1ed287', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:33', 'roleName:部分管理员2;target:com.csd.system.role.po.Role@74721fd8;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a2120acb0d0e466783ba146bb75ce520', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:59:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a257601078894473940b9e7c0a3fe49c', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:39:14', 'roleName:roleName;target:com.csd.system.role.po.Role@76dd0963;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a2e737dbd76f4bb0860d6b58f1869579', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a3ec7e01fa1c4d56bb62be6a32268b1a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:18:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a3fd26a9403d45099a05cabc5c83ec6e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:25:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a4022924bc044a2aaa570f39807b85f0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a424cc154d5c403486fb501e8604e1a5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:29:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a442641eb1844d618e1289b9b3743e90', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:43:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a4a2f7517ff9428a8cc0d8aa2763f7a0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:37:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5814a3a755f49ef84bb02aeecd9810e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5a8a4e3c7f04bec9a1d565d5ce52ea8', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', 'admin', '2019-02-14 13:46:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5e5cefa7ad04b969fd60a7977ba75b3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:39:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5eb5b8b86774fe7930e92f4eeee93f6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:45:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5efe772b49248f8bdf9ff70698265d1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:41:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a70408a0b48c45e49a1396249898e69e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:23:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a792ecf799b1495b8f8c2ae4ac5505e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:50:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a7b1ff26b43d45e880b430a621aa44e3', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a7f3e50b1aa34a9cbeca46b1a678f802', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:23:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a838f87cd85644cb86982dfb2d415100', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a98f9e169b7c4d0cbf88bd97db03f5e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:30:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a9f1f872aea34cfeab81dbced724b142', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('abd8ca035446473d901bb9611c31b433', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:02:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('abfd9c4d56d34dab989b2e8168c398dd', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', 'admin', '2019-02-14 13:40:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ad3baa3e34714abaae55a97525ccb9c1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:33:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ad44f004406a4cde8639264dcbbd03f3', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 10:57:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ad4c4f537629472488dde2248b86b4cf', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('adf168a89aac42fca08ee314bf540621', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:36:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b035477c83a647239adf4332c691a98a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:47:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b11d68d0f68a496e8450329c2c339d64', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:36:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b251d43661a84627b534ec5ecc18cd75', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:04:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b40f6f4a8b4c4c018b34cc1edaf89553', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:18:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b42968918b1441888485c0cae255a4ed', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:52:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b47fc640b8e049cd82dd77bce955b8d3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:00:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b51de46b1a64461b944a52410af4473d', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', 'admin', '2019-02-14 15:41:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b59c8925f4944236a4a9412ee82a1854', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b6078010d8e54a37a940da38b6e99314', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b7edd84ee9c84006ae2e41f86a57e831', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b87309752f1a41fda70202d0216a7e70', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b916ee04638e4bef88b8156ed6b93404', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:28:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b92e1ee0ee74408ba55a0bb93fb64b29', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:15:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b96105e8d4964175895ff81597ae980c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:38:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b9d2265f0ed14cdcb858f8e59d7f7ce5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:14:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('baa322e742554f62879b6f58510db7ac', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bb224d2bdb794455898bc0f1e44fa682', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:31:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bb75f17586e64bb6801070e20f3360db', 'update', '修改角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:39:22', 'roleName:roleName;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bbdeb4206f6b4d73a0f7b64489968386', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bbf752c0b84242dcb28ff91611a358e3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:20:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bc6ce3661e04413995667fa2ec846d5e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:58:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bc75d9b090f545b09497dccb06411b21', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:34:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bc805e349dad4c18824f580a336904f8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:00:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bcd09f5c1e0448a29c9d0259ba91a1f9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:39:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bd89efd23164461ebf4b8f217ae436f8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:00:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bdfcc7d0b4244cd9a356cd540a9e782e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('be06fde7bf3c43eba3224890544b7f79', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bf228814d96047b78e5b6107a895110e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:05:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bf4fb155250a4914a71593ab357f56bd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:56:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bfc67ef1aca24851917f7f9f959c02a6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:33:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c031815d35554e0f80c59fe5397471a8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c06ac937f4134a648197ac342dc688dc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c09e88ff70b840499ebdc919ec0f3a62', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:39:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c19c2e9af13e4bb78309ad4ce9ea5d96', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:41:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c1b8f96e476b47b69787fa37c7544589', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:02:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c1de8f9943fa427fbc7a0973d96f0488', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:03:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c264a668af7143e0baaa5c132ab84cf4', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:19:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c2a5f5be6ebf424293d86fba646c9e32', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c3ed452ae3b24fa585a98169b187b8f8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:45:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c4de0a82a6374204b8f53f3441b54320', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:27:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c51661b66d3a48d590616b0919eb3866', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:48:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c573fd624d7e4267945953f1cdc3222a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:14:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c58a157c64744d338b5bade546f9294b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:45:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c59ca0aa29134c36b7839b79718b439d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:40:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c65c2d462ff84993a192eecf95014b9c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:03:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c66fc7b3136541228b9d4b54ad7f9e84', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:36:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c6d14fb33c8542e2b3ce8cde27794585', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:57:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c6d7a138898540e582d49af3c0ca9212', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:32:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c779a56a64ab433fa55166c71b5dda50', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c788ac02e8da4141abf5cfeef22828ff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:30:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c88ff5a0a361487a8c35f8a7e9e92446', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:18:43', 'roleName:平台管理员部分;target:com.csd.system.role.po.Role@6b23dff;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c962e9aa5c894fd682732bbd368bad9f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:17:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ca51a5f9197345d289a080e6da0f6143', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cb77be8eedd041ac8d0845983fd08e2b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:56:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cc17cb58f3814521b8509ece6641c8ba', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cc82d0041abb4b77be8348ac57fc98ea', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:44:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ccd7c5b471294798804f0dcee8899838', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cd3b6c4533be4c1d9e2560af5edf849f', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:21:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cdc522b091424a179466720f467850d4', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:45:21', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员新;target:com.csd.system.role.po.Role@1d044681;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cec815496b2a42bfb750982652a8b27c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:11:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cf161906497e4a10bd3386394a9a9ae0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:01:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cf3c6c7e278d4bbc8ed5b18e2d3f52b6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:19:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cfbb5046733e498380913cfe5e0bb0a3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:45:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d00fc5ed25ad445a871e845df45eebd0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:05:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d0867c2258874c41b673861410a705cf', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:48:53', 'target:com.csd.system.role.po.Role@5d3be0e7;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d127987e24304c19b1e7746a09ad818a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:13:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d12aa5878fd0417d805d2dd920b07b8a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:58:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d155eda243a642fea4169ab7c415efa7', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d2171d4a91094fb985ee0ef1bbfd0dd7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:31:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d217e15fe5ab4b70abb62cb7c8880122', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:17:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d3eb5fda70784a5a805ff4416575c635', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:11:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d4ba92108f574aaaa8ee22b0e4551c9c', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d5044009fae84256ae7420b398899c86', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:13:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d5f722061dd84caebdcd9f09625f524f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d67de5b0728743fc99e9576313641292', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d74778fb6ddd4a259212202c0bb18c2d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:56:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d7616e86a10547f08bea92a6c9f28fb8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:38:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d8ecae1f64284b1d8847b8cc2fde860c', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d9100832d0cf4267aec909ae35c7eac0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:13:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d93a5811589044d9b598fc16a1527539', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:40:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d9a3bc211372409ca9af6e6d5600bbef', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:52:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('db21a33454fa4745b29bc6a9f9fbc5c1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:24:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dc37f59fd3ea4e6e8057ec5361b48faa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dc98b500ba644954b65e771ff963cd3d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:12:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ddcbc9418f6245ce93bf83b936e03fbb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:47:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dde69c47e1844bd5b5c6a22593300fed', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:15:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('de0a33633086493787038bfe59639015', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:23:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dee5e633a0ba4c71afe086f4419cd911', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('df5c5d7b56014166b73509c902534b73', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('df687f622d5c4beb978c8eb6d1f33031', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:31:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e0cbf937120f47fca38faa83acbaa8ab', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:13:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e0fc12c867c14804ad85e248a7ee8102', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:36:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e12297bc83c441bc9c1b05a490fa3515', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:33:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e1627c2dda794254ac9c24f144a70e3f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:20:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e34970ecbc294ad4bee51eafa803389c', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', 'admin', '2019-02-14 13:44:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e3ea45f9a95547baa45e81a98d0a8ea9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:14:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e442054461fa46fb8582b76337372160', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:27:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e445e33d661e4535926d5323d43337ae', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e4a431ee337e4e878dc798aadd1b8568', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e530af0171a1422b836118da4665505a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e6b66662f2744e1bacf27f4535e98bc3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:14:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e6bdd42428e742499e0b2089fe1fd674', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e6fe5680d6d946d2a1714d0ef61a212b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e7250dc0ddc04dc89e9aedd1482655c4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:07:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e7e40672786040318743ecfb1b3f8e71', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:47:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e80d3265d85441b0b6f2fda75a61b524', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e8abdcd40e7b4902bad0fd0caff593e7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e96c42fc3fc041ac93294a2177b222b8', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ea9ba32592c147cfaee2c2a8761dde28', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('eac3c4a14a5748b5aa8bdb60bfe80c2d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:06:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ead5bb827b2f431eafb343b77b89c6ce', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('eafaaa1c302e4d389d36fdd109c503ca', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:34:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('eb993a35ed8b44f58ca60d109e77657a', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:35:48', 'target:com.csd.system.role.po.Role@14d42be;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ec9c003948dd43dcaf0e8ad85d5f6d75', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:35:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ed4bfa0d272042169e9c33977cb77a64', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:55:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ef7de409744e4450bc2761515ab84b25', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ef80d53eab8546dd9bcf30919ed5d9f0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:07:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f0350d514b51456e98ccc939f4c361f1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f0beeb70ba724459a37804a675909011', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f0c4d2cbe8b94d1ba733ea20855d3ba2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:41:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f165d132f1364951a0d7b998224252d8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:19:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f199d4b0b73148ebaa661ba8b089c5db', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:34:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f1f21bc8712548bf9bfb1af8dc7cc8ca', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f1f2f0f3cf244cdc8f4b354c25f0238a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:41:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f35ff9a5978842269e3aa02875e1f851', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:59:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f38d2ece6fab4996989e09fe22a77ffa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:39:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f38d304cd4564fe190008adea59c3475', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:55:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f3d5190ffcb44d14b3da979fd184c4dd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f400753e54954e94b2c1806afcc1fd78', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:48:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f486ea4e9e274df9b07a83a48875d372', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:26:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f500d87be497472aa9cc3888571e73c8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:08:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f5268d8cad9d4c5f977234f26fa278ad', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:21:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f5a9c43f94a44d388c2b70c0c8debd7c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:27:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f5a9d1edebab4e6485125072434b08e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:30:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f5f8bb3ca08e4ab0b09f07f55e2d5063', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:03:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f6e09e0abae044b88beb9574498512e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:20:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f6f57953dd01427297e907c1c4861ddd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f7087ac4c79445fb823a896b670297ad', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:33:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f7289520691548a4880ac8acd7bb2256', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:30:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f79891f5e86e437094c92a1b7b948f9b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f7bc2889ce0f4842b92916a7ff90553b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:53:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f806bf3260a941c7a63c246bbdee75d7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:24:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f81fd6d4a37644b281decf35aa68fd18', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f905b28688a24a1ca5432b136152bebd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f9255cbda77d4dd5b5ad503e22496f97', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f947239257fa49b5ad7105aa2328782e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:08:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fa81b89fae264d288b9315f0f4ea47f7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:18:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fae850454cae448abe793a542b906cc3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:29:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fb25d753b2a845a9ab57dc24c480a4f8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fb65b7829a694297b126bf7a56667c69', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:13:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fe1ee6a28b5d4278a9af8af6bb63550e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:37:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fe365fc6ace94717ba5cb7b847632271', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:33:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fe9e4f3844a74a3ba2054f5c565db813', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:59', '', '1', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for w_user
-- ----------------------------
DROP TABLE IF EXISTS `w_user`;
CREATE TABLE `w_user`  (
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户主键',
  `user_org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司ID',
  `user_dep_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户姓名',
  `user_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户登录号',
  `user_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户密码',
  `user_sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户性别',
  `user_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户地址',
  `user_is_valid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否生效',
  `user_is_active` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '账户激活(1待激活，2激活待确认，3已激活, 4冻结)',
  `user_number` int(11) DEFAULT NULL COMMENT '员工工号',
  `user_native_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '籍贯',
  `user_id_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证',
  `user_state` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '人员状态(1在职人员，2离职人员，3休假人员，4停职人员）',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '人员类型（0超级管理员，1平台管理员，2公司管理员, 3普通员工',
  `user_notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  `user_head_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像路径',
  `user_create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `user_update_time` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `user_create_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人ID',
  `user_create_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人名称',
  `user_update_user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人ID',
  `user_update_user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人名称',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_user
-- ----------------------------
INSERT INTO `w_user` VALUES ('430196a10298435a89e261cc9df9a437', '1000', '1000', '超级管理员', 'admin', 'fe39db8fa7eea8d5d1208d504bf8f7983703b10f', '1', '四川省成都市', '1', '3', NULL, NULL, NULL, '1', '0', NULL, NULL, '2018-11-28 09:30:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `w_user` VALUES ('728e957eb3344ac593d118b67fbff683', '10', '10', '平台管理员10', 'admin10', '2ff8ddae4aae26dc75071e350de20c14675c51f4', '1', '四川省成都市', '1', '3', NULL, NULL, NULL, '1', '1', NULL, NULL, '2018-11-27 17:23:44', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `w_user` VALUES ('905cbdcb8fc446babf6b5bfec3538a72', '10', '10.1', '吴4', '18644444444', 'ca0ff6de06c338127e3cb9d9ed0e7bdefd19e0a0', '1', '四川省成都市', '1', '1', NULL, NULL, NULL, NULL, '3', NULL, NULL, '2018-11-27 17:24:39', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `w_user` VALUES ('bbdbf895c1e24b59bf88ee984cd07f28', '10', '10.1', '吴1', '18683789594', '4ad7835f8c919eadb6b5f8612ed2afff84158c22', '1', '四川省成都市', '1', '2', NULL, NULL, NULL, '1', '3', NULL, NULL, '2018-11-14 15:55:12', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `w_user` VALUES ('d64bb17fe452491481932a59d360b67d', '10', '10.2', '吴3', '18633333333', '24aa1a301294c56b5c94b47f97907adf3371507b', '1', '四川省成都市', '1', '1', NULL, NULL, NULL, '1', '3', NULL, NULL, '2018-11-27 17:24:26', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for w_user_role
-- ----------------------------
DROP TABLE IF EXISTS `w_user_role`;
CREATE TABLE `w_user_role`  (
  `relation_role_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `relation_job_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位ID',
  `relation_is_valid` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '是否生效'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_user_role
-- ----------------------------
INSERT INTO `w_user_role` VALUES ('29269ebeac54477bb6d269fe1d4af6ca', '8a8628ba2aa34456a6c51f0e4f537ecc', '1');
INSERT INTO `w_user_role` VALUES ('2dd795f6de62477985acafae201e2076', 'e0cd5eb7b3d84c1a9da08fdb238c5b69', '1');

SET FOREIGN_KEY_CHECKS = 1;
