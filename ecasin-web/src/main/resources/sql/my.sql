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

 Date: 29/01/2019 16:15:05
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
INSERT INTO `w_check_code` VALUES ('0ac13e45347142728cfb9d81afcb7cf4', '18683789594', 30560, '1', '2018-12-28 13:23:11');
INSERT INTO `w_check_code` VALUES ('583dbc1a67d045db8ba65358dba9c95e', '18683789594', 74564, '2', '2019-01-02 15:42:02');
INSERT INTO `w_check_code` VALUES ('c5b911d15a9e45adacbc9e93352a0d4a', '18683789594', 53789, '2', '2019-01-02 15:43:16');

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
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of w_job
-- ----------------------------
INSERT INTO `w_job` VALUES ('403f7e439f75438788b6746b099e71ff', '10', '10.1', '后端工程师', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:20:10', NULL, NULL, '1');
INSERT INTO `w_job` VALUES ('63a60fef9680488d8969e4baeb7a430b', '10', '10.1', '前端工程师', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:20:13', NULL, NULL, '1');
INSERT INTO `w_job` VALUES ('6cc4239ecb2943a7973820a563508b74', '10', '10.2', '软件销售', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:20:46', NULL, NULL, '1');
INSERT INTO `w_job` VALUES ('8a8628ba2aa34456a6c51f0e4f537ecc', NULL, NULL, '超级管理员', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-28 09:34:21', NULL, NULL, '1');
INSERT INTO `w_job` VALUES ('e0cd5eb7b3d84c1a9da08fdb238c5b69', '10', '10', '公司管理员10', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-12-29 14:20:55', NULL, NULL, '1');

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
INSERT INTO `w_pt_job` VALUES ('00fb7aad21c6499aaa6883f1365ea403', '10', '10.1', '63a60fef9680488d8969e4baeb7a430b', '728e957eb3344ac593d118b67fbff683', '1', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:21:54', NULL, NULL, '1');
INSERT INTO `w_pt_job` VALUES ('1bcf2bf18acf44afbf97b4806ceefab3', '10', '10.2', '6cc4239ecb2943a7973820a563508b74', '905cbdcb8fc446babf6b5bfec3538a72', '1', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:26:57', NULL, NULL, '1');
INSERT INTO `w_pt_job` VALUES ('3396415112874ef6acb258029c9584fa', '10', '10.1', '8a8628ba2aa34456a6c51f0e4f537ecc', 'bbdbf895c1e24b59bf88ee984cd07f28', '1', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-12-24 17:09:29', NULL, NULL, '1');
INSERT INTO `w_pt_job` VALUES ('ba08cc1c3bb042c2b7fd8722764c53d1', NULL, NULL, '8a8628ba2aa34456a6c51f0e4f537ecc', '430196a10298435a89e261cc9df9a437', '1', NULL, '2018-11-22 09:36:39', NULL, NULL, '1');
INSERT INTO `w_pt_job` VALUES ('cd4843e43869408c98174b08f058c55e', '10', '10.1', '403f7e439f75438788b6746b099e71ff', 'bbdbf895c1e24b59bf88ee984cd07f28', '2', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:21:31', NULL, NULL, '1');
INSERT INTO `w_pt_job` VALUES ('f5e6046ca3da4a5bb5927ef0b0ac5f7b', '10', '10.2', '6cc4239ecb2943a7973820a563508b74', 'd64bb17fe452491481932a59d360b67d', '1', 'bbdbf895c1e24b59bf88ee984cd07f28', '2018-11-27 17:26:30', NULL, NULL, '1');

-- ----------------------------
-- Table structure for w_role
-- ----------------------------
DROP TABLE IF EXISTS `w_role`;
CREATE TABLE `w_role`  (
  `role_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `role_org_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司ID',
  `role_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '层级（1超级管理员,2平台管理员,3普通角色）',
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
INSERT INTO `w_role` VALUES ('29269ebeac54477bb6d269fe1d4af6ca', '10', '1', '所有权限', 'ROLE_ADMIN', 'system', '2018-11-27 17:30:13', NULL, NULL, '1');
INSERT INTO `w_role` VALUES ('2dd795f6de62477985acafae201e2076', '10', '2', '部门权限', 'ROLE_10', '430196a10298435a89e261cc9df9a437', '2018-11-28 09:31:02', NULL, NULL, '1');

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
INSERT INTO `w_role_menu` VALUES ('337b5b2753b1450db5a747fd4b260230', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('39dbd2c3dbf040b7929823ea50d25bc4', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('9618b57230fc4deab308bc445031dc06', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('2616b17fc3f347659594eef947d33471', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('8397433445af4659970698c3019ca2d0', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('b4d61d22f83f44ddb6d24055c4d2b0d4', '29269ebeac54477bb6d269fe1d4af6ca', '1');
INSERT INTO `w_role_menu` VALUES ('0d074f6606244b70983bfb1e7b33efca', '29269ebeac54477bb6d269fe1d4af6ca', '0');
INSERT INTO `w_role_menu` VALUES ('bdc87bfd8a214730a0026860e70ef084', '29269ebeac54477bb6d269fe1d4af6ca', '1');

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
INSERT INTO `w_system_log` VALUES ('02c7fb79cc6b4694aff97719f23fda6a', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '192.168.1.92');
INSERT INTO `w_system_log` VALUES ('07e8d4336daf4444a9b2f5807f68a65e', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('11bda18e21a34014bdb23be363c47441', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '192.168.1.92');
INSERT INTO `w_system_log` VALUES ('1540b94f4b774229a6c3a4f00a0a65c5', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '192.168.1.92');
INSERT INTO `w_system_log` VALUES ('17e2339cb9dd4733bf55a0abfc6a41d9', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('3970c1c1ecbc4e70a03613c80e406dec', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '192.168.1.92');
INSERT INTO `w_system_log` VALUES ('3f14b6cf15d94e329f89894e33a29381', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('437007e59751466f964e67e403e6fa51', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('474c66bff3d74b338ab8583977349615', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('63f48998d0d54a00bf8df015573bebc5', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '192.168.1.92');
INSERT INTO `w_system_log` VALUES ('8b25f25a1fb74782a8c96b1461703c42', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('8da070737e4e4c35aa70337aa1f3e7d2', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '192.168.1.92');
INSERT INTO `w_system_log` VALUES ('b160d3d6f399498296c184000d66c457', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('c628e5dd27b24584a8cd3d616f85ff01', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '0:0:0:0:0:0:0:1');
INSERT INTO `w_system_log` VALUES ('caff05fb158044168e5ce8751b690804', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '192.168.1.92');
INSERT INTO `w_system_log` VALUES ('d0cdd191c3b148239ba95a76b1c18145', 'getUser', '查询用户', '4', '1', 'wu', '2019-01-29 15:31:00', '', '1', '192.168.1.92');

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
INSERT INTO `w_user` VALUES ('430196a10298435a89e261cc9df9a437', NULL, NULL, 'admin', 'admin', 'fe39db8fa7eea8d5d1208d504bf8f7983703b10f', '1', '四川省成都市', '1', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-28 09:30:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `w_user` VALUES ('728e957eb3344ac593d118b67fbff683', '10', '10.1', '吴2', '18622222222', '2ff8ddae4aae26dc75071e350de20c14675c51f4', '1', '四川省成都市', '1', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-27 17:23:44', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `w_user` VALUES ('905cbdcb8fc446babf6b5bfec3538a72', '10', '10.2', '吴4', '18644444444', 'ca0ff6de06c338127e3cb9d9ed0e7bdefd19e0a0', '1', '四川省成都市', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-27 17:24:39', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `w_user` VALUES ('bbdbf895c1e24b59bf88ee984cd07f28', '10', '10.1', '吴1', '18683789594', '89af3ea003ab176c5a376494b6b65224091ecab3', '1', '四川省成都市', '1', '3', NULL, NULL, NULL, '1', '3', NULL, NULL, '2018-11-14 15:55:12', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `w_user` VALUES ('d64bb17fe452491481932a59d360b67d', '10', '10.2', '吴3', '18633333333', '24aa1a301294c56b5c94b47f97907adf3371507b', '1', '四川省成都市', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-27 17:24:26', NULL, NULL, NULL, NULL, NULL);

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
INSERT INTO `w_user_role` VALUES ('2dd795f6de62477985acafae201e2076', '403f7e439f75438788b6746b099e71ff', '1');
INSERT INTO `w_user_role` VALUES ('2dd795f6de62477985acafae201e2076', '63a60fef9680488d8969e4baeb7a430b', '1');

SET FOREIGN_KEY_CHECKS = 1;
