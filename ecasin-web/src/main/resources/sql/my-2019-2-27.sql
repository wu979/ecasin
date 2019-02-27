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

 Date: 27/02/2019 16:37:50
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
  `job_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '职位类型(1超级管理,2平台管理,3普通职位)',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_job
-- ----------------------------
INSERT INTO `w_job` VALUES ('403f7e439f75438788b6746b099e71ff', '10', '10.1', '后端工程师', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:20:10', NULL, NULL, '1', 'ae40e12d661e44da9d1baa884caec15b');
INSERT INTO `w_job` VALUES ('4d28fee161044f03b62f869b616678d5', '1000', '1000', '平台管理员2', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-12-29 14:20:55', NULL, NULL, '1', 'a1459e332d2943c6ab4faa5c04d2bde9');
INSERT INTO `w_job` VALUES ('63a60fef9680488d8969e4baeb7a430b', '10', '10.1', '前端工程师', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:20:13', NULL, NULL, '1', 'ae40e12d661e44da9d1baa884caec15b');
INSERT INTO `w_job` VALUES ('6cc4239ecb2943a7973820a563508b74', '10', '10.2', '软件销售', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:20:46', NULL, NULL, '1', 'ae40e12d661e44da9d1baa884caec15b');
INSERT INTO `w_job` VALUES ('8a8628ba2aa34456a6c51f0e4f537ecc', '1000', '1000', '超级管理员', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-28 09:34:21', NULL, NULL, '1', 'b56c6135a2d34db28a4227dd64425816');
INSERT INTO `w_job` VALUES ('e0cd5eb7b3d84c1a9da08fdb238c5b69', '1000', '1000', '平台管理员', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-12-29 14:20:55', NULL, NULL, '1', 'a1459e332d2943c6ab4faa5c04d2bde9');

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
INSERT INTO `w_menu` VALUES ('2616b17fc3f347659594eef947d33471', NULL, '角色设置', 'MENU_ROLE', '/role/index', '8397433445af4659970698c3019ca2d0', 20, 0, 2, '430196a10298435a89e261cc9df9a437', '2019-01-03 09:32:49', '2019-02-27 15:34:14', '430196a10298435a89e261cc9df9a437', '1');
INSERT INTO `w_menu` VALUES ('337b5b2753b1450db5a747fd4b260230', NULL, '首页', 'MENU_HOME', '/home/index', NULL, 1, 0, 1, '430196a10298435a89e261cc9df9a437', '2018-12-24 17:11:05', NULL, NULL, '1');
INSERT INTO `w_menu` VALUES ('39dbd2c3dbf040b7929823ea50d25bc4', NULL, '菜单设置', 'MENU_MENU', '/menu/index', '8397433445af4659970698c3019ca2d0', 10, 0, 2, '430196a10298435a89e261cc9df9a437', '2019-01-03 09:28:19', '2019-02-27 15:34:04', '430196a10298435a89e261cc9df9a437', '1');
INSERT INTO `w_menu` VALUES ('8397433445af4659970698c3019ca2d0', NULL, '平台系统设置', 'MENU_SYSTEM', '/platformSet/index', NULL, 100, 1, 1, '430196a10298435a89e261cc9df9a437', '2018-12-29 13:54:53', '2019-02-27 15:34:33', '430196a10298435a89e261cc9df9a437', '1');
INSERT INTO `w_menu` VALUES ('9eb004dc226b4cbabf627fe69f68cb6d', NULL, '日志管理', 'MENU_LOG', '/log/index', NULL, 200, 0, 1, '430196a10298435a89e261cc9df9a437', '2019-01-22 11:31:26', '2019-02-27 15:34:25', '430196a10298435a89e261cc9df9a437', '1');

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
INSERT INTO `w_role` VALUES ('2dd795f6de62477985acafae201e2076', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '默认平台管理员权限', 'ROLE_PING', '430196a10298435a89e261cc9df9a437', '2018-11-28 09:31:02', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('fac692c5042f4b5d9b9c2a200588a8dc', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '平台管理员部分权限', 'ROLE_201902151550202289', '430196a10298435a89e261cc9df9a437', '2019-02-15 11:44:49', '2019-02-27 16:30:49', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('fed0a0ccfb754cbc9fc835de01fe4e99', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '3333333333', 'ROLE_201902271551256274', '430196a10298435a89e261cc9df9a437', '2019-02-27 16:31:14', '2019-02-27 16:34:08', '430196a10298435a89e261cc9df9a437', '1');

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
INSERT INTO `w_role_menu` VALUES ('2616b17fc3f347659594eef947d33471', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('337b5b2753b1450db5a747fd4b260230', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('39dbd2c3dbf040b7929823ea50d25bc4', '29269ebeac54477bb6d269fe1d4af6ca', '1');
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
