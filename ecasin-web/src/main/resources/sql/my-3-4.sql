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

 Date: 05/03/2019 15:04:33
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
INSERT INTO `w_constant` VALUES ('0bb98e0258624eb5acc2ef76d5c0be16', NULL, 'userIsActive', '用户激活', NULL, NULL, 0, 1, 2, NULL, '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('18956188b81147a896a6679b87a51de1', NULL, 'userState', '用户状态', NULL, NULL, 0, 1, 3, NULL, NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('2ddc1951fe274e64b4e4cbcdd8ca3383', NULL, 'roleType', '角色类型', NULL, NULL, 0, 1, 1, NULL, '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('5402ec44cf784bcba4032899489b6835', NULL, 'userState', '用户状态', '离职人员', '2', 1, 0, 2, '18956188b81147a896a6679b87a51de1', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('5d3e5a17a7d348e9a7ecdbd2735b5c1d', NULL, 'userIsActive', '用户激活', '冻结', '4', 1, 0, 4, '0bb98e0258624eb5acc2ef76d5c0be16', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('7310cab057b14b7da8f811dba8badec1', NULL, 'userState', '用户状态', '休假人员', '3', 1, 0, 3, '18956188b81147a896a6679b87a51de1', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('84cd262feb6c44c19c1805504665b161', NULL, 'userIsActive', '用户激活', '已激活', '3', 1, 0, 3, '0bb98e0258624eb5acc2ef76d5c0be16', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('9bacaf52acd44048a64234409c350e51', NULL, 'userIsActive', '用户激活', '待激活', '1', 1, 0, 1, '0bb98e0258624eb5acc2ef76d5c0be16', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('a1459e332d2943c6ab4faa5c04d2bde9', NULL, 'roleType', '角色类型', '平台管理员', '2', 1, 0, 2, '2ddc1951fe274e64b4e4cbcdd8ca3383', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('ae40e12d661e44da9d1baa884caec15b', NULL, 'roleType', '角色类型', '普通角色', '3', 1, 0, 3, '2ddc1951fe274e64b4e4cbcdd8ca3383', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('b56c6135a2d34db28a4227dd64425816', NULL, 'roleType', '角色类型', '超级管理员', '1', 1, 0, 1, '2ddc1951fe274e64b4e4cbcdd8ca3383', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('c363700c3c534839a86935fd681c6869', NULL, 'userIsActive', '用户激活', '激活待确认', '2', 1, 0, 2, '0bb98e0258624eb5acc2ef76d5c0be16', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('d6c77d7640b14c0bb676066c310ef8f2', NULL, 'userState', '用户状态', '在职人员', '1', 1, 0, 1, '18956188b81147a896a6679b87a51de1', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);
INSERT INTO `w_constant` VALUES ('db652b21c25f4681afccadcd7bd61b9d', NULL, 'userState', '用户状态', '停职人员', '4', 1, 0, 4, '18956188b81147a896a6679b87a51de1', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 15:48:23', NULL, NULL, NULL);

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
INSERT INTO `w_menu` VALUES ('8881fee989fe4b82b86e6dccf6d26c9f', NULL, '档案管理', 'MENU_ARCHIVES', '/archives/index', 'b7746e693423420da24bee3f557ab11f', 10, 0, 2, '430196a10298435a89e261cc9df9a437', '2019-02-28 15:08:58', NULL, NULL, '1');
INSERT INTO `w_menu` VALUES ('9eb004dc226b4cbabf627fe69f68cb6d', NULL, '日志管理', 'MENU_LOG', '/log/index', NULL, 200, 0, 1, '430196a10298435a89e261cc9df9a437', '2019-01-22 11:31:26', '2019-02-27 15:34:25', '430196a10298435a89e261cc9df9a437', '1');
INSERT INTO `w_menu` VALUES ('b7746e693423420da24bee3f557ab11f', NULL, '员工管理', 'MENU_STAFF_MANAGE', '/staffManage/index', NULL, 10, 1, 1, '430196a10298435a89e261cc9df9a437', '2019-02-28 14:33:25', '2019-02-28 15:08:58', '430196a10298435a89e261cc9df9a437', '1');

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
INSERT INTO `w_role_menu` VALUES ('19eb004dc226b4cbabf627fe69f68cb6d', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('b7746e693423420da24bee3f557ab11f', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('8881fee989fe4b82b86e6dccf6d26c9f', '29269ebeac54477bb6d269fe1d4af6ca', '1');

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
INSERT INTO `w_system_log` VALUES ('00d50c2ac0ec4ca19b4f5bc3ce66c3d0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:22:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0144c9e8f80a4e22826d8585ec3795c2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:18:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('048cfbe0fe314b0e8a3e7402c98520a2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:29:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('04eb4740ceea4e2f9f936d7713d15fb8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:06:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('05c7d68496c94ec3adb5cbdb18ec4191', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:25:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('065ef085f4254f9a98d3c3400b9e3ce3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:23:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0891b92bab504441ba65781fe2c9d758', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:16:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0901367e470d4304a9d71a116b885473', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:07:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('09e116c98c5f4dd8bc66c9af31e90d39', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:20:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0e35374a20d14e4fbe233741d5d2e436', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:27:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('13fa6a87c2ef417fa5dbe51b938aa4e8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:19:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1401d5f6323147f481622ba2797222a0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:17:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('15d020961b55452a8edde06dd70eb175', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:23:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('15e5c6e3edcb4ef9b55272d85c796424', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:31:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1a096f258235489dbe266dfaeadb0e3c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:34:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1a6480038170440d923549632b8c6eee', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:35:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1b1d52cb6c6b4e158be9eb4e961037c3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:11:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1d7b5a15e5a048fab18e50dce2b02110', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:18:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('205b9e82eb884b06902f5956967055d7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:22:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('211d3343807b40988f22a9b8147fc220', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:35:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('218b165452f14308b20b2a01a5258363', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:54:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('22205891541d457ba17656fe3696a91f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:25:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('235e957f85cc455099ff6e6eab8d7ced', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:32:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('245ee1b94475482a817a45ad1253a109', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:17:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('280d7e07c35447b5b6fe45167be2c580', 'save', '新增菜单', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:07:01', 'menuName:啦啦啦;menuCode:MENU_INDEX_fefe;menuUrl:menu/wdwdwd;menuPid:root_parent;menuOrder:1;target:com.csd.system.menu.po.Menu@31a241a3;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('295f970895654cc0967a3463d569ec22', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:25:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2b85e5a352b243d58b8efa5a643594d5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:20:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2df7baed0b984b41ba92e2695e9ffc95', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:20:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('30106bdd956d455887e1140d4b51717b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:11:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('30ca8ec1433c46178785caab267a0084', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:19:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3375d367023540cba7c8dd152dfd27d4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:32:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('34dd2d9e6d4a473993bc7a066302697a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:32:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('37809bda734048cca4b8da98c1b752df', 'save', '新增菜单', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:33:25', 'menuName:员工管理;menuCode:MENU_STAFFMANAGE;menuUrl:/staffManage/index;menuPid:root_parent;menuOrder:10;target:com.csd.system.menu.po.Menu@677a8185;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3a3b26c2dde348899aca18c26cde052a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:22:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3d38b7d57857419e8bd04cc2b7b0f414', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:01:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3f427ac384fa4dd2995e31357137458b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:18:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('40d1e8bf36284976bac9f238a3aa6c9e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:32:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('42225e1e42794bdd944d1d14bd22887f', 'save', '新增菜单', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:06:51', 'menuName:啦啦啦;menuCode:MEN_INDEX;menuUrl:/menu/wdwdwd;menuPid:root_parent;menuOrder:1;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('42917483560f43438dc99c7fc7087aab', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:01:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('42c0661146a74b9fa6d7cff250f690ea', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:29:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('440afcb9fb8f41479cc07ea092d153ae', 'save', '新增菜单', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:07:01', 'menuName:啦啦啦;menuCode:MENU_INDEX_fefe;menuUrl:menu/wdwdwd;menuPid:root_parent;menuOrder:1;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('45c179d178784294b33242c66ca096d1', 'save', '新增菜单', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:06:51', 'menuName:啦啦啦;menuCode:MEN_INDEX;menuUrl:/menu/wdwdwd;menuPid:root_parent;menuOrder:1;target:com.csd.system.menu.po.Menu@5d0b22e4;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('460ac81ad0ab4975be648caf38b7d797', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:25:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('46558c6193d64c9ab41408974623ead5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:42:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('484e6263b0fe4674a5a80298bb85c8b1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:26:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4b850e051add4224bde69577b7c95862', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:25:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4ec2013e6e7340fa93f9f0940592e25c', 'update', '修改菜单', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:34:30', 'menuId:b7746e693423420da24bee3f557ab11f;menuName:员工管理;menuCode:MENU_STAFF_MANAGE;menuUrl:/staffManage/index;menuPid:root_parent;menuOrder:10;target:com.csd.system.menu.po.Menu@190932e5;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('53cc9e873a634dee95eb60166e317c48', 'save', '新增菜单', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:07:05', 'menuName:啦啦啦;menuCode:MENU_INDEX_fefe;menuUrl:/menu/wdwdwd;menuPid:root_parent;menuOrder:1;target:com.csd.system.menu.po.Menu@22e39681;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('54c50926b8064108af2e16ccbd414e4c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:22:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('554e5d54e2e44adebfca778be7f9a162', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:14:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('572d3cab3e354ba7be74774fbe33e33b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:23:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('579f4b3dbede456da978567c15119801', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:43:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('59b4e56ed7104a81b9a198dbbe7066d9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:20:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('59bfe5dd9f5b4e60869b93c5bf764604', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:22:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('59c987c78a0240abbb833a59030d853f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:35:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5bfec58fea834cdda67110ff6082bf82', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:35:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5d15d0c61280460cbc888b88c801c937', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:24:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5d168f5b38a64da085479e3e45584b55', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5ea42f3545c4445db92ef4ac0896d9cc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:10:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5fbdde016d604ddc896c81695039f660', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:17:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('61ec826a756347b7ae9c078c38160641', 'update', '修改菜单', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:43:01', 'menuId:b7746e693423420da24bee3f557ab11f;menuName:员工管理;menuCode:MENU_STAFF_MANAGE;menuUrl:/staffManage/index;menuPid:root_parent;menuOrder:10;target:com.csd.system.menu.po.Menu@2c7b9f;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('65bb1a15dc724f1eba81b5ff36887b93', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:21:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6757f31100a6422f86a14cadd90fc050', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:05:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('69fc5a50adc349b6b88d0747c8df0244', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:23:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6a08c23f798f4b0fb2b67c3685eeed1f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:35:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6a60726ee4e1439fbfbc26e053a471b0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:20:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6ac3ebf1174244edafb1df824c3f256f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:18:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7264395d33f94db6a3b78df99c4f7def', 'delete', '删除菜单', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:07:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('72d4b68d6aea46369c42164a798b847b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:23:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('741ab139c0dd4afba7672cfc7d9b7ca0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:46:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('779f182647b44e48be34ff80c26b05c7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:32:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7a5bc07ffa98497fbe6887917dd7042f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:35:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7bfa3a92f0ed45aa8e64b22d5e824545', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:25:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7c3237b6afeb4b2aae2842efbc67fa19', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:18:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7d244b36644340c4985891c51484b916', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:07:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7e8d8149e8a241bbae6e3f1ed92e13c3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:22:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7ee606b546694beea28bee80ad82339d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:22:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('80fca7f5b26d4664943aa936b71eb383', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:00:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8166bab5082f4975b9525f8620e99aa6', 'save', '新增菜单', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:08:58', 'menuName:档案管理;menuCode:MENU_ARCHIVES;menuUrl:/staff/index;menuPid:b7746e693423420da24bee3f557ab11f;menuOrder:10;target:com.csd.system.menu.po.Menu@54efb998;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('81abb3ca37a645c3b8ae5e860cf8020b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:18:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('81e8996860514982ba20c05d4e12dfe3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:24:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('86d90225f9b34c0fa41be9cab857b620', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:28:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8aa1711b25354d9582e7837654993ecf', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:23:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8b1700e6473b403bb3789ab87b20e37f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:22:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8b4e7e0a192d4e0db583e8662ea3a5cf', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:16:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('92351616bbe64acfa1712810eb720210', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:17:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('93008b6f5125494cb3c02e9db58e96e8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:22:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('931c5bd814364d35b5acc31aa0c8fca7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:22:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9367f8d151ad4b98befbfa5deb63291a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:48:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('93d20097cf874ab693805fb6fcc09160', 'update', '修改菜单', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:35:48', 'menuId:b7746e693423420da24bee3f557ab11f;menuName:员工管理;menuCode:MENU_STAFF_MANAGE;menuUrl:/staffManage/index;menuPid:root_parent;menuOrder:10;target:com.csd.system.menu.po.Menu@3befb792;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('949a49fcda3e44d6b5bcc4a0bc896f81', 'save', '新增菜单', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:33:07', 'menuName:员工管理;menuCode:MENU_STAFF_MANAGE;menuUrl:/staffManage/index;menuPid:root_parent;menuOrder:10;target:com.csd.system.menu.po.Menu@262d3de1;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('94b4a1b7cd2f46e1b3383f1d0297bcc1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:18:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('95dda301f6224ce3a875bd6850f246cb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:21:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('96fe336c26a249cf87754f94d35e6dea', 'save', '新增菜单', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:32:07', 'menuName:员工管理;menuCode:MENU_STAFF_MANAGE;menuUrl:/staffManage/index;menuPid:root_parent;menuOrder:10;target:com.csd.system.menu.po.Menu@6e5ee1d5;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a3cc32fc195a4282acc7ae4ae6e64a14', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:16:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a4ebe390e7ee45408f0e86b784889a71', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:21:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5bc613c44d64fc394bae7c1eba67ac2', 'save', '新增菜单', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:32:15', 'menuName:员工管理;menuCode:MENU_STAFF_MANAGE;menuUrl:/staffManage/index;menuPid:root_parent;menuOrder:10;target:com.csd.system.menu.po.Menu@4c19f7c8;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5d984b76c534331ad644204951243f6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:10:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a68ad847391243c3bbde251506814839', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:35:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a7d6297479d4439dafcad9c1415e9a75', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:32:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a98f99eff4934c44a066862223fa8bb4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:07:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('aae9c9d3b477404c87339fc8eb7c9dd5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:16:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ab1bd389021b4f999b91ac99d86884eb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:36:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ab59202edb6b4e18b0919fe2bf2d3279', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:06:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('abae3bd2ec4e4d49b91a5da141721aac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:07:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('acc854b0861d485884631b483e348afb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:16:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ace1776a67b84d6a93fe5552e2335a5b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:25:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b268e71fbb0d42a3890c36ea971bd5b9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:17:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b330e1b531f342649590049e7002f6ca', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:20:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b9e222564cb2478abb10b89fb5dd82c6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:16:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ba6d5e8d9a1b4e77b1efb974dc5a06a3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:21:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bc11816a62aa48dba4829b4cf936b171', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:18:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bd39bf32042142cf85ae67fdf8b968e7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:13:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('be6f70931a4141aba66139a3a49a5c93', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:24:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('be8bce1703854f559fcd4a1e1f0a65fa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:20:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('beb466c5cbe84ce0a469e250dd9b5da9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:13:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c11e266e319c4e04a4e8f85bb401bde2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:21:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c1b6e89ae05e4c72af17cdceaaf83793', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:17:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c1dd3fc7f24646fea58073849fc095e9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:14:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c3a9013dedd5484ebb621b931d10451d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:17:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c590ae0cf27b4da4888d5565110428ae', 'update', '修改菜单', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:07:12', 'menuId:ac5ffa062ad9460caedf0b3556ddf3c0;menuName:啦啦啦;menuCode:MENU_INDEX_FFF;menuUrl:/menu/wdwdwd;menuPid:root_parent;menuOrder:1;target:com.csd.system.menu.po.Menu@7da61adf;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c69455a080c6419d84a80be17ff626d9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:27:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c7e8cade6a1748a3927483246a230fa0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:46:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('caa45ffe518940c5af9ae251a7fae69a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:23:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cb62987aa78a48619ed9fc1edc91c14a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:16:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cd06e09c2b7a46f4bb406d6c6c7480b1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:14:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cd67fd48b38d451fbd12d08bd9daa61f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:44:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cda0c6631e9b4fd2b3c4723bc9f18257', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:19:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cf645a50299f47c7adcef4e3c617d483', 'update', '修改菜单', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:43:15', 'menuId:b7746e693423420da24bee3f557ab11f;menuName:员工管理;menuCode:MEN_STAFF_MANAGE;menuUrl:/staffManage/index;menuPid:root_parent;menuOrder:10;target:com.csd.system.menu.po.Menu@6dc9bfde;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d14ffd9ecec3446c84d852361810eed0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:35:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d7aab32bd3a64a67a16b6411630bb991', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:08:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('db10da0303c243bd9afd3b7a64f6ebac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:32:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dca985857eeb4b4188c080a93cdd5bb9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:34:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dd4a9bb343894ffd944aba86f556892d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:32:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e11858e461a64056ae5a37b8fb804749', 'update', '修改菜单', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:07:26', 'menuId:b7746e693423420da24bee3f557ab11f;menuName:员工管理;menuCode:MENU_STAFF_MANAGE;menuUrl:/staffManage/index;menuPid:root_parent;menuOrder:10;target:com.csd.system.menu.po.Menu@4910673f;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e4c150e3c49046aa8da6c39a9da287de', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:34:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e53c7da3802e422c8409fe540fb6b976', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:02:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e5f40365d1c947da85c9aa386b1730bb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:26:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e7f00f92cde74fd5b65f5484ababc65d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:02:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('eaca206dd6cd4326b79131b58ffebb28', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:14:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('eb2f9d54a9194a419afd0ff6ca6e7d73', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:01:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ed3d18879106435f893cff9173964c36', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:25:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ee867827fc2d46cb96b942dd8428c5d5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 14:42:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('efb6fe0a2677404aaa18560405ddd96a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:29:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f115bcd0a0f04d4d8648f1e6cc35419b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:17:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f411607ab3da4d7692d36ab175a6a9e8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:23:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f57f3ce986044ce4b78461200d7ab650', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:42:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f59117f41a594c52b13f135591dedeec', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:32:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f6c9b2725be248f4921b67e110ff9b38', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:35:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fa5a6158a5d5409b8449a7c0dc3ff7df', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 16:17:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fa6843821d2b45888b79b790291fd889', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:18:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fe71dfd2669746f1ab2eae587f5a87df', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 15:49:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ff268a589ddc404780b2b874d0aa08b8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-28 17:20:23', '', '1', '0:0:0:0:0:0:0:1');

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
INSERT INTO `w_user` VALUES ('905cbdcb8fc446babf6b5bfec3538a72', '1000', '1000', '测试', '18644444444', 'ca0ff6de06c338127e3cb9d9ed0e7bdefd19e0a0', '1', '四川省成都市', '1', '1', NULL, NULL, NULL, NULL, '3', NULL, NULL, '2018-11-27 17:24:39', NULL, NULL, NULL, NULL, NULL);
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
