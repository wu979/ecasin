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

 Date: 27/02/2019 08:45:26
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
INSERT INTO `w_job` VALUES ('11111111', '1000', '1000', '平台管理员2', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-12-29 14:20:55', NULL, NULL, '1', 'a1459e332d2943c6ab4faa5c04d2bde9');
INSERT INTO `w_job` VALUES ('403f7e439f75438788b6746b099e71ff', '10', '10.1', '后端工程师', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:20:10', NULL, NULL, '1', 'ae40e12d661e44da9d1baa884caec15b');
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
INSERT INTO `w_menu` VALUES ('2323232323232323', NULL, '菜单设置子', 'MENU_FFFFF', '/ddd/ffff', '39dbd2c3dbf040b7929823ea50d25bc4', 1, 0, 3, NULL, NULL, NULL, NULL, '1');
INSERT INTO `w_menu` VALUES ('2616b17fc3f347659594eef947d33471', NULL, '角色设置', 'MENU_ROLE', '/role/index', '8397433445af4659970698c3019ca2d0', 2, 0, 2, '430196a10298435a89e261cc9df9a437', '2019-01-03 09:32:49', NULL, NULL, '1');
INSERT INTO `w_menu` VALUES ('337b5b2753b1450db5a747fd4b260230', NULL, '首页', 'MENU_HOME', '/home/index', NULL, 1, 0, 1, '430196a10298435a89e261cc9df9a437', '2018-12-24 17:11:05', NULL, NULL, '1');
INSERT INTO `w_menu` VALUES ('39dbd2c3dbf040b7929823ea50d25bc4', NULL, '菜单设置', 'MENU_MENU', '/menu/index', '8397433445af4659970698c3019ca2d0', 1, 1, 2, '430196a10298435a89e261cc9df9a437', '2019-01-03 09:28:19', NULL, NULL, '1');
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
INSERT INTO `w_role` VALUES ('085fcc8451a348b8ab3e21723ccfd4bc', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '666', 'ROLE_201902211550731741', '430196a10298435a89e261cc9df9a437', '2019-02-21 14:49:01', '2019-02-22 14:31:29', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('0adc2d8ae1d645b9b464b6010ad896d9', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '999', 'ROLE_201902221550817345', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:35:45', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('16f63eb054eb40798f135779ecbfb149', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '3333', 'ROLE_201902221550816749', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:25:49', '2019-02-22 14:31:29', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('2833ebcfc3da4c55b036ca4c9fa363d6', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '666', 'ROLE_201902221550817327', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:35:27', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('29269ebeac54477bb6d269fe1d4af6ca', '1000', 'b56c6135a2d34db28a4227dd64425816', '所有权限', 'ROLE_ADMIN', '430196a10298435a89e261cc9df9a437', '2018-11-27 17:30:13', '2019-02-15 13:18:54', '430196a10298435a89e261cc9df9a437', '1');
INSERT INTO `w_role` VALUES ('299f6d00e73e4722b571007386bd016b', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '333', 'ROLE_201902211550731733', '430196a10298435a89e261cc9df9a437', '2019-02-21 14:48:53', '2019-02-22 14:31:36', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('2dd795f6de62477985acafae201e2076', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '默认平台管理员权限', 'ROLE_PING', '430196a10298435a89e261cc9df9a437', '2018-11-28 09:31:02', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('2faa4e71791a4f8390c45729ab063581', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '1111', 'ROLE_201902221550819320', '430196a10298435a89e261cc9df9a437', '2019-02-22 15:08:40', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('2fe27fc6281944b98015d9829ab45e09', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '111', 'ROLE_201902221550817312', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:35:12', '2019-02-22 15:48:54', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('35d5417c28dd4a18b9f4e7235c9704e2', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '5555', 'ROLE_201902221550816888', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:28:08', '2019-02-22 14:31:29', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('5490b0b956124cbea8dbf1b455c3f4ae', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '111', 'ROLE_201902211550731728', '430196a10298435a89e261cc9df9a437', '2019-02-21 14:48:48', '2019-02-22 14:31:36', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('65dfc472a93a4551a7df84e3d4860b2d', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '888', 'ROLE_201902221550817337', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:35:37', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('690df676bdf54eb5a7bd7f928352311a', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '6666', 'ROLE_201902221550817069', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:31:09', '2019-02-22 14:31:29', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('774df5eda23b43ba8902980141ff144f', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '777', 'ROLE_201902221550817334', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:35:34', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('83632f640d124485b5289493bd44ca4e', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '333', 'ROLE_201902221550817319', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:35:19', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('84221a3216134418b074a45063ab5d4a', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '555', 'ROLE_201902211550731739', '430196a10298435a89e261cc9df9a437', '2019-02-21 14:48:59', '2019-02-22 14:31:36', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('8767817cc85f400ebb4fc2fb4b6b3f7f', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '777', 'ROLE_201902221550816604', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:23:24', '2019-02-22 14:31:29', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('8d18bd91df4f4058baef8473811323f9', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '444', 'ROLE_201902221550817321', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:35:21', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('96b97810a294438ca566e510c589044c', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '888', 'ROLE_201902221550816607', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:23:27', '2019-02-22 14:31:29', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('996a8c2eb5ee4c508f77263d38c01c12', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '222', 'ROLE_201902221550817317', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:35:17', '2019-02-22 15:48:57', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('9afbdffcb9bc4e85925d7c971081e0d5', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '2222', 'ROLE_201902221550816697', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:24:57', '2019-02-22 14:31:29', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('a3970dda07c14f789d3e69827c85ce59', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '888', 'ROLE_201902211550731746', '430196a10298435a89e261cc9df9a437', '2019-02-21 14:49:06', '2019-02-22 14:21:22', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('aab870f643de47629d4f1f11615bfdef', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '444', 'ROLE_201902211550731736', '430196a10298435a89e261cc9df9a437', '2019-02-21 14:48:56', '2019-02-22 14:31:36', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('b25a03e2d78044e6a1c4a0032c0742c6', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '222', 'ROLE_201902211550731731', '430196a10298435a89e261cc9df9a437', '2019-02-21 14:48:51', '2019-02-22 14:31:36', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('b8a66f5cd0514fb0b4cf377eedc159e5', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '777', 'ROLE_201902211550731744', '430196a10298435a89e261cc9df9a437', '2019-02-21 14:49:04', '2019-02-22 14:21:24', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('cb5a0fc1d51c481c8f101eb95ab3663e', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '1111', 'ROLE_201902221550816638', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:23:58', '2019-02-22 14:31:29', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('cba5f0998f2d4b9ab309d3addf9e5441', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '555', 'ROLE_201902221550817324', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:35:24', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('cd13788c91ae494db6dc15f0a59136d6', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '232313', 'ROLE_201902221550821664', '430196a10298435a89e261cc9df9a437', '2019-02-22 15:47:44', '2019-02-25 16:08:08', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('dbe5ce2e4d654448bab8338762363596', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '999', 'ROLE_201902221550816610', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:23:30', '2019-02-22 14:31:29', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('dfaecc1efcda4751afdcb74eed32b552', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '999', 'ROLE_201902211550731748', '430196a10298435a89e261cc9df9a437', '2019-02-21 14:49:08', '2019-02-22 14:21:17', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('f1b948d70762490ca565ef4eccc15e32', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '4444', 'ROLE_201902221550816842', '430196a10298435a89e261cc9df9a437', '2019-02-22 14:27:22', '2019-02-22 14:31:29', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('fac692c5042f4b5d9b9c2a200588a8dc', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '平台管理员部分权限', 'ROLE_201902151550202289', '430196a10298435a89e261cc9df9a437', '2019-02-15 11:44:49', '2019-02-15 12:47:46', '430196a10298435a89e261cc9df9a437', '1');
INSERT INTO `w_role` VALUES ('fd41ccf846ed424d9f7b6de96b7a967f', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '55555', 'ROLE_201902221550821630', '430196a10298435a89e261cc9df9a437', '2019-02-22 15:47:10', '2019-02-25 16:08:08', '430196a10298435a89e261cc9df9a437', '0');
INSERT INTO `w_role` VALUES ('fd480fa4ce8c473d8d0e83b4534b2410', '1000', 'a1459e332d2943c6ab4faa5c04d2bde9', '232332323232', 'ROLE_201902221550821676', '430196a10298435a89e261cc9df9a437', '2019-02-22 15:47:56', '2019-02-25 16:08:08', '430196a10298435a89e261cc9df9a437', '0');

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
INSERT INTO `w_system_log` VALUES ('003005efb5bf40798981b735e4cf986e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:01:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0111383650b14156b623892a6cb32afe', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:02:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0129623b0c4041e9990eb86aeb89c480', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('01b8a94452aa4ff786629678cec74eb7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:40:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('01ebd970a6624b9992bd72ecbcc7e5ac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:40:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('024f26aac02c4dc89fec60ea2fa585ee', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:08:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0256cd3510824cd9a9385da4c1a0aa11', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('028299f4839b473b93b6a6b3c4e2141e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:44:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('02b327db7e464c199b1e8135f0c66f93', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:35:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('02d0092684614ef880a000cfa52911a6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('02f5c10a43a7445ca19735ef6434a075', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:48:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('035922ca186043d5a2f9902543f34ce1', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:47:10', 'roleName:55555;target:com.csd.system.role.po.Role@2266348d;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0438f5bb846d4d7faa8ee08306d58c18', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 15:34:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0446dd5840de44fd86176c70126be16d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:45:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('047f6ab34fb841fd8b823fd36b897341', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:41:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('048e999e234a485aa27a6293a4ad0fbb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:48:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('04cf3aee1602419fa26e31cd83a4bd2c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:01:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('05350f4550d4415a9666b731accc94c2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:43:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('053d0c0a0c8145f5b5d93c39691473cb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:36:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('05571d8897d14288963f78adc8afeaac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:31:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('05f16275da98485f9af39ac49e3f5410', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:11:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('05fc2651922b44a69a855990644f802a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:39:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0613237299f7431988c2f137ad7b65e2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:34:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('063383c7021249fab825ff3390b4d930', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:19:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0680a317e3c2485d830743c9908639b9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:13:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('069fdb9fd8334f7bb243e0cae37c25dd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:45:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('06adb60cb98b431a858a77d48888ca54', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:27', 'roleName:666;target:com.csd.system.role.po.Role@57db2f3e;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('06cffb9cc1e7481c841bb8b66cdf1828', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:28:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0770f2970b274feaaf9fb30d7858f8be', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:14:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('07fdb8ed9a544ba3b03e754db1cc3285', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:43:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('08210e210e73491180382fac96701aac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('08b326f067cd419f878a1f9d858ce966', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:41:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('090220c2e6c84ffab10a5b9c940f8058', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:26:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('09526821a5434d44a40acba9745e979b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('096cbdf4519741f1a22c1d6ddcc76149', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:11:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('09b8f925e58c41fdbc7d7f5476adb233', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:23:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('09eb17308f6e45fdaf769dce2d8cea21', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:23:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0a22dadb2c594ee7b0429fbc99f1009a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0a5c9fad48f54f78a51bbfe0787e6028', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:08:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0ab3fcf531884bac8d3f90034aa1baa4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0b957bb68ff04ea3897381d3e9717762', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:20:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0c37a56b5150461e87814ba0b307cdd8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:40:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0c5504fec1124b4ca44310253a57c8bd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:06:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0c64b402cf0f4106add2df8655e76fb0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:17:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0c68f222ef0143c0bd4e473433f5aef5', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0cfde3cc019a47bf991268fdcc97c4cd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:16:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0d07a8bd698249bf801153a11d2cf273', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:43:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0d6cfa64f4b946878317b8e075061544', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:47:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0db372bf931b44a39dd170729d686314', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:01:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0dd2bd29644c4a89a45bc7b19231e434', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:07:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0df8346379234b48920818ec19ca6a08', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:30:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0e02523585c343be8208cc9e865e9f03', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0e345e19f8824c58938b4aef09ef6d8e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:28:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0e7011350719479c8fbb38cdc2cf83de', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:41:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0e7ef87f4a754d3aa0cf22b9036531f6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:19:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0e9fb939f5f54b38bb163c1e964a5601', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:30:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0ebb2e7b0e204711aac7bd3c8a7e0b6a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:00:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0f16d400ac4e49819006e8a5c27fac73', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0f65e55e940a4362817b3b1bdf0f4754', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 16:08:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0f6d4235150846078269528a301ff5ef', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:45:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0fb5a331479148d393b721ffaa8f936c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:56:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0fd4b86d74b04e31a6eac695d09376fc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:21:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('0fe69bc7b79b45e6b6fe139cb5cbd51c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:18:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('10793309bd0a447a828ef5d73f1f8507', 'update', '修改角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:37:54', 'roleName:部分管理员新;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('11233a5ba393437fb6c0eb3f784456d5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:18:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('116c7b0b68c840b4aa1bbfcc293b485c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:51:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('11752b7b2e6345c392f2777142af754f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:30:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('11a318444d5a461884e9eedc1a03a51d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:13:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('11f5919b2eee4679b546c29d2ea7fd60', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:39:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('11faf1996e6148cab25849b36b3b51dc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:02:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('11fd0b345b0f4275a3ef675907a3444e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:04:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('12392664d7ca415cb130906c31a059f0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:45:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('131fc3d0a2d84f4a8031f115847bc590', 'update', '修改角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:44:54', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员新;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('133501da50134d0fbca322a825a01a43', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:05:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('135b41c6fe9049448e90921c37e1b5b2', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:21:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('139e10dfd907446abbca34c0c3278d2c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('141e5d5c38ae455bba8804744d6df79d', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:21:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('14613c0c06b841ab948bbbaeb7badf51', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1463aacb616e439eae6a21c845c7d8d0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:11:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1469b976faed43738201234bc90bb519', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:25:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('146e8e4c8bb14cf3a882c91fd2edd57c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('14be1724b3e149c6a24793913e78120f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('15261afe3f1e4431917ed44d424ff126', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:30:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1584cbb90ef74f7ab5a28a1268a59486', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:22:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('15e3d5339eae4e13be0c3f69a95c03a8', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:25:49', 'roleName:3333;target:com.csd.system.role.po.Role@33917c53;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('15ed047e17d3496b94785b2771eed73a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:25:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('15f8dbff44ab402494c07a8d629e7154', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:45:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('16154c45fd7e4b96ad7783300ab09be3', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:12', 'roleName:111;target:com.csd.system.role.po.Role@64422668;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('161a50551042454eade36a487e79834d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:25:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('166afb6d1fd84df2af17e6f3ca21903b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:45:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1728b541f01e4798b9d17633dd9a6bf1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:48:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1872869646754b0ab54eb199d6de057d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:47:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('18b1e1665c484d7ea26a9601ff3bf42c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('19aa4698a87c46daaaf80a4174b92006', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:22:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('19dfcde7f2fa46ee9658efe7c4e65afe', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:20:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('19e23e1cf82f4ea3a101f72e72de9c28', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:48:25', 'roleName:部门管理员3;target:com.csd.system.role.po.Role@3ed886c3;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1a02dc754a874cd686334c1895223514', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:30:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1a18da63f0f34d7cb6a636689288fbf4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1a42a8c4caef40cc9ba4027f23c4201f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:38:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1a55f6d47c5242a4885fb279a5e34199', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1a88404a1adf4c95ae250b96c8ef9ce1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:00:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1acfaead454f442886dea8f05fd5e51b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:59:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1ad27cefbcc74a66ac0259e3e574d5c3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:57:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1af573fa89b34bf3835c1a09c1ecf355', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:27:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1b333333938446099f4a99d08ca9dca7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:45:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1b9334191d5144f5b0ff37f06a026436', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:39:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1c2327f1db9c49209a837c4caa18331f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:00:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1c4b4c66c17b4938811f9c924995c6fb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:02:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1cc694ee27864108a9d28412964a725d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:32:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1d089b3008ed4d0f94fb963e0184d025', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:30:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1daa6ffc31224b1cbb456dfeff41b7d7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:10:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1daecfa0a73c47dc85700c1a216556a5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:43:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1db099aeb4b5407f92cc690e22707250', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:01:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1df1ceec37f04bb280352871b30521a3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:27:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1e2551964f984309b15a8d6e22ff2225', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:01:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1e594a853cb34936bca76fb75fefdf46', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1e5f7bc7b3e64f4495e136a5ca3f3384', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:00:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1e70401057284b41a25102c6e8dd810c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:05:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1e9092a088b9471481308d9d8c8c6231', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:59:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1ebfd048a23740699a7988deb5e1e102', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:32:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1f48ce8663bd498caed1f67e6544d3f3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:50:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1f6d8149d4504dedb4126132b80e89b8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:28:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('1fce3758ee444a59a457612f2b91cf22', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:45:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('20b30b1cc0b74236b8759fda4dfe8300', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:41:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('210580c2f37d41d59c93b6e4fe8c7e42', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:02:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('21c8a0c9e0944fe08162a85d777a1705', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:13:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('21e4973a2e734b8eb760d70e3c58b2c5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:50:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('21f74c8ac5704de584118fa2a62c6f9c', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:31:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('225d79896cd4474ba604068045211510', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:16:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('22cb23e060984b18b423fdfb19db1f1e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('22eaa91ee4b04af59ebb962973b6b14e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:45:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('233d9d2730604b2fa67ab03cf68dd972', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:27:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('234a9f36d4c84209915714937395701f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:40:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('23f30639b6fa4687a40a11346371a33c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:35:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('23f49e29ae014fd7a4fa4d05b6c32aa2', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:48:19', 'roleName:部门管理员1;target:com.csd.system.role.po.Role@7416bcf2;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2410f5e0b6764665b3c47a8f585c0118', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:41:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('242da9b26d55464bade85add299c3a44', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:13:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('242e9e27eb894ee8a1bac3c8120f83a0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:43:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2449e08ba31e4fa2a9135ff9f045644c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:41:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('24dba39db3424cff9cf933d6630a923c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('24dfb8ca400249b79117b19eed8b6082', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('24fe4d563ca24260b9d3979c02cf0e1f', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:48:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2502fda343c74a4097394a4a59b7a033', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:59:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('251c677ac72145a6b26d53903ab5ead0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:59:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2573e8957521429290767a5667bc9e9b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:09:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('264588bb8f5347738d8a3581e8b8ba0c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:40:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('26643e85b86a4fa294ebd4f093debcad', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:59:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('26983978e7464f9883b43511d8d17450', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('26f81876295e4753b8f90b3c6bb1cd07', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:27:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('271d75b6fe7c41cabc03acb579e2706c', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('273b706678e84e01a41e5b0efe8f0c6f', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:31:09', 'roleName:6666;target:com.csd.system.role.po.Role@197c1284;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2800dc724dad4716a40ee07984d9aa43', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:21:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('280258bccf8a4713984506424264b601', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:56:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2836b4e3c2ae47b1a5092e6853953d1f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:08:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('283d2b96c07640b683bd68671d89f6a7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:23:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('288d8c93fa094debbd8590d5018c2d9e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:41:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('28b72c3fa91242ed948a88fe39c044eb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:00:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('28d833e705ad4cafac1d1ac1a774f220', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:40:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('29474ed4fb1e4f0495c6e6bf69e650fc', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:15:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('295b2288a9144bada3fba1c31db0503f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:43:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('295fe91cff7b43e4a56b6171bdb8f7e5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:56:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('298fff78c9474700971d8c926ac9424e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:37:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('29e78b6c39664145a362319cff997803', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:40:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2a0b51fe71304983a05344f2ff5e3841', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:27:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2a52183eb69b4296a5465064d7efbee7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:56:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2adc9691b22148aa8db3b35f3387f394', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:15:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2b2aac4a595547878dd6729c5d688254', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2b53fd60eff64bd2806f68cf96a48852', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 10:00:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2b59931d0a33483dbcb6c21a8ac3b10d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:23:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2c81620337e24183acf0d25089dae72c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:26:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2cba1a1ab4484b04b0c0ca9fe793a0d2', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:02:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2db540ef04d4433cbe6b4ae795d02549', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:14:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2e50f5427b18450e86351b7c45ba9cca', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 10:04:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2f0c374ee59f48ae99e2740f7a43d8bc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:43:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2f2629ffd6194341819af64a7ec4e0a7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2f7d5d0075c544d6a955ac6d03e8a813', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2fb69db4defd4ee3af87f6cf7b6c9b24', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:52:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('2fefdf2387f942a8b16ee0ea2fa957ba', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:31:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('301cbab894944495b63fe11dfd82a3d7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3068515a9d5a4e50b5ba3ec706cf28fd', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:23:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('30af3e95f18a42be8faf37f67d100ce7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('31d3853c5fa64c4c9e224129613e3729', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:12:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('31f3b61eeebe4a04b8bd3fdb121e1324', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:01:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('325436cdde814dbb83a8da263c02bf9b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:58:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3274c2db8b4c4fd790b17160fb7f2a70', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:43:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3285d18848414738b95b95fd68ffaf84', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:21:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('32d6b5daae544746bfdc049969137b59', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:37:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('32ecb20d88fc438dad93e8de6b827df4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:38:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3313084c0f834b2dada4358fd536d000', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:22:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('333436c9b95b4d1dade03ccf1f5b6ba6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:33:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3334b435b1fd45e08e9211cace7c8277', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('344e60b0c23a4d41ba911338d9088ca2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:59:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('34b0585d6e8f4d76af1ed69f2eef72a1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:22:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('34b0c4264abb4005b52880b4d483c433', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:01:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('353bfcb904a74421b59933d1eee7584d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:03:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3560e41c71c441ceaba820cbc8b647cd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:10:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('35884a4591cc4871bcfb1a72ed2fad9f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:08:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('35f9f00d258f46f48cfa541899bc9081', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 16:41:40', 'target:com.csd.system.role.po.Role@16ea15ef;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('360e2eac91664d06826b5e481d4adbd7', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:48:56', 'roleName:444;target:com.csd.system.role.po.Role@36119d94;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('362814f540e14bf99217933174a4c231', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:44:50', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员新;target:com.csd.system.role.po.Role@4d146043;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('363be24b58064204a194f8acf6d0da85', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:29:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('365d22d36d8a4506ae1f03ca0fe72c85', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:19:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('368b4c958d444e0dba6f959b76547d0b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:47:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('371d6615cc944123a8182fd5b17ff7ac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:42:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('37d4c212e03d4db89d26ecbcf4dc142a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:05:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('38b9c9f4322441cf957c8da0810f64e5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:23:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('38eb1257525d4bf0b73d7a217690a77f', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:28:08', 'roleName:5555;target:com.csd.system.role.po.Role@12d87cee;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('392ed0000ac44ed6b6fabd976273d2e7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:26:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3940ccc47bd44848aaeb2e738daf5f9a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:59:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3956b246544548beb433a02c2b6c6472', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:49:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('39b84d2b0f6a4a83a5c547928da2a72c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:27:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('39cbf5931a79474bb75501e478ffaadf', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:19:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('39f76e2c59b14cd78240a1f1c7ee22d2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:45:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3a0602ddc9af4e9fb76816a0992ace02', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:23:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3a09e6a92f014e4f95c8e9413812d248', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:09:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3a382b8372b5405fa83e4c6948044f5a', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:23:30', 'roleName:999;target:com.csd.system.role.po.Role@727cb30c;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3aa95a708ca146c2bfc4aa295508566e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:28:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3ab52c091d7641e5a24c45a7434c8d35', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:22:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3b502c5c22cc437d8c7bfd5d59fdf516', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3bfcc856dd1446569fbbd50ad71c83e3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:04:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3c167628dde144d19e4f6bc9a73f271e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:04:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3c254c87471740178ba833ce6a1fcbe8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:40:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3c92ba4d720b460bbe6976aa55c862f5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:11:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3c9bb24d6e1540168ee97f2f0ade2d27', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:18:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3cbbf1ac88ee4446b0e68572f98636b3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:05:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3cbd23733f09411a863885e8c481e3ec', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:19:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3cf7782d3349496e81bd1fea22e49b03', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:09:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3dc5f8a876c045129025d6f0a723c8e1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:04:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3dcd518015264c96a67b74d395bd90cc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:05:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3def9011b42747b197f7b44a66dfc3bb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3e14b48bf2804eea83f815ab5234de75', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:16:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3e1a6744375c40908aa1b2a39883c5ee', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:25:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3e3adb9998ac4849af373195ceb88e6b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:14:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3e3cc40595864503b968676201cb7696', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:28:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3f9e19cfb2d64717984cf96f3654b124', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:47:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3fe2826036eb4a28b7fb782af8a950e3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:23:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3ff5b1c7ce664a31829f96371ba64aac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:45:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3fff0b9329f94af89375a9e26cf8b18e', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:21:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('405224e64df74651b11fea28d33990a0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:30:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('40c90858be344c5d8c6c240049254f3c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:10:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('40e65317b0314dd592d0e07665bb5506', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:40:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4161428ffefb467faa3ac0f7c1c4d03c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:08:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('416cc00a190a4d59a12c82d7077688f5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:19:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('417ec7ce1ef547669fed53a556ceff2b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:59:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('419aeb4f56354f87b82dbcca47b7a9ca', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:29:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('41dc817705024e14bf041b0a93606246', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:47:43', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员;target:com.csd.system.role.po.Role@67dda7a3;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('420f1c2d9fd248debf34fcd64d0611e4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:01:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('426dc340800c49cead16db99420dc36a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:16:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('42a7f25dc6a44a87bc6bb0ba83bc6186', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('42c3f119f05741b0a8aa676857dd5617', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:02:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('42cf93c0d4f84ed99a5679ba60da66f0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('42e8f567045340af9e0229d0c54ed8d6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:10:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('430b5069272e4b058219daeb6cdc8981', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 16:35:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('439b8415a2a5406f9fd320a7e46f120d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('441d1a3a7bae4eef842544be31e6b449', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:52:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('442fe3c1aa294e79b142c47b820abf6c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:41:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('447a492560cb4465914025ad138faf4b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:11:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('448cbaf8edca4e349dc0ee65ee181b30', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:39:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4502b6729fe640fdbac408d5e8d9182c', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('451b87ab3fcf4ef6a48c1a5f589353c2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('452efe25f3a44311807ab66dd00c0a03', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:59:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('453e56952d39417d903b0f795bdd176d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:11:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('457b8fcf92ca4207bf14e85e48dca068', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:35:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('45e0ff96735b4ba59468c3b6170b25c4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('46061c32bc2f4a6b9cc1f227116ab878', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:57:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('46130c5260df4a05a65257fafe2803b2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:17:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('46601d8838154e658bcee9dc210a14eb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:27:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('46affe5c18684193aa09962254d1c29a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:08:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('473c9bc4dfc14020aba0802e6f859b62', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:47:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('475ab67a5a334bdfbbbe4c1c70c3239d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('47f6c41c83a34e1cb90fb109098e9486', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:49:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('482735f685d047469092eee51827dfd8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('483ccb431daf4c67a2ab8584849667a7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:45:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4843a2062eef4ad18aa20f230e9d4ef5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:15:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('48625040009c4120afce237f4af6d15f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:35:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('48834190f5fe4541bd69955ec6abe056', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('48cf7c43cd104474a3def97c58b45104', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:20:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('48d21ad6c6fc4683a50928de2d04791f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('491dc99d1d134837b4fef01c7da6bbe0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:18:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4930f355a57e49ce89a7c82cf87ea4d0', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:20:43', 'roleName:平台管理员部分;target:com.csd.system.role.po.Role@347f7141;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('496d5098705a40d1b865b79f24c2fa1b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:57:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4995fa9af3bb43f7a7f32528cfde709a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:40:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('49a6f1957a5c4f42b032ad95c47a2f8e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:42:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4a0b2307233c4f26a331cde18d3e3059', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:43:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4a837a75bebb4e6d9f1f8b28e8a8eb51', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:01:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4abb84e8316044539b9b46f997b615c6', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4b82aac38b4a4b5fbc8801badcf2f22f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:48:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4c11115254e54d019f65d886484c6898', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:08:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4cfb7ba3c9054475b921afe6f106cf88', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:27:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4d165f5f0d2841e2bd3a8bc5c72b74f2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:28:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4d2537f7e737490db0a8aaa0f2d986d6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:48:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4d8067876db94279847d6795e2254ba6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:03:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4db4e6f568d04f5484e8041d0269dc6e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:11:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4dc70dbae1d643d5a88d400f651e4adc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:41:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4e31de9e455641188456cd0e7c7fc272', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:11:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4e51eab8e25c4731be0944ad52fdcb36', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:28:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4e73327d4bcf49358250738697c06063', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:53:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4e8181d9e57942aa9514193022ad0b10', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:49', 'roleName:部分管理员4;target:com.csd.system.role.po.Role@2f045487;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4eae8be935274cccb6e471d46755f28c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4eb62a0db153459280ca30f7a500e5f1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:14:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4f2791701f744372a7f7a7abeca12a0c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:31:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4f36e15e41e94f0d9389ccdcfe7150fa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:36:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4f5be6178169464eae08e184b06ccae4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:01:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4f729c64aff749038720195d92d09b7f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:41:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4fccc497898d4b91a7409d737a876d8e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:49:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('4fcd73670f2f49fdaa20dafd401e6ada', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:45:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('504e2fe2fa4445e481d066484671fea0', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:55:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5065ecf2bbea4386bdea6499ca800858', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:13:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5085936c86f84fdaa10b9be15cc231da', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:19:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('509ae5fc084c4bd1ae1c5a4dbaaa22d7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:27:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5136f3e9a5c24e21ab4f4ff814d89526', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:37:47', 'roleName:部分管理员新;target:com.csd.system.role.po.Role@3d02f0b5;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5173e1c3551d4411826cebc92ad0bb8d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:41:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('51c098b7bcc54aa3b1272107d7a6d8ec', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:25:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('51d82cfc8a1846f38d581f4f2e51ab82', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:01:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('521f03a354a841218d65a25798f3fc56', 'save', '新增角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:19:40', 'roleName:平台管理员部分;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5252bee9e2f74f49860a183b774ec249', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:27:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('52755a7a137042818a51ac07bab3d9a1', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:48:53', 'roleName:333;target:com.csd.system.role.po.Role@50338b74;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('52934cdf3e744eee962ea35910a30462', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('52a8c9581f704f8593731f05eedabe0a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:25:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('531456224b4f4e009d81500184dbbdc6', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:49:06', 'roleName:888;target:com.csd.system.role.po.Role@1f0a10cb;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('532a00328fe940caa3374f29e0f2160e', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:48:51', 'roleName:222;target:com.csd.system.role.po.Role@4c546688;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('538d8657d0254563bb21d487bc3e388d', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:27:22', 'roleName:4444;target:com.csd.system.role.po.Role@417ec693;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('539e2144603c4d11bfb8db4c1af7b783', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:19:23', 'roleName:平台管理员部分;target:com.csd.system.role.po.Role@23cec6a2;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('53c1ab4c4ee44bda800bdfcfedf07aff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:40:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5415db0592c4418a8bd9e28b2745873f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:24:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5462c69bb0c745d198df438146fd3c0b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:01:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('549d72cb2c134f3097d890dc4f8f82ff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:42:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('54ce008a89764dd59c7620b31cf11c73', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:59:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('54f6c01ea8974282ab2c1ce365aaef48', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:36:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('551ad1c276fc4169aba115a571ab06e4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:15:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('551fbec620c749d9975700ee605e03b8', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:17', 'roleName:222;target:com.csd.system.role.po.Role@57f9d435;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('561cb14bd10e4cbdbdac9f8b89cd08e8', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-14 16:46:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5660108a613344dd9bf7701a418cccb3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:21:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('56a2dcf9e04445ef8abf699efe359f8f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('56b16e2030594909a916456619332a94', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:53:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('572738da4fcd4e30ab1e98932cede376', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:06:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('57301ca2fe324a30ae12a72ec14f2114', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 15:51:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('573248af1bcf4b5dab110845719f8607', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:30:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('578a89abbc1644baa9f6b0cb7b267561', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:10:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5791c189d2bf4ee68a5fae58a506c1b8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:24:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('581307c1890842d4a6b478d388926dbc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:53:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('586673f504774b71b75b4442de487994', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:27:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('58a0683986504bf6965dc1504fddc50a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('59195e438ffe4ca483fc8076f4337602', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5929b9589786407ebdcf4cc7c32c3664', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:11:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('59812bb2099043038105fe6f1db0c202', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:05:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('59e8a4b1217f4a3f90a02e34026c46dc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:47:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5a15a03ae82d46ca80d3e71d2a19ec82', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:19:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5b12e464ffd346c6a7a356d960987512', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:11:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5b366bc2b1324e6692eaa0febaa0df10', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:30:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5b3ba04eb9044499b1e601c31e201aa6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5b598b1c8a3e4c4caa437116a4f3b187', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:07:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5b9569a37de04301a998f3ff54bce15d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5bdfd4ef060d43ee9ce670beb12742d1', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5bf1e6d4fa784c50b91ac9b47feaf6f0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:32:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5c30758532364bda9a65c2a19a9cc136', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5c7c0f748ede46e999af462c2e3e6769', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:49:08', 'roleName:999;target:com.csd.system.role.po.Role@b0d4be2;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5c7d5859e6494856b378bd6050609325', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:23:58', 'roleName:1111;target:com.csd.system.role.po.Role@39c21822;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5d5e29eee60e44b0b6efef571396fbe3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:07:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5d8d4676b5534c92b9a330a55f835cd3', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:45', 'roleName:999;target:com.csd.system.role.po.Role@1f52648b;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5dbd35aab4d14e75b9b48ef8b07678bd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:31:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5e19937950df4ce1a737c07dad7a051f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:46:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5e8016cf07564b63b9c7e2b4c9496996', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:31:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5e83ff531de04bd682bb6797360e51d3', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:47:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5ec96884884248a1a7495121bcc966d6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5f0c125b99a04a7e8830ca6cf428c44f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:00:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('5f1000fbdd514207b95121e4ae04902c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:00:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6031e7bdc6284a668284b182c3b440c8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6054cd0c3d1b479b92a589b4dea039fa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:32:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6067aaa5031a4a0fa2c60735db2ec6e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:32:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('60c1decd84994c39976517baea093edb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('60c5bb309bbf459cabc196eb8877b155', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:33:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('60d178e898554f86ba8196d65501b2e5', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:24:57', 'roleName:2222;target:com.csd.system.role.po.Role@38d2d138;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6100ce5b9f224365a7b679e397bfec3f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:42:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('610c03a2098c4ddfa403186e8261059d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('614d323cda944302874cfa9525a3eef4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:35:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6150a16429b644f0b4d9ab77dda5ff39', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:44:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('615b7af8ef184a359b18b65da7f61a3e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('61cd729861cd4b97bd2a162369c5b1d1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:40:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('620ec9a4e2da4a3db6700b87047c199c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:08:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6280dba025a04bf680f3e9be3262e689', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 15:57:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('62ac3327b1eb44179da46fa85a8c4613', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:42:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('630a748d0bf84fb9bf46692ee2109ded', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('63179b6d55074f8ab9654c682aa3edba', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:26:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('637ba358c23f43c19b939c47d2f39baa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('640304735dac4970b704522af2cd02a0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:37:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6449fe780bce4e4592e27e648bb86afd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:48:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('64a5f7dadfe24d0d918cef24a96cbeff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('64ab90103e5747df9ff8c02562f4bbc8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:07:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('651c5f66cc6742a48fb1e0f8bdb8d970', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:03:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('65a91e1f71524a348b3c8bb0f7d061c1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:27:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('65b6692318ad43808b1931cfbb6485d8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:09:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('666684d29fd540cc9931b20f756cb22b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:19:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('667b1094f6f144f5ae678782068894d7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:03:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('66b098cbfedc45d7988aeb1a8648ba12', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('67d4a1122105421589b97022311e5fac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:24:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('68000d32cd334899b78aeccb982065d6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6844c5c7621a420b95de32259ffefd0c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:51:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('68adebeee2024f39b70c1d061ab03956', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:02:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('68af250cd7734160aa73a3cb62c62a91', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('68be161598784fb688c8fe96c2243eca', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:48:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('68d02b1fc36c4d5d88890d2af8db25b9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:59:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6960370d24fb45c7859be26d4d9559fd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:56:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('697aa4ff63ab4e47b5c54aef42a48644', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6a026c08aba048f2a7fef0d945a1294f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:48:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6a84005a431a49b6b2fd238792b70741', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:35:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6aef81e037254bcd9966cdb3fab3148c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6af4cff434c14318a82640e43b704737', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:41:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6b05962679554dfab09793be4c9dea93', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:34:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6b15ac0ba9ec42a3a57826be8fb0e7a2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:46:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6b60a5567f0d4c1db5175be78074b31e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:03:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6b8322b9563a45b1aa7ed7fe8530e534', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:41:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6b9bd2c35dcc44b9bf14eab0da21868d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:20:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6bedc72fb8d049f491b37fd7cb86d206', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:10:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6bf2d60414f548479333152be12b23ed', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:14:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6c799eb76a2942b5a79d04a706a4374f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6c88af5552ca4db99bc504ee18c57ad4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:05:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6ca444b2aa4741998eea023b39699b50', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6cc868d0e4ff45e3b86149759eb7a6c2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:24:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6d3887e8ca4b41f19743309c601d4bee', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:20:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6dffdb61a55a4e52bb27a096c1918f4f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:54:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6e42830481cb4dcba4623ee690b948b0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:01:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6e63087b77624491b295a3b101805696', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6e974c886db843aa94c12df4e1fa3463', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:14:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6edf0ced11504c739c9cce8b885fe022', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:19:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6f3548a22d0848e38838ccde32d1bd9e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:28:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6f65e1ff0c924bf7aeecf4d6c4d31ec6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:39:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6fc17821da5142eda50f0a6a10e9fb0e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:56:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6fc690b8a2704c65829fcf57fc64780f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:49:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('6ff4cdb299aa44a397e0fe17d5fe4c1f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:56:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('709e4ac3c66347b6bd0031f2d9d61487', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:05:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('70a079789ef548579678729f7fe5fd30', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:09:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('70bfe5f7c3074ea2b06097b847e623e2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:47:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('70f97646a0b84f3aa89833edc8326db8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:53:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('714c5a49853a4e8291980533b6ccd926', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:11:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('716f55aa11f141b4b14bebc4ca7a2fe3', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:23:24', 'roleName:777;target:com.csd.system.role.po.Role@507561d4;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('72195d572faf422bb79c9fb71688e6ee', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:44:21', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员新;target:com.csd.system.role.po.Role@5382bffb;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('723f66d69b3740898d7949ffbfb669c8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:40:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('726ccccd8fb54e6a8e52c63495275c61', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:16:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7322c1bfb4164ae0bd79f8ebb67ab8ab', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:56:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('732a3ff5b47747ecbccec99c380554c5', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:49:04', 'roleName:777;target:com.csd.system.role.po.Role@1e708182;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('748b98f0f46340ad94eb1175eca365b5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:16:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74991a6598f64fb19822b83ae294b542', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74a2ff1b0f8a4af3b083e5e5b44b6ea2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:36:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74b1ee78fc944427bd37ec7bcd27b568', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:54:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74d7e05bfb69414b8a7fa3440e6d4e7e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:22:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74de3d6633804a528b0c533705c1f82a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:29:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74e1ce0609284800a1ac4b2732825bcc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:21:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74e8c8e726d94a7f880b7e9e4517116c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:06:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74f366cca3ba49f092166d59c111d6f2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:33:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('74fb18ae022a4b3ca8ad4ae9b54c0610', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:35:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('759e7d5409ee45df9ea0f46a689bf9ec', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:59:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('75f49a9fc67b448f8e94504a705ffece', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:48:13', 'target:com.csd.system.role.po.Role@732f2925;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('76bab3b58955450ca1f34ee9e257c461', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:17:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('76cafe1b2f664929a54d0abb375694af', 'update', '修改角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:44:26', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员新;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('76e8c24e0ed64cfd8332fd4c4dd017ff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:22:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('77d850570ecf4250a73ce57f4ce6c235', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:42:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('77fa4385c94644eea3e0d9434a6163fd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:35:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('783f7c6a34b6444f800e2c5ba85473f3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:10:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('785e9edf0abd4529a44cd54a8445ea20', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:30:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('786a0cde58004be1b0fcd6c576a001f9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:12:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7870910f59d54348a1a5a0425c6a8f22', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:25:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('78d14a55f980458ab99cb0d7f175da3b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:40:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('78dbe2ad3f554fdca28cb6434aeb09a0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:07:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('78f5ce26b0fb49749e25264edf4785b6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:41:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('78ff1fba96b64eb49ac7e8002c2fb853', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:44:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('79226d16c4b04733acff1bbb850586b5', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:48:22', 'roleName:部门管理员2;target:com.csd.system.role.po.Role@7affc00e;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('79266d24fc2e44579f870aaf56954269', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:19:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('794f8bff23684b3381967a265f378e77', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:41:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7989004568904089bb0bb9f44a53e872', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:40:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('79904a643f70455087bdfb441754cdf6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:25:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7a0877c8079444e79262aa90b83dafa7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:31:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7a2469a5251e43578e97d75ee8ab171e', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:29', 'roleName:部分管理员1;target:com.csd.system.role.po.Role@61ae362c;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7a25c47aad494cd8ba86345fcb14ee97', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:41:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7a4deb493e254195903fc11254da4fba', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:03:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7a4e6de8ea6b4eec8e6c0ce06e2c878a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:33:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7a6f6da7ef9946598cb05b49feb464a8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:56:36', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7b6921b1ad8f4fac8d06e8dc4bff663a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:24:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7b6e1ca28cf942158fa14ae85414bf1b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:20:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7b81b7e193164989ae3dc89663042dff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:03:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7bb69a1e8795413eb0474428dba6251d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:04:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7bef6b7b1d49405999cc8008d25110f3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:59:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7c2a9c8b35a941eea9698b99acea6496', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7d3f7f23de9947a8a44b55d876b56fcb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:06:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7d5bce0e92b74d23be840105c99997ff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7d65b9c587b1415887ff9dc25184c92e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:55:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7da1e4f5482340e2bc9e994399bb7469', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:42:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7e6d177bec0c4f4388096cd7cceb67a2', 'save', '新增角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:18:43', 'roleName:平台管理员部分;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7e731b77e59c45c8a7b9d26f8469a41c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:01:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7ee1332f5cda49a4829ae66933c798a9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:37:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7efd9c3e19ad4384a6958307a11a4b04', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:41:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7f93f83897d04d078764599e17cbee40', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7fd9a12f0ae14fcd9285d7dd11bdd0bc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('7feec3c2369042d59ddd206166e1b1b1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:08:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8034e32535794be1aef6d068fa8fbefe', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:57:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('805e538bf50b47589a79ba182107cf40', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:38:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('808225bc9c8d4424ade6cd70dc401e3d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:07:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('810388e2c2b848dbba94ed74be1c77d9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:02:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('812b07178fb349398d6135d19170ff0f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:33:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('816a59b695be41c9b22e1f4b324c9049', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:24:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('817f66ca71364540b3a4810a943d7490', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:07:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('818ce6c7689c44b98b99e55768b72859', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 15:33:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('819df3af70cb4ced81f102ed64c71e6d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:33:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('81d4c7f845504d2aabc8a521b313e441', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:07:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('82a7e1047b5341968fa905d10088d5dd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:46:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('82a92130f8624ed3b9c3c2d8caf12937', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:19:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('82e96d3087c043c984ea8612644a9ebd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 15:50:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('82f0e4c51de94eb59fdff905eb66fa30', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('83972b71e1c84679bb0f73760c6b937a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:32:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('83ab813013c745559cfac5801e2903fa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:35:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('83da8b9c8a504441982c23f12a01fee3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:30:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('83de34b503c44a46a85e0555477ed193', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:45:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('846e61f03f6d4b97b046602504d99173', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:24:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('846eaa41d88f48f2a20508ab389c1eda', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:18:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('849e6d47187949f8b5424023e24e9b99', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('84f79bfe52034a8abfd3e4cb7c54515b', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:44:44', 'roleName:部分管理员;target:com.csd.system.role.po.Role@2467319f;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('85174491a1ad4195a19d4cc9a5c835ec', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:23:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8565a8ea05694eb6b4ff8f1033dfb7a1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:10:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8573ce89d0bd4a558f66dbec35c3cb83', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:27:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8621f523053d44e98a0d67cbfaedc919', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:12:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8635c5e26d9a4c68b983d98fc660dceb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:11:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8676bb0befe44780aaa61eb7691d9036', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8680ac9724de4735a9c179850eac5ab9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:50:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('868c2fe0df3b40c6bc5017fe579a6b15', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:53:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('86c4c53add7449b19ff7970899ed1f99', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:59:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('86d76ff91acf40d78c8c9e7a771e66ba', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:33:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('871f09c48cea4b6ca88cc2d4b5cb885e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:33:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8739e2cb3bae4ba784c45247b76abd05', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:45:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('873c8862203a481aabd77989db6f4165', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:57:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('878672a8f4ef46aaabd6fb1c8cf2c45b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:14:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('87b9dc311b054505983457abda555579', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:54:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8801181e995f4dac9fa673706dcffc71', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:17:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('882ff175b36a4411b04d43a7ced34d38', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:11:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('886d018eb66843c6a9ee4a449ede381c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:00:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('88aea16be0b242779a7c921b9da04156', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:18:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('88d637adbc594c14a6284ecb6bbe6f40', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:10:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8900c14c97e445f693727dbeb74b2ab2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:20:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('892a8f17d1db4e67ac48de0c3fd7219c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:59:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89b26c8c56054915a58dda1f2655f64c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:35:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89bb274e725a463385aa17b93e026321', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:07:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89d13bda8fbc44c7b4d3b99cbadfc64f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:27:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89df0f1def7a4569a53163816c7a2503', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:07:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89f164755e684561bd2d6f4813f1bc40', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:42:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89f8e2cecce14a1c98b527c57c784437', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:43:12', 'roleName:部分管理员;target:com.csd.system.role.po.Role@2e3e6ac6;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('89fd51669744486093543d84182a7c5d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8adfd8f9f1f4428b90fa799cc40bb61e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8af380e8898549ab814850a94cce4911', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:56:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8af6e21988a048ecbacf39f2dfd5f43f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:24:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8b2eb0c41fd442c89f914e504fcda680', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:20:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8b3cc2b704ee4136b3308cddf95b8403', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:40:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8b5ed44605654c248505259b58840f60', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:49:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8b9fed6290754f058f2213e7d258351c', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8c45a92927204c7e95309b928662197e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:15:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8cfa2c2969594c04a4b21eb9205f46c3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:53:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8d043a648d434834b98fc46c0934fae3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:40:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8d70bc4c93394f5a85cf4b6b7911067a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8eaedcada6c345a5a4759d006f024972', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:00:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8f39f9f4561a457f824f00ef44b01926', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:33:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8fcd20cfc94d4831971a01ff547634e0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:59:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8fe8b87c92554880b67a226a7fb0c6c2', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8ff70ccc804d42848a535e22657b55ae', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:56:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('909df5dca2604bb0b300e4a4048a57b1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:23:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('90f4edfc9dfa40a79f2bbf0d5d9c8e39', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:28:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('90f671b2a57f4a4cbc4ed6a7108ec9c8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:56:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9158ac98078f4d36806c0bb85131e89e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:53:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9174bf08f3404900a8bf2dac3b0a32bb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('91f9a801d41942259c58d7b8d8979a18', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:26:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('91fa735674244ddbbea865b88e5461d9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:03:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('920eddbed32144fcb5bbaf4b57429f55', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 10:05:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('921568e7e78840ad81271a39369c7bc6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:04:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('923505e7fcc7475b801822268d82adc6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:01:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9239c161b25240e5a7948060732754de', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:52:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('92ada92ef0f54fed9a32f333891a7ddf', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:12:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('92c35d3a0d0543d6a542f09795301eff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:30:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9302c0fec5294e3ebcf14be3cca8171b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:46:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('93de3f262c8848c49f5e172cd239e73d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:42:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('93fe04b0825849cfb2c51143164928e4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:45:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('944b13e24262494a86627b8eb1fb3528', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('94cef999e8d24ad19909a69cca51f7a1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:03:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('953b72066b9741d29d70af0c91752611', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('955ad81b29ff4616bf20c3ea9acd5682', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:08:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('962f5ed9825d4e2da829493983bef449', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:45:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('964dd8d5c58c467288f5183952f8ce8f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:24:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('96670c5e5d62451c9ea5d725c6e72357', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:44:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9677f842f6954e03a1886c6bc48fcce6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:40:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('96c7c59b52724509b29016f31a700c56', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:01:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('96fd51e8e6974029b621d8e46f4e98fe', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:11:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('97375307405b417380b92ca9738b3b38', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:24:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('97ba9c98edce4d1faea74b686a7201ed', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:48:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('97fa4575ee754b9c854d0903a2800d28', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:52:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9818df9810274d7eb862c38e9a202cac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9832d5ff0b5246359f55b72e27e2e838', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:30:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('988c9df6c8094c2aafcb45218e848217', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:07:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('98be9f54bc214723a6df2999ef1351e4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:40:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('98ca154f387b4ea0bbac1b46bbdd4353', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:39', 'roleName:部分管理员3;target:com.csd.system.role.po.Role@793b75eb;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('99212a078b09443a87d2c151214617fc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('994559505eb74774a61aa31ecb5bcef8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:21:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('99e3fc02f33f45b4b427c04dfdd8998f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:47:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9a01d52595e3499bad45b82de47b8043', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9a90566ee95e44dabbff9eff47379405', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:29:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9b1529271b7a44eaa453c09edf68c2bc', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:21:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9b24ca2aec4f478ca2d364fa98d69600', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:52:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9b7cd3687b484011b3f3d8721602c663', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 14:29:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9b8b5fc17b7b43328886721c855a6c5f', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:47:56', 'roleName:232332323232;target:com.csd.system.role.po.Role@38e4b80;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9b8fd673c6ff493b84402660d4e64035', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:00:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9b99d9c46a704a6a8ff78d2a693416de', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:41:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9bc3e626d7694566926561ed581da2c1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:11:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9c5482668cca4511b586b5018e7f97fb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:34:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9c67dd8247c147cd89a9f0db56b468ce', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9c7183cd72714475a206d62757d94940', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:01:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9cde1eb9974b44ee9ceb43eaebe89474', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:22:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9ce5bb36c5474567b2804fd5fd5858c6', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:24', 'roleName:555;target:com.csd.system.role.po.Role@10ee52ef;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9dcba79c0bae4a3baccc9ab7c37de446', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:05:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9debfb4476fc454da96cc805310249c4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:43:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9e2a4cbbfdb7498c966a7fbed71aed38', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:24:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9e4b2733da424eb6b13250238735b6de', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9e6d6d8640a047f6ba838a60d42b92fc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:27:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9e91688abe584eddbf2eb4d62437127e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:40:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9f36e9aac55d462caaa934573d851c32', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:05:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9f5cf05b2ee745b48c6d4d2d84253fa0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:48:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9f9f7a7a512f475b8ad02f11f09bec3c', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:37', 'roleName:888;target:com.csd.system.role.po.Role@48bf8173;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9fc4406d60894325a73f458ec6c34621', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:09:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('9fcdb4348fab46c091ae7f3ab3c0468d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a0225da6b1c44f91b9202680351d15bb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a023cd51ada7481f9366d825d89b2120', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:00:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a050f2f6d9954138a2ec0bc659b6b2b0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:24:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a058718a220e4e9da714daf19d2bbe73', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:02:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a08a3e1febd34aeaa976ac3b1a631aab', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:38:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a0cd37b1b3304587bea9d5ddd8e6a10b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:22:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a0fc3e2594f547f9a9acd0108be68971', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:50:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a15cbc828ff4441694b769017f210591', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:52:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a1b3814f9efb4e198e57fd2b9a1ed287', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:22:33', 'roleName:部分管理员2;target:com.csd.system.role.po.Role@74721fd8;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a2120acb0d0e466783ba146bb75ce520', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:59:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a22d9ab1566c47fea71dd3f8f3795371', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:04:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a257601078894473940b9e7c0a3fe49c', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:39:14', 'roleName:roleName;target:com.csd.system.role.po.Role@76dd0963;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a2b065744c6e4d0b9335fe7d2105295c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:01:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a2bae283c43845d49db843273038f247', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:27:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a2e737dbd76f4bb0860d6b58f1869579', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a38b0a8329d74767bc8609e9ede1aa3e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:40:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a3b708e1fc9344eab83b789f75f63e74', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:48:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a3ea89e57e4942b487ebf29e6b17a701', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:10:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a3ec7e01fa1c4d56bb62be6a32268b1a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:18:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a3fd26a9403d45099a05cabc5c83ec6e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:25:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a4022924bc044a2aaa570f39807b85f0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a424cc154d5c403486fb501e8604e1a5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:29:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a442641eb1844d618e1289b9b3743e90', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:43:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a4a2f7517ff9428a8cc0d8aa2763f7a0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:37:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a548f3798110472ba0e6b2befb282781', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:21:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a54e71b779084ef98c78bb02a5bd1664', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:11:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5814a3a755f49ef84bb02aeecd9810e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5a8a4e3c7f04bec9a1d565d5ce52ea8', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', 'admin', '2019-02-14 13:46:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5cbc60cc11442cfbebea0e4bd47087c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:19:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5e5cefa7ad04b969fd60a7977ba75b3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:39:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5eb5b8b86774fe7930e92f4eeee93f6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:45:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5efe772b49248f8bdf9ff70698265d1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:41:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a5fd21e3eea24ac390e34ca1ab4b5e9e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:23:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a67251b63da0494494c2968d2dbd2c95', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 10:01:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a70408a0b48c45e49a1396249898e69e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:23:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a71c1efc22e545bc9412e8d9d0b015d6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:07:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a77bbd9c53f545de87a072510f6bf89b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:35:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a792ecf799b1495b8f8c2ae4ac5505e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:50:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a7b1ff26b43d45e880b430a621aa44e3', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a7b56903ef804d89a832914e6b97c3c0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:56:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a7eb5c70349c4941b3f3d28b9889aa48', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:17:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a7f3e50b1aa34a9cbeca46b1a678f802', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:23:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a817774eb0ae4f9abb91d42f281ac971', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:47:44', 'roleName:232313;target:com.csd.system.role.po.Role@2d9666e4;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a8198012ca524404a79f6113dd1e990d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:48:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a838f87cd85644cb86982dfb2d415100', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a87eba0d989e48bdb215bda45c9befb0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:59:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a89c34c60b5349abbf7c9cb1124d2ce9', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:34', 'roleName:777;target:com.csd.system.role.po.Role@361c9d39;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a8b7cc88a1594b9bbe594f0ab71e15fc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:33:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a930e1386e924bbeb1c9b01577d8b3a3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:53:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a98f9e169b7c4d0cbf88bd97db03f5e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:30:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('a9f1f872aea34cfeab81dbced724b142', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('aaa9798865de44b9acc9a20abdea11cb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:45:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('aac873d6247248b38b70796c8f319098', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:44:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ab42c4a1371147d2bfba0bed6c0dd097', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('abd8ca035446473d901bb9611c31b433', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:02:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('abfd9c4d56d34dab989b2e8168c398dd', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', 'admin', '2019-02-14 13:40:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('acf5e914d4c44d1b848d3edc65dc1033', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:38:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ad3baa3e34714abaae55a97525ccb9c1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:33:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ad44f004406a4cde8639264dcbbd03f3', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 10:57:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ad4c4f537629472488dde2248b86b4cf', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('adf168a89aac42fca08ee314bf540621', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:36:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ae8768ffcdae48ea895792be5101f8e4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:45:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('aeb75428276842b195fba97eb22008f4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:55:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('aefb903338aa4be585356f45f6569079', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:44:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('af07a842970b43e4b7b884cdf817d526', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:57:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('af2fee27175442a899242d3f6f9305be', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:34:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('af888de8e3e44490b17d6646ebf0046e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:39:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('af8dc2acaf0143a2b44c03cb42a8e68d', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:21:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('af95866f7f744abc824029d4a2f3b307', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:36:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b035477c83a647239adf4332c691a98a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:47:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b1058dfeb83647989259d1525123fd03', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:31:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b11d68d0f68a496e8450329c2c339d64', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:36:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b17a08e0b6d145238fdb13ccddab681f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:59:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b19de6e2db784481b8e4e8aed3c23094', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:59:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b23ae61dfa864e619bd5079bbc39e97c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:11:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b251d43661a84627b534ec5ecc18cd75', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:04:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b2aef61aa2c74965a70a4e8bfc90b343', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:40:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b2f71c5939244b36bf7a8943987676fb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:09:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b39ae530e24b43ecb357054f46863545', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:00:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b3ed3313c1b549f3ab22cff091047340', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:19:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b40f6f4a8b4c4c018b34cc1edaf89553', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:18:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b41221bda6e14b5da60369d503b6a5f9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:04:54', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b42968918b1441888485c0cae255a4ed', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:52:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b4466d283df54b8ba401cd52a57f1b05', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:54:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b47fc640b8e049cd82dd77bce955b8d3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:00:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b4ccecf1455b46d394dc78bafd5c8fa8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:27:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b51de46b1a64461b944a52410af4473d', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', 'admin', '2019-02-14 15:41:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b59c8925f4944236a4a9412ee82a1854', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b6078010d8e54a37a940da38b6e99314', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b6ad97a9c58c4eb58fdb2c4e8b84edad', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:44:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b6e2054bc7be46d5b01b51bfac2eb8b7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:58:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b718ed815aca4c129c2992778f67ce73', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:52:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b75f8c4208a84914a94432a09260480b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:31:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b794328ba5ca4ce8825bf411aea86429', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:27:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b7be8fb85d5f464ba53fd5fea4c7312c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:26:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b7edd84ee9c84006ae2e41f86a57e831', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b8311d1bde1540b3bcdb18ab71619b66', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:38:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b86bdf32b5df4f79bb48bc99536765d1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:47:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b87309752f1a41fda70202d0216a7e70', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b8a4da84612047098dd5d98a88051465', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 15:31:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b8a60b2a2e0441c0aa2d07706e5f4ac3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b916ee04638e4bef88b8156ed6b93404', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:28:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b92e1ee0ee74408ba55a0bb93fb64b29', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:15:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b956669c74a8477bac5c59a8832fd851', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:42:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b96105e8d4964175895ff81597ae980c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:38:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('b9d2265f0ed14cdcb858f8e59d7f7ce5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:14:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ba795dc039ee417fa21a7d2bfdb1a688', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:31:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ba99b05f90b2497f82ee490e2701a1f1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:42:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('baa322e742554f62879b6f58510db7ac', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('babc2603dbe5449691952d0077ed99cb', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:15:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bac240809f7b4ad38a8b5bd44f3d89b7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:16:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bb17b71fe0bc483580871587faf2c54f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:19:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bb224d2bdb794455898bc0f1e44fa682', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:31:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bb72776372a14e24a96e01420ec3a679', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:49:01', 'roleName:666;target:com.csd.system.role.po.Role@14f55589;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bb75f17586e64bb6801070e20f3360db', 'update', '修改角色', NULL, '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:39:22', 'roleName:roleName;', '2', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bbdbd04112f14893b26072cb2e73e0d5', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:40', 'roleName:1111;target:com.csd.system.role.po.Role@e9cb7e8;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bbdd6c3285ce4f27bc7e5e3965452d85', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:57:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bbdeb4206f6b4d73a0f7b64489968386', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bbf752c0b84242dcb28ff91611a358e3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:20:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bc31e01fa7394f97963aeb7e638227c0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:18:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bc6ce3661e04413995667fa2ec846d5e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:58:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bc7131c1b2fd47ecad88a4e698258948', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:12:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bc74de41a8a6482385e551df6e8c51e7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:41:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bc75d9b090f545b09497dccb06411b21', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:34:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bc805e349dad4c18824f580a336904f8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:00:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bcd09f5c1e0448a29c9d0259ba91a1f9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:39:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bd89efd23164461ebf4b8f217ae436f8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:00:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bdfcc7d0b4244cd9a356cd540a9e782e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('be06fde7bf3c43eba3224890544b7f79', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:35:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('be1ea1cdd531417aa80a26bc4e43e9c3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:44:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('becd44c3686d4483858a33874e69764e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bf1f4960a5a5471aa0c65d0023fe33fb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:41:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bf228814d96047b78e5b6107a895110e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:05:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bf4fb155250a4914a71593ab357f56bd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:56:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('bfc67ef1aca24851917f7f9f959c02a6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:33:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c031815d35554e0f80c59fe5397471a8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c06ac937f4134a648197ac342dc688dc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c06b0bc3fced4c659f999f9e3707dd30', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:26:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c09e88ff70b840499ebdc919ec0f3a62', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:39:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c0be1611bf264d97b74235a5c0af2049', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 15:51:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c19c2e9af13e4bb78309ad4ce9ea5d96', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:41:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c1b8f96e476b47b69787fa37c7544589', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:02:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c1de8f9943fa427fbc7a0973d96f0488', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:03:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c223c03ef177429780ab03caf975e5e7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:29:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c264a668af7143e0baaa5c132ab84cf4', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 13:19:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c2a2dd75a3804b5c8848f5016444e695', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:45:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c2a5f5be6ebf424293d86fba646c9e32', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c2b17bfbe5ac430199c6af14e7a3ad1c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:47:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c3727a9f98044fbcb82dc8185cbfb2c9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:00:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c3ed452ae3b24fa585a98169b187b8f8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:45:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c4de0a82a6374204b8f53f3441b54320', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:27:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c51661b66d3a48d590616b0919eb3866', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:48:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c573fd624d7e4267945953f1cdc3222a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:14:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c57645e820a64f03ab2baf9fd55aeac1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:16:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c58a157c64744d338b5bade546f9294b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:45:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c59ca0aa29134c36b7839b79718b439d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:40:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c59fe577cb1e4b25a5f3ca4b6a18728f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:30:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c5f0cc4b67ed44768e1b8a6b9c391b7c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:08:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c65c2d462ff84993a192eecf95014b9c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:03:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c66fc7b3136541228b9d4b54ad7f9e84', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:36:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c6d14fb33c8542e2b3ce8cde27794585', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:57:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c6d7a138898540e582d49af3c0ca9212', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:32:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c779a56a64ab433fa55166c71b5dda50', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:18:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c788ac02e8da4141abf5cfeef22828ff', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:30:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c808377792624de6bf1cd88edc12713d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:20:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c88ff5a0a361487a8c35f8a7e9e92446', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:18:43', 'roleName:平台管理员部分;target:com.csd.system.role.po.Role@6b23dff;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c90b756d2c2c40568122c52231d24746', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:49:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c9197205047041d2adada3bdba9ff2bc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:44:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c962e9aa5c894fd682732bbd368bad9f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:17:21', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c9a271afbc464f878f015ccac3c3677b', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:21', 'roleName:444;target:com.csd.system.role.po.Role@36b4ddc;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ca51a5f9197345d289a080e6da0f6143', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ca54b6c8994749aca12436eb55d815c7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 15:57:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ca65d91e7a8d49abbee387603a660292', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:25:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cab435adda5a42699cfe26aad02f0343', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:44:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cb5ac00e0c82438480d008159d6b4836', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:25:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cb60bb80928049b58a60da2ff6bda5c0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:30:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cb77be8eedd041ac8d0845983fd08e2b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:56:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cc17cb58f3814521b8509ece6641c8ba', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cc22c275062a4bc982ae5cee2da0a8e7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:10:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cc62813fa24a490bb6fab7f39282ff60', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:53:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cc6418becfdb406988e78279e7f5e5cf', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:53:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cc82d0041abb4b77be8348ac57fc98ea', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:44:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ccd7c5b471294798804f0dcee8899838', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cd29ec8e896c49eebc6d5d8634c62a43', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:23:27', 'roleName:888;target:com.csd.system.role.po.Role@448acec9;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cd3b6c4533be4c1d9e2560af5edf849f', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:21:20', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cd4f2f7194624d849c4fdb0df6b49ed7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:31:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cdc522b091424a179466720f467850d4', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:45:21', 'roleId:fac692c5042f4b5d9b9c2a200588a8dc;roleName:部分管理员新;target:com.csd.system.role.po.Role@1d044681;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cec815496b2a42bfb750982652a8b27c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:11:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cece9cfccb5b4effb5e9f025c3ddc562', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:56:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cf161906497e4a10bd3386394a9a9ae0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:01:40', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cf3c6c7e278d4bbc8ed5b18e2d3f52b6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:19:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cfa826060d074be0a37934acb3e9bb87', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:46:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('cfbb5046733e498380913cfe5e0bb0a3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:45:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d005fb3c275a4b3e852db2801e7483ea', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:40:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d006ddf75cfe4e7e87ad7889007f96e1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:23:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d00fc5ed25ad445a871e845df45eebd0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:05:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d077795574ec44fe89064429e19d2d88', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:04:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d0867c2258874c41b673861410a705cf', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 11:48:53', 'target:com.csd.system.role.po.Role@5d3be0e7;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d127987e24304c19b1e7746a09ad818a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:13:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d12aa5878fd0417d805d2dd920b07b8a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:58:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d155eda243a642fea4169ab7c415efa7', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d1b2caac9e7340e18ef1562edd865736', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:42:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d1b7fc1e9cd64b4b99a1ecc3cd9fe5bc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:56:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d1e31d20d26446c499a8ae0a0ed0eb5a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:19:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d2171d4a91094fb985ee0ef1bbfd0dd7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:31:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d217e15fe5ab4b70abb62cb7c8880122', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:17:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d230d72f383942f8913f867c2a363e40', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:53:12', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d26c821354794780a0161236ce991c57', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:48:48', 'roleName:111;target:com.csd.system.role.po.Role@67e3e80b;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d35b96db521c49f5847e30b45fcf4c7b', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:15:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d3b76d08f2fa497e986c3a2a39bdd839', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:43:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d3eb5fda70784a5a805ff4416575c635', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:11:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d41ce024e13745d2884bed36566b3638', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:40:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d4ba92108f574aaaa8ee22b0e4551c9c', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d5044009fae84256ae7420b398899c86', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:13:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d5f722061dd84caebdcd9f09625f524f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d62feb7a02ef4f90a50a914c7e2cd808', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:34:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d630e704f47e4eefac3f4451b15e3477', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:07:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d65e7de441a24048ba84157752eed719', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:24:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d67de5b0728743fc99e9576313641292', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d6cccec218264f1f8b61e1e35c04be90', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d6cf7db214744022be7c5c7c0a7a4c49', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:24:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d74778fb6ddd4a259212202c0bb18c2d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:56:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d7616e86a10547f08bea92a6c9f28fb8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:38:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d761a2fe6710437ab198e737e3314f91', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:04:34', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d8051c7e83ec41e79cb619219f72bbac', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:43:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d888e8b5a9b0445395afeebfae094718', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:19:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d8b996bdca5d41d3a029405e4980e4d9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:23:24', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d8ecae1f64284b1d8847b8cc2fde860c', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d9100832d0cf4267aec909ae35c7eac0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:13:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d93a5811589044d9b598fc16a1527539', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:40:14', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d95efbdf65da40e78e9df72dae511c3f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:42', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d96f096c383b4c628844c98eb3624aed', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:54:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('d9a3bc211372409ca9af6e6d5600bbef', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:52:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('daa51f86b2414c7d89eb4bf1126e85ec', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:42:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('db21a33454fa4745b29bc6a9f9fbc5c1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:24:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('db8e3c64356c44229015420c42afa96a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:53:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dc37f59fd3ea4e6e8057ec5361b48faa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dc98b500ba644954b65e771ff963cd3d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:12:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dd1776a4472b4f848074bc50b9b9c962', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:31:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dd1ed755f8914c79b5c13bc55a736a49', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 13:57:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dd748806fd3543f5a037af4508c222b9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:23:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dd7859a90bc54c72a2bd5958ccaab4a6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:05:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ddcbc9418f6245ce93bf83b936e03fbb', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:47:52', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ddddd48ed0d7483f9761e5915be06042', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:26:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dde69c47e1844bd5b5c6a22593300fed', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:15:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('de0a33633086493787038bfe59639015', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:23:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('deb371735f0c4c6cb6dbac6d2bb4a7db', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 09:54:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('dee5e633a0ba4c71afe086f4419cd911', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('df09f88a3c3d4efb969d1e9fef3958e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:59:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('df12989dcbcd455dbc327cbe4af04085', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:52:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('df5c5d7b56014166b73509c902534b73', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('df687f622d5c4beb978c8eb6d1f33031', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:31:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e0cbf937120f47fca38faa83acbaa8ab', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:13:47', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e0f520340c074eeb81b0edfbed06f520', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:23:50', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e0fc12c867c14804ad85e248a7ee8102', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:36:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e12297bc83c441bc9c1b05a490fa3515', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:33:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e1314e2ab0d048d6a57c38c6a6e45a99', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:03:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e1627c2dda794254ac9c24f144a70e3f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:20:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e2d710d88a48439b8ba576a897a686ee', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:30:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e34961d9f07946c9900c6702429af653', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:08:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e34970ecbc294ad4bee51eafa803389c', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', 'admin', '2019-02-14 13:44:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e3a49d4f6c0d4e83bd2374e6b218ffd1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:01:31', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e3a58da4248d40dfa20d06429d652f77', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 16:02:45', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e3ea45f9a95547baa45e81a98d0a8ea9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:14:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e442054461fa46fb8582b76337372160', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:27:29', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e445e33d661e4535926d5323d43337ae', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e46421bb7562435f9cc6fb03c2370525', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:39:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e4a431ee337e4e878dc798aadd1b8568', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e530af0171a1422b836118da4665505a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e59e99644e6c4b10aee358b6b830eef5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:30:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e5cd9f19a7de4afbb5c65391fce2d4da', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:18:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e5ecf407a91b487d8e5a8fb9b4abbe30', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:21:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e5fa03866aa443e294598ffc29f19a5d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:36:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e6b66662f2744e1bacf27f4535e98bc3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:14:06', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e6bdd42428e742499e0b2089fe1fd674', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e6cdd38a81de41a883420fba66ee9771', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:48:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e6e83bae452443fab120ad19e9a475fc', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:47:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e6fe5680d6d946d2a1714d0ef61a212b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:16:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e71ae66b1d0e4222a315b5b8256b5f04', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:25:05', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e7250dc0ddc04dc89e9aedd1482655c4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:07:55', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e7e40672786040318743ecfb1b3f8e71', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:47:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e80d3265d85441b0b6f2fda75a61b524', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e8224d03b164495e8a37d596a41093a8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:32:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e88f78c98dc74b11afd5e4600812b901', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:13:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e8abdcd40e7b4902bad0fd0caff593e7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:49:43', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e92116bda5494470b2623dda57536f99', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:44:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e96c42fc3fc041ac93294a2177b222b8', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e98420c5704249e3afa32c7aa7a46df1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:56:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('e9f75781bca74f2887518ed2c13b3bf5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:01:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ea8d7e48e1f34d27b07bbc3b2f119491', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 16:12:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ea9ba32592c147cfaee2c2a8761dde28', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:24:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('eac3c4a14a5748b5aa8bdb60bfe80c2d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:06:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ead5bb827b2f431eafb343b77b89c6ce', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('eafaaa1c302e4d389d36fdd109c503ca', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:34:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('eb993a35ed8b44f58ca60d109e77657a', 'update', '修改角色', '2', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 12:35:48', 'target:com.csd.system.role.po.Role@14d42be;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ec163425f16f480abcffceea7396223c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:33:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ec9c003948dd43dcaf0e8ad85d5f6d75', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:35:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('eca1d554604444b799de64cd30a54bc5', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:23:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ed4bfa0d272042169e9c33977cb77a64', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:55:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('edbef30bb79847e6bc4a0fb29f54996f', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:25:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ee4ae2e9531347289e3804e9ff2a54e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 10:45:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ee50f556d2a74b82ab0f2fdc1b095d84', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:02:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('eedfcd24a0054457a2c3c7277c36af33', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:54:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ef7de409744e4450bc2761515ab84b25', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:50:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ef80d53eab8546dd9bcf30919ed5d9f0', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:07:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f0350d514b51456e98ccc939f4c361f1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:34:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f059792a03fc41bb921c0997f9f21882', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:21:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f08e942d053e437186b229bd2e8ab90c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:40:25', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f0beeb70ba724459a37804a675909011', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:26:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f0c4d2cbe8b94d1ba733ea20855d3ba2', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:41:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f165d132f1364951a0d7b998224252d8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 11:19:56', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f199d4b0b73148ebaa661ba8b089c5db', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:34:03', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f1f21bc8712548bf9bfb1af8dc7cc8ca', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f1f2f0f3cf244cdc8f4b354c25f0238a', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:41:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f293230cac344eb7a1feabb93c1df4e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:27:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f336fadf379b42939d0783fe5167590e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:26:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f35ff9a5978842269e3aa02875e1f851', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:59:11', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f3683fae537f40ea841a32eca6507313', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:26:15', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f38d2ece6fab4996989e09fe22a77ffa', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:39:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f38d304cd4564fe190008adea59c3475', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:55:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f3d5190ffcb44d14b3da979fd184c4dd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:01:13', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f400753e54954e94b2c1806afcc1fd78', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 09:48:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f4627d315a094a75a944a553b3289cd3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 11:05:58', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f486ea4e9e274df9b07a83a48875d372', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:26:16', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f500d87be497472aa9cc3888571e73c8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:08:07', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f5268d8cad9d4c5f977234f26fa278ad', 'findByPage', '查询菜单', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-15 10:21:19', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f52a0afb77364322b3c066873154f1b4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:04:49', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f5a9c43f94a44d388c2b70c0c8debd7c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 13:27:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f5a9d1edebab4e6485125072434b08e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:30:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f5f8bb3ca08e4ab0b09f07f55e2d5063', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:03:46', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f612f8ce043d4ca8b9e38638fb2f0c72', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:42:02', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f666b1d51dfa4a8eabbd587179d25f02', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:36:01', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f68da85e53d24e529bc11994e05386e4', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:04:41', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f6d3b896e1e64167a628a9f7223b3a4c', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:45:26', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f6e09e0abae044b88beb9574498512e6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:20:30', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f6e447be9f014709a863a2cb74828dc1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 17:21:18', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f6f57953dd01427297e907c1c4861ddd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:30:51', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f7087ac4c79445fb823a896b670297ad', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:33:09', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f7289520691548a4880ac8acd7bb2256', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:30:27', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f72aadb9c47d46dda1df24be1d9dab16', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:11:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f79891f5e86e437094c92a1b7b948f9b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:16:44', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f7bc2889ce0f4842b92916a7ff90553b', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:53:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f7c90e3dab6c4e9eadabf7a74e6107f1', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:11:23', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f806bf3260a941c7a63c246bbdee75d7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 17:24:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f81fd6d4a37644b281decf35aa68fd18', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 15:03:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f8dc2575b2dd4336aa1b1b10d300eed9', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:04:53', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f905b28688a24a1ca5432b136152bebd', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:17:10', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f9159ba6045044c7954a678824c8881c', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:48:59', 'roleName:555;target:com.csd.system.role.po.Role@168406f5;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f9255cbda77d4dd5b5ad503e22496f97', 'findByPage', '查询菜单', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f947239257fa49b5ad7105aa2328782e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:08:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f989607a47484dfeb4963be5d6c2356d', 'delete', '删除角色', '3', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:21:22', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('f99c39ee1efd4440a9ccd5f7e8c9a7a6', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 12:40:38', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fa81b89fae264d288b9315f0f4ea47f7', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 15:18:48', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fae850454cae448abe793a542b906cc3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 10:29:39', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fb25d753b2a845a9ab57dc24c480a4f8', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 16:29:37', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fb374e3560424141b5cf21da72a254da', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:28:32', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fb65b7829a694297b126bf7a56667c69', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:13:33', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fc2046252f50447b96144c5eff25c9be', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 17:10:28', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fcb420f38078454aa35c603e5c685f76', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:47:04', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fcb935cbd52d4a3e97e498b135591613', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:26:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fd212083467a47c4bc3d64ecaf1aa979', 'save', '新增角色', '1', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 14:35:19', 'roleName:333;target:com.csd.system.role.po.Role@1a9da5d1;', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fe1ee6a28b5d4278a9af8af6bb63550e', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-19 14:37:35', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fe365fc6ace94717ba5cb7b847632271', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:33:08', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fe9e4f3844a74a3ba2054f5c565db813', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-20 14:14:59', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fedefd5feba04171b305479e8c11ab5d', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-21 14:01:57', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('ff6b9d217a1b44bdbef963fd7357a1d3', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-22 15:08:17', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('fff1d6f237074c94b0f8539923c58e88', 'index', '登录成功', '4', '430196a10298435a89e261cc9df9a437', '超级管理员', '2019-02-25 16:55:39', '', '1', '0:0:0:0:0:0:0:1');

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
INSERT INTO `w_user_role` VALUES ('fac692c5042f4b5d9b9c2a200588a8dc', 'e0cd5eb7b3d84c1a9da08fdb238c5b69', '1');

SET FOREIGN_KEY_CHECKS = 1;
