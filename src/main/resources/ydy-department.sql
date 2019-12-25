/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : ydy-department

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 25/12/2019 14:34:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_resource
-- ----------------------------
DROP TABLE IF EXISTS `auth_resource`;
CREATE TABLE `auth_resource`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `CODE` int(5) NULL DEFAULT NULL COMMENT '资源排序',
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源描述',
  `PARENT_ID` int(11) NULL DEFAULT NULL COMMENT '父资源编码->菜单',
  `URI` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问地址URL',
  `TYPE` smallint(4) NULL DEFAULT NULL COMMENT '类型 1:菜单menu 2:资源element(rest-api) 3:资源分类',
  `METHOD` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问方式 GET POST PUT DELETE PATCH',
  `ICON` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `ROUTER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端路由',
  `STATUS` smallint(4) NULL DEFAULT 1 COMMENT '状态   1:正常、9：禁用',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源信息表(菜单,资源)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_resource
-- ----------------------------
INSERT INTO `auth_resource` VALUES (1, 1, '生命体征监测', -1, NULL, 1, NULL, 'icon-jianceqi', '/monitor/allList', 1, '2019-11-29 16:47:37', '2019-12-10 15:35:05');
INSERT INTO `auth_resource` VALUES (2, 11, '全部列表', 1, '/departmentsPatient/page', 2, 'POST', 'icon-jianceqi', '/monitor/allList', 1, '2019-11-29 17:07:44', '2019-12-10 15:35:58');
INSERT INTO `auth_resource` VALUES (3, 12, '异常列表', 1, '/monitor/anomalyList', 2, 'POST', NULL, '/monitor/anomalyList', 1, '2019-11-29 17:25:22', '2019-12-10 15:36:00');
INSERT INTO `auth_resource` VALUES (4, 2, '患者管理', -1, NULL, 1, NULL, 'icon-huanzhechaxun', '/patient/patientList', 1, '2019-11-29 17:42:46', '2019-12-10 15:35:08');
INSERT INTO `auth_resource` VALUES (5, 21, '病人列表', 4, '/departmentsPatient/page', 2, 'POST', NULL, '/patient/patientList', 1, '2019-11-29 17:43:44', '2019-12-10 15:36:04');
INSERT INTO `auth_resource` VALUES (6, 22, '新增病人', 4, '/departmentsPatient', 2, 'POST', NULL, '/patient/patientAdd', 1, '2019-11-29 17:44:42', '2019-12-10 15:36:06');
INSERT INTO `auth_resource` VALUES (7, 23, '病人编辑', 4, '/departmentsPatient', 3, 'PUT', NULL, NULL, 1, '2019-11-29 17:45:41', '2019-12-10 15:36:22');
INSERT INTO `auth_resource` VALUES (8, 3, '病房设备管理', -1, NULL, 1, NULL, 'icon-shebeiguanli', '/room/roomList', 1, '2019-11-29 17:47:16', '2019-12-10 15:35:23');
INSERT INTO `auth_resource` VALUES (9, 31, '病房管理', 8, '/departmentsRoom/page', 2, 'POST', NULL, '/room/roomList', 1, '2019-11-29 17:48:06', '2019-12-10 15:36:25');
INSERT INTO `auth_resource` VALUES (10, 32, '新增病房', 8, '/departmentsRoom', 2, 'POST', NULL, '/room/roomAdd', 1, '2019-11-29 17:48:54', '2019-12-10 15:36:28');
INSERT INTO `auth_resource` VALUES (11, 33, '设备管理', 8, '/departmentsDevice/page', 2, 'POST', NULL, '/room/deviceList', 1, '2019-11-29 17:50:07', '2019-12-10 15:36:31');
INSERT INTO `auth_resource` VALUES (12, 34, '新增设备', 8, 'departmentsDevice', 2, 'POST', NULL, '/room/deviceAdd', 1, '2019-11-29 17:51:03', '2019-12-10 15:36:36');
INSERT INTO `auth_resource` VALUES (13, 4, '权限管理', -1, NULL, 1, NULL, 'icon-shebeiguanli', '/role/resourceList', 1, '2019-11-29 17:51:39', '2019-12-10 15:35:28');
INSERT INTO `auth_resource` VALUES (14, 41, '资源管理', 13, '/resource/page', 2, 'POST', NULL, '/role/resourceList', 1, '2019-11-29 17:52:27', '2019-12-10 15:36:39');
INSERT INTO `auth_resource` VALUES (15, 42, '新增资源', 13, '/resource/page', 2, 'POST', NULL, '/role/resourceAdd', 1, '2019-11-29 17:53:14', '2019-12-10 15:36:41');
INSERT INTO `auth_resource` VALUES (16, 43, '角色管理', 13, '/role/page', 2, 'POST', NULL, '/role/roleList', 1, '2019-11-29 17:53:32', '2019-12-10 15:36:43');
INSERT INTO `auth_resource` VALUES (17, 44, '新增角色', 13, '/role', 2, 'POST', NULL, '/role/roleAdd', 1, '2019-12-03 13:42:53', '2019-12-10 15:36:45');
INSERT INTO `auth_resource` VALUES (18, 45, '人员管理', 13, '/departmentsAdmin/page', 2, 'POST', NULL, '/role/adminList', 1, '2019-12-03 13:44:23', '2019-12-10 15:36:47');
INSERT INTO `auth_resource` VALUES (19, 46, '新增人员', 13, '/departmentsAdmin', 2, 'POST', NULL, '/role/adminAdd', 1, '2019-12-03 13:46:23', '2019-12-10 15:36:49');
INSERT INTO `auth_resource` VALUES (20, 5, '科室管理', -1, NULL, 1, NULL, 'icon-shebeiguanli', '/section/hospitalList', 1, '2019-11-29 17:51:39', '2019-12-11 16:50:35');
INSERT INTO `auth_resource` VALUES (21, 51, '医院管理', 20, '/departmentsHospital/page', 2, 'POST', NULL, '/section/hospitalList', 1, '2019-12-11 16:53:47', NULL);
INSERT INTO `auth_resource` VALUES (22, 52, '新增医院', 20, '/departmentsHospital', 2, 'POST', NULL, '/section/hospitalAdd', 1, '2019-12-11 16:55:01', NULL);
INSERT INTO `auth_resource` VALUES (23, 53, '科室管理', 20, '/departmentsSection/page', 2, 'POST', NULL, '/section/sectionList', 1, '2019-12-11 16:55:48', NULL);
INSERT INTO `auth_resource` VALUES (24, 54, '新增科室', 20, '/departmentsSection', 2, 'POST', NULL, '/section/sectionAdd', 1, '2019-12-11 16:56:48', NULL);

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `CODE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色编码',
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `STATUS` smallint(4) NULL DEFAULT 1 COMMENT '状态   1:正常、9：禁用',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES (100, 'role_admin', '管理员角色', 1, '2019-12-10 14:03:13', '2019-12-03 14:03:17');
INSERT INTO `auth_role` VALUES (102, 'role_user', '用户角色', 1, '2019-12-02 14:03:18', '2019-12-03 14:03:21');
INSERT INTO `auth_role` VALUES (103, 'role_guest', '访客角色', 1, '2019-11-28 14:03:23', '2019-12-03 14:03:29');

-- ----------------------------
-- Table structure for auth_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_resource`;
CREATE TABLE `auth_role_resource`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ROLE_ID` int(11) NOT NULL COMMENT '角色ID',
  `RESOURCE_ID` int(11) NOT NULL COMMENT '资源ID',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `ROLE_ID`(`ROLE_ID`, `RESOURCE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_role_resource
-- ----------------------------
INSERT INTO `auth_role_resource` VALUES (20, 102, 2, '2019-12-03 16:09:36', '2019-12-03 16:09:36');
INSERT INTO `auth_role_resource` VALUES (21, 102, 3, '2019-12-03 16:09:36', '2019-12-03 16:09:36');
INSERT INTO `auth_role_resource` VALUES (22, 102, 5, '2019-12-03 16:09:36', '2019-12-03 16:09:36');
INSERT INTO `auth_role_resource` VALUES (23, 102, 6, '2019-12-03 16:09:36', '2019-12-03 16:09:36');
INSERT INTO `auth_role_resource` VALUES (24, 102, 7, '2019-12-03 16:09:36', '2019-12-03 16:09:36');
INSERT INTO `auth_role_resource` VALUES (25, 102, 9, '2019-12-03 16:09:36', '2019-12-03 16:09:36');
INSERT INTO `auth_role_resource` VALUES (26, 102, 10, '2019-12-03 16:09:36', '2019-12-03 16:09:36');
INSERT INTO `auth_role_resource` VALUES (27, 102, 11, '2019-12-03 16:09:36', '2019-12-03 16:09:36');
INSERT INTO `auth_role_resource` VALUES (28, 102, 12, '2019-12-03 16:09:36', '2019-12-03 16:09:36');
INSERT INTO `auth_role_resource` VALUES (29, 103, 2, '2019-12-03 16:09:45', '2019-12-03 16:09:45');
INSERT INTO `auth_role_resource` VALUES (30, 103, 3, '2019-12-03 16:09:45', '2019-12-03 16:09:45');
INSERT INTO `auth_role_resource` VALUES (36, 100, 2, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (37, 100, 3, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (38, 100, 5, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (39, 100, 6, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (40, 100, 7, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (41, 100, 9, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (42, 100, 10, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (43, 100, 11, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (44, 100, 12, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (45, 100, 14, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (46, 100, 15, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (47, 100, 16, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (48, 100, 17, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (49, 100, 18, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (50, 100, 19, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (51, 100, 21, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (52, 100, 22, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (53, 100, 23, '2019-12-11 17:20:39', '2019-12-11 17:20:39');
INSERT INTO `auth_role_resource` VALUES (54, 100, 24, '2019-12-11 17:20:39', '2019-12-11 17:20:39');

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role`  (
  `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户角色关联表主键',
  `USER_ID` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户UID',
  `ROLE_ID` int(11) NOT NULL COMMENT '角色ID',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE,
  UNIQUE INDEX `USER_ID`(`USER_ID`, `ROLE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES (39, '1', 100, '2019-12-09 16:53:26', '2019-12-09 16:53:26');
INSERT INTO `auth_user_role` VALUES (40, '1', 102, '2019-12-09 16:53:26', '2019-12-09 16:53:26');
INSERT INTO `auth_user_role` VALUES (41, '24', 102, '2019-12-09 16:55:29', '2019-12-09 16:55:29');
INSERT INTO `auth_user_role` VALUES (43, '25', 100, '2019-12-10 10:02:07', '2019-12-10 10:02:07');
INSERT INTO `auth_user_role` VALUES (46, '26', 102, '2019-12-10 10:36:09', '2019-12-10 10:36:09');

-- ----------------------------
-- Table structure for departments_admin
-- ----------------------------
DROP TABLE IF EXISTS `departments_admin`;
CREATE TABLE `departments_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `section_id` int(11) NULL DEFAULT NULL COMMENT '科室id',
  `creat_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(2) NULL DEFAULT NULL COMMENT '是否删除  0-未删除，1-已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '医生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments_admin
-- ----------------------------
INSERT INTO `departments_admin` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, '2019-05-07 14:27:18', 0);
INSERT INTO `departments_admin` VALUES (24, 'bbb', 'e10adc3949ba59abbe56e057f20f883e', 9, '2019-12-09 16:55:29', 0);
INSERT INTO `departments_admin` VALUES (25, 'aaa', 'e10adc3949ba59abbe56e057f20f883e', 2, '2019-12-09 17:24:00', 0);
INSERT INTO `departments_admin` VALUES (26, 'asdf', '670b14728ad9902aecba32e22fa4f6bd', 1, '2019-12-10 10:35:18', 0);

-- ----------------------------
-- Table structure for departments_bed
-- ----------------------------
DROP TABLE IF EXISTS `departments_bed`;
CREATE TABLE `departments_bed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) UNSIGNED NOT NULL COMMENT '科室id',
  `bed_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '床位',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0：正常，1：加床',
  `creat_time` datetime(0) NULL DEFAULT NULL COMMENT '病床添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 750 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments_bed
-- ----------------------------
INSERT INTO `departments_bed` VALUES (739, 1, '1病床', 0, '2019-10-15 14:26:58');
INSERT INTO `departments_bed` VALUES (740, 1, '2病床', 0, '2019-10-15 14:26:58');
INSERT INTO `departments_bed` VALUES (741, 1, '1病床', 0, '2019-10-15 14:28:05');
INSERT INTO `departments_bed` VALUES (742, 1, '2病床', 0, '2019-10-15 14:28:05');
INSERT INTO `departments_bed` VALUES (743, 1, '3病床', 0, '2019-10-15 14:28:05');
INSERT INTO `departments_bed` VALUES (744, 1, '4病床', 0, '2019-10-15 14:28:05');
INSERT INTO `departments_bed` VALUES (748, 1, '1病床', 0, '2019-10-24 17:52:17');
INSERT INTO `departments_bed` VALUES (749, 1, '2病床', 0, '2019-10-24 17:52:47');

-- ----------------------------
-- Table structure for departments_data
-- ----------------------------
DROP TABLE IF EXISTS `departments_data`;
CREATE TABLE `departments_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mac` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spo2` decimal(10, 2) NULL DEFAULT NULL,
  `hr` decimal(10, 2) NULL DEFAULT NULL,
  `rr` decimal(10, 2) NULL DEFAULT NULL,
  `sbp` decimal(10, 2) NULL DEFAULT NULL,
  `dbp` decimal(10, 2) NULL DEFAULT NULL,
  `creat_time` datetime(0) NULL DEFAULT NULL COMMENT '测量时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1477 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '历史数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments_data
-- ----------------------------
INSERT INTO `departments_data` VALUES (1, '12:26:48', 97.38, 98.00, 19.00, 131.00, 75.00, '2019-12-16 15:33:33');
INSERT INTO `departments_data` VALUES (2, '12:26:04', 99.69, 78.00, 17.00, 114.00, 76.00, '2019-12-16 15:33:33');
INSERT INTO `departments_data` VALUES (3, '12:26:01', 97.72, 81.00, 16.00, 102.00, 82.00, '2019-12-16 15:33:33');
INSERT INTO `departments_data` VALUES (4, '12:26:48', 98.58, 72.00, 19.00, 100.00, 64.00, '2019-12-16 15:34:00');
INSERT INTO `departments_data` VALUES (5, '12:26:04', 95.05, 78.00, 16.00, 91.00, 81.00, '2019-12-16 15:34:00');
INSERT INTO `departments_data` VALUES (6, '12:26:01', 98.89, 73.00, 19.00, 101.00, 76.00, '2019-12-16 15:34:00');
INSERT INTO `departments_data` VALUES (7, '12:26:48', 97.29, 84.00, 16.00, 120.00, 66.00, '2019-12-16 15:35:00');
INSERT INTO `departments_data` VALUES (8, '12:26:04', 99.71, 77.00, 19.00, 128.00, 87.00, '2019-12-16 15:35:00');
INSERT INTO `departments_data` VALUES (9, '12:26:01', 96.99, 74.00, 17.00, 115.00, 69.00, '2019-12-16 15:35:00');
INSERT INTO `departments_data` VALUES (10, '12:26:48', 98.62, 68.00, 19.00, 95.00, 72.00, '2019-12-16 15:36:00');
INSERT INTO `departments_data` VALUES (11, '12:26:04', 98.36, 77.00, 16.00, 121.00, 68.00, '2019-12-16 15:36:00');
INSERT INTO `departments_data` VALUES (12, '12:26:01', 95.03, 70.00, 17.00, 115.00, 66.00, '2019-12-16 15:36:00');
INSERT INTO `departments_data` VALUES (13, '12:26:48', 95.55, 65.00, 17.00, 128.00, 80.00, '2019-12-16 15:37:00');
INSERT INTO `departments_data` VALUES (14, '12:26:02', 98.20, 93.00, 16.00, 91.00, 66.00, '2019-12-16 15:37:00');
INSERT INTO `departments_data` VALUES (15, '12:26:01', 97.10, 85.00, 16.00, 108.00, 75.00, '2019-12-16 15:37:00');
INSERT INTO `departments_data` VALUES (16, '12:26:48', 96.59, 71.00, 19.00, 124.00, 86.00, '2019-12-16 17:32:00');
INSERT INTO `departments_data` VALUES (17, '12:26:04', 97.93, 69.00, 16.00, 104.00, 83.00, '2019-12-16 17:32:00');
INSERT INTO `departments_data` VALUES (18, '12:26:01', 96.47, 65.00, 19.00, 91.00, 81.00, '2019-12-16 17:32:00');
INSERT INTO `departments_data` VALUES (19, '12:26:48', 96.33, 61.00, 16.00, 139.00, 70.00, '2019-12-16 17:33:01');
INSERT INTO `departments_data` VALUES (20, '12:26:04', 97.19, 63.00, 17.00, 113.00, 77.00, '2019-12-16 17:33:01');
INSERT INTO `departments_data` VALUES (21, '12:26:01', 98.40, 93.00, 16.00, 134.00, 80.00, '2019-12-16 17:33:01');
INSERT INTO `departments_data` VALUES (22, '12:26:48', 96.43, 62.00, 17.00, 115.00, 86.00, '2019-12-17 14:46:00');
INSERT INTO `departments_data` VALUES (23, '12:26:04', 97.89, 79.00, 19.00, 97.00, 88.00, '2019-12-17 14:46:00');
INSERT INTO `departments_data` VALUES (24, '12:26:01', 95.76, 83.00, 16.00, 122.00, 86.00, '2019-12-17 14:46:00');
INSERT INTO `departments_data` VALUES (25, '12:26:48', 96.34, 79.00, 17.00, 94.00, 62.00, '2019-12-17 14:47:00');
INSERT INTO `departments_data` VALUES (26, '12:26:04', 98.90, 95.00, 16.00, 134.00, 64.00, '2019-12-17 14:47:00');
INSERT INTO `departments_data` VALUES (27, '12:26:01', 95.79, 76.00, 16.00, 132.00, 85.00, '2019-12-17 14:47:00');
INSERT INTO `departments_data` VALUES (28, '12:26:48', 95.78, 66.00, 16.00, 115.00, 77.00, '2019-12-17 14:48:00');
INSERT INTO `departments_data` VALUES (29, '12:26:04', 96.43, 83.00, 19.00, 108.00, 66.00, '2019-12-17 14:48:00');
INSERT INTO `departments_data` VALUES (30, '12:26:01', 95.19, 99.00, 16.00, 135.00, 63.00, '2019-12-17 14:48:00');
INSERT INTO `departments_data` VALUES (31, '12:26:48', 99.59, 73.00, 18.00, 133.00, 85.00, '2019-12-17 14:49:00');
INSERT INTO `departments_data` VALUES (32, '12:26:04', 99.19, 90.00, 16.00, 133.00, 89.00, '2019-12-17 14:49:00');
INSERT INTO `departments_data` VALUES (33, '12:26:01', 98.09, 78.00, 17.00, 120.00, 87.00, '2019-12-17 14:49:00');
INSERT INTO `departments_data` VALUES (34, '12:26:48', 96.00, 92.00, 16.00, 137.00, 86.00, '2019-12-17 14:50:00');
INSERT INTO `departments_data` VALUES (35, '12:26:04', 99.21, 85.00, 17.00, 94.00, 78.00, '2019-12-17 14:50:00');
INSERT INTO `departments_data` VALUES (36, '12:26:01', 99.17, 84.00, 19.00, 104.00, 64.00, '2019-12-17 14:50:00');
INSERT INTO `departments_data` VALUES (37, '12:26:48', 98.45, 72.00, 16.00, 106.00, 65.00, '2019-12-17 15:37:00');
INSERT INTO `departments_data` VALUES (38, '12:26:04', 97.16, 65.00, 16.00, 93.00, 60.00, '2019-12-17 15:37:00');
INSERT INTO `departments_data` VALUES (39, '12:26:01', 96.64, 91.00, 19.00, 129.00, 81.00, '2019-12-17 15:37:01');
INSERT INTO `departments_data` VALUES (40, '12:26:48', 99.88, 80.00, 18.00, 97.00, 78.00, '2019-12-17 15:38:00');
INSERT INTO `departments_data` VALUES (41, '12:26:04', 97.89, 79.00, 19.00, 115.00, 85.00, '2019-12-17 15:38:00');
INSERT INTO `departments_data` VALUES (42, '12:26:01', 95.75, 94.00, 17.00, 115.00, 74.00, '2019-12-17 15:38:00');
INSERT INTO `departments_data` VALUES (43, '12:26:48', 99.95, 62.00, 16.00, 105.00, 79.00, '2019-12-17 15:39:00');
INSERT INTO `departments_data` VALUES (44, '12:26:04', 99.07, 65.00, 17.00, 107.00, 89.00, '2019-12-17 15:39:00');
INSERT INTO `departments_data` VALUES (45, '12:26:01', 95.49, 93.00, 18.00, 127.00, 69.00, '2019-12-17 15:39:00');
INSERT INTO `departments_data` VALUES (46, '12:26:48', 97.96, 70.00, 16.00, 117.00, 82.00, '2019-12-17 15:40:00');
INSERT INTO `departments_data` VALUES (47, '12:26:04', 95.27, 90.00, 17.00, 133.00, 80.00, '2019-12-17 15:40:00');
INSERT INTO `departments_data` VALUES (48, '12:26:01', 95.11, 75.00, 18.00, 103.00, 67.00, '2019-12-17 15:40:00');
INSERT INTO `departments_data` VALUES (49, '12:26:48', 95.07, 64.00, 16.00, 97.00, 87.00, '2019-12-17 15:41:00');
INSERT INTO `departments_data` VALUES (50, '12:26:04', 97.35, 97.00, 17.00, 128.00, 71.00, '2019-12-17 15:41:00');
INSERT INTO `departments_data` VALUES (51, '12:26:01', 97.38, 91.00, 19.00, 97.00, 67.00, '2019-12-17 15:41:00');
INSERT INTO `departments_data` VALUES (52, '12:26:48', 95.79, 60.00, 18.00, 124.00, 72.00, '2019-12-17 15:42:00');
INSERT INTO `departments_data` VALUES (53, '12:26:04', 97.11, 84.00, 19.00, 95.00, 68.00, '2019-12-17 15:42:00');
INSERT INTO `departments_data` VALUES (54, '12:26:01', 97.51, 86.00, 18.00, 107.00, 62.00, '2019-12-17 15:42:00');
INSERT INTO `departments_data` VALUES (55, '12:26:48', 97.67, 82.00, 16.00, 113.00, 70.00, '2019-12-17 15:43:00');
INSERT INTO `departments_data` VALUES (56, '12:26:04', 96.09, 63.00, 17.00, 117.00, 79.00, '2019-12-17 15:43:00');
INSERT INTO `departments_data` VALUES (57, '12:26:01', 95.49, 86.00, 18.00, 119.00, 85.00, '2019-12-17 15:43:00');
INSERT INTO `departments_data` VALUES (58, '12:26:48', 98.23, 79.00, 17.00, 114.00, 80.00, '2019-12-17 15:44:00');
INSERT INTO `departments_data` VALUES (59, '12:26:04', 96.55, 62.00, 16.00, 114.00, 68.00, '2019-12-17 15:44:00');
INSERT INTO `departments_data` VALUES (60, '12:26:01', 95.00, 94.00, 19.00, 101.00, 83.00, '2019-12-17 15:44:00');
INSERT INTO `departments_data` VALUES (61, '12:26:48', 97.88, 73.00, 17.00, 128.00, 85.00, '2019-12-17 15:45:00');
INSERT INTO `departments_data` VALUES (62, '12:26:04', 97.27, 98.00, 16.00, 118.00, 61.00, '2019-12-17 15:45:00');
INSERT INTO `departments_data` VALUES (63, '12:26:01', 98.78, 90.00, 18.00, 100.00, 77.00, '2019-12-17 15:45:00');
INSERT INTO `departments_data` VALUES (64, '12:26:48', 98.27, 76.00, 19.00, 138.00, 78.00, '2019-12-17 15:46:00');
INSERT INTO `departments_data` VALUES (65, '12:26:04', 96.31, 72.00, 18.00, 107.00, 81.00, '2019-12-17 15:46:00');
INSERT INTO `departments_data` VALUES (66, '12:26:01', 97.52, 79.00, 18.00, 110.00, 87.00, '2019-12-17 15:46:00');
INSERT INTO `departments_data` VALUES (67, '12:26:48', 99.17, 68.00, 17.00, 101.00, 70.00, '2019-12-17 15:47:00');
INSERT INTO `departments_data` VALUES (68, '12:26:04', 95.99, 95.00, 17.00, 120.00, 60.00, '2019-12-17 15:47:00');
INSERT INTO `departments_data` VALUES (69, '12:26:01', 99.54, 64.00, 19.00, 117.00, 70.00, '2019-12-17 15:47:00');
INSERT INTO `departments_data` VALUES (70, '12:26:48', 95.49, 76.00, 16.00, 101.00, 82.00, '2019-12-17 15:48:00');
INSERT INTO `departments_data` VALUES (71, '12:26:04', 99.24, 95.00, 17.00, 100.00, 89.00, '2019-12-17 15:48:00');
INSERT INTO `departments_data` VALUES (72, '12:26:01', 96.96, 75.00, 16.00, 125.00, 86.00, '2019-12-17 15:48:00');
INSERT INTO `departments_data` VALUES (73, '12:26:48', 96.76, 66.00, 18.00, 116.00, 62.00, '2019-12-17 15:49:00');
INSERT INTO `departments_data` VALUES (74, '12:26:04', 97.48, 99.00, 17.00, 113.00, 64.00, '2019-12-17 15:49:00');
INSERT INTO `departments_data` VALUES (75, '12:26:01', 98.14, 87.00, 17.00, 107.00, 70.00, '2019-12-17 15:49:00');
INSERT INTO `departments_data` VALUES (76, '12:26:48', 99.70, 73.00, 19.00, 101.00, 85.00, '2019-12-17 15:50:00');
INSERT INTO `departments_data` VALUES (77, '12:26:04', 96.07, 76.00, 18.00, 111.00, 65.00, '2019-12-17 15:50:00');
INSERT INTO `departments_data` VALUES (78, '12:26:01', 97.73, 74.00, 18.00, 132.00, 67.00, '2019-12-17 15:50:00');
INSERT INTO `departments_data` VALUES (79, '12:26:48', 98.82, 88.00, 16.00, 98.00, 64.00, '2019-12-17 15:51:00');
INSERT INTO `departments_data` VALUES (80, '12:26:04', 99.85, 86.00, 19.00, 109.00, 66.00, '2019-12-17 15:51:00');
INSERT INTO `departments_data` VALUES (81, '12:26:01', 98.16, 71.00, 16.00, 108.00, 70.00, '2019-12-17 15:51:00');
INSERT INTO `departments_data` VALUES (82, '12:26:48', 99.55, 75.00, 16.00, 131.00, 68.00, '2019-12-17 15:52:00');
INSERT INTO `departments_data` VALUES (83, '12:26:04', 96.91, 65.00, 16.00, 117.00, 69.00, '2019-12-17 15:52:00');
INSERT INTO `departments_data` VALUES (84, '12:26:01', 98.30, 69.00, 16.00, 128.00, 60.00, '2019-12-17 15:52:00');
INSERT INTO `departments_data` VALUES (85, '12:26:48', 98.81, 97.00, 16.00, 129.00, 68.00, '2019-12-17 15:53:00');
INSERT INTO `departments_data` VALUES (86, '12:26:04', 95.06, 64.00, 19.00, 90.00, 84.00, '2019-12-17 15:53:00');
INSERT INTO `departments_data` VALUES (87, '12:26:01', 96.39, 66.00, 17.00, 91.00, 63.00, '2019-12-17 15:53:00');
INSERT INTO `departments_data` VALUES (88, '12:26:48', 95.32, 69.00, 17.00, 127.00, 68.00, '2019-12-17 15:54:00');
INSERT INTO `departments_data` VALUES (89, '12:26:04', 99.47, 79.00, 19.00, 123.00, 74.00, '2019-12-17 15:54:00');
INSERT INTO `departments_data` VALUES (90, '12:26:01', 97.57, 86.00, 19.00, 127.00, 63.00, '2019-12-17 15:54:00');
INSERT INTO `departments_data` VALUES (91, '12:26:48', 97.23, 69.00, 18.00, 124.00, 70.00, '2019-12-17 15:55:00');
INSERT INTO `departments_data` VALUES (92, '12:26:04', 97.78, 89.00, 17.00, 109.00, 77.00, '2019-12-17 15:55:00');
INSERT INTO `departments_data` VALUES (93, '12:26:01', 97.85, 77.00, 17.00, 118.00, 89.00, '2019-12-17 15:55:00');
INSERT INTO `departments_data` VALUES (94, '12:26:48', 96.59, 79.00, 16.00, 100.00, 80.00, '2019-12-17 15:56:00');
INSERT INTO `departments_data` VALUES (95, '12:26:04', 95.21, 60.00, 19.00, 123.00, 74.00, '2019-12-17 15:56:00');
INSERT INTO `departments_data` VALUES (96, '12:26:01', 98.62, 65.00, 19.00, 136.00, 79.00, '2019-12-17 15:56:00');
INSERT INTO `departments_data` VALUES (97, '12:26:48', 99.98, 86.00, 18.00, 137.00, 82.00, '2019-12-17 15:57:00');
INSERT INTO `departments_data` VALUES (98, '12:26:04', 95.50, 91.00, 19.00, 114.00, 64.00, '2019-12-17 15:57:00');
INSERT INTO `departments_data` VALUES (99, '12:26:01', 99.62, 88.00, 17.00, 100.00, 77.00, '2019-12-17 15:57:00');
INSERT INTO `departments_data` VALUES (100, '12:26:48', 96.11, 86.00, 18.00, 110.00, 60.00, '2019-12-17 15:58:00');
INSERT INTO `departments_data` VALUES (101, '12:26:04', 96.77, 71.00, 18.00, 97.00, 80.00, '2019-12-17 15:58:00');
INSERT INTO `departments_data` VALUES (102, '12:26:01', 99.58, 82.00, 19.00, 134.00, 80.00, '2019-12-17 15:58:01');
INSERT INTO `departments_data` VALUES (103, '12:26:48', 98.76, 71.00, 16.00, 121.00, 70.00, '2019-12-17 15:59:00');
INSERT INTO `departments_data` VALUES (104, '12:26:04', 99.36, 87.00, 18.00, 117.00, 61.00, '2019-12-17 15:59:00');
INSERT INTO `departments_data` VALUES (105, '12:26:01', 97.06, 90.00, 18.00, 135.00, 79.00, '2019-12-17 15:59:00');
INSERT INTO `departments_data` VALUES (106, '12:26:48', 98.43, 72.00, 18.00, 115.00, 79.00, '2019-12-17 16:00:00');
INSERT INTO `departments_data` VALUES (107, '12:26:04', 97.32, 67.00, 17.00, 101.00, 76.00, '2019-12-17 16:00:00');
INSERT INTO `departments_data` VALUES (108, '12:26:01', 96.14, 83.00, 19.00, 101.00, 81.00, '2019-12-17 16:00:00');
INSERT INTO `departments_data` VALUES (109, '12:26:48', 99.42, 74.00, 16.00, 105.00, 66.00, '2019-12-17 16:01:00');
INSERT INTO `departments_data` VALUES (110, '12:26:04', 96.34, 96.00, 19.00, 127.00, 81.00, '2019-12-17 16:01:00');
INSERT INTO `departments_data` VALUES (111, '12:26:01', 98.37, 84.00, 17.00, 133.00, 87.00, '2019-12-17 16:01:00');
INSERT INTO `departments_data` VALUES (112, '12:26:48', 99.84, 62.00, 16.00, 106.00, 85.00, '2019-12-17 16:02:00');
INSERT INTO `departments_data` VALUES (113, '12:26:04', 98.16, 98.00, 19.00, 135.00, 78.00, '2019-12-17 16:02:00');
INSERT INTO `departments_data` VALUES (114, '12:26:01', 96.78, 68.00, 18.00, 121.00, 68.00, '2019-12-17 16:02:00');
INSERT INTO `departments_data` VALUES (115, '12:26:48', 95.71, 87.00, 17.00, 119.00, 72.00, '2019-12-17 16:03:00');
INSERT INTO `departments_data` VALUES (116, '12:26:04', 98.39, 79.00, 17.00, 134.00, 73.00, '2019-12-17 16:03:00');
INSERT INTO `departments_data` VALUES (117, '12:26:01', 98.45, 68.00, 18.00, 90.00, 62.00, '2019-12-17 16:03:00');
INSERT INTO `departments_data` VALUES (118, '12:26:48', 98.50, 85.00, 18.00, 138.00, 76.00, '2019-12-17 16:04:00');
INSERT INTO `departments_data` VALUES (119, '12:26:04', 95.17, 63.00, 18.00, 92.00, 78.00, '2019-12-17 16:04:00');
INSERT INTO `departments_data` VALUES (120, '12:26:01', 95.23, 63.00, 18.00, 118.00, 84.00, '2019-12-17 16:04:00');
INSERT INTO `departments_data` VALUES (121, '12:26:48', 97.39, 75.00, 16.00, 109.00, 68.00, '2019-12-17 16:05:00');
INSERT INTO `departments_data` VALUES (122, '12:26:04', 99.83, 88.00, 16.00, 131.00, 83.00, '2019-12-17 16:05:00');
INSERT INTO `departments_data` VALUES (123, '12:26:01', 95.38, 66.00, 19.00, 109.00, 82.00, '2019-12-17 16:05:00');
INSERT INTO `departments_data` VALUES (124, '12:26:48', 95.32, 92.00, 16.00, 102.00, 87.00, '2019-12-17 16:06:00');
INSERT INTO `departments_data` VALUES (125, '12:26:04', 96.67, 95.00, 17.00, 99.00, 80.00, '2019-12-17 16:06:00');
INSERT INTO `departments_data` VALUES (126, '12:26:01', 95.47, 61.00, 17.00, 119.00, 64.00, '2019-12-17 16:06:00');
INSERT INTO `departments_data` VALUES (127, '12:26:48', 95.46, 86.00, 16.00, 127.00, 77.00, '2019-12-17 16:07:00');
INSERT INTO `departments_data` VALUES (128, '12:26:04', 97.58, 77.00, 16.00, 92.00, 62.00, '2019-12-17 16:07:00');
INSERT INTO `departments_data` VALUES (129, '12:26:01', 98.41, 72.00, 17.00, 97.00, 81.00, '2019-12-17 16:07:00');
INSERT INTO `departments_data` VALUES (130, '12:26:48', 96.12, 88.00, 19.00, 94.00, 83.00, '2019-12-17 16:08:00');
INSERT INTO `departments_data` VALUES (131, '12:26:04', 98.40, 74.00, 16.00, 129.00, 67.00, '2019-12-17 16:08:00');
INSERT INTO `departments_data` VALUES (132, '12:26:01', 99.79, 85.00, 16.00, 90.00, 67.00, '2019-12-17 16:08:00');
INSERT INTO `departments_data` VALUES (133, '12:26:48', 98.46, 88.00, 19.00, 132.00, 71.00, '2019-12-17 16:09:00');
INSERT INTO `departments_data` VALUES (134, '12:26:04', 95.16, 76.00, 19.00, 92.00, 74.00, '2019-12-17 16:09:00');
INSERT INTO `departments_data` VALUES (135, '12:26:01', 99.29, 93.00, 19.00, 129.00, 79.00, '2019-12-17 16:09:00');
INSERT INTO `departments_data` VALUES (136, '12:26:48', 97.16, 94.00, 16.00, 102.00, 82.00, '2019-12-17 16:10:00');
INSERT INTO `departments_data` VALUES (137, '12:26:04', 96.59, 70.00, 17.00, 106.00, 87.00, '2019-12-17 16:10:00');
INSERT INTO `departments_data` VALUES (138, '12:26:01', 99.37, 97.00, 19.00, 90.00, 77.00, '2019-12-17 16:10:00');
INSERT INTO `departments_data` VALUES (139, '12:26:48', 98.45, 87.00, 17.00, 136.00, 61.00, '2019-12-17 16:11:00');
INSERT INTO `departments_data` VALUES (140, '12:26:04', 96.63, 65.00, 18.00, 123.00, 69.00, '2019-12-17 16:11:00');
INSERT INTO `departments_data` VALUES (141, '12:26:01', 99.86, 96.00, 17.00, 127.00, 65.00, '2019-12-17 16:11:00');
INSERT INTO `departments_data` VALUES (142, '12:26:48', 96.29, 90.00, 19.00, 105.00, 84.00, '2019-12-17 16:12:00');
INSERT INTO `departments_data` VALUES (143, '12:26:04', 98.82, 98.00, 16.00, 107.00, 70.00, '2019-12-17 16:12:00');
INSERT INTO `departments_data` VALUES (144, '12:26:01', 95.75, 92.00, 16.00, 110.00, 77.00, '2019-12-17 16:12:00');
INSERT INTO `departments_data` VALUES (145, '12:26:48', 99.40, 92.00, 16.00, 112.00, 74.00, '2019-12-17 16:13:00');
INSERT INTO `departments_data` VALUES (146, '12:26:04', 99.79, 98.00, 19.00, 125.00, 79.00, '2019-12-17 16:13:00');
INSERT INTO `departments_data` VALUES (147, '12:26:01', 96.75, 97.00, 18.00, 107.00, 80.00, '2019-12-17 16:13:00');
INSERT INTO `departments_data` VALUES (148, '12:26:48', 97.80, 76.00, 18.00, 120.00, 60.00, '2019-12-17 16:14:00');
INSERT INTO `departments_data` VALUES (149, '12:26:04', 96.99, 67.00, 16.00, 138.00, 77.00, '2019-12-17 16:14:00');
INSERT INTO `departments_data` VALUES (150, '12:26:01', 97.86, 96.00, 16.00, 117.00, 74.00, '2019-12-17 16:14:00');
INSERT INTO `departments_data` VALUES (151, '12:26:48', 98.97, 61.00, 17.00, 130.00, 72.00, '2019-12-17 16:15:00');
INSERT INTO `departments_data` VALUES (152, '12:26:04', 97.62, 95.00, 18.00, 115.00, 78.00, '2019-12-17 16:15:00');
INSERT INTO `departments_data` VALUES (153, '12:26:01', 95.69, 71.00, 17.00, 122.00, 61.00, '2019-12-17 16:15:00');
INSERT INTO `departments_data` VALUES (154, '12:26:48', 97.12, 93.00, 18.00, 124.00, 81.00, '2019-12-17 16:16:00');
INSERT INTO `departments_data` VALUES (155, '12:26:04', 97.13, 78.00, 16.00, 103.00, 65.00, '2019-12-17 16:16:00');
INSERT INTO `departments_data` VALUES (156, '12:26:01', 97.34, 87.00, 17.00, 119.00, 89.00, '2019-12-17 16:16:00');
INSERT INTO `departments_data` VALUES (157, '12:26:48', 99.03, 94.00, 16.00, 135.00, 64.00, '2019-12-17 16:17:00');
INSERT INTO `departments_data` VALUES (158, '12:26:04', 97.52, 93.00, 19.00, 135.00, 83.00, '2019-12-17 16:17:00');
INSERT INTO `departments_data` VALUES (159, '12:26:01', 99.21, 72.00, 16.00, 101.00, 74.00, '2019-12-17 16:17:00');
INSERT INTO `departments_data` VALUES (160, '12:26:48', 95.51, 89.00, 18.00, 129.00, 81.00, '2019-12-17 16:18:00');
INSERT INTO `departments_data` VALUES (161, '12:26:04', 95.34, 88.00, 18.00, 90.00, 73.00, '2019-12-17 16:18:00');
INSERT INTO `departments_data` VALUES (162, '12:26:01', 97.70, 91.00, 17.00, 132.00, 85.00, '2019-12-17 16:18:00');
INSERT INTO `departments_data` VALUES (163, '12:26:48', 99.59, 77.00, 19.00, 123.00, 78.00, '2019-12-17 16:19:00');
INSERT INTO `departments_data` VALUES (164, '12:26:04', 99.19, 73.00, 16.00, 98.00, 69.00, '2019-12-17 16:19:00');
INSERT INTO `departments_data` VALUES (165, '12:26:01', 97.82, 67.00, 19.00, 108.00, 83.00, '2019-12-17 16:19:00');
INSERT INTO `departments_data` VALUES (166, '12:26:48', 97.06, 93.00, 17.00, 95.00, 86.00, '2019-12-17 16:20:00');
INSERT INTO `departments_data` VALUES (167, '12:26:04', 96.62, 70.00, 16.00, 92.00, 87.00, '2019-12-17 16:20:00');
INSERT INTO `departments_data` VALUES (168, '12:26:01', 99.92, 84.00, 19.00, 111.00, 76.00, '2019-12-17 16:20:00');
INSERT INTO `departments_data` VALUES (169, '12:26:48', 97.30, 80.00, 19.00, 129.00, 78.00, '2019-12-17 16:21:00');
INSERT INTO `departments_data` VALUES (170, '12:26:04', 99.32, 71.00, 16.00, 99.00, 88.00, '2019-12-17 16:21:00');
INSERT INTO `departments_data` VALUES (171, '12:26:01', 98.16, 92.00, 17.00, 131.00, 82.00, '2019-12-17 16:21:00');
INSERT INTO `departments_data` VALUES (172, '12:26:48', 96.57, 99.00, 16.00, 111.00, 76.00, '2019-12-17 16:22:00');
INSERT INTO `departments_data` VALUES (173, '12:26:04', 97.79, 69.00, 19.00, 136.00, 61.00, '2019-12-17 16:22:00');
INSERT INTO `departments_data` VALUES (174, '12:26:01', 99.12, 90.00, 19.00, 124.00, 75.00, '2019-12-17 16:22:00');
INSERT INTO `departments_data` VALUES (175, '12:26:48', 96.52, 88.00, 18.00, 119.00, 64.00, '2019-12-17 16:23:00');
INSERT INTO `departments_data` VALUES (176, '12:26:04', 96.28, 72.00, 19.00, 122.00, 61.00, '2019-12-17 16:23:00');
INSERT INTO `departments_data` VALUES (177, '12:26:01', 95.05, 68.00, 19.00, 132.00, 68.00, '2019-12-17 16:23:00');
INSERT INTO `departments_data` VALUES (178, '12:26:48', 98.83, 87.00, 18.00, 102.00, 84.00, '2019-12-17 16:24:00');
INSERT INTO `departments_data` VALUES (179, '12:26:04', 99.99, 61.00, 19.00, 136.00, 64.00, '2019-12-17 16:24:00');
INSERT INTO `departments_data` VALUES (180, '12:26:01', 98.42, 61.00, 17.00, 114.00, 73.00, '2019-12-17 16:24:00');
INSERT INTO `departments_data` VALUES (181, '12:26:48', 95.92, 82.00, 16.00, 92.00, 73.00, '2019-12-17 16:25:00');
INSERT INTO `departments_data` VALUES (182, '12:26:04', 95.94, 61.00, 16.00, 106.00, 78.00, '2019-12-17 16:25:00');
INSERT INTO `departments_data` VALUES (183, '12:26:01', 98.28, 65.00, 17.00, 133.00, 85.00, '2019-12-17 16:25:00');
INSERT INTO `departments_data` VALUES (184, '12:26:48', 95.96, 86.00, 16.00, 98.00, 87.00, '2019-12-17 16:26:00');
INSERT INTO `departments_data` VALUES (185, '12:26:04', 95.08, 80.00, 16.00, 115.00, 62.00, '2019-12-17 16:26:00');
INSERT INTO `departments_data` VALUES (186, '12:26:01', 98.62, 87.00, 17.00, 129.00, 88.00, '2019-12-17 16:26:00');
INSERT INTO `departments_data` VALUES (187, '12:26:48', 98.85, 76.00, 17.00, 137.00, 84.00, '2019-12-17 16:27:00');
INSERT INTO `departments_data` VALUES (188, '12:26:04', 99.27, 62.00, 16.00, 130.00, 82.00, '2019-12-17 16:27:00');
INSERT INTO `departments_data` VALUES (189, '12:26:01', 97.80, 61.00, 16.00, 138.00, 86.00, '2019-12-17 16:27:00');
INSERT INTO `departments_data` VALUES (190, '12:26:48', 96.75, 74.00, 19.00, 114.00, 80.00, '2019-12-17 16:28:00');
INSERT INTO `departments_data` VALUES (191, '12:26:04', 95.25, 81.00, 19.00, 120.00, 78.00, '2019-12-17 16:28:00');
INSERT INTO `departments_data` VALUES (192, '12:26:01', 98.19, 77.00, 17.00, 133.00, 75.00, '2019-12-17 16:28:00');
INSERT INTO `departments_data` VALUES (193, '12:26:48', 99.86, 60.00, 17.00, 127.00, 77.00, '2019-12-17 16:29:00');
INSERT INTO `departments_data` VALUES (194, '12:26:04', 99.49, 95.00, 16.00, 95.00, 76.00, '2019-12-17 16:29:00');
INSERT INTO `departments_data` VALUES (195, '12:26:01', 97.67, 61.00, 17.00, 124.00, 84.00, '2019-12-17 16:29:00');
INSERT INTO `departments_data` VALUES (196, '12:26:48', 95.35, 67.00, 19.00, 112.00, 61.00, '2019-12-17 16:30:00');
INSERT INTO `departments_data` VALUES (197, '12:26:04', 97.05, 89.00, 17.00, 128.00, 62.00, '2019-12-17 16:30:00');
INSERT INTO `departments_data` VALUES (198, '12:26:01', 96.95, 61.00, 19.00, 98.00, 76.00, '2019-12-17 16:30:00');
INSERT INTO `departments_data` VALUES (199, '12:26:48', 98.72, 75.00, 19.00, 131.00, 71.00, '2019-12-17 16:31:00');
INSERT INTO `departments_data` VALUES (200, '12:26:04', 96.36, 76.00, 17.00, 101.00, 84.00, '2019-12-17 16:31:00');
INSERT INTO `departments_data` VALUES (201, '12:26:01', 98.32, 76.00, 16.00, 112.00, 78.00, '2019-12-17 16:31:00');
INSERT INTO `departments_data` VALUES (202, '12:26:48', 98.50, 98.00, 16.00, 93.00, 66.00, '2019-12-17 16:32:00');
INSERT INTO `departments_data` VALUES (203, '12:26:04', 95.65, 68.00, 16.00, 136.00, 82.00, '2019-12-17 16:32:00');
INSERT INTO `departments_data` VALUES (204, '12:26:01', 95.90, 62.00, 16.00, 121.00, 88.00, '2019-12-17 16:32:00');
INSERT INTO `departments_data` VALUES (205, '12:26:48', 96.66, 81.00, 19.00, 102.00, 80.00, '2019-12-17 16:33:00');
INSERT INTO `departments_data` VALUES (206, '12:26:04', 98.49, 92.00, 17.00, 131.00, 62.00, '2019-12-17 16:33:00');
INSERT INTO `departments_data` VALUES (207, '12:26:01', 97.44, 74.00, 16.00, 115.00, 82.00, '2019-12-17 16:33:00');
INSERT INTO `departments_data` VALUES (208, '12:26:48', 98.17, 67.00, 19.00, 120.00, 87.00, '2019-12-17 16:34:00');
INSERT INTO `departments_data` VALUES (209, '12:26:04', 98.00, 81.00, 18.00, 96.00, 65.00, '2019-12-17 16:34:00');
INSERT INTO `departments_data` VALUES (210, '12:26:01', 96.90, 67.00, 18.00, 119.00, 80.00, '2019-12-17 16:34:00');
INSERT INTO `departments_data` VALUES (211, '12:26:48', 97.00, 69.00, 16.00, 134.00, 67.00, '2019-12-17 16:35:00');
INSERT INTO `departments_data` VALUES (212, '12:26:04', 99.97, 76.00, 16.00, 95.00, 75.00, '2019-12-17 16:35:00');
INSERT INTO `departments_data` VALUES (213, '12:26:01', 97.00, 78.00, 17.00, 96.00, 62.00, '2019-12-17 16:35:00');
INSERT INTO `departments_data` VALUES (214, '12:26:48', 96.80, 62.00, 18.00, 114.00, 89.00, '2019-12-17 16:36:00');
INSERT INTO `departments_data` VALUES (215, '12:26:04', 95.22, 64.00, 17.00, 119.00, 64.00, '2019-12-17 16:36:00');
INSERT INTO `departments_data` VALUES (216, '12:26:01', 95.71, 90.00, 17.00, 123.00, 83.00, '2019-12-17 16:36:00');
INSERT INTO `departments_data` VALUES (217, '12:26:48', 99.20, 63.00, 17.00, 97.00, 60.00, '2019-12-17 16:37:00');
INSERT INTO `departments_data` VALUES (218, '12:26:04', 99.14, 67.00, 19.00, 102.00, 72.00, '2019-12-17 16:37:00');
INSERT INTO `departments_data` VALUES (219, '12:26:01', 99.58, 89.00, 16.00, 118.00, 68.00, '2019-12-17 16:37:00');
INSERT INTO `departments_data` VALUES (220, '12:26:48', 95.22, 98.00, 19.00, 125.00, 80.00, '2019-12-17 16:38:00');
INSERT INTO `departments_data` VALUES (221, '12:26:04', 96.55, 91.00, 17.00, 139.00, 68.00, '2019-12-17 16:38:00');
INSERT INTO `departments_data` VALUES (222, '12:26:01', 96.28, 77.00, 17.00, 119.00, 88.00, '2019-12-17 16:38:00');
INSERT INTO `departments_data` VALUES (223, '12:26:48', 95.40, 62.00, 19.00, 126.00, 79.00, '2019-12-17 16:39:00');
INSERT INTO `departments_data` VALUES (224, '12:26:04', 97.41, 97.00, 19.00, 114.00, 73.00, '2019-12-17 16:39:00');
INSERT INTO `departments_data` VALUES (225, '12:26:01', 97.90, 86.00, 18.00, 121.00, 66.00, '2019-12-17 16:39:00');
INSERT INTO `departments_data` VALUES (226, '12:26:48', 95.60, 83.00, 17.00, 109.00, 79.00, '2019-12-17 16:40:00');
INSERT INTO `departments_data` VALUES (227, '12:26:04', 97.83, 94.00, 19.00, 119.00, 75.00, '2019-12-17 16:40:00');
INSERT INTO `departments_data` VALUES (228, '12:26:01', 96.41, 76.00, 16.00, 114.00, 61.00, '2019-12-17 16:40:00');
INSERT INTO `departments_data` VALUES (229, '12:26:48', 97.74, 93.00, 19.00, 136.00, 84.00, '2019-12-17 16:41:00');
INSERT INTO `departments_data` VALUES (230, '12:26:04', 97.39, 72.00, 17.00, 106.00, 66.00, '2019-12-17 16:41:00');
INSERT INTO `departments_data` VALUES (231, '12:26:01', 97.42, 68.00, 18.00, 94.00, 69.00, '2019-12-17 16:41:00');
INSERT INTO `departments_data` VALUES (232, '12:26:48', 95.33, 65.00, 19.00, 136.00, 87.00, '2019-12-17 16:42:00');
INSERT INTO `departments_data` VALUES (233, '12:26:04', 95.25, 69.00, 18.00, 117.00, 83.00, '2019-12-17 16:42:00');
INSERT INTO `departments_data` VALUES (234, '12:26:01', 97.50, 81.00, 17.00, 122.00, 75.00, '2019-12-17 16:42:00');
INSERT INTO `departments_data` VALUES (235, '12:26:48', 95.77, 75.00, 16.00, 125.00, 80.00, '2019-12-17 16:43:00');
INSERT INTO `departments_data` VALUES (236, '12:26:04', 97.72, 88.00, 16.00, 117.00, 67.00, '2019-12-17 16:43:00');
INSERT INTO `departments_data` VALUES (237, '12:26:01', 96.16, 82.00, 16.00, 127.00, 79.00, '2019-12-17 16:43:00');
INSERT INTO `departments_data` VALUES (238, '12:26:48', 99.50, 99.00, 16.00, 109.00, 75.00, '2019-12-17 16:44:00');
INSERT INTO `departments_data` VALUES (239, '12:26:04', 96.78, 72.00, 19.00, 130.00, 88.00, '2019-12-17 16:44:00');
INSERT INTO `departments_data` VALUES (240, '12:26:01', 97.49, 79.00, 19.00, 120.00, 65.00, '2019-12-17 16:44:00');
INSERT INTO `departments_data` VALUES (241, '12:26:48', 97.91, 83.00, 17.00, 110.00, 84.00, '2019-12-17 16:45:00');
INSERT INTO `departments_data` VALUES (242, '12:26:04', 99.21, 80.00, 16.00, 135.00, 80.00, '2019-12-17 16:45:00');
INSERT INTO `departments_data` VALUES (243, '12:26:01', 96.96, 97.00, 16.00, 92.00, 80.00, '2019-12-17 16:45:00');
INSERT INTO `departments_data` VALUES (244, '12:26:48', 98.93, 91.00, 18.00, 130.00, 77.00, '2019-12-17 16:46:00');
INSERT INTO `departments_data` VALUES (245, '12:26:04', 98.28, 88.00, 18.00, 99.00, 64.00, '2019-12-17 16:46:00');
INSERT INTO `departments_data` VALUES (246, '12:26:01', 95.28, 91.00, 18.00, 101.00, 61.00, '2019-12-17 16:46:00');
INSERT INTO `departments_data` VALUES (247, '12:26:48', 95.84, 89.00, 18.00, 130.00, 76.00, '2019-12-17 16:47:00');
INSERT INTO `departments_data` VALUES (248, '12:26:04', 95.95, 84.00, 17.00, 112.00, 72.00, '2019-12-17 16:47:00');
INSERT INTO `departments_data` VALUES (249, '12:26:01', 99.49, 71.00, 18.00, 137.00, 86.00, '2019-12-17 16:47:00');
INSERT INTO `departments_data` VALUES (250, '12:26:48', 98.89, 87.00, 16.00, 94.00, 76.00, '2019-12-17 16:48:00');
INSERT INTO `departments_data` VALUES (251, '12:26:04', 99.82, 77.00, 19.00, 117.00, 67.00, '2019-12-17 16:48:00');
INSERT INTO `departments_data` VALUES (252, '12:26:01', 97.24, 79.00, 17.00, 121.00, 67.00, '2019-12-17 16:48:00');
INSERT INTO `departments_data` VALUES (253, '12:26:48', 98.43, 98.00, 18.00, 123.00, 81.00, '2019-12-17 16:49:00');
INSERT INTO `departments_data` VALUES (254, '12:26:04', 98.32, 81.00, 17.00, 116.00, 89.00, '2019-12-17 16:49:00');
INSERT INTO `departments_data` VALUES (255, '12:26:01', 99.62, 74.00, 16.00, 116.00, 66.00, '2019-12-17 16:49:00');
INSERT INTO `departments_data` VALUES (256, '12:26:48', 97.89, 61.00, 16.00, 117.00, 60.00, '2019-12-17 16:50:00');
INSERT INTO `departments_data` VALUES (257, '12:26:04', 99.95, 93.00, 17.00, 102.00, 75.00, '2019-12-17 16:50:00');
INSERT INTO `departments_data` VALUES (258, '12:26:01', 95.04, 94.00, 19.00, 106.00, 83.00, '2019-12-17 16:50:00');
INSERT INTO `departments_data` VALUES (259, '12:26:48', 97.51, 71.00, 17.00, 123.00, 89.00, '2019-12-17 16:51:00');
INSERT INTO `departments_data` VALUES (260, '12:26:04', 97.23, 71.00, 18.00, 120.00, 74.00, '2019-12-17 16:51:00');
INSERT INTO `departments_data` VALUES (261, '12:26:01', 97.47, 69.00, 19.00, 100.00, 63.00, '2019-12-17 16:51:00');
INSERT INTO `departments_data` VALUES (262, '12:26:48', 97.03, 63.00, 17.00, 106.00, 71.00, '2019-12-17 16:52:00');
INSERT INTO `departments_data` VALUES (263, '12:26:04', 96.40, 86.00, 17.00, 105.00, 70.00, '2019-12-17 16:52:00');
INSERT INTO `departments_data` VALUES (264, '12:26:01', 98.05, 62.00, 19.00, 135.00, 73.00, '2019-12-17 16:52:00');
INSERT INTO `departments_data` VALUES (265, '12:26:48', 95.68, 77.00, 16.00, 123.00, 73.00, '2019-12-17 16:53:00');
INSERT INTO `departments_data` VALUES (266, '12:26:04', 97.67, 95.00, 16.00, 108.00, 64.00, '2019-12-17 16:53:00');
INSERT INTO `departments_data` VALUES (267, '12:26:01', 98.38, 89.00, 19.00, 131.00, 62.00, '2019-12-17 16:53:00');
INSERT INTO `departments_data` VALUES (268, '12:26:48', 98.16, 77.00, 16.00, 133.00, 66.00, '2019-12-17 16:54:00');
INSERT INTO `departments_data` VALUES (269, '12:26:04', 96.62, 76.00, 19.00, 139.00, 60.00, '2019-12-17 16:54:00');
INSERT INTO `departments_data` VALUES (270, '12:26:01', 99.24, 63.00, 16.00, 134.00, 85.00, '2019-12-17 16:54:00');
INSERT INTO `departments_data` VALUES (271, '12:26:48', 99.64, 77.00, 19.00, 125.00, 81.00, '2019-12-17 16:55:00');
INSERT INTO `departments_data` VALUES (272, '12:26:04', 97.16, 68.00, 19.00, 105.00, 73.00, '2019-12-17 16:55:00');
INSERT INTO `departments_data` VALUES (273, '12:26:01', 99.58, 78.00, 19.00, 106.00, 65.00, '2019-12-17 16:55:00');
INSERT INTO `departments_data` VALUES (274, '12:26:48', 98.95, 90.00, 17.00, 104.00, 76.00, '2019-12-17 16:56:00');
INSERT INTO `departments_data` VALUES (275, '12:26:04', 98.78, 90.00, 18.00, 103.00, 74.00, '2019-12-17 16:56:00');
INSERT INTO `departments_data` VALUES (276, '12:26:01', 98.72, 92.00, 19.00, 100.00, 81.00, '2019-12-17 16:56:00');
INSERT INTO `departments_data` VALUES (277, '12:26:48', 96.36, 94.00, 17.00, 102.00, 61.00, '2019-12-17 16:57:00');
INSERT INTO `departments_data` VALUES (278, '12:26:04', 98.00, 97.00, 19.00, 117.00, 63.00, '2019-12-17 16:57:00');
INSERT INTO `departments_data` VALUES (279, '12:26:01', 98.72, 79.00, 18.00, 134.00, 72.00, '2019-12-17 16:57:00');
INSERT INTO `departments_data` VALUES (280, '12:26:48', 97.15, 93.00, 19.00, 105.00, 74.00, '2019-12-17 16:58:00');
INSERT INTO `departments_data` VALUES (281, '12:26:04', 96.37, 78.00, 17.00, 133.00, 76.00, '2019-12-17 16:58:00');
INSERT INTO `departments_data` VALUES (282, '12:26:01', 99.53, 68.00, 19.00, 128.00, 80.00, '2019-12-17 16:58:00');
INSERT INTO `departments_data` VALUES (283, '12:26:48', 96.46, 64.00, 19.00, 121.00, 88.00, '2019-12-17 16:59:00');
INSERT INTO `departments_data` VALUES (284, '12:26:04', 95.82, 80.00, 16.00, 122.00, 62.00, '2019-12-17 16:59:00');
INSERT INTO `departments_data` VALUES (285, '12:26:01', 96.16, 81.00, 17.00, 122.00, 74.00, '2019-12-17 16:59:00');
INSERT INTO `departments_data` VALUES (286, '12:26:48', 95.33, 81.00, 18.00, 139.00, 68.00, '2019-12-17 17:00:00');
INSERT INTO `departments_data` VALUES (287, '12:26:04', 97.46, 68.00, 17.00, 95.00, 82.00, '2019-12-17 17:00:00');
INSERT INTO `departments_data` VALUES (288, '12:26:01', 95.44, 86.00, 17.00, 105.00, 79.00, '2019-12-17 17:00:00');
INSERT INTO `departments_data` VALUES (289, '12:26:48', 95.02, 77.00, 16.00, 134.00, 81.00, '2019-12-17 17:01:00');
INSERT INTO `departments_data` VALUES (290, '12:26:04', 98.13, 98.00, 17.00, 123.00, 62.00, '2019-12-17 17:01:00');
INSERT INTO `departments_data` VALUES (291, '12:26:01', 99.18, 78.00, 17.00, 90.00, 64.00, '2019-12-17 17:01:00');
INSERT INTO `departments_data` VALUES (292, '12:26:48', 95.15, 81.00, 19.00, 131.00, 66.00, '2019-12-17 17:02:00');
INSERT INTO `departments_data` VALUES (293, '12:26:04', 97.69, 86.00, 18.00, 112.00, 80.00, '2019-12-17 17:02:00');
INSERT INTO `departments_data` VALUES (294, '12:26:01', 97.17, 93.00, 16.00, 113.00, 83.00, '2019-12-17 17:02:00');
INSERT INTO `departments_data` VALUES (295, '12:26:48', 95.36, 69.00, 19.00, 117.00, 88.00, '2019-12-17 17:03:00');
INSERT INTO `departments_data` VALUES (296, '12:26:04', 96.56, 61.00, 16.00, 125.00, 86.00, '2019-12-17 17:03:00');
INSERT INTO `departments_data` VALUES (297, '12:26:01', 95.99, 80.00, 16.00, 104.00, 82.00, '2019-12-17 17:03:00');
INSERT INTO `departments_data` VALUES (298, '12:26:48', 97.82, 83.00, 17.00, 122.00, 67.00, '2019-12-17 17:04:00');
INSERT INTO `departments_data` VALUES (299, '12:26:04', 98.99, 93.00, 19.00, 108.00, 70.00, '2019-12-17 17:04:00');
INSERT INTO `departments_data` VALUES (300, '12:26:01', 97.51, 93.00, 16.00, 90.00, 86.00, '2019-12-17 17:04:00');
INSERT INTO `departments_data` VALUES (301, '12:26:48', 99.75, 70.00, 18.00, 90.00, 60.00, '2019-12-17 17:05:00');
INSERT INTO `departments_data` VALUES (302, '12:26:04', 98.65, 78.00, 19.00, 103.00, 63.00, '2019-12-17 17:05:00');
INSERT INTO `departments_data` VALUES (303, '12:26:01', 98.13, 99.00, 18.00, 102.00, 62.00, '2019-12-17 17:05:00');
INSERT INTO `departments_data` VALUES (304, '12:26:48', 95.72, 63.00, 17.00, 103.00, 77.00, '2019-12-17 17:06:00');
INSERT INTO `departments_data` VALUES (305, '12:26:04', 97.56, 73.00, 18.00, 116.00, 74.00, '2019-12-17 17:06:00');
INSERT INTO `departments_data` VALUES (306, '12:26:01', 99.19, 65.00, 19.00, 131.00, 86.00, '2019-12-17 17:06:00');
INSERT INTO `departments_data` VALUES (307, '12:26:48', 99.52, 94.00, 18.00, 132.00, 71.00, '2019-12-17 17:07:00');
INSERT INTO `departments_data` VALUES (308, '12:26:04', 96.14, 65.00, 19.00, 108.00, 78.00, '2019-12-17 17:07:00');
INSERT INTO `departments_data` VALUES (309, '12:26:01', 99.85, 98.00, 16.00, 105.00, 86.00, '2019-12-17 17:07:00');
INSERT INTO `departments_data` VALUES (310, '12:26:48', 95.37, 70.00, 19.00, 106.00, 71.00, '2019-12-17 17:08:00');
INSERT INTO `departments_data` VALUES (311, '12:26:04', 99.81, 74.00, 17.00, 138.00, 65.00, '2019-12-17 17:08:00');
INSERT INTO `departments_data` VALUES (312, '12:26:01', 95.31, 83.00, 17.00, 125.00, 88.00, '2019-12-17 17:08:00');
INSERT INTO `departments_data` VALUES (313, '12:26:48', 96.68, 60.00, 18.00, 95.00, 72.00, '2019-12-17 17:09:00');
INSERT INTO `departments_data` VALUES (314, '12:26:04', 96.48, 63.00, 17.00, 139.00, 61.00, '2019-12-17 17:09:00');
INSERT INTO `departments_data` VALUES (315, '12:26:01', 99.09, 73.00, 16.00, 96.00, 61.00, '2019-12-17 17:09:00');
INSERT INTO `departments_data` VALUES (316, '12:26:48', 96.63, 99.00, 17.00, 103.00, 66.00, '2019-12-17 17:10:00');
INSERT INTO `departments_data` VALUES (317, '12:26:04', 98.39, 92.00, 19.00, 125.00, 74.00, '2019-12-17 17:10:00');
INSERT INTO `departments_data` VALUES (318, '12:26:01', 97.46, 77.00, 16.00, 117.00, 62.00, '2019-12-17 17:10:00');
INSERT INTO `departments_data` VALUES (319, '12:26:48', 95.62, 93.00, 19.00, 93.00, 85.00, '2019-12-17 17:11:00');
INSERT INTO `departments_data` VALUES (320, '12:26:04', 96.36, 85.00, 18.00, 98.00, 72.00, '2019-12-17 17:11:00');
INSERT INTO `departments_data` VALUES (321, '12:26:01', 95.90, 64.00, 18.00, 103.00, 66.00, '2019-12-17 17:11:00');
INSERT INTO `departments_data` VALUES (322, '12:26:48', 99.05, 83.00, 19.00, 130.00, 68.00, '2019-12-17 17:12:00');
INSERT INTO `departments_data` VALUES (323, '12:26:04', 99.42, 60.00, 18.00, 125.00, 65.00, '2019-12-17 17:12:00');
INSERT INTO `departments_data` VALUES (324, '12:26:01', 97.09, 98.00, 17.00, 130.00, 61.00, '2019-12-17 17:12:00');
INSERT INTO `departments_data` VALUES (325, '12:26:48', 97.89, 66.00, 17.00, 101.00, 74.00, '2019-12-17 17:13:00');
INSERT INTO `departments_data` VALUES (326, '12:26:04', 99.49, 93.00, 18.00, 126.00, 72.00, '2019-12-17 17:13:00');
INSERT INTO `departments_data` VALUES (327, '12:26:01', 95.49, 61.00, 19.00, 132.00, 63.00, '2019-12-17 17:13:00');
INSERT INTO `departments_data` VALUES (328, '12:26:48', 98.41, 95.00, 17.00, 117.00, 71.00, '2019-12-17 17:14:00');
INSERT INTO `departments_data` VALUES (329, '12:26:04', 99.34, 67.00, 18.00, 117.00, 73.00, '2019-12-17 17:14:00');
INSERT INTO `departments_data` VALUES (330, '12:26:01', 97.08, 88.00, 17.00, 138.00, 87.00, '2019-12-17 17:14:00');
INSERT INTO `departments_data` VALUES (331, '12:26:48', 95.60, 65.00, 19.00, 101.00, 76.00, '2019-12-17 17:15:00');
INSERT INTO `departments_data` VALUES (332, '12:26:04', 97.55, 98.00, 19.00, 137.00, 86.00, '2019-12-17 17:15:00');
INSERT INTO `departments_data` VALUES (333, '12:26:01', 95.54, 93.00, 19.00, 124.00, 68.00, '2019-12-17 17:15:00');
INSERT INTO `departments_data` VALUES (334, '12:26:48', 95.55, 94.00, 17.00, 116.00, 67.00, '2019-12-17 17:16:00');
INSERT INTO `departments_data` VALUES (335, '12:26:04', 99.57, 84.00, 16.00, 124.00, 80.00, '2019-12-17 17:16:00');
INSERT INTO `departments_data` VALUES (336, '12:26:01', 97.37, 85.00, 18.00, 92.00, 82.00, '2019-12-17 17:16:00');
INSERT INTO `departments_data` VALUES (337, '12:26:48', 96.95, 97.00, 18.00, 115.00, 81.00, '2019-12-17 17:17:00');
INSERT INTO `departments_data` VALUES (338, '12:26:04', 96.19, 66.00, 18.00, 101.00, 73.00, '2019-12-17 17:17:00');
INSERT INTO `departments_data` VALUES (339, '12:26:01', 99.10, 87.00, 19.00, 134.00, 73.00, '2019-12-17 17:17:00');
INSERT INTO `departments_data` VALUES (340, '12:26:48', 99.02, 67.00, 18.00, 139.00, 70.00, '2019-12-17 17:18:00');
INSERT INTO `departments_data` VALUES (341, '12:26:04', 99.15, 61.00, 16.00, 132.00, 73.00, '2019-12-17 17:18:00');
INSERT INTO `departments_data` VALUES (342, '12:26:01', 95.10, 72.00, 16.00, 114.00, 83.00, '2019-12-17 17:18:00');
INSERT INTO `departments_data` VALUES (343, '12:26:48', 98.47, 68.00, 19.00, 107.00, 61.00, '2019-12-17 17:19:00');
INSERT INTO `departments_data` VALUES (344, '12:26:04', 97.28, 64.00, 17.00, 100.00, 60.00, '2019-12-17 17:19:00');
INSERT INTO `departments_data` VALUES (345, '12:26:01', 97.27, 92.00, 19.00, 136.00, 66.00, '2019-12-17 17:19:00');
INSERT INTO `departments_data` VALUES (346, '12:26:48', 97.40, 92.00, 18.00, 125.00, 86.00, '2019-12-17 17:20:00');
INSERT INTO `departments_data` VALUES (347, '12:26:04', 97.38, 71.00, 17.00, 109.00, 89.00, '2019-12-17 17:20:00');
INSERT INTO `departments_data` VALUES (348, '12:26:01', 98.49, 64.00, 19.00, 95.00, 75.00, '2019-12-17 17:20:00');
INSERT INTO `departments_data` VALUES (349, '12:26:48', 97.25, 87.00, 18.00, 100.00, 77.00, '2019-12-17 17:21:00');
INSERT INTO `departments_data` VALUES (350, '12:26:04', 96.30, 83.00, 18.00, 120.00, 84.00, '2019-12-17 17:21:00');
INSERT INTO `departments_data` VALUES (351, '12:26:01', 96.93, 97.00, 17.00, 139.00, 74.00, '2019-12-17 17:21:00');
INSERT INTO `departments_data` VALUES (352, '12:26:48', 98.04, 96.00, 16.00, 134.00, 69.00, '2019-12-17 17:22:00');
INSERT INTO `departments_data` VALUES (353, '12:26:04', 95.55, 85.00, 19.00, 113.00, 65.00, '2019-12-17 17:22:00');
INSERT INTO `departments_data` VALUES (354, '12:26:01', 99.72, 71.00, 18.00, 98.00, 81.00, '2019-12-17 17:22:00');
INSERT INTO `departments_data` VALUES (355, '12:26:48', 99.23, 85.00, 17.00, 114.00, 65.00, '2019-12-17 17:23:00');
INSERT INTO `departments_data` VALUES (356, '12:26:04', 97.79, 73.00, 19.00, 106.00, 72.00, '2019-12-17 17:23:00');
INSERT INTO `departments_data` VALUES (357, '12:26:01', 95.89, 72.00, 19.00, 104.00, 68.00, '2019-12-17 17:23:00');
INSERT INTO `departments_data` VALUES (358, '12:26:48', 95.08, 83.00, 19.00, 96.00, 84.00, '2019-12-17 17:24:00');
INSERT INTO `departments_data` VALUES (359, '12:26:04', 96.17, 67.00, 17.00, 128.00, 74.00, '2019-12-17 17:24:00');
INSERT INTO `departments_data` VALUES (360, '12:26:01', 97.63, 69.00, 19.00, 132.00, 61.00, '2019-12-17 17:24:00');
INSERT INTO `departments_data` VALUES (361, '12:26:48', 95.03, 91.00, 17.00, 99.00, 61.00, '2019-12-17 17:25:00');
INSERT INTO `departments_data` VALUES (362, '12:26:04', 99.12, 90.00, 18.00, 136.00, 69.00, '2019-12-17 17:25:00');
INSERT INTO `departments_data` VALUES (363, '12:26:01', 96.79, 86.00, 17.00, 128.00, 89.00, '2019-12-17 17:25:00');
INSERT INTO `departments_data` VALUES (364, '12:26:48', 95.20, 85.00, 17.00, 139.00, 62.00, '2019-12-17 17:26:00');
INSERT INTO `departments_data` VALUES (365, '12:26:04', 95.46, 86.00, 17.00, 101.00, 84.00, '2019-12-17 17:26:00');
INSERT INTO `departments_data` VALUES (366, '12:26:01', 98.99, 93.00, 17.00, 124.00, 71.00, '2019-12-17 17:26:00');
INSERT INTO `departments_data` VALUES (367, '12:26:48', 96.04, 93.00, 17.00, 98.00, 64.00, '2019-12-17 17:27:00');
INSERT INTO `departments_data` VALUES (368, '12:26:04', 98.23, 73.00, 16.00, 107.00, 75.00, '2019-12-17 17:27:00');
INSERT INTO `departments_data` VALUES (369, '12:26:01', 95.56, 93.00, 16.00, 125.00, 63.00, '2019-12-17 17:27:00');
INSERT INTO `departments_data` VALUES (370, '12:26:48', 98.81, 71.00, 17.00, 114.00, 69.00, '2019-12-17 17:28:00');
INSERT INTO `departments_data` VALUES (371, '12:26:04', 96.20, 90.00, 19.00, 139.00, 83.00, '2019-12-17 17:28:00');
INSERT INTO `departments_data` VALUES (372, '12:26:01', 95.19, 69.00, 17.00, 131.00, 85.00, '2019-12-17 17:28:00');
INSERT INTO `departments_data` VALUES (373, '12:26:48', 97.47, 79.00, 16.00, 104.00, 82.00, '2019-12-17 17:29:00');
INSERT INTO `departments_data` VALUES (374, '12:26:04', 96.71, 65.00, 19.00, 119.00, 74.00, '2019-12-17 17:29:00');
INSERT INTO `departments_data` VALUES (375, '12:26:01', 99.83, 99.00, 16.00, 107.00, 62.00, '2019-12-17 17:29:00');
INSERT INTO `departments_data` VALUES (376, '12:26:48', 97.35, 83.00, 18.00, 107.00, 72.00, '2019-12-17 17:30:00');
INSERT INTO `departments_data` VALUES (377, '12:26:04', 99.97, 86.00, 19.00, 134.00, 64.00, '2019-12-17 17:30:00');
INSERT INTO `departments_data` VALUES (378, '12:26:01', 97.06, 66.00, 18.00, 117.00, 81.00, '2019-12-17 17:30:00');
INSERT INTO `departments_data` VALUES (379, '12:26:48', 99.93, 94.00, 17.00, 125.00, 65.00, '2019-12-17 17:31:00');
INSERT INTO `departments_data` VALUES (380, '12:26:04', 97.64, 61.00, 17.00, 91.00, 76.00, '2019-12-17 17:31:00');
INSERT INTO `departments_data` VALUES (381, '12:26:01', 97.18, 71.00, 17.00, 122.00, 85.00, '2019-12-17 17:31:00');
INSERT INTO `departments_data` VALUES (382, '12:26:48', 99.76, 63.00, 19.00, 107.00, 67.00, '2019-12-17 17:32:00');
INSERT INTO `departments_data` VALUES (383, '12:26:04', 95.42, 76.00, 19.00, 104.00, 87.00, '2019-12-17 17:32:00');
INSERT INTO `departments_data` VALUES (384, '12:26:01', 95.96, 96.00, 19.00, 125.00, 69.00, '2019-12-17 17:32:00');
INSERT INTO `departments_data` VALUES (385, '12:26:48', 99.92, 85.00, 18.00, 95.00, 63.00, '2019-12-17 17:33:00');
INSERT INTO `departments_data` VALUES (386, '12:26:04', 99.90, 60.00, 17.00, 104.00, 83.00, '2019-12-17 17:33:00');
INSERT INTO `departments_data` VALUES (387, '12:26:01', 95.50, 68.00, 17.00, 120.00, 63.00, '2019-12-17 17:33:00');
INSERT INTO `departments_data` VALUES (388, '12:26:48', 99.45, 87.00, 16.00, 134.00, 89.00, '2019-12-17 17:34:00');
INSERT INTO `departments_data` VALUES (389, '12:26:04', 99.57, 60.00, 19.00, 102.00, 87.00, '2019-12-17 17:34:00');
INSERT INTO `departments_data` VALUES (390, '12:26:01', 99.68, 94.00, 17.00, 112.00, 74.00, '2019-12-17 17:34:00');
INSERT INTO `departments_data` VALUES (391, '12:26:48', 97.93, 66.00, 17.00, 107.00, 74.00, '2019-12-17 17:35:00');
INSERT INTO `departments_data` VALUES (392, '12:26:04', 96.97, 72.00, 17.00, 102.00, 60.00, '2019-12-17 17:35:00');
INSERT INTO `departments_data` VALUES (393, '12:26:01', 98.95, 62.00, 17.00, 132.00, 86.00, '2019-12-17 17:35:00');
INSERT INTO `departments_data` VALUES (394, '12:26:48', 97.54, 91.00, 18.00, 122.00, 68.00, '2019-12-17 17:36:00');
INSERT INTO `departments_data` VALUES (395, '12:26:04', 96.13, 64.00, 17.00, 121.00, 73.00, '2019-12-17 17:36:00');
INSERT INTO `departments_data` VALUES (396, '12:26:01', 97.40, 71.00, 16.00, 96.00, 72.00, '2019-12-17 17:36:00');
INSERT INTO `departments_data` VALUES (397, '12:26:48', 96.91, 94.00, 16.00, 137.00, 87.00, '2019-12-17 17:37:00');
INSERT INTO `departments_data` VALUES (398, '12:26:04', 99.82, 65.00, 18.00, 138.00, 70.00, '2019-12-17 17:37:00');
INSERT INTO `departments_data` VALUES (399, '12:26:01', 95.12, 78.00, 17.00, 122.00, 89.00, '2019-12-17 17:37:00');
INSERT INTO `departments_data` VALUES (400, '12:26:48', 98.85, 67.00, 18.00, 114.00, 64.00, '2019-12-17 17:38:00');
INSERT INTO `departments_data` VALUES (401, '12:26:04', 97.17, 72.00, 17.00, 130.00, 89.00, '2019-12-17 17:38:00');
INSERT INTO `departments_data` VALUES (402, '12:26:01', 99.29, 82.00, 19.00, 133.00, 74.00, '2019-12-17 17:38:00');
INSERT INTO `departments_data` VALUES (403, '12:26:48', 95.42, 92.00, 18.00, 101.00, 82.00, '2019-12-17 17:39:00');
INSERT INTO `departments_data` VALUES (404, '12:26:04', 97.65, 84.00, 19.00, 119.00, 87.00, '2019-12-17 17:39:00');
INSERT INTO `departments_data` VALUES (405, '12:26:01', 98.02, 95.00, 18.00, 90.00, 71.00, '2019-12-17 17:39:00');
INSERT INTO `departments_data` VALUES (406, '12:26:48', 97.53, 71.00, 19.00, 117.00, 73.00, '2019-12-17 17:40:00');
INSERT INTO `departments_data` VALUES (407, '12:26:04', 98.36, 79.00, 19.00, 102.00, 79.00, '2019-12-17 17:40:00');
INSERT INTO `departments_data` VALUES (408, '12:26:01', 95.08, 67.00, 16.00, 123.00, 82.00, '2019-12-17 17:40:00');
INSERT INTO `departments_data` VALUES (409, '12:26:48', 97.70, 66.00, 16.00, 94.00, 71.00, '2019-12-17 17:41:00');
INSERT INTO `departments_data` VALUES (410, '12:26:04', 98.31, 77.00, 17.00, 96.00, 62.00, '2019-12-17 17:41:00');
INSERT INTO `departments_data` VALUES (411, '12:26:01', 99.17, 86.00, 18.00, 101.00, 84.00, '2019-12-17 17:41:00');
INSERT INTO `departments_data` VALUES (412, '12:26:48', 98.23, 89.00, 18.00, 111.00, 72.00, '2019-12-17 17:42:00');
INSERT INTO `departments_data` VALUES (413, '12:26:04', 99.95, 90.00, 16.00, 124.00, 75.00, '2019-12-17 17:42:00');
INSERT INTO `departments_data` VALUES (414, '12:26:01', 98.32, 69.00, 18.00, 97.00, 67.00, '2019-12-17 17:42:00');
INSERT INTO `departments_data` VALUES (415, '12:26:48', 97.74, 93.00, 16.00, 102.00, 73.00, '2019-12-17 17:43:00');
INSERT INTO `departments_data` VALUES (416, '12:26:04', 96.71, 67.00, 17.00, 100.00, 88.00, '2019-12-17 17:43:00');
INSERT INTO `departments_data` VALUES (417, '12:26:01', 96.82, 71.00, 19.00, 130.00, 86.00, '2019-12-17 17:43:00');
INSERT INTO `departments_data` VALUES (418, '12:26:48', 98.54, 69.00, 16.00, 126.00, 82.00, '2019-12-17 17:44:00');
INSERT INTO `departments_data` VALUES (419, '12:26:04', 98.90, 99.00, 19.00, 130.00, 61.00, '2019-12-17 17:44:00');
INSERT INTO `departments_data` VALUES (420, '12:26:01', 97.48, 84.00, 19.00, 120.00, 89.00, '2019-12-17 17:44:00');
INSERT INTO `departments_data` VALUES (421, '12:26:48', 99.64, 72.00, 18.00, 123.00, 61.00, '2019-12-17 17:45:00');
INSERT INTO `departments_data` VALUES (422, '12:26:04', 95.18, 97.00, 18.00, 91.00, 73.00, '2019-12-17 17:45:00');
INSERT INTO `departments_data` VALUES (423, '12:26:01', 96.63, 93.00, 17.00, 99.00, 86.00, '2019-12-17 17:45:00');
INSERT INTO `departments_data` VALUES (424, '12:26:48', 96.32, 72.00, 19.00, 125.00, 69.00, '2019-12-17 17:46:00');
INSERT INTO `departments_data` VALUES (425, '12:26:04', 95.41, 97.00, 17.00, 116.00, 82.00, '2019-12-17 17:46:00');
INSERT INTO `departments_data` VALUES (426, '12:26:01', 97.55, 99.00, 17.00, 119.00, 88.00, '2019-12-17 17:46:00');
INSERT INTO `departments_data` VALUES (427, '12:26:48', 97.75, 66.00, 17.00, 90.00, 65.00, '2019-12-17 17:47:00');
INSERT INTO `departments_data` VALUES (428, '12:26:04', 97.19, 96.00, 16.00, 105.00, 62.00, '2019-12-17 17:47:00');
INSERT INTO `departments_data` VALUES (429, '12:26:01', 98.90, 66.00, 16.00, 107.00, 77.00, '2019-12-17 17:47:00');
INSERT INTO `departments_data` VALUES (430, '12:26:48', 97.48, 76.00, 16.00, 102.00, 76.00, '2019-12-17 17:48:00');
INSERT INTO `departments_data` VALUES (431, '12:26:04', 96.95, 86.00, 18.00, 93.00, 78.00, '2019-12-17 17:48:00');
INSERT INTO `departments_data` VALUES (432, '12:26:01', 98.02, 79.00, 17.00, 96.00, 73.00, '2019-12-17 17:48:00');
INSERT INTO `departments_data` VALUES (433, '12:26:48', 96.20, 70.00, 19.00, 105.00, 82.00, '2019-12-17 17:49:00');
INSERT INTO `departments_data` VALUES (434, '12:26:04', 95.20, 92.00, 18.00, 96.00, 77.00, '2019-12-17 17:49:00');
INSERT INTO `departments_data` VALUES (435, '12:26:01', 95.74, 68.00, 16.00, 110.00, 69.00, '2019-12-17 17:49:00');
INSERT INTO `departments_data` VALUES (436, '12:26:48', 95.97, 72.00, 19.00, 130.00, 73.00, '2019-12-17 17:50:00');
INSERT INTO `departments_data` VALUES (437, '12:26:04', 97.59, 60.00, 19.00, 102.00, 79.00, '2019-12-17 17:50:00');
INSERT INTO `departments_data` VALUES (438, '12:26:01', 99.75, 71.00, 17.00, 124.00, 65.00, '2019-12-17 17:50:00');
INSERT INTO `departments_data` VALUES (439, '12:26:48', 97.71, 70.00, 17.00, 115.00, 63.00, '2019-12-17 17:51:00');
INSERT INTO `departments_data` VALUES (440, '12:26:04', 99.38, 76.00, 19.00, 133.00, 67.00, '2019-12-17 17:51:00');
INSERT INTO `departments_data` VALUES (441, '12:26:01', 96.92, 86.00, 19.00, 134.00, 75.00, '2019-12-17 17:51:00');
INSERT INTO `departments_data` VALUES (442, '12:26:48', 99.43, 66.00, 19.00, 95.00, 67.00, '2019-12-17 17:52:00');
INSERT INTO `departments_data` VALUES (443, '12:26:04', 97.64, 83.00, 16.00, 100.00, 79.00, '2019-12-17 17:52:00');
INSERT INTO `departments_data` VALUES (444, '12:26:01', 99.04, 61.00, 16.00, 130.00, 68.00, '2019-12-17 17:52:00');
INSERT INTO `departments_data` VALUES (445, '12:26:48', 96.03, 76.00, 17.00, 100.00, 72.00, '2019-12-17 17:53:00');
INSERT INTO `departments_data` VALUES (446, '12:26:04', 97.42, 85.00, 18.00, 95.00, 80.00, '2019-12-17 17:53:00');
INSERT INTO `departments_data` VALUES (447, '12:26:01', 95.80, 83.00, 19.00, 107.00, 79.00, '2019-12-17 17:53:00');
INSERT INTO `departments_data` VALUES (448, '12:26:48', 97.52, 68.00, 18.00, 135.00, 67.00, '2019-12-17 17:54:00');
INSERT INTO `departments_data` VALUES (449, '12:26:04', 96.21, 80.00, 18.00, 132.00, 85.00, '2019-12-17 17:54:00');
INSERT INTO `departments_data` VALUES (450, '12:26:01', 96.39, 96.00, 16.00, 119.00, 74.00, '2019-12-17 17:54:00');
INSERT INTO `departments_data` VALUES (451, '12:26:48', 97.87, 63.00, 16.00, 128.00, 80.00, '2019-12-17 17:55:00');
INSERT INTO `departments_data` VALUES (452, '12:26:04', 97.54, 99.00, 16.00, 104.00, 69.00, '2019-12-17 17:55:00');
INSERT INTO `departments_data` VALUES (453, '12:26:01', 98.86, 80.00, 17.00, 98.00, 66.00, '2019-12-17 17:55:00');
INSERT INTO `departments_data` VALUES (454, '12:26:48', 97.44, 96.00, 19.00, 137.00, 75.00, '2019-12-17 17:56:00');
INSERT INTO `departments_data` VALUES (455, '12:26:04', 98.97, 69.00, 18.00, 127.00, 74.00, '2019-12-17 17:56:00');
INSERT INTO `departments_data` VALUES (456, '12:26:01', 97.48, 88.00, 18.00, 134.00, 74.00, '2019-12-17 17:56:00');
INSERT INTO `departments_data` VALUES (457, '12:26:48', 95.16, 93.00, 19.00, 111.00, 78.00, '2019-12-17 17:57:00');
INSERT INTO `departments_data` VALUES (458, '12:26:04', 98.85, 76.00, 17.00, 103.00, 85.00, '2019-12-17 17:57:00');
INSERT INTO `departments_data` VALUES (459, '12:26:01', 98.19, 64.00, 17.00, 136.00, 83.00, '2019-12-17 17:57:00');
INSERT INTO `departments_data` VALUES (460, '12:26:48', 96.11, 71.00, 19.00, 102.00, 87.00, '2019-12-17 17:58:00');
INSERT INTO `departments_data` VALUES (461, '12:26:04', 98.97, 98.00, 19.00, 108.00, 88.00, '2019-12-17 17:58:00');
INSERT INTO `departments_data` VALUES (462, '12:26:01', 98.13, 76.00, 17.00, 131.00, 85.00, '2019-12-17 17:58:00');
INSERT INTO `departments_data` VALUES (463, '12:26:48', 97.45, 92.00, 19.00, 130.00, 80.00, '2019-12-17 17:59:00');
INSERT INTO `departments_data` VALUES (464, '12:26:04', 97.77, 92.00, 19.00, 101.00, 76.00, '2019-12-17 17:59:00');
INSERT INTO `departments_data` VALUES (465, '12:26:01', 98.52, 79.00, 19.00, 104.00, 71.00, '2019-12-17 17:59:00');
INSERT INTO `departments_data` VALUES (466, '12:26:48', 97.67, 89.00, 19.00, 91.00, 61.00, '2019-12-17 18:00:00');
INSERT INTO `departments_data` VALUES (467, '12:26:04', 95.14, 84.00, 19.00, 112.00, 74.00, '2019-12-17 18:00:00');
INSERT INTO `departments_data` VALUES (468, '12:26:01', 99.01, 93.00, 18.00, 96.00, 82.00, '2019-12-17 18:00:00');
INSERT INTO `departments_data` VALUES (469, '12:26:48', 96.23, 64.00, 18.00, 120.00, 71.00, '2019-12-17 18:01:00');
INSERT INTO `departments_data` VALUES (470, '12:26:04', 98.84, 63.00, 19.00, 137.00, 88.00, '2019-12-17 18:01:00');
INSERT INTO `departments_data` VALUES (471, '12:26:01', 96.77, 90.00, 16.00, 106.00, 76.00, '2019-12-17 18:01:00');
INSERT INTO `departments_data` VALUES (472, '12:26:48', 98.76, 81.00, 19.00, 105.00, 67.00, '2019-12-18 10:36:00');
INSERT INTO `departments_data` VALUES (473, '12:26:04', 99.05, 76.00, 16.00, 91.00, 68.00, '2019-12-18 10:36:00');
INSERT INTO `departments_data` VALUES (474, '12:26:01', 98.83, 90.00, 18.00, 139.00, 86.00, '2019-12-18 10:36:00');
INSERT INTO `departments_data` VALUES (475, '12:26:48', 99.71, 97.00, 18.00, 90.00, 73.00, '2019-12-18 10:37:00');
INSERT INTO `departments_data` VALUES (476, '12:26:04', 98.30, 79.00, 18.00, 90.00, 69.00, '2019-12-18 10:37:00');
INSERT INTO `departments_data` VALUES (477, '12:26:01', 97.38, 83.00, 19.00, 104.00, 79.00, '2019-12-18 10:37:00');
INSERT INTO `departments_data` VALUES (478, '12:26:48', 95.24, 97.00, 19.00, 96.00, 63.00, '2019-12-18 10:38:00');
INSERT INTO `departments_data` VALUES (479, '12:26:04', 98.40, 71.00, 18.00, 116.00, 68.00, '2019-12-18 10:38:00');
INSERT INTO `departments_data` VALUES (480, '12:26:01', 98.95, 83.00, 17.00, 126.00, 65.00, '2019-12-18 10:38:00');
INSERT INTO `departments_data` VALUES (481, '12:26:48', 95.39, 64.00, 17.00, 118.00, 67.00, '2019-12-18 10:39:00');
INSERT INTO `departments_data` VALUES (482, '12:26:04', 95.99, 79.00, 16.00, 100.00, 77.00, '2019-12-18 10:39:00');
INSERT INTO `departments_data` VALUES (483, '12:26:01', 99.60, 90.00, 19.00, 124.00, 76.00, '2019-12-18 10:39:00');
INSERT INTO `departments_data` VALUES (484, '12:26:48', 98.01, 82.00, 18.00, 108.00, 87.00, '2019-12-18 10:40:00');
INSERT INTO `departments_data` VALUES (485, '12:26:04', 97.24, 60.00, 17.00, 100.00, 78.00, '2019-12-18 10:40:00');
INSERT INTO `departments_data` VALUES (486, '12:26:01', 99.98, 62.00, 18.00, 116.00, 68.00, '2019-12-18 10:40:00');
INSERT INTO `departments_data` VALUES (487, '12:26:48', 97.52, 91.00, 19.00, 131.00, 68.00, '2019-12-18 10:41:00');
INSERT INTO `departments_data` VALUES (488, '12:26:04', 97.17, 64.00, 18.00, 116.00, 70.00, '2019-12-18 10:41:00');
INSERT INTO `departments_data` VALUES (489, '12:26:01', 95.46, 77.00, 17.00, 134.00, 79.00, '2019-12-18 10:41:00');
INSERT INTO `departments_data` VALUES (490, '12:26:48', 95.00, 84.00, 18.00, 114.00, 63.00, '2019-12-18 10:42:00');
INSERT INTO `departments_data` VALUES (491, '12:26:04', 95.43, 67.00, 17.00, 95.00, 62.00, '2019-12-18 10:42:00');
INSERT INTO `departments_data` VALUES (492, '12:26:01', 98.77, 95.00, 17.00, 126.00, 66.00, '2019-12-18 10:42:00');
INSERT INTO `departments_data` VALUES (493, '12:26:48', 98.64, 77.00, 16.00, 119.00, 76.00, '2019-12-18 10:43:00');
INSERT INTO `departments_data` VALUES (494, '12:26:04', 95.70, 83.00, 18.00, 100.00, 79.00, '2019-12-18 10:43:00');
INSERT INTO `departments_data` VALUES (495, '12:26:01', 98.06, 78.00, 18.00, 100.00, 79.00, '2019-12-18 10:43:00');
INSERT INTO `departments_data` VALUES (496, '12:26:48', 95.61, 91.00, 19.00, 133.00, 63.00, '2019-12-18 10:44:00');
INSERT INTO `departments_data` VALUES (497, '12:26:04', 99.34, 72.00, 19.00, 130.00, 71.00, '2019-12-18 10:44:00');
INSERT INTO `departments_data` VALUES (498, '12:26:01', 98.30, 98.00, 18.00, 100.00, 65.00, '2019-12-18 10:44:00');
INSERT INTO `departments_data` VALUES (499, '12:26:48', 97.86, 89.00, 17.00, 139.00, 85.00, '2019-12-18 10:45:00');
INSERT INTO `departments_data` VALUES (500, '12:26:04', 96.48, 97.00, 17.00, 92.00, 66.00, '2019-12-18 10:45:00');
INSERT INTO `departments_data` VALUES (501, '12:26:01', 99.45, 63.00, 16.00, 130.00, 77.00, '2019-12-18 10:45:00');
INSERT INTO `departments_data` VALUES (502, '12:26:48', 96.02, 69.00, 17.00, 103.00, 80.00, '2019-12-18 10:46:00');
INSERT INTO `departments_data` VALUES (503, '12:26:04', 95.93, 97.00, 18.00, 135.00, 84.00, '2019-12-18 10:46:00');
INSERT INTO `departments_data` VALUES (504, '12:26:01', 96.53, 86.00, 16.00, 92.00, 68.00, '2019-12-18 10:46:00');
INSERT INTO `departments_data` VALUES (505, '12:26:48', 95.01, 81.00, 19.00, 101.00, 76.00, '2019-12-18 10:47:00');
INSERT INTO `departments_data` VALUES (506, '12:26:04', 98.04, 66.00, 16.00, 93.00, 69.00, '2019-12-18 10:47:00');
INSERT INTO `departments_data` VALUES (507, '12:26:01', 98.57, 95.00, 17.00, 132.00, 74.00, '2019-12-18 10:47:00');
INSERT INTO `departments_data` VALUES (508, '12:26:48', 97.82, 92.00, 16.00, 136.00, 79.00, '2019-12-18 10:48:00');
INSERT INTO `departments_data` VALUES (509, '12:26:04', 98.61, 63.00, 17.00, 130.00, 77.00, '2019-12-18 10:48:00');
INSERT INTO `departments_data` VALUES (510, '12:26:01', 95.01, 97.00, 18.00, 126.00, 84.00, '2019-12-18 10:48:00');
INSERT INTO `departments_data` VALUES (511, '12:26:48', 98.62, 69.00, 17.00, 134.00, 87.00, '2019-12-18 10:49:00');
INSERT INTO `departments_data` VALUES (512, '12:26:04', 96.62, 70.00, 17.00, 129.00, 62.00, '2019-12-18 10:49:00');
INSERT INTO `departments_data` VALUES (513, '12:26:01', 98.80, 63.00, 19.00, 91.00, 80.00, '2019-12-18 10:49:00');
INSERT INTO `departments_data` VALUES (514, '12:26:48', 96.96, 69.00, 16.00, 91.00, 70.00, '2019-12-18 10:50:00');
INSERT INTO `departments_data` VALUES (515, '12:26:04', 96.72, 97.00, 19.00, 114.00, 87.00, '2019-12-18 10:50:00');
INSERT INTO `departments_data` VALUES (516, '12:26:01', 99.22, 89.00, 18.00, 100.00, 65.00, '2019-12-18 10:50:00');
INSERT INTO `departments_data` VALUES (517, '12:26:48', 98.59, 62.00, 18.00, 125.00, 88.00, '2019-12-18 10:51:00');
INSERT INTO `departments_data` VALUES (518, '12:26:04', 99.00, 69.00, 19.00, 134.00, 85.00, '2019-12-18 10:51:00');
INSERT INTO `departments_data` VALUES (519, '12:26:01', 97.64, 69.00, 16.00, 104.00, 89.00, '2019-12-18 10:51:00');
INSERT INTO `departments_data` VALUES (520, '12:26:48', 98.18, 91.00, 18.00, 119.00, 61.00, '2019-12-18 10:52:00');
INSERT INTO `departments_data` VALUES (521, '12:26:04', 98.11, 92.00, 18.00, 126.00, 72.00, '2019-12-18 10:52:00');
INSERT INTO `departments_data` VALUES (522, '12:26:01', 96.76, 74.00, 16.00, 99.00, 78.00, '2019-12-18 10:52:00');
INSERT INTO `departments_data` VALUES (523, '12:26:48', 99.62, 62.00, 16.00, 102.00, 66.00, '2019-12-18 10:53:00');
INSERT INTO `departments_data` VALUES (524, '12:26:04', 95.44, 76.00, 18.00, 130.00, 67.00, '2019-12-18 10:53:00');
INSERT INTO `departments_data` VALUES (525, '12:26:01', 95.59, 71.00, 19.00, 91.00, 88.00, '2019-12-18 10:53:00');
INSERT INTO `departments_data` VALUES (526, '12:26:48', 97.43, 80.00, 16.00, 114.00, 71.00, '2019-12-18 10:54:00');
INSERT INTO `departments_data` VALUES (527, '12:26:04', 95.81, 89.00, 19.00, 121.00, 87.00, '2019-12-18 10:54:00');
INSERT INTO `departments_data` VALUES (528, '12:26:01', 97.82, 91.00, 18.00, 95.00, 68.00, '2019-12-18 10:54:00');
INSERT INTO `departments_data` VALUES (529, '12:26:48', 95.34, 63.00, 16.00, 124.00, 78.00, '2019-12-18 10:55:00');
INSERT INTO `departments_data` VALUES (530, '12:26:04', 97.55, 98.00, 19.00, 132.00, 78.00, '2019-12-18 10:55:00');
INSERT INTO `departments_data` VALUES (531, '12:26:01', 96.64, 83.00, 19.00, 105.00, 71.00, '2019-12-18 10:55:00');
INSERT INTO `departments_data` VALUES (532, '12:26:48', 98.94, 88.00, 17.00, 92.00, 65.00, '2019-12-18 10:56:00');
INSERT INTO `departments_data` VALUES (533, '12:26:04', 97.26, 97.00, 18.00, 92.00, 79.00, '2019-12-18 10:56:00');
INSERT INTO `departments_data` VALUES (534, '12:26:01', 97.04, 83.00, 18.00, 94.00, 76.00, '2019-12-18 10:56:00');
INSERT INTO `departments_data` VALUES (535, '12:26:48', 99.31, 98.00, 18.00, 94.00, 66.00, '2019-12-18 10:57:00');
INSERT INTO `departments_data` VALUES (536, '12:26:04', 99.76, 81.00, 17.00, 137.00, 87.00, '2019-12-18 10:57:00');
INSERT INTO `departments_data` VALUES (537, '12:26:01', 98.32, 64.00, 18.00, 94.00, 87.00, '2019-12-18 10:57:00');
INSERT INTO `departments_data` VALUES (538, '12:26:48', 98.04, 69.00, 16.00, 125.00, 65.00, '2019-12-18 11:07:00');
INSERT INTO `departments_data` VALUES (539, '12:26:04', 96.24, 89.00, 19.00, 97.00, 72.00, '2019-12-18 11:07:00');
INSERT INTO `departments_data` VALUES (540, '12:26:01', 97.70, 76.00, 19.00, 110.00, 69.00, '2019-12-18 11:07:00');
INSERT INTO `departments_data` VALUES (541, '12:26:48', 99.22, 96.00, 18.00, 137.00, 79.00, '2019-12-18 11:08:00');
INSERT INTO `departments_data` VALUES (542, '12:26:04', 95.36, 80.00, 18.00, 113.00, 82.00, '2019-12-18 11:08:00');
INSERT INTO `departments_data` VALUES (543, '12:26:01', 97.64, 66.00, 19.00, 114.00, 63.00, '2019-12-18 11:08:00');
INSERT INTO `departments_data` VALUES (544, '12:26:48', 98.19, 90.00, 16.00, 109.00, 60.00, '2019-12-18 11:09:00');
INSERT INTO `departments_data` VALUES (545, '12:26:04', 96.72, 63.00, 17.00, 119.00, 74.00, '2019-12-18 11:09:00');
INSERT INTO `departments_data` VALUES (546, '12:26:01', 99.25, 80.00, 17.00, 125.00, 65.00, '2019-12-18 11:09:00');
INSERT INTO `departments_data` VALUES (547, '12:26:48', 95.64, 81.00, 19.00, 123.00, 61.00, '2019-12-18 11:10:00');
INSERT INTO `departments_data` VALUES (548, '12:26:04', 98.11, 70.00, 16.00, 134.00, 75.00, '2019-12-18 11:10:00');
INSERT INTO `departments_data` VALUES (549, '12:26:01', 95.05, 93.00, 19.00, 107.00, 67.00, '2019-12-18 11:10:00');
INSERT INTO `departments_data` VALUES (550, '12:26:48', 96.82, 71.00, 16.00, 123.00, 83.00, '2019-12-18 11:11:00');
INSERT INTO `departments_data` VALUES (551, '12:26:04', 96.82, 99.00, 18.00, 133.00, 69.00, '2019-12-18 11:11:00');
INSERT INTO `departments_data` VALUES (552, '12:26:01', 95.80, 82.00, 17.00, 138.00, 81.00, '2019-12-18 11:11:00');
INSERT INTO `departments_data` VALUES (553, '12:26:48', 98.55, 67.00, 19.00, 90.00, 70.00, '2019-12-18 11:12:00');
INSERT INTO `departments_data` VALUES (554, '12:26:04', 97.67, 80.00, 17.00, 108.00, 72.00, '2019-12-18 11:12:00');
INSERT INTO `departments_data` VALUES (555, '12:26:01', 97.43, 63.00, 19.00, 132.00, 79.00, '2019-12-18 11:12:00');
INSERT INTO `departments_data` VALUES (556, '12:26:48', 98.92, 81.00, 18.00, 129.00, 70.00, '2019-12-18 11:13:00');
INSERT INTO `departments_data` VALUES (557, '12:26:04', 97.56, 95.00, 16.00, 92.00, 65.00, '2019-12-18 11:13:00');
INSERT INTO `departments_data` VALUES (558, '12:26:01', 97.91, 74.00, 16.00, 115.00, 67.00, '2019-12-18 11:13:00');
INSERT INTO `departments_data` VALUES (559, '12:26:48', 98.03, 70.00, 18.00, 99.00, 71.00, '2019-12-18 11:14:00');
INSERT INTO `departments_data` VALUES (560, '12:26:04', 96.31, 96.00, 18.00, 92.00, 60.00, '2019-12-18 11:14:00');
INSERT INTO `departments_data` VALUES (561, '12:26:01', 98.76, 71.00, 18.00, 126.00, 69.00, '2019-12-18 11:14:00');
INSERT INTO `departments_data` VALUES (562, '12:26:48', 98.31, 95.00, 19.00, 131.00, 62.00, '2019-12-18 11:15:00');
INSERT INTO `departments_data` VALUES (563, '12:26:04', 95.88, 99.00, 19.00, 91.00, 82.00, '2019-12-18 11:15:00');
INSERT INTO `departments_data` VALUES (564, '12:26:01', 95.16, 70.00, 17.00, 130.00, 72.00, '2019-12-18 11:15:00');
INSERT INTO `departments_data` VALUES (565, '12:26:48', 99.78, 81.00, 18.00, 126.00, 80.00, '2019-12-18 11:16:00');
INSERT INTO `departments_data` VALUES (566, '12:26:04', 95.01, 72.00, 17.00, 100.00, 83.00, '2019-12-18 11:16:00');
INSERT INTO `departments_data` VALUES (567, '12:26:01', 98.07, 60.00, 19.00, 133.00, 86.00, '2019-12-18 11:16:00');
INSERT INTO `departments_data` VALUES (568, '12:26:48', 96.57, 64.00, 16.00, 108.00, 85.00, '2019-12-18 11:17:00');
INSERT INTO `departments_data` VALUES (569, '12:26:04', 98.94, 84.00, 18.00, 103.00, 70.00, '2019-12-18 11:17:00');
INSERT INTO `departments_data` VALUES (570, '12:26:01', 97.96, 95.00, 18.00, 103.00, 71.00, '2019-12-18 11:17:00');
INSERT INTO `departments_data` VALUES (571, '12:26:48', 95.00, 88.00, 19.00, 104.00, 62.00, '2019-12-18 11:18:00');
INSERT INTO `departments_data` VALUES (572, '12:26:04', 99.46, 76.00, 16.00, 111.00, 60.00, '2019-12-18 11:18:00');
INSERT INTO `departments_data` VALUES (573, '12:26:01', 95.36, 75.00, 17.00, 92.00, 75.00, '2019-12-18 11:18:00');
INSERT INTO `departments_data` VALUES (574, '12:26:48', 95.51, 91.00, 17.00, 132.00, 82.00, '2019-12-18 11:19:00');
INSERT INTO `departments_data` VALUES (575, '12:26:04', 98.48, 71.00, 17.00, 119.00, 89.00, '2019-12-18 11:19:00');
INSERT INTO `departments_data` VALUES (576, '12:26:01', 99.25, 68.00, 18.00, 111.00, 87.00, '2019-12-18 11:19:00');
INSERT INTO `departments_data` VALUES (577, '12:26:48', 96.16, 86.00, 16.00, 102.00, 81.00, '2019-12-18 11:20:00');
INSERT INTO `departments_data` VALUES (578, '12:26:04', 99.45, 83.00, 19.00, 99.00, 63.00, '2019-12-18 11:20:00');
INSERT INTO `departments_data` VALUES (579, '12:26:01', 96.90, 60.00, 16.00, 136.00, 74.00, '2019-12-18 11:20:00');
INSERT INTO `departments_data` VALUES (580, '12:26:48', 98.72, 69.00, 18.00, 139.00, 71.00, '2019-12-18 11:21:00');
INSERT INTO `departments_data` VALUES (581, '12:26:04', 98.49, 60.00, 17.00, 104.00, 63.00, '2019-12-18 11:21:00');
INSERT INTO `departments_data` VALUES (582, '12:26:01', 97.06, 70.00, 16.00, 102.00, 81.00, '2019-12-18 11:21:00');
INSERT INTO `departments_data` VALUES (583, '12:26:48', 96.30, 70.00, 16.00, 129.00, 71.00, '2019-12-18 11:22:00');
INSERT INTO `departments_data` VALUES (584, '12:26:04', 98.76, 63.00, 18.00, 110.00, 79.00, '2019-12-18 11:22:00');
INSERT INTO `departments_data` VALUES (585, '12:26:01', 97.01, 77.00, 16.00, 127.00, 89.00, '2019-12-18 11:22:00');
INSERT INTO `departments_data` VALUES (586, '12:26:48', 96.52, 87.00, 17.00, 109.00, 73.00, '2019-12-18 11:23:00');
INSERT INTO `departments_data` VALUES (587, '12:26:04', 95.73, 86.00, 19.00, 135.00, 77.00, '2019-12-18 11:23:00');
INSERT INTO `departments_data` VALUES (588, '12:26:01', 96.93, 81.00, 18.00, 122.00, 75.00, '2019-12-18 11:23:00');
INSERT INTO `departments_data` VALUES (589, '12:26:48', 95.30, 93.00, 19.00, 128.00, 67.00, '2019-12-18 11:24:00');
INSERT INTO `departments_data` VALUES (590, '12:26:04', 98.74, 90.00, 16.00, 101.00, 69.00, '2019-12-18 11:24:00');
INSERT INTO `departments_data` VALUES (591, '12:26:01', 98.33, 71.00, 17.00, 136.00, 77.00, '2019-12-18 11:24:00');
INSERT INTO `departments_data` VALUES (592, '12:26:48', 96.16, 71.00, 18.00, 92.00, 72.00, '2019-12-18 11:25:00');
INSERT INTO `departments_data` VALUES (593, '12:26:04', 98.74, 94.00, 18.00, 100.00, 60.00, '2019-12-18 11:25:00');
INSERT INTO `departments_data` VALUES (594, '12:26:01', 97.10, 68.00, 17.00, 132.00, 73.00, '2019-12-18 11:25:00');
INSERT INTO `departments_data` VALUES (595, '12:26:48', 95.77, 74.00, 17.00, 136.00, 60.00, '2019-12-18 11:26:00');
INSERT INTO `departments_data` VALUES (596, '12:26:04', 99.97, 67.00, 16.00, 110.00, 70.00, '2019-12-18 11:26:00');
INSERT INTO `departments_data` VALUES (597, '12:26:01', 96.05, 69.00, 19.00, 122.00, 89.00, '2019-12-18 11:26:00');
INSERT INTO `departments_data` VALUES (598, '12:26:48', 97.59, 98.00, 16.00, 115.00, 76.00, '2019-12-18 11:27:00');
INSERT INTO `departments_data` VALUES (599, '12:26:04', 98.05, 71.00, 17.00, 112.00, 60.00, '2019-12-18 11:27:00');
INSERT INTO `departments_data` VALUES (600, '12:26:01', 99.34, 66.00, 18.00, 136.00, 88.00, '2019-12-18 11:27:00');
INSERT INTO `departments_data` VALUES (601, '12:26:48', 97.40, 63.00, 16.00, 105.00, 84.00, '2019-12-18 11:28:00');
INSERT INTO `departments_data` VALUES (602, '12:26:04', 99.34, 83.00, 17.00, 110.00, 64.00, '2019-12-18 11:28:00');
INSERT INTO `departments_data` VALUES (603, '12:26:01', 98.66, 72.00, 16.00, 112.00, 74.00, '2019-12-18 11:28:00');
INSERT INTO `departments_data` VALUES (604, '12:26:48', 99.27, 78.00, 17.00, 98.00, 64.00, '2019-12-18 11:29:00');
INSERT INTO `departments_data` VALUES (605, '12:26:04', 98.02, 95.00, 18.00, 106.00, 89.00, '2019-12-18 11:29:00');
INSERT INTO `departments_data` VALUES (606, '12:26:01', 95.44, 95.00, 19.00, 102.00, 78.00, '2019-12-18 11:29:00');
INSERT INTO `departments_data` VALUES (607, '12:26:48', 95.93, 76.00, 19.00, 135.00, 83.00, '2019-12-18 11:30:00');
INSERT INTO `departments_data` VALUES (608, '12:26:04', 95.97, 87.00, 18.00, 107.00, 71.00, '2019-12-18 11:30:00');
INSERT INTO `departments_data` VALUES (609, '12:26:01', 98.51, 98.00, 18.00, 130.00, 71.00, '2019-12-18 11:30:00');
INSERT INTO `departments_data` VALUES (610, '12:26:48', 95.69, 73.00, 16.00, 129.00, 72.00, '2019-12-18 11:31:00');
INSERT INTO `departments_data` VALUES (611, '12:26:04', 95.95, 92.00, 16.00, 131.00, 83.00, '2019-12-18 11:31:00');
INSERT INTO `departments_data` VALUES (612, '12:26:01', 97.57, 83.00, 16.00, 117.00, 71.00, '2019-12-18 11:31:00');
INSERT INTO `departments_data` VALUES (613, '12:26:48', 95.87, 65.00, 17.00, 97.00, 85.00, '2019-12-18 11:32:00');
INSERT INTO `departments_data` VALUES (614, '12:26:04', 96.85, 74.00, 16.00, 106.00, 76.00, '2019-12-18 11:32:00');
INSERT INTO `departments_data` VALUES (615, '12:26:01', 99.85, 65.00, 18.00, 109.00, 65.00, '2019-12-18 11:32:00');
INSERT INTO `departments_data` VALUES (616, '12:26:48', 98.21, 93.00, 17.00, 112.00, 87.00, '2019-12-18 11:33:00');
INSERT INTO `departments_data` VALUES (617, '12:26:04', 97.73, 70.00, 16.00, 95.00, 75.00, '2019-12-18 11:33:00');
INSERT INTO `departments_data` VALUES (618, '12:26:01', 96.62, 89.00, 18.00, 124.00, 69.00, '2019-12-18 11:33:00');
INSERT INTO `departments_data` VALUES (619, '12:26:48', 99.38, 85.00, 19.00, 107.00, 75.00, '2019-12-18 11:34:00');
INSERT INTO `departments_data` VALUES (620, '12:26:04', 96.34, 88.00, 18.00, 93.00, 89.00, '2019-12-18 11:34:00');
INSERT INTO `departments_data` VALUES (621, '12:26:01', 97.12, 69.00, 19.00, 116.00, 60.00, '2019-12-18 11:34:00');
INSERT INTO `departments_data` VALUES (622, '12:26:48', 95.72, 90.00, 18.00, 108.00, 65.00, '2019-12-18 11:35:00');
INSERT INTO `departments_data` VALUES (623, '12:26:04', 98.68, 69.00, 16.00, 96.00, 82.00, '2019-12-18 11:35:00');
INSERT INTO `departments_data` VALUES (624, '12:26:01', 99.20, 83.00, 16.00, 109.00, 85.00, '2019-12-18 11:35:00');
INSERT INTO `departments_data` VALUES (625, '12:26:48', 99.66, 99.00, 16.00, 91.00, 86.00, '2019-12-18 11:36:00');
INSERT INTO `departments_data` VALUES (626, '12:26:04', 97.15, 65.00, 19.00, 122.00, 74.00, '2019-12-18 11:36:00');
INSERT INTO `departments_data` VALUES (627, '12:26:01', 97.67, 81.00, 18.00, 121.00, 74.00, '2019-12-18 11:36:00');
INSERT INTO `departments_data` VALUES (628, '12:26:48', 95.40, 69.00, 18.00, 122.00, 68.00, '2019-12-18 11:37:00');
INSERT INTO `departments_data` VALUES (629, '12:26:04', 96.74, 81.00, 18.00, 131.00, 89.00, '2019-12-18 11:37:00');
INSERT INTO `departments_data` VALUES (630, '12:26:01', 98.88, 81.00, 19.00, 108.00, 74.00, '2019-12-18 11:37:00');
INSERT INTO `departments_data` VALUES (631, '12:26:48', 98.44, 65.00, 16.00, 102.00, 89.00, '2019-12-18 11:38:00');
INSERT INTO `departments_data` VALUES (632, '12:26:04', 97.67, 89.00, 19.00, 134.00, 71.00, '2019-12-18 11:38:00');
INSERT INTO `departments_data` VALUES (633, '12:26:01', 99.51, 78.00, 18.00, 93.00, 80.00, '2019-12-18 11:38:00');
INSERT INTO `departments_data` VALUES (634, '12:26:48', 95.00, 85.00, 17.00, 98.00, 69.00, '2019-12-18 11:39:00');
INSERT INTO `departments_data` VALUES (635, '12:26:04', 99.63, 78.00, 16.00, 137.00, 78.00, '2019-12-18 11:39:00');
INSERT INTO `departments_data` VALUES (636, '12:26:01', 96.98, 64.00, 18.00, 133.00, 84.00, '2019-12-18 11:39:00');
INSERT INTO `departments_data` VALUES (637, '12:26:48', 96.14, 93.00, 16.00, 133.00, 75.00, '2019-12-18 11:40:00');
INSERT INTO `departments_data` VALUES (638, '12:26:04', 96.54, 62.00, 17.00, 120.00, 87.00, '2019-12-18 11:40:00');
INSERT INTO `departments_data` VALUES (639, '12:26:01', 96.52, 89.00, 18.00, 127.00, 84.00, '2019-12-18 11:40:00');
INSERT INTO `departments_data` VALUES (640, '12:26:48', 98.35, 71.00, 18.00, 100.00, 72.00, '2019-12-18 11:41:00');
INSERT INTO `departments_data` VALUES (641, '12:26:04', 98.53, 62.00, 16.00, 102.00, 72.00, '2019-12-18 11:41:00');
INSERT INTO `departments_data` VALUES (642, '12:26:01', 96.09, 75.00, 17.00, 108.00, 76.00, '2019-12-18 11:41:00');
INSERT INTO `departments_data` VALUES (643, '12:26:48', 99.90, 98.00, 16.00, 109.00, 60.00, '2019-12-18 11:42:00');
INSERT INTO `departments_data` VALUES (644, '12:26:04', 97.09, 84.00, 19.00, 104.00, 72.00, '2019-12-18 11:42:00');
INSERT INTO `departments_data` VALUES (645, '12:26:01', 98.01, 83.00, 17.00, 127.00, 80.00, '2019-12-18 11:42:00');
INSERT INTO `departments_data` VALUES (646, '12:26:48', 95.63, 73.00, 16.00, 133.00, 84.00, '2019-12-18 11:43:00');
INSERT INTO `departments_data` VALUES (647, '12:26:04', 95.74, 85.00, 17.00, 108.00, 73.00, '2019-12-18 11:43:00');
INSERT INTO `departments_data` VALUES (648, '12:26:01', 96.87, 60.00, 17.00, 111.00, 74.00, '2019-12-18 11:43:00');
INSERT INTO `departments_data` VALUES (649, '12:26:48', 95.28, 66.00, 16.00, 102.00, 81.00, '2019-12-18 11:44:00');
INSERT INTO `departments_data` VALUES (650, '12:26:04', 98.80, 89.00, 16.00, 126.00, 69.00, '2019-12-18 11:44:00');
INSERT INTO `departments_data` VALUES (651, '12:26:01', 99.72, 74.00, 19.00, 123.00, 79.00, '2019-12-18 11:44:00');
INSERT INTO `departments_data` VALUES (652, '12:26:48', 99.08, 87.00, 18.00, 118.00, 85.00, '2019-12-18 11:45:00');
INSERT INTO `departments_data` VALUES (653, '12:26:04', 99.86, 91.00, 18.00, 98.00, 85.00, '2019-12-18 11:45:00');
INSERT INTO `departments_data` VALUES (654, '12:26:01', 98.32, 86.00, 18.00, 104.00, 79.00, '2019-12-18 11:45:00');
INSERT INTO `departments_data` VALUES (655, '12:26:48', 96.45, 73.00, 17.00, 129.00, 66.00, '2019-12-18 11:46:00');
INSERT INTO `departments_data` VALUES (656, '12:26:04', 99.43, 70.00, 17.00, 131.00, 69.00, '2019-12-18 11:46:00');
INSERT INTO `departments_data` VALUES (657, '12:26:01', 96.13, 65.00, 18.00, 104.00, 79.00, '2019-12-18 11:46:00');
INSERT INTO `departments_data` VALUES (658, '12:26:48', 95.11, 63.00, 16.00, 90.00, 83.00, '2019-12-18 11:47:00');
INSERT INTO `departments_data` VALUES (659, '12:26:04', 96.37, 65.00, 17.00, 108.00, 74.00, '2019-12-18 11:47:00');
INSERT INTO `departments_data` VALUES (660, '12:26:01', 99.72, 60.00, 16.00, 112.00, 89.00, '2019-12-18 11:47:00');
INSERT INTO `departments_data` VALUES (661, '12:26:48', 95.19, 79.00, 18.00, 123.00, 64.00, '2019-12-18 11:48:00');
INSERT INTO `departments_data` VALUES (662, '12:26:04', 99.22, 82.00, 19.00, 114.00, 81.00, '2019-12-18 11:48:00');
INSERT INTO `departments_data` VALUES (663, '12:26:01', 95.90, 98.00, 19.00, 108.00, 75.00, '2019-12-18 11:48:00');
INSERT INTO `departments_data` VALUES (664, '12:26:48', 98.49, 79.00, 16.00, 101.00, 76.00, '2019-12-18 11:49:00');
INSERT INTO `departments_data` VALUES (665, '12:26:04', 99.64, 99.00, 17.00, 98.00, 60.00, '2019-12-18 11:49:00');
INSERT INTO `departments_data` VALUES (666, '12:26:01', 97.59, 93.00, 17.00, 118.00, 87.00, '2019-12-18 11:49:00');
INSERT INTO `departments_data` VALUES (667, '12:26:48', 96.31, 71.00, 16.00, 122.00, 68.00, '2019-12-18 11:50:00');
INSERT INTO `departments_data` VALUES (668, '12:26:04', 95.11, 98.00, 16.00, 134.00, 75.00, '2019-12-18 11:50:00');
INSERT INTO `departments_data` VALUES (669, '12:26:01', 97.51, 85.00, 18.00, 118.00, 63.00, '2019-12-18 11:50:00');
INSERT INTO `departments_data` VALUES (670, '12:26:48', 96.12, 71.00, 18.00, 114.00, 71.00, '2019-12-18 11:51:00');
INSERT INTO `departments_data` VALUES (671, '12:26:04', 95.42, 79.00, 19.00, 117.00, 86.00, '2019-12-18 11:51:00');
INSERT INTO `departments_data` VALUES (672, '12:26:01', 97.03, 93.00, 16.00, 99.00, 68.00, '2019-12-18 11:51:00');
INSERT INTO `departments_data` VALUES (673, '12:26:48', 95.66, 77.00, 16.00, 110.00, 79.00, '2019-12-18 11:52:00');
INSERT INTO `departments_data` VALUES (674, '12:26:04', 97.82, 72.00, 18.00, 107.00, 81.00, '2019-12-18 11:52:00');
INSERT INTO `departments_data` VALUES (675, '12:26:01', 98.18, 78.00, 16.00, 133.00, 75.00, '2019-12-18 11:52:00');
INSERT INTO `departments_data` VALUES (676, '12:26:48', 99.35, 80.00, 18.00, 123.00, 61.00, '2019-12-18 11:53:00');
INSERT INTO `departments_data` VALUES (677, '12:26:04', 98.86, 70.00, 18.00, 98.00, 75.00, '2019-12-18 11:53:00');
INSERT INTO `departments_data` VALUES (678, '12:26:01', 95.14, 93.00, 19.00, 90.00, 76.00, '2019-12-18 11:53:00');
INSERT INTO `departments_data` VALUES (679, '12:26:48', 97.26, 74.00, 17.00, 98.00, 61.00, '2019-12-18 11:54:00');
INSERT INTO `departments_data` VALUES (680, '12:26:04', 95.40, 90.00, 17.00, 95.00, 72.00, '2019-12-18 11:54:00');
INSERT INTO `departments_data` VALUES (681, '12:26:01', 96.38, 93.00, 18.00, 100.00, 65.00, '2019-12-18 11:54:00');
INSERT INTO `departments_data` VALUES (682, '12:26:48', 97.76, 98.00, 16.00, 99.00, 81.00, '2019-12-18 11:55:00');
INSERT INTO `departments_data` VALUES (683, '12:26:04', 98.02, 92.00, 18.00, 115.00, 75.00, '2019-12-18 11:55:00');
INSERT INTO `departments_data` VALUES (684, '12:26:01', 95.68, 94.00, 19.00, 110.00, 62.00, '2019-12-18 11:55:00');
INSERT INTO `departments_data` VALUES (685, '12:26:48', 95.38, 72.00, 17.00, 120.00, 60.00, '2019-12-18 11:56:00');
INSERT INTO `departments_data` VALUES (686, '12:26:04', 97.86, 70.00, 18.00, 120.00, 73.00, '2019-12-18 11:56:00');
INSERT INTO `departments_data` VALUES (687, '12:26:01', 99.22, 77.00, 19.00, 130.00, 69.00, '2019-12-18 11:56:00');
INSERT INTO `departments_data` VALUES (688, '12:26:48', 95.61, 80.00, 18.00, 113.00, 79.00, '2019-12-18 11:57:00');
INSERT INTO `departments_data` VALUES (689, '12:26:04', 97.52, 82.00, 18.00, 132.00, 73.00, '2019-12-18 11:57:00');
INSERT INTO `departments_data` VALUES (690, '12:26:01', 97.05, 87.00, 19.00, 123.00, 87.00, '2019-12-18 11:57:00');
INSERT INTO `departments_data` VALUES (691, '12:26:48', 95.54, 99.00, 16.00, 113.00, 79.00, '2019-12-18 11:58:00');
INSERT INTO `departments_data` VALUES (692, '12:26:04', 95.68, 88.00, 16.00, 126.00, 69.00, '2019-12-18 11:58:00');
INSERT INTO `departments_data` VALUES (693, '12:26:01', 99.16, 64.00, 17.00, 135.00, 87.00, '2019-12-18 11:58:00');
INSERT INTO `departments_data` VALUES (694, '12:26:48', 98.63, 90.00, 17.00, 107.00, 86.00, '2019-12-18 11:59:00');
INSERT INTO `departments_data` VALUES (695, '12:26:04', 96.28, 65.00, 18.00, 129.00, 72.00, '2019-12-18 11:59:00');
INSERT INTO `departments_data` VALUES (696, '12:26:01', 99.65, 64.00, 18.00, 96.00, 64.00, '2019-12-18 11:59:00');
INSERT INTO `departments_data` VALUES (697, '12:26:48', 99.52, 96.00, 19.00, 130.00, 67.00, '2019-12-18 12:00:00');
INSERT INTO `departments_data` VALUES (698, '12:26:04', 95.46, 60.00, 16.00, 103.00, 70.00, '2019-12-18 12:00:00');
INSERT INTO `departments_data` VALUES (699, '12:26:01', 96.31, 74.00, 18.00, 118.00, 72.00, '2019-12-18 12:00:00');
INSERT INTO `departments_data` VALUES (700, '12:26:48', 98.52, 63.00, 19.00, 92.00, 77.00, '2019-12-18 12:01:00');
INSERT INTO `departments_data` VALUES (701, '12:26:04', 96.36, 81.00, 17.00, 106.00, 88.00, '2019-12-18 12:01:00');
INSERT INTO `departments_data` VALUES (702, '12:26:01', 97.12, 90.00, 19.00, 114.00, 62.00, '2019-12-18 12:01:00');
INSERT INTO `departments_data` VALUES (703, '12:26:48', 99.84, 80.00, 19.00, 93.00, 71.00, '2019-12-18 12:02:00');
INSERT INTO `departments_data` VALUES (704, '12:26:04', 99.30, 98.00, 18.00, 103.00, 74.00, '2019-12-18 12:02:00');
INSERT INTO `departments_data` VALUES (705, '12:26:01', 99.39, 72.00, 18.00, 107.00, 80.00, '2019-12-18 12:02:00');
INSERT INTO `departments_data` VALUES (706, '12:26:48', 95.70, 64.00, 18.00, 117.00, 82.00, '2019-12-18 12:03:00');
INSERT INTO `departments_data` VALUES (707, '12:26:04', 96.02, 64.00, 16.00, 134.00, 62.00, '2019-12-18 12:03:00');
INSERT INTO `departments_data` VALUES (708, '12:26:01', 98.55, 60.00, 19.00, 113.00, 78.00, '2019-12-18 12:03:00');
INSERT INTO `departments_data` VALUES (709, '12:26:48', 98.43, 93.00, 16.00, 116.00, 74.00, '2019-12-18 12:04:00');
INSERT INTO `departments_data` VALUES (710, '12:26:04', 96.97, 98.00, 19.00, 116.00, 89.00, '2019-12-18 12:04:00');
INSERT INTO `departments_data` VALUES (711, '12:26:01', 96.41, 88.00, 17.00, 126.00, 63.00, '2019-12-18 12:04:00');
INSERT INTO `departments_data` VALUES (712, '12:26:48', 96.28, 75.00, 18.00, 101.00, 60.00, '2019-12-18 12:05:00');
INSERT INTO `departments_data` VALUES (713, '12:26:04', 95.55, 78.00, 19.00, 134.00, 69.00, '2019-12-18 12:05:00');
INSERT INTO `departments_data` VALUES (714, '12:26:01', 98.52, 70.00, 16.00, 90.00, 68.00, '2019-12-18 12:05:00');
INSERT INTO `departments_data` VALUES (715, '12:26:48', 99.32, 94.00, 18.00, 97.00, 73.00, '2019-12-18 12:06:00');
INSERT INTO `departments_data` VALUES (716, '12:26:04', 95.55, 61.00, 19.00, 101.00, 66.00, '2019-12-18 12:06:00');
INSERT INTO `departments_data` VALUES (717, '12:26:01', 98.81, 88.00, 19.00, 108.00, 65.00, '2019-12-18 12:06:00');
INSERT INTO `departments_data` VALUES (718, '12:26:48', 97.93, 68.00, 16.00, 128.00, 73.00, '2019-12-18 12:07:00');
INSERT INTO `departments_data` VALUES (719, '12:26:04', 98.76, 83.00, 17.00, 113.00, 75.00, '2019-12-18 12:07:00');
INSERT INTO `departments_data` VALUES (720, '12:26:01', 97.90, 81.00, 19.00, 113.00, 83.00, '2019-12-18 12:07:00');
INSERT INTO `departments_data` VALUES (721, '12:26:48', 98.83, 61.00, 17.00, 90.00, 83.00, '2019-12-18 12:08:00');
INSERT INTO `departments_data` VALUES (722, '12:26:04', 97.77, 67.00, 18.00, 109.00, 67.00, '2019-12-18 12:08:00');
INSERT INTO `departments_data` VALUES (723, '12:26:01', 96.93, 96.00, 18.00, 108.00, 68.00, '2019-12-18 12:08:00');
INSERT INTO `departments_data` VALUES (724, '12:26:48', 98.61, 99.00, 18.00, 93.00, 67.00, '2019-12-18 12:09:00');
INSERT INTO `departments_data` VALUES (725, '12:26:04', 99.49, 89.00, 18.00, 119.00, 69.00, '2019-12-18 12:09:00');
INSERT INTO `departments_data` VALUES (726, '12:26:01', 99.97, 77.00, 18.00, 135.00, 60.00, '2019-12-18 12:09:00');
INSERT INTO `departments_data` VALUES (727, '12:26:48', 98.95, 63.00, 17.00, 100.00, 89.00, '2019-12-18 12:10:00');
INSERT INTO `departments_data` VALUES (728, '12:26:04', 99.54, 86.00, 19.00, 120.00, 86.00, '2019-12-18 12:10:00');
INSERT INTO `departments_data` VALUES (729, '12:26:01', 99.46, 91.00, 18.00, 138.00, 63.00, '2019-12-18 12:10:00');
INSERT INTO `departments_data` VALUES (730, '12:26:48', 99.74, 72.00, 16.00, 123.00, 63.00, '2019-12-18 12:11:00');
INSERT INTO `departments_data` VALUES (731, '12:26:04', 95.91, 74.00, 16.00, 113.00, 65.00, '2019-12-18 12:11:00');
INSERT INTO `departments_data` VALUES (732, '12:26:01', 95.33, 61.00, 18.00, 114.00, 65.00, '2019-12-18 12:11:00');
INSERT INTO `departments_data` VALUES (733, '12:26:48', 97.37, 83.00, 16.00, 116.00, 84.00, '2019-12-18 12:12:00');
INSERT INTO `departments_data` VALUES (734, '12:26:04', 99.16, 68.00, 16.00, 128.00, 78.00, '2019-12-18 12:12:00');
INSERT INTO `departments_data` VALUES (735, '12:26:01', 98.69, 63.00, 16.00, 138.00, 76.00, '2019-12-18 12:12:00');
INSERT INTO `departments_data` VALUES (736, '12:26:48', 96.45, 83.00, 16.00, 130.00, 84.00, '2019-12-18 12:13:00');
INSERT INTO `departments_data` VALUES (737, '12:26:04', 95.82, 88.00, 17.00, 104.00, 68.00, '2019-12-18 12:13:00');
INSERT INTO `departments_data` VALUES (738, '12:26:01', 97.11, 90.00, 18.00, 108.00, 69.00, '2019-12-18 12:13:00');
INSERT INTO `departments_data` VALUES (739, '12:26:48', 99.28, 85.00, 17.00, 120.00, 69.00, '2019-12-18 12:14:00');
INSERT INTO `departments_data` VALUES (740, '12:26:04', 99.76, 67.00, 19.00, 117.00, 81.00, '2019-12-18 12:14:00');
INSERT INTO `departments_data` VALUES (741, '12:26:01', 97.09, 80.00, 18.00, 96.00, 80.00, '2019-12-18 12:14:00');
INSERT INTO `departments_data` VALUES (742, '12:26:48', 96.35, 86.00, 18.00, 114.00, 72.00, '2019-12-18 12:15:00');
INSERT INTO `departments_data` VALUES (743, '12:26:04', 98.83, 63.00, 18.00, 122.00, 72.00, '2019-12-18 12:15:00');
INSERT INTO `departments_data` VALUES (744, '12:26:01', 98.96, 94.00, 19.00, 105.00, 83.00, '2019-12-18 12:15:00');
INSERT INTO `departments_data` VALUES (745, '12:26:48', 97.03, 93.00, 16.00, 115.00, 82.00, '2019-12-18 12:16:00');
INSERT INTO `departments_data` VALUES (746, '12:26:04', 99.17, 92.00, 18.00, 112.00, 86.00, '2019-12-18 12:16:00');
INSERT INTO `departments_data` VALUES (747, '12:26:01', 97.59, 64.00, 18.00, 110.00, 79.00, '2019-12-18 12:16:00');
INSERT INTO `departments_data` VALUES (748, '12:26:48', 98.55, 79.00, 17.00, 131.00, 68.00, '2019-12-18 12:17:00');
INSERT INTO `departments_data` VALUES (749, '12:26:04', 98.13, 62.00, 17.00, 138.00, 65.00, '2019-12-18 12:17:00');
INSERT INTO `departments_data` VALUES (750, '12:26:01', 95.97, 82.00, 18.00, 121.00, 66.00, '2019-12-18 12:17:00');
INSERT INTO `departments_data` VALUES (751, '12:26:48', 96.30, 61.00, 19.00, 91.00, 60.00, '2019-12-18 12:18:00');
INSERT INTO `departments_data` VALUES (752, '12:26:04', 95.88, 64.00, 19.00, 136.00, 81.00, '2019-12-18 12:18:00');
INSERT INTO `departments_data` VALUES (753, '12:26:01', 97.94, 91.00, 17.00, 108.00, 86.00, '2019-12-18 12:18:00');
INSERT INTO `departments_data` VALUES (754, '12:26:48', 96.29, 67.00, 18.00, 93.00, 74.00, '2019-12-18 12:19:00');
INSERT INTO `departments_data` VALUES (755, '12:26:04', 95.79, 61.00, 18.00, 96.00, 81.00, '2019-12-18 12:19:00');
INSERT INTO `departments_data` VALUES (756, '12:26:01', 95.82, 99.00, 17.00, 120.00, 77.00, '2019-12-18 12:19:00');
INSERT INTO `departments_data` VALUES (757, '12:26:48', 99.97, 93.00, 16.00, 104.00, 83.00, '2019-12-18 12:20:00');
INSERT INTO `departments_data` VALUES (758, '12:26:04', 98.38, 65.00, 17.00, 108.00, 73.00, '2019-12-18 12:20:00');
INSERT INTO `departments_data` VALUES (759, '12:26:01', 97.40, 96.00, 19.00, 108.00, 70.00, '2019-12-18 12:20:00');
INSERT INTO `departments_data` VALUES (760, '12:26:48', 97.77, 67.00, 18.00, 112.00, 65.00, '2019-12-18 12:21:00');
INSERT INTO `departments_data` VALUES (761, '12:26:04', 95.91, 97.00, 17.00, 137.00, 72.00, '2019-12-18 12:21:00');
INSERT INTO `departments_data` VALUES (762, '12:26:01', 97.72, 61.00, 18.00, 106.00, 76.00, '2019-12-18 12:21:00');
INSERT INTO `departments_data` VALUES (763, '12:26:48', 95.80, 89.00, 18.00, 138.00, 79.00, '2019-12-18 12:22:00');
INSERT INTO `departments_data` VALUES (764, '12:26:04', 99.05, 98.00, 17.00, 113.00, 72.00, '2019-12-18 12:22:00');
INSERT INTO `departments_data` VALUES (765, '12:26:01', 95.77, 99.00, 18.00, 133.00, 69.00, '2019-12-18 12:22:00');
INSERT INTO `departments_data` VALUES (766, '12:26:48', 95.74, 91.00, 18.00, 136.00, 87.00, '2019-12-18 12:23:00');
INSERT INTO `departments_data` VALUES (767, '12:26:04', 98.40, 97.00, 19.00, 119.00, 65.00, '2019-12-18 12:23:00');
INSERT INTO `departments_data` VALUES (768, '12:26:01', 97.37, 79.00, 18.00, 118.00, 84.00, '2019-12-18 12:23:00');
INSERT INTO `departments_data` VALUES (769, '12:26:48', 95.48, 75.00, 16.00, 115.00, 78.00, '2019-12-18 12:24:00');
INSERT INTO `departments_data` VALUES (770, '12:26:04', 98.16, 94.00, 16.00, 100.00, 64.00, '2019-12-18 12:24:00');
INSERT INTO `departments_data` VALUES (771, '12:26:01', 95.51, 96.00, 16.00, 109.00, 66.00, '2019-12-18 12:24:00');
INSERT INTO `departments_data` VALUES (772, '12:26:48', 98.92, 93.00, 18.00, 132.00, 82.00, '2019-12-18 12:25:00');
INSERT INTO `departments_data` VALUES (773, '12:26:04', 96.06, 90.00, 17.00, 121.00, 65.00, '2019-12-18 12:25:00');
INSERT INTO `departments_data` VALUES (774, '12:26:01', 97.27, 84.00, 17.00, 99.00, 71.00, '2019-12-18 12:25:00');
INSERT INTO `departments_data` VALUES (775, '12:26:48', 95.04, 86.00, 18.00, 111.00, 60.00, '2019-12-18 12:26:00');
INSERT INTO `departments_data` VALUES (776, '12:26:04', 96.24, 80.00, 19.00, 125.00, 65.00, '2019-12-18 12:26:00');
INSERT INTO `departments_data` VALUES (777, '12:26:01', 97.93, 69.00, 17.00, 94.00, 80.00, '2019-12-18 12:26:00');
INSERT INTO `departments_data` VALUES (778, '12:26:48', 99.81, 91.00, 18.00, 121.00, 77.00, '2019-12-18 12:27:00');
INSERT INTO `departments_data` VALUES (779, '12:26:04', 97.01, 86.00, 19.00, 124.00, 65.00, '2019-12-18 12:27:00');
INSERT INTO `departments_data` VALUES (780, '12:26:01', 97.74, 71.00, 18.00, 103.00, 65.00, '2019-12-18 12:27:00');
INSERT INTO `departments_data` VALUES (781, '12:26:48', 99.98, 62.00, 17.00, 138.00, 62.00, '2019-12-18 12:28:00');
INSERT INTO `departments_data` VALUES (782, '12:26:04', 96.17, 91.00, 17.00, 118.00, 80.00, '2019-12-18 12:28:00');
INSERT INTO `departments_data` VALUES (783, '12:26:01', 99.05, 73.00, 19.00, 119.00, 71.00, '2019-12-18 12:28:00');
INSERT INTO `departments_data` VALUES (784, '12:26:48', 97.70, 72.00, 19.00, 134.00, 70.00, '2019-12-18 12:29:00');
INSERT INTO `departments_data` VALUES (785, '12:26:04', 99.10, 85.00, 16.00, 139.00, 72.00, '2019-12-18 12:29:00');
INSERT INTO `departments_data` VALUES (786, '12:26:01', 97.65, 75.00, 19.00, 109.00, 87.00, '2019-12-18 12:29:00');
INSERT INTO `departments_data` VALUES (787, '12:26:48', 97.52, 69.00, 17.00, 94.00, 63.00, '2019-12-18 12:30:00');
INSERT INTO `departments_data` VALUES (788, '12:26:04', 97.17, 88.00, 16.00, 98.00, 79.00, '2019-12-18 12:30:00');
INSERT INTO `departments_data` VALUES (789, '12:26:01', 98.40, 97.00, 17.00, 113.00, 71.00, '2019-12-18 12:30:00');
INSERT INTO `departments_data` VALUES (790, '12:26:48', 96.98, 89.00, 19.00, 94.00, 66.00, '2019-12-18 12:31:00');
INSERT INTO `departments_data` VALUES (791, '12:26:04', 96.00, 62.00, 16.00, 113.00, 73.00, '2019-12-18 12:31:00');
INSERT INTO `departments_data` VALUES (792, '12:26:01', 97.27, 81.00, 16.00, 111.00, 70.00, '2019-12-18 12:31:00');
INSERT INTO `departments_data` VALUES (793, '12:26:48', 95.22, 71.00, 17.00, 139.00, 71.00, '2019-12-18 12:32:00');
INSERT INTO `departments_data` VALUES (794, '12:26:04', 97.38, 81.00, 17.00, 107.00, 87.00, '2019-12-18 12:32:00');
INSERT INTO `departments_data` VALUES (795, '12:26:01', 98.09, 91.00, 16.00, 123.00, 76.00, '2019-12-18 12:32:00');
INSERT INTO `departments_data` VALUES (796, '12:26:48', 97.08, 94.00, 17.00, 122.00, 73.00, '2019-12-18 12:33:00');
INSERT INTO `departments_data` VALUES (797, '12:26:04', 98.86, 85.00, 16.00, 106.00, 87.00, '2019-12-18 12:33:00');
INSERT INTO `departments_data` VALUES (798, '12:26:01', 97.79, 61.00, 19.00, 97.00, 88.00, '2019-12-18 12:33:00');
INSERT INTO `departments_data` VALUES (799, '12:26:48', 95.13, 81.00, 16.00, 131.00, 68.00, '2019-12-18 12:34:00');
INSERT INTO `departments_data` VALUES (800, '12:26:04', 98.35, 73.00, 18.00, 91.00, 67.00, '2019-12-18 12:34:00');
INSERT INTO `departments_data` VALUES (801, '12:26:01', 97.48, 66.00, 19.00, 127.00, 64.00, '2019-12-18 12:34:00');
INSERT INTO `departments_data` VALUES (802, '12:26:48', 96.12, 94.00, 17.00, 137.00, 84.00, '2019-12-18 12:35:00');
INSERT INTO `departments_data` VALUES (803, '12:26:04', 96.19, 88.00, 17.00, 114.00, 63.00, '2019-12-18 12:35:00');
INSERT INTO `departments_data` VALUES (804, '12:26:01', 99.03, 93.00, 18.00, 123.00, 87.00, '2019-12-18 12:35:00');
INSERT INTO `departments_data` VALUES (805, '12:26:48', 99.10, 80.00, 19.00, 128.00, 69.00, '2019-12-18 12:36:00');
INSERT INTO `departments_data` VALUES (806, '12:26:04', 98.72, 75.00, 18.00, 102.00, 61.00, '2019-12-18 12:36:00');
INSERT INTO `departments_data` VALUES (807, '12:26:01', 97.83, 66.00, 17.00, 92.00, 63.00, '2019-12-18 12:36:00');
INSERT INTO `departments_data` VALUES (808, '12:26:48', 96.95, 60.00, 17.00, 136.00, 84.00, '2019-12-18 12:37:00');
INSERT INTO `departments_data` VALUES (809, '12:26:04', 97.59, 68.00, 19.00, 107.00, 87.00, '2019-12-18 12:37:00');
INSERT INTO `departments_data` VALUES (810, '12:26:01', 97.80, 83.00, 17.00, 98.00, 81.00, '2019-12-18 12:37:00');
INSERT INTO `departments_data` VALUES (811, '12:26:48', 99.63, 73.00, 16.00, 113.00, 81.00, '2019-12-18 12:38:00');
INSERT INTO `departments_data` VALUES (812, '12:26:04', 98.50, 86.00, 19.00, 100.00, 86.00, '2019-12-18 12:38:00');
INSERT INTO `departments_data` VALUES (813, '12:26:01', 96.70, 89.00, 17.00, 93.00, 77.00, '2019-12-18 12:38:00');
INSERT INTO `departments_data` VALUES (814, '12:26:48', 98.62, 93.00, 16.00, 122.00, 65.00, '2019-12-18 12:39:00');
INSERT INTO `departments_data` VALUES (815, '12:26:04', 97.93, 93.00, 18.00, 103.00, 72.00, '2019-12-18 12:39:00');
INSERT INTO `departments_data` VALUES (816, '12:26:01', 95.56, 85.00, 18.00, 130.00, 87.00, '2019-12-18 12:39:00');
INSERT INTO `departments_data` VALUES (817, '12:26:48', 97.58, 84.00, 17.00, 131.00, 63.00, '2019-12-18 12:40:00');
INSERT INTO `departments_data` VALUES (818, '12:26:04', 95.98, 98.00, 16.00, 116.00, 71.00, '2019-12-18 12:40:00');
INSERT INTO `departments_data` VALUES (819, '12:26:01', 95.57, 94.00, 17.00, 126.00, 72.00, '2019-12-18 12:40:00');
INSERT INTO `departments_data` VALUES (820, '12:26:48', 96.93, 83.00, 18.00, 123.00, 67.00, '2019-12-18 12:41:00');
INSERT INTO `departments_data` VALUES (821, '12:26:04', 99.02, 96.00, 16.00, 102.00, 61.00, '2019-12-18 12:41:00');
INSERT INTO `departments_data` VALUES (822, '12:26:01', 98.81, 81.00, 18.00, 92.00, 79.00, '2019-12-18 12:41:00');
INSERT INTO `departments_data` VALUES (823, '12:26:48', 98.14, 72.00, 16.00, 129.00, 87.00, '2019-12-18 12:42:00');
INSERT INTO `departments_data` VALUES (824, '12:26:04', 97.46, 81.00, 19.00, 121.00, 83.00, '2019-12-18 12:42:00');
INSERT INTO `departments_data` VALUES (825, '12:26:01', 98.66, 69.00, 18.00, 107.00, 81.00, '2019-12-18 12:42:00');
INSERT INTO `departments_data` VALUES (826, '12:26:48', 98.30, 83.00, 19.00, 108.00, 81.00, '2019-12-18 12:43:00');
INSERT INTO `departments_data` VALUES (827, '12:26:04', 99.48, 97.00, 19.00, 126.00, 69.00, '2019-12-18 12:43:00');
INSERT INTO `departments_data` VALUES (828, '12:26:01', 95.33, 77.00, 16.00, 120.00, 70.00, '2019-12-18 12:43:00');
INSERT INTO `departments_data` VALUES (829, '12:26:48', 98.61, 95.00, 17.00, 109.00, 72.00, '2019-12-18 12:44:00');
INSERT INTO `departments_data` VALUES (830, '12:26:04', 98.37, 68.00, 19.00, 115.00, 87.00, '2019-12-18 12:44:00');
INSERT INTO `departments_data` VALUES (831, '12:26:01', 98.11, 92.00, 19.00, 120.00, 71.00, '2019-12-18 12:44:00');
INSERT INTO `departments_data` VALUES (832, '12:26:48', 99.17, 90.00, 19.00, 127.00, 64.00, '2019-12-18 13:29:28');
INSERT INTO `departments_data` VALUES (833, '12:26:04', 99.79, 82.00, 17.00, 118.00, 78.00, '2019-12-18 13:29:28');
INSERT INTO `departments_data` VALUES (834, '12:26:01', 98.00, 69.00, 19.00, 90.00, 79.00, '2019-12-18 13:29:28');
INSERT INTO `departments_data` VALUES (835, '12:26:48', 95.29, 77.00, 19.00, 98.00, 80.00, '2019-12-18 13:30:00');
INSERT INTO `departments_data` VALUES (836, '12:26:04', 97.67, 92.00, 18.00, 101.00, 70.00, '2019-12-18 13:30:00');
INSERT INTO `departments_data` VALUES (837, '12:26:01', 95.57, 76.00, 18.00, 91.00, 63.00, '2019-12-18 13:30:00');
INSERT INTO `departments_data` VALUES (838, '12:26:48', 97.32, 86.00, 19.00, 92.00, 89.00, '2019-12-18 13:31:00');
INSERT INTO `departments_data` VALUES (839, '12:26:04', 96.00, 60.00, 17.00, 134.00, 69.00, '2019-12-18 13:31:00');
INSERT INTO `departments_data` VALUES (840, '12:26:01', 99.79, 84.00, 19.00, 97.00, 61.00, '2019-12-18 13:31:00');
INSERT INTO `departments_data` VALUES (841, '12:26:48', 98.27, 86.00, 16.00, 132.00, 80.00, '2019-12-18 13:32:00');
INSERT INTO `departments_data` VALUES (842, '12:26:04', 99.21, 67.00, 17.00, 101.00, 70.00, '2019-12-18 13:32:00');
INSERT INTO `departments_data` VALUES (843, '12:26:01', 99.19, 60.00, 16.00, 126.00, 83.00, '2019-12-18 13:32:00');
INSERT INTO `departments_data` VALUES (844, '12:26:48', 98.74, 94.00, 18.00, 114.00, 72.00, '2019-12-18 13:33:00');
INSERT INTO `departments_data` VALUES (845, '12:26:04', 99.64, 71.00, 17.00, 110.00, 76.00, '2019-12-18 13:33:00');
INSERT INTO `departments_data` VALUES (846, '12:26:01', 99.65, 86.00, 19.00, 93.00, 79.00, '2019-12-18 13:33:00');
INSERT INTO `departments_data` VALUES (847, '12:26:48', 96.64, 74.00, 19.00, 119.00, 76.00, '2019-12-18 13:34:00');
INSERT INTO `departments_data` VALUES (848, '12:26:04', 97.41, 67.00, 17.00, 96.00, 65.00, '2019-12-18 13:34:00');
INSERT INTO `departments_data` VALUES (849, '12:26:01', 95.69, 77.00, 17.00, 108.00, 66.00, '2019-12-18 13:34:00');
INSERT INTO `departments_data` VALUES (850, '12:26:48', 98.72, 96.00, 19.00, 96.00, 64.00, '2019-12-18 13:35:00');
INSERT INTO `departments_data` VALUES (851, '12:26:04', 95.64, 84.00, 19.00, 134.00, 78.00, '2019-12-18 13:35:00');
INSERT INTO `departments_data` VALUES (852, '12:26:01', 96.95, 67.00, 19.00, 129.00, 65.00, '2019-12-18 13:35:00');
INSERT INTO `departments_data` VALUES (853, '12:26:48', 96.11, 76.00, 17.00, 104.00, 70.00, '2019-12-18 13:36:00');
INSERT INTO `departments_data` VALUES (854, '12:26:04', 95.01, 90.00, 17.00, 103.00, 88.00, '2019-12-18 13:36:00');
INSERT INTO `departments_data` VALUES (855, '12:26:01', 95.53, 64.00, 17.00, 126.00, 69.00, '2019-12-18 13:36:00');
INSERT INTO `departments_data` VALUES (856, '12:26:48', 98.86, 69.00, 19.00, 103.00, 76.00, '2019-12-18 13:37:00');
INSERT INTO `departments_data` VALUES (857, '12:26:04', 98.70, 64.00, 17.00, 108.00, 83.00, '2019-12-18 13:37:00');
INSERT INTO `departments_data` VALUES (858, '12:26:01', 98.72, 91.00, 17.00, 116.00, 68.00, '2019-12-18 13:37:00');
INSERT INTO `departments_data` VALUES (859, '12:26:48', 95.76, 69.00, 18.00, 115.00, 72.00, '2019-12-18 13:38:00');
INSERT INTO `departments_data` VALUES (860, '12:26:04', 99.14, 90.00, 17.00, 112.00, 83.00, '2019-12-18 13:38:00');
INSERT INTO `departments_data` VALUES (861, '12:26:01', 95.65, 85.00, 17.00, 115.00, 80.00, '2019-12-18 13:38:00');
INSERT INTO `departments_data` VALUES (862, '12:26:48', 98.73, 89.00, 18.00, 116.00, 76.00, '2019-12-18 13:39:00');
INSERT INTO `departments_data` VALUES (863, '12:26:04', 99.26, 87.00, 16.00, 102.00, 78.00, '2019-12-18 13:39:00');
INSERT INTO `departments_data` VALUES (864, '12:26:01', 95.44, 90.00, 16.00, 103.00, 84.00, '2019-12-18 13:39:00');
INSERT INTO `departments_data` VALUES (865, '12:26:48', 95.82, 84.00, 17.00, 107.00, 64.00, '2019-12-18 13:40:00');
INSERT INTO `departments_data` VALUES (866, '12:26:04', 95.57, 65.00, 19.00, 107.00, 80.00, '2019-12-18 13:40:00');
INSERT INTO `departments_data` VALUES (867, '12:26:01', 99.10, 70.00, 18.00, 139.00, 70.00, '2019-12-18 13:40:00');
INSERT INTO `departments_data` VALUES (868, '12:26:48', 95.75, 63.00, 18.00, 109.00, 74.00, '2019-12-18 13:41:00');
INSERT INTO `departments_data` VALUES (869, '12:26:04', 99.62, 81.00, 18.00, 127.00, 64.00, '2019-12-18 13:41:00');
INSERT INTO `departments_data` VALUES (870, '12:26:01', 96.10, 96.00, 18.00, 111.00, 88.00, '2019-12-18 13:41:00');
INSERT INTO `departments_data` VALUES (871, '12:26:48', 99.27, 91.00, 18.00, 125.00, 87.00, '2019-12-18 13:42:00');
INSERT INTO `departments_data` VALUES (872, '12:26:04', 98.51, 84.00, 18.00, 91.00, 73.00, '2019-12-18 13:42:00');
INSERT INTO `departments_data` VALUES (873, '12:26:01', 97.05, 74.00, 18.00, 98.00, 89.00, '2019-12-18 13:42:00');
INSERT INTO `departments_data` VALUES (874, '12:26:48', 96.53, 89.00, 16.00, 115.00, 60.00, '2019-12-18 13:43:00');
INSERT INTO `departments_data` VALUES (875, '12:26:04', 96.23, 74.00, 18.00, 139.00, 65.00, '2019-12-18 13:43:00');
INSERT INTO `departments_data` VALUES (876, '12:26:01', 95.55, 66.00, 19.00, 139.00, 78.00, '2019-12-18 13:43:00');
INSERT INTO `departments_data` VALUES (877, '12:26:48', 98.73, 74.00, 18.00, 102.00, 83.00, '2019-12-18 13:44:00');
INSERT INTO `departments_data` VALUES (878, '12:26:04', 98.44, 85.00, 17.00, 137.00, 62.00, '2019-12-18 13:44:00');
INSERT INTO `departments_data` VALUES (879, '12:26:01', 96.83, 63.00, 19.00, 93.00, 65.00, '2019-12-18 13:44:00');
INSERT INTO `departments_data` VALUES (880, '12:26:48', 99.91, 73.00, 18.00, 96.00, 77.00, '2019-12-18 13:45:00');
INSERT INTO `departments_data` VALUES (881, '12:26:04', 99.94, 85.00, 18.00, 118.00, 71.00, '2019-12-18 13:45:00');
INSERT INTO `departments_data` VALUES (882, '12:26:01', 97.19, 88.00, 17.00, 117.00, 66.00, '2019-12-18 13:45:00');
INSERT INTO `departments_data` VALUES (883, '12:26:48', 96.08, 98.00, 18.00, 100.00, 68.00, '2019-12-18 13:46:00');
INSERT INTO `departments_data` VALUES (884, '12:26:04', 95.92, 77.00, 17.00, 131.00, 73.00, '2019-12-18 13:46:00');
INSERT INTO `departments_data` VALUES (885, '12:26:01', 98.85, 83.00, 16.00, 139.00, 69.00, '2019-12-18 13:46:00');
INSERT INTO `departments_data` VALUES (886, '12:26:48', 99.27, 72.00, 18.00, 119.00, 74.00, '2019-12-18 13:47:00');
INSERT INTO `departments_data` VALUES (887, '12:26:04', 98.72, 60.00, 19.00, 91.00, 84.00, '2019-12-18 13:47:00');
INSERT INTO `departments_data` VALUES (888, '12:26:01', 98.80, 82.00, 16.00, 114.00, 67.00, '2019-12-18 13:47:00');
INSERT INTO `departments_data` VALUES (889, '12:26:48', 96.54, 79.00, 17.00, 95.00, 88.00, '2019-12-18 13:48:00');
INSERT INTO `departments_data` VALUES (890, '12:26:04', 98.90, 72.00, 16.00, 130.00, 79.00, '2019-12-18 13:48:00');
INSERT INTO `departments_data` VALUES (891, '12:26:01', 97.58, 67.00, 16.00, 122.00, 85.00, '2019-12-18 13:48:00');
INSERT INTO `departments_data` VALUES (892, '12:26:48', 95.50, 81.00, 19.00, 128.00, 63.00, '2019-12-18 13:49:00');
INSERT INTO `departments_data` VALUES (893, '12:26:04', 99.40, 82.00, 18.00, 137.00, 74.00, '2019-12-18 13:49:00');
INSERT INTO `departments_data` VALUES (894, '12:26:01', 95.50, 62.00, 19.00, 95.00, 85.00, '2019-12-18 13:49:00');
INSERT INTO `departments_data` VALUES (895, '12:26:48', 99.13, 77.00, 19.00, 100.00, 74.00, '2019-12-18 13:50:00');
INSERT INTO `departments_data` VALUES (896, '12:26:04', 97.18, 78.00, 17.00, 136.00, 65.00, '2019-12-18 13:50:00');
INSERT INTO `departments_data` VALUES (897, '12:26:01', 97.32, 94.00, 19.00, 96.00, 82.00, '2019-12-18 13:50:00');
INSERT INTO `departments_data` VALUES (898, '12:26:48', 96.41, 64.00, 16.00, 134.00, 67.00, '2019-12-18 13:51:00');
INSERT INTO `departments_data` VALUES (899, '12:26:04', 97.18, 76.00, 19.00, 105.00, 89.00, '2019-12-18 13:51:00');
INSERT INTO `departments_data` VALUES (900, '12:26:01', 97.45, 99.00, 17.00, 122.00, 81.00, '2019-12-18 13:51:00');
INSERT INTO `departments_data` VALUES (901, '12:26:48', 95.73, 67.00, 17.00, 115.00, 72.00, '2019-12-18 13:52:00');
INSERT INTO `departments_data` VALUES (902, '12:26:04', 99.56, 64.00, 17.00, 117.00, 63.00, '2019-12-18 13:52:00');
INSERT INTO `departments_data` VALUES (903, '12:26:01', 99.53, 87.00, 19.00, 139.00, 77.00, '2019-12-18 13:52:00');
INSERT INTO `departments_data` VALUES (904, '12:26:48', 98.27, 61.00, 17.00, 128.00, 84.00, '2019-12-18 13:53:00');
INSERT INTO `departments_data` VALUES (905, '12:26:04', 98.95, 79.00, 18.00, 124.00, 66.00, '2019-12-18 13:53:00');
INSERT INTO `departments_data` VALUES (906, '12:26:01', 97.67, 76.00, 16.00, 135.00, 82.00, '2019-12-18 13:53:00');
INSERT INTO `departments_data` VALUES (907, '12:26:48', 99.46, 89.00, 16.00, 103.00, 78.00, '2019-12-18 13:54:00');
INSERT INTO `departments_data` VALUES (908, '12:26:04', 97.90, 60.00, 16.00, 121.00, 75.00, '2019-12-18 13:54:00');
INSERT INTO `departments_data` VALUES (909, '12:26:01', 98.27, 73.00, 19.00, 131.00, 64.00, '2019-12-18 13:54:00');
INSERT INTO `departments_data` VALUES (910, '12:26:48', 99.96, 86.00, 16.00, 101.00, 67.00, '2019-12-18 13:55:00');
INSERT INTO `departments_data` VALUES (911, '12:26:04', 99.68, 93.00, 16.00, 100.00, 70.00, '2019-12-18 13:55:00');
INSERT INTO `departments_data` VALUES (912, '12:26:01', 97.62, 75.00, 19.00, 94.00, 84.00, '2019-12-18 13:55:00');
INSERT INTO `departments_data` VALUES (913, '12:26:48', 99.55, 88.00, 17.00, 134.00, 81.00, '2019-12-18 13:56:00');
INSERT INTO `departments_data` VALUES (914, '12:26:04', 98.37, 69.00, 19.00, 113.00, 84.00, '2019-12-18 13:56:00');
INSERT INTO `departments_data` VALUES (915, '12:26:01', 99.55, 75.00, 17.00, 126.00, 66.00, '2019-12-18 13:56:00');
INSERT INTO `departments_data` VALUES (916, '12:26:48', 95.07, 92.00, 19.00, 133.00, 70.00, '2019-12-18 13:57:00');
INSERT INTO `departments_data` VALUES (917, '12:26:04', 97.42, 67.00, 19.00, 134.00, 76.00, '2019-12-18 13:57:00');
INSERT INTO `departments_data` VALUES (918, '12:26:01', 98.49, 84.00, 18.00, 129.00, 87.00, '2019-12-18 13:57:00');
INSERT INTO `departments_data` VALUES (919, '12:26:48', 99.00, 74.00, 16.00, 93.00, 85.00, '2019-12-18 13:58:00');
INSERT INTO `departments_data` VALUES (920, '12:26:04', 98.44, 67.00, 16.00, 122.00, 60.00, '2019-12-18 13:58:00');
INSERT INTO `departments_data` VALUES (921, '12:26:01', 95.89, 65.00, 17.00, 136.00, 67.00, '2019-12-18 13:58:00');
INSERT INTO `departments_data` VALUES (922, '12:26:48', 95.69, 96.00, 18.00, 121.00, 76.00, '2019-12-18 13:59:00');
INSERT INTO `departments_data` VALUES (923, '12:26:04', 97.34, 88.00, 17.00, 98.00, 61.00, '2019-12-18 13:59:00');
INSERT INTO `departments_data` VALUES (924, '12:26:01', 96.40, 77.00, 16.00, 137.00, 83.00, '2019-12-18 13:59:00');
INSERT INTO `departments_data` VALUES (925, '12:26:48', 99.54, 88.00, 19.00, 125.00, 84.00, '2019-12-18 14:00:00');
INSERT INTO `departments_data` VALUES (926, '12:26:04', 99.22, 83.00, 16.00, 119.00, 80.00, '2019-12-18 14:00:00');
INSERT INTO `departments_data` VALUES (927, '12:26:01', 98.96, 91.00, 16.00, 100.00, 80.00, '2019-12-18 14:00:00');
INSERT INTO `departments_data` VALUES (928, '12:26:48', 98.60, 97.00, 17.00, 101.00, 77.00, '2019-12-18 14:01:00');
INSERT INTO `departments_data` VALUES (929, '12:26:04', 98.41, 92.00, 16.00, 138.00, 66.00, '2019-12-18 14:01:00');
INSERT INTO `departments_data` VALUES (930, '12:26:01', 96.39, 67.00, 16.00, 99.00, 75.00, '2019-12-18 14:01:00');
INSERT INTO `departments_data` VALUES (931, '12:26:48', 99.77, 95.00, 16.00, 93.00, 76.00, '2019-12-18 14:02:00');
INSERT INTO `departments_data` VALUES (932, '12:26:04', 96.50, 62.00, 19.00, 115.00, 70.00, '2019-12-18 14:02:00');
INSERT INTO `departments_data` VALUES (933, '12:26:01', 95.42, 60.00, 18.00, 117.00, 82.00, '2019-12-18 14:02:00');
INSERT INTO `departments_data` VALUES (934, '12:26:48', 95.02, 60.00, 16.00, 95.00, 76.00, '2019-12-18 14:03:00');
INSERT INTO `departments_data` VALUES (935, '12:26:04', 98.22, 81.00, 16.00, 116.00, 67.00, '2019-12-18 14:03:00');
INSERT INTO `departments_data` VALUES (936, '12:26:01', 98.31, 88.00, 19.00, 113.00, 74.00, '2019-12-18 14:03:00');
INSERT INTO `departments_data` VALUES (937, '12:26:48', 96.34, 82.00, 19.00, 105.00, 84.00, '2019-12-18 14:04:00');
INSERT INTO `departments_data` VALUES (938, '12:26:04', 96.16, 83.00, 18.00, 93.00, 62.00, '2019-12-18 14:04:00');
INSERT INTO `departments_data` VALUES (939, '12:26:01', 98.34, 68.00, 18.00, 116.00, 80.00, '2019-12-18 14:04:00');
INSERT INTO `departments_data` VALUES (940, '12:26:48', 95.75, 86.00, 16.00, 130.00, 79.00, '2019-12-18 14:05:00');
INSERT INTO `departments_data` VALUES (941, '12:26:04', 98.98, 63.00, 16.00, 113.00, 84.00, '2019-12-18 14:05:00');
INSERT INTO `departments_data` VALUES (942, '12:26:01', 99.04, 70.00, 18.00, 139.00, 83.00, '2019-12-18 14:05:00');
INSERT INTO `departments_data` VALUES (943, '12:26:48', 98.63, 77.00, 16.00, 114.00, 84.00, '2019-12-18 14:06:00');
INSERT INTO `departments_data` VALUES (944, '12:26:04', 98.47, 88.00, 16.00, 118.00, 72.00, '2019-12-18 14:06:00');
INSERT INTO `departments_data` VALUES (945, '12:26:01', 96.15, 81.00, 17.00, 132.00, 69.00, '2019-12-18 14:06:00');
INSERT INTO `departments_data` VALUES (946, '12:26:48', 97.92, 99.00, 18.00, 115.00, 68.00, '2019-12-18 14:07:00');
INSERT INTO `departments_data` VALUES (947, '12:26:04', 95.93, 68.00, 17.00, 132.00, 75.00, '2019-12-18 14:07:00');
INSERT INTO `departments_data` VALUES (948, '12:26:01', 95.00, 98.00, 16.00, 97.00, 66.00, '2019-12-18 14:07:00');
INSERT INTO `departments_data` VALUES (949, '12:26:48', 95.41, 84.00, 19.00, 112.00, 79.00, '2019-12-18 14:08:00');
INSERT INTO `departments_data` VALUES (950, '12:26:04', 99.76, 97.00, 18.00, 130.00, 84.00, '2019-12-18 14:08:00');
INSERT INTO `departments_data` VALUES (951, '12:26:01', 96.42, 78.00, 19.00, 128.00, 63.00, '2019-12-18 14:08:00');
INSERT INTO `departments_data` VALUES (952, '12:26:48', 96.08, 83.00, 17.00, 122.00, 87.00, '2019-12-18 14:09:00');
INSERT INTO `departments_data` VALUES (953, '12:26:04', 97.95, 95.00, 19.00, 118.00, 70.00, '2019-12-18 14:09:00');
INSERT INTO `departments_data` VALUES (954, '12:26:01', 98.41, 64.00, 18.00, 120.00, 82.00, '2019-12-18 14:09:00');
INSERT INTO `departments_data` VALUES (955, '12:26:48', 97.51, 79.00, 19.00, 95.00, 84.00, '2019-12-18 14:10:00');
INSERT INTO `departments_data` VALUES (956, '12:26:04', 98.59, 87.00, 17.00, 116.00, 89.00, '2019-12-18 14:10:00');
INSERT INTO `departments_data` VALUES (957, '12:26:01', 98.69, 71.00, 19.00, 130.00, 66.00, '2019-12-18 14:10:00');
INSERT INTO `departments_data` VALUES (958, '12:26:48', 99.13, 97.00, 16.00, 94.00, 65.00, '2019-12-18 14:11:00');
INSERT INTO `departments_data` VALUES (959, '12:26:04', 99.14, 81.00, 17.00, 111.00, 62.00, '2019-12-18 14:11:00');
INSERT INTO `departments_data` VALUES (960, '12:26:01', 99.26, 73.00, 18.00, 102.00, 73.00, '2019-12-18 14:11:00');
INSERT INTO `departments_data` VALUES (961, '12:26:48', 95.93, 76.00, 18.00, 112.00, 83.00, '2019-12-18 14:12:00');
INSERT INTO `departments_data` VALUES (962, '12:26:04', 98.28, 68.00, 17.00, 102.00, 71.00, '2019-12-18 14:12:00');
INSERT INTO `departments_data` VALUES (963, '12:26:01', 96.20, 64.00, 17.00, 137.00, 75.00, '2019-12-18 14:12:00');
INSERT INTO `departments_data` VALUES (964, '12:26:48', 98.63, 61.00, 16.00, 136.00, 81.00, '2019-12-18 14:13:00');
INSERT INTO `departments_data` VALUES (965, '12:26:04', 95.23, 74.00, 18.00, 123.00, 64.00, '2019-12-18 14:13:00');
INSERT INTO `departments_data` VALUES (966, '12:26:01', 95.11, 70.00, 16.00, 123.00, 83.00, '2019-12-18 14:13:00');
INSERT INTO `departments_data` VALUES (967, '12:26:48', 95.08, 92.00, 19.00, 104.00, 67.00, '2019-12-18 14:14:00');
INSERT INTO `departments_data` VALUES (968, '12:26:04', 95.84, 73.00, 18.00, 116.00, 77.00, '2019-12-18 14:14:00');
INSERT INTO `departments_data` VALUES (969, '12:26:01', 99.61, 82.00, 18.00, 119.00, 74.00, '2019-12-18 14:14:00');
INSERT INTO `departments_data` VALUES (970, '12:26:48', 97.61, 66.00, 17.00, 107.00, 79.00, '2019-12-18 14:15:00');
INSERT INTO `departments_data` VALUES (971, '12:26:04', 96.92, 66.00, 19.00, 102.00, 60.00, '2019-12-18 14:15:00');
INSERT INTO `departments_data` VALUES (972, '12:26:01', 95.32, 94.00, 18.00, 136.00, 88.00, '2019-12-18 14:15:00');
INSERT INTO `departments_data` VALUES (973, '12:26:48', 96.34, 97.00, 19.00, 138.00, 88.00, '2019-12-18 14:16:00');
INSERT INTO `departments_data` VALUES (974, '12:26:04', 95.78, 96.00, 18.00, 128.00, 69.00, '2019-12-18 14:16:01');
INSERT INTO `departments_data` VALUES (975, '12:26:01', 98.39, 75.00, 19.00, 135.00, 65.00, '2019-12-18 14:16:01');
INSERT INTO `departments_data` VALUES (976, '12:26:48', 95.45, 96.00, 19.00, 95.00, 60.00, '2019-12-18 14:17:00');
INSERT INTO `departments_data` VALUES (977, '12:26:04', 99.69, 62.00, 17.00, 119.00, 74.00, '2019-12-18 14:17:00');
INSERT INTO `departments_data` VALUES (978, '12:26:01', 99.47, 81.00, 19.00, 105.00, 86.00, '2019-12-18 14:17:00');
INSERT INTO `departments_data` VALUES (979, '12:26:48', 96.51, 84.00, 16.00, 116.00, 81.00, '2019-12-18 14:18:00');
INSERT INTO `departments_data` VALUES (980, '12:26:04', 98.76, 82.00, 19.00, 128.00, 88.00, '2019-12-18 14:18:00');
INSERT INTO `departments_data` VALUES (981, '12:26:01', 98.43, 81.00, 18.00, 132.00, 85.00, '2019-12-18 14:18:00');
INSERT INTO `departments_data` VALUES (982, '12:26:48', 98.52, 90.00, 17.00, 105.00, 73.00, '2019-12-18 14:19:00');
INSERT INTO `departments_data` VALUES (983, '12:26:04', 99.14, 84.00, 16.00, 109.00, 60.00, '2019-12-18 14:19:00');
INSERT INTO `departments_data` VALUES (984, '12:26:01', 96.61, 76.00, 16.00, 123.00, 69.00, '2019-12-18 14:19:00');
INSERT INTO `departments_data` VALUES (985, '12:26:48', 97.76, 97.00, 19.00, 100.00, 80.00, '2019-12-18 14:20:00');
INSERT INTO `departments_data` VALUES (986, '12:26:04', 95.91, 91.00, 18.00, 123.00, 79.00, '2019-12-18 14:20:00');
INSERT INTO `departments_data` VALUES (987, '12:26:01', 95.05, 77.00, 16.00, 96.00, 81.00, '2019-12-18 14:20:00');
INSERT INTO `departments_data` VALUES (988, '12:26:48', 99.41, 62.00, 17.00, 138.00, 68.00, '2019-12-18 14:21:00');
INSERT INTO `departments_data` VALUES (989, '12:26:04', 96.30, 88.00, 16.00, 126.00, 79.00, '2019-12-18 14:21:00');
INSERT INTO `departments_data` VALUES (990, '12:26:01', 99.08, 85.00, 16.00, 96.00, 86.00, '2019-12-18 14:21:00');
INSERT INTO `departments_data` VALUES (991, '12:26:48', 98.78, 76.00, 17.00, 92.00, 63.00, '2019-12-18 14:22:00');
INSERT INTO `departments_data` VALUES (992, '12:26:04', 96.34, 77.00, 17.00, 112.00, 75.00, '2019-12-18 14:22:00');
INSERT INTO `departments_data` VALUES (993, '12:26:01', 96.04, 95.00, 16.00, 115.00, 80.00, '2019-12-18 14:22:00');
INSERT INTO `departments_data` VALUES (994, '12:26:48', 96.70, 74.00, 19.00, 122.00, 78.00, '2019-12-18 14:23:00');
INSERT INTO `departments_data` VALUES (995, '12:26:04', 99.80, 67.00, 17.00, 116.00, 60.00, '2019-12-18 14:23:00');
INSERT INTO `departments_data` VALUES (996, '12:26:01', 95.32, 80.00, 18.00, 93.00, 77.00, '2019-12-18 14:23:00');
INSERT INTO `departments_data` VALUES (997, '12:26:48', 96.03, 94.00, 16.00, 105.00, 81.00, '2019-12-18 14:24:00');
INSERT INTO `departments_data` VALUES (998, '12:26:04', 96.68, 65.00, 17.00, 111.00, 84.00, '2019-12-18 14:24:00');
INSERT INTO `departments_data` VALUES (999, '12:26:01', 98.05, 63.00, 18.00, 110.00, 83.00, '2019-12-18 14:24:00');
INSERT INTO `departments_data` VALUES (1000, '12:26:48', 96.16, 65.00, 18.00, 120.00, 83.00, '2019-12-18 14:25:00');
INSERT INTO `departments_data` VALUES (1001, '12:26:04', 99.05, 73.00, 18.00, 92.00, 65.00, '2019-12-18 14:25:00');
INSERT INTO `departments_data` VALUES (1002, '12:26:01', 97.46, 64.00, 17.00, 95.00, 87.00, '2019-12-18 14:25:00');
INSERT INTO `departments_data` VALUES (1003, '12:26:48', 99.00, 91.00, 17.00, 104.00, 80.00, '2019-12-18 14:26:00');
INSERT INTO `departments_data` VALUES (1004, '12:26:04', 95.67, 95.00, 16.00, 100.00, 74.00, '2019-12-18 14:26:00');
INSERT INTO `departments_data` VALUES (1005, '12:26:01', 95.11, 88.00, 19.00, 101.00, 71.00, '2019-12-18 14:26:00');
INSERT INTO `departments_data` VALUES (1006, '12:26:48', 97.14, 89.00, 17.00, 115.00, 60.00, '2019-12-18 14:27:00');
INSERT INTO `departments_data` VALUES (1007, '12:26:04', 95.21, 93.00, 16.00, 114.00, 71.00, '2019-12-18 14:27:00');
INSERT INTO `departments_data` VALUES (1008, '12:26:01', 99.57, 80.00, 16.00, 94.00, 71.00, '2019-12-18 14:27:00');
INSERT INTO `departments_data` VALUES (1009, '12:26:48', 95.73, 73.00, 19.00, 131.00, 64.00, '2019-12-18 14:28:00');
INSERT INTO `departments_data` VALUES (1010, '12:26:04', 95.13, 64.00, 16.00, 131.00, 67.00, '2019-12-18 14:28:00');
INSERT INTO `departments_data` VALUES (1011, '12:26:01', 99.37, 86.00, 17.00, 121.00, 71.00, '2019-12-18 14:28:00');
INSERT INTO `departments_data` VALUES (1012, '12:26:48', 96.26, 73.00, 16.00, 115.00, 70.00, '2019-12-18 14:29:00');
INSERT INTO `departments_data` VALUES (1013, '12:26:04', 98.93, 81.00, 17.00, 105.00, 83.00, '2019-12-18 14:29:00');
INSERT INTO `departments_data` VALUES (1014, '12:26:01', 97.98, 84.00, 18.00, 112.00, 82.00, '2019-12-18 14:29:00');
INSERT INTO `departments_data` VALUES (1015, '12:26:48', 98.95, 90.00, 19.00, 130.00, 86.00, '2019-12-18 14:30:00');
INSERT INTO `departments_data` VALUES (1016, '12:26:04', 97.33, 61.00, 19.00, 94.00, 89.00, '2019-12-18 14:30:00');
INSERT INTO `departments_data` VALUES (1017, '12:26:01', 96.66, 77.00, 18.00, 95.00, 83.00, '2019-12-18 14:30:00');
INSERT INTO `departments_data` VALUES (1018, '12:26:48', 99.94, 93.00, 17.00, 109.00, 65.00, '2019-12-18 14:31:00');
INSERT INTO `departments_data` VALUES (1019, '12:26:04', 97.13, 82.00, 17.00, 116.00, 76.00, '2019-12-18 14:31:00');
INSERT INTO `departments_data` VALUES (1020, '12:26:01', 99.05, 96.00, 19.00, 118.00, 87.00, '2019-12-18 14:31:00');
INSERT INTO `departments_data` VALUES (1021, '12:26:48', 98.88, 92.00, 19.00, 102.00, 64.00, '2019-12-18 14:32:00');
INSERT INTO `departments_data` VALUES (1022, '12:26:04', 99.88, 85.00, 16.00, 111.00, 73.00, '2019-12-18 14:32:00');
INSERT INTO `departments_data` VALUES (1023, '12:26:01', 96.63, 61.00, 16.00, 136.00, 69.00, '2019-12-18 14:32:00');
INSERT INTO `departments_data` VALUES (1024, '12:26:48', 98.22, 66.00, 18.00, 119.00, 66.00, '2019-12-18 14:33:00');
INSERT INTO `departments_data` VALUES (1025, '12:26:04', 97.06, 95.00, 18.00, 110.00, 70.00, '2019-12-18 14:33:00');
INSERT INTO `departments_data` VALUES (1026, '12:26:01', 99.24, 95.00, 17.00, 91.00, 66.00, '2019-12-18 14:33:00');
INSERT INTO `departments_data` VALUES (1027, '12:26:48', 98.84, 67.00, 16.00, 133.00, 73.00, '2019-12-18 14:34:00');
INSERT INTO `departments_data` VALUES (1028, '12:26:04', 98.80, 74.00, 19.00, 109.00, 83.00, '2019-12-18 14:34:00');
INSERT INTO `departments_data` VALUES (1029, '12:26:01', 98.43, 74.00, 19.00, 129.00, 75.00, '2019-12-18 14:34:00');
INSERT INTO `departments_data` VALUES (1030, '12:26:48', 95.77, 72.00, 19.00, 91.00, 65.00, '2019-12-18 14:35:00');
INSERT INTO `departments_data` VALUES (1031, '12:26:04', 99.54, 84.00, 18.00, 120.00, 74.00, '2019-12-18 14:35:00');
INSERT INTO `departments_data` VALUES (1032, '12:26:01', 99.07, 77.00, 19.00, 120.00, 68.00, '2019-12-18 14:35:00');
INSERT INTO `departments_data` VALUES (1033, '12:26:48', 97.99, 67.00, 17.00, 129.00, 60.00, '2019-12-18 14:36:00');
INSERT INTO `departments_data` VALUES (1034, '12:26:04', 99.93, 78.00, 18.00, 139.00, 87.00, '2019-12-18 14:36:00');
INSERT INTO `departments_data` VALUES (1035, '12:26:01', 99.41, 63.00, 17.00, 139.00, 60.00, '2019-12-18 14:36:00');
INSERT INTO `departments_data` VALUES (1036, '12:26:48', 96.44, 90.00, 16.00, 131.00, 87.00, '2019-12-18 14:37:00');
INSERT INTO `departments_data` VALUES (1037, '12:26:04', 95.13, 67.00, 16.00, 96.00, 84.00, '2019-12-18 14:37:00');
INSERT INTO `departments_data` VALUES (1038, '12:26:01', 99.86, 74.00, 18.00, 105.00, 66.00, '2019-12-18 14:37:00');
INSERT INTO `departments_data` VALUES (1039, '12:26:48', 98.38, 91.00, 17.00, 102.00, 70.00, '2019-12-18 14:38:00');
INSERT INTO `departments_data` VALUES (1040, '12:26:04', 99.07, 85.00, 19.00, 127.00, 88.00, '2019-12-18 14:38:00');
INSERT INTO `departments_data` VALUES (1041, '12:26:01', 98.86, 85.00, 17.00, 135.00, 67.00, '2019-12-18 14:38:00');
INSERT INTO `departments_data` VALUES (1042, '12:26:48', 97.34, 82.00, 18.00, 125.00, 81.00, '2019-12-18 14:39:00');
INSERT INTO `departments_data` VALUES (1043, '12:26:04', 96.09, 61.00, 19.00, 122.00, 86.00, '2019-12-18 14:39:00');
INSERT INTO `departments_data` VALUES (1044, '12:26:01', 99.85, 71.00, 18.00, 92.00, 61.00, '2019-12-18 14:39:00');
INSERT INTO `departments_data` VALUES (1045, '12:26:48', 97.40, 68.00, 18.00, 109.00, 81.00, '2019-12-18 14:40:00');
INSERT INTO `departments_data` VALUES (1046, '12:26:04', 99.88, 94.00, 18.00, 135.00, 83.00, '2019-12-18 14:40:00');
INSERT INTO `departments_data` VALUES (1047, '12:26:01', 98.18, 69.00, 16.00, 135.00, 62.00, '2019-12-18 14:40:00');
INSERT INTO `departments_data` VALUES (1048, '12:26:48', 99.95, 81.00, 17.00, 121.00, 84.00, '2019-12-18 14:41:00');
INSERT INTO `departments_data` VALUES (1049, '12:26:04', 96.07, 64.00, 19.00, 101.00, 64.00, '2019-12-18 14:41:00');
INSERT INTO `departments_data` VALUES (1050, '12:26:01', 99.74, 67.00, 18.00, 115.00, 81.00, '2019-12-18 14:41:00');
INSERT INTO `departments_data` VALUES (1051, '12:26:48', 98.18, 93.00, 16.00, 117.00, 67.00, '2019-12-18 14:42:00');
INSERT INTO `departments_data` VALUES (1052, '12:26:04', 98.91, 81.00, 17.00, 123.00, 60.00, '2019-12-18 14:42:00');
INSERT INTO `departments_data` VALUES (1053, '12:26:01', 96.41, 82.00, 19.00, 107.00, 68.00, '2019-12-18 14:42:00');
INSERT INTO `departments_data` VALUES (1054, '12:26:48', 97.71, 83.00, 19.00, 94.00, 73.00, '2019-12-18 14:43:00');
INSERT INTO `departments_data` VALUES (1055, '12:26:04', 98.20, 74.00, 16.00, 128.00, 70.00, '2019-12-18 14:43:00');
INSERT INTO `departments_data` VALUES (1056, '12:26:01', 99.36, 82.00, 16.00, 92.00, 66.00, '2019-12-18 14:43:00');
INSERT INTO `departments_data` VALUES (1057, '12:26:48', 98.52, 87.00, 17.00, 90.00, 68.00, '2019-12-18 14:44:00');
INSERT INTO `departments_data` VALUES (1058, '12:26:04', 98.88, 71.00, 16.00, 118.00, 65.00, '2019-12-18 14:44:00');
INSERT INTO `departments_data` VALUES (1059, '12:26:01', 98.90, 87.00, 17.00, 109.00, 74.00, '2019-12-18 14:44:00');
INSERT INTO `departments_data` VALUES (1060, '12:26:48', 98.25, 60.00, 19.00, 133.00, 65.00, '2019-12-18 14:45:00');
INSERT INTO `departments_data` VALUES (1061, '12:26:04', 99.59, 96.00, 16.00, 133.00, 87.00, '2019-12-18 14:45:00');
INSERT INTO `departments_data` VALUES (1062, '12:26:01', 99.01, 97.00, 19.00, 127.00, 74.00, '2019-12-18 14:45:00');
INSERT INTO `departments_data` VALUES (1063, '12:26:48', 98.77, 69.00, 19.00, 122.00, 67.00, '2019-12-18 14:46:00');
INSERT INTO `departments_data` VALUES (1064, '12:26:04', 96.48, 89.00, 17.00, 137.00, 88.00, '2019-12-18 14:46:00');
INSERT INTO `departments_data` VALUES (1065, '12:26:01', 97.23, 94.00, 19.00, 107.00, 82.00, '2019-12-18 14:46:00');
INSERT INTO `departments_data` VALUES (1066, '12:26:48', 98.22, 75.00, 17.00, 127.00, 81.00, '2019-12-18 14:47:00');
INSERT INTO `departments_data` VALUES (1067, '12:26:04', 96.68, 97.00, 17.00, 116.00, 67.00, '2019-12-18 14:47:00');
INSERT INTO `departments_data` VALUES (1068, '12:26:01', 96.97, 91.00, 19.00, 101.00, 83.00, '2019-12-18 14:47:00');
INSERT INTO `departments_data` VALUES (1069, '12:26:48', 98.42, 95.00, 17.00, 120.00, 60.00, '2019-12-18 14:48:00');
INSERT INTO `departments_data` VALUES (1070, '12:26:04', 99.53, 65.00, 18.00, 130.00, 77.00, '2019-12-18 14:48:00');
INSERT INTO `departments_data` VALUES (1071, '12:26:01', 97.99, 79.00, 18.00, 104.00, 62.00, '2019-12-18 14:48:00');
INSERT INTO `departments_data` VALUES (1072, '12:26:48', 99.85, 62.00, 18.00, 123.00, 79.00, '2019-12-18 14:49:00');
INSERT INTO `departments_data` VALUES (1073, '12:26:04', 97.42, 98.00, 16.00, 108.00, 85.00, '2019-12-18 14:49:00');
INSERT INTO `departments_data` VALUES (1074, '12:26:01', 96.81, 82.00, 16.00, 98.00, 68.00, '2019-12-18 14:49:00');
INSERT INTO `departments_data` VALUES (1075, '12:26:48', 99.61, 79.00, 18.00, 121.00, 64.00, '2019-12-18 14:50:00');
INSERT INTO `departments_data` VALUES (1076, '12:26:04', 96.18, 79.00, 17.00, 105.00, 72.00, '2019-12-18 14:50:00');
INSERT INTO `departments_data` VALUES (1077, '12:26:01', 99.64, 69.00, 19.00, 129.00, 60.00, '2019-12-18 14:50:00');
INSERT INTO `departments_data` VALUES (1078, '12:26:48', 96.35, 61.00, 18.00, 100.00, 63.00, '2019-12-18 14:51:00');
INSERT INTO `departments_data` VALUES (1079, '12:26:04', 97.68, 86.00, 16.00, 107.00, 81.00, '2019-12-18 14:51:00');
INSERT INTO `departments_data` VALUES (1080, '12:26:01', 98.84, 84.00, 18.00, 131.00, 73.00, '2019-12-18 14:51:00');
INSERT INTO `departments_data` VALUES (1081, '12:26:48', 97.57, 76.00, 16.00, 99.00, 87.00, '2019-12-18 14:52:00');
INSERT INTO `departments_data` VALUES (1082, '12:26:04', 97.88, 60.00, 16.00, 126.00, 75.00, '2019-12-18 14:52:00');
INSERT INTO `departments_data` VALUES (1083, '12:26:01', 98.01, 87.00, 18.00, 125.00, 85.00, '2019-12-18 14:52:00');
INSERT INTO `departments_data` VALUES (1084, '12:26:48', 96.31, 96.00, 19.00, 99.00, 66.00, '2019-12-18 14:53:00');
INSERT INTO `departments_data` VALUES (1085, '12:26:04', 99.99, 87.00, 17.00, 116.00, 75.00, '2019-12-18 14:53:00');
INSERT INTO `departments_data` VALUES (1086, '12:26:01', 98.94, 94.00, 19.00, 134.00, 78.00, '2019-12-18 14:53:00');
INSERT INTO `departments_data` VALUES (1087, '12:26:48', 99.16, 64.00, 19.00, 100.00, 82.00, '2019-12-18 14:54:00');
INSERT INTO `departments_data` VALUES (1088, '12:26:04', 96.32, 60.00, 17.00, 102.00, 72.00, '2019-12-18 14:54:00');
INSERT INTO `departments_data` VALUES (1089, '12:26:01', 96.53, 95.00, 17.00, 107.00, 61.00, '2019-12-18 14:54:00');
INSERT INTO `departments_data` VALUES (1090, '12:26:48', 97.67, 82.00, 19.00, 138.00, 67.00, '2019-12-18 14:55:00');
INSERT INTO `departments_data` VALUES (1091, '12:26:04', 96.35, 86.00, 19.00, 128.00, 61.00, '2019-12-18 14:55:00');
INSERT INTO `departments_data` VALUES (1092, '12:26:01', 97.34, 69.00, 16.00, 116.00, 83.00, '2019-12-18 14:55:00');
INSERT INTO `departments_data` VALUES (1093, '12:26:48', 96.16, 70.00, 17.00, 122.00, 89.00, '2019-12-18 14:56:00');
INSERT INTO `departments_data` VALUES (1094, '12:26:04', 96.10, 61.00, 18.00, 139.00, 89.00, '2019-12-18 14:56:00');
INSERT INTO `departments_data` VALUES (1095, '12:26:01', 95.56, 78.00, 16.00, 103.00, 78.00, '2019-12-18 14:56:00');
INSERT INTO `departments_data` VALUES (1096, '12:26:48', 96.38, 95.00, 16.00, 99.00, 81.00, '2019-12-18 14:57:00');
INSERT INTO `departments_data` VALUES (1097, '12:26:04', 95.67, 81.00, 16.00, 128.00, 89.00, '2019-12-18 14:57:00');
INSERT INTO `departments_data` VALUES (1098, '12:26:01', 96.04, 77.00, 17.00, 96.00, 81.00, '2019-12-18 14:57:00');
INSERT INTO `departments_data` VALUES (1099, '12:26:48', 96.83, 83.00, 16.00, 116.00, 89.00, '2019-12-18 14:58:00');
INSERT INTO `departments_data` VALUES (1100, '12:26:04', 96.53, 71.00, 18.00, 122.00, 70.00, '2019-12-18 14:58:00');
INSERT INTO `departments_data` VALUES (1101, '12:26:01', 97.45, 92.00, 18.00, 93.00, 75.00, '2019-12-18 14:58:00');
INSERT INTO `departments_data` VALUES (1102, '12:26:48', 96.05, 79.00, 16.00, 117.00, 63.00, '2019-12-18 14:59:00');
INSERT INTO `departments_data` VALUES (1103, '12:26:04', 98.92, 63.00, 18.00, 102.00, 79.00, '2019-12-18 14:59:00');
INSERT INTO `departments_data` VALUES (1104, '12:26:01', 97.24, 81.00, 16.00, 104.00, 84.00, '2019-12-18 14:59:00');
INSERT INTO `departments_data` VALUES (1105, '12:26:48', 99.44, 87.00, 17.00, 111.00, 61.00, '2019-12-18 15:00:00');
INSERT INTO `departments_data` VALUES (1106, '12:26:04', 96.86, 62.00, 19.00, 137.00, 74.00, '2019-12-18 15:00:00');
INSERT INTO `departments_data` VALUES (1107, '12:26:01', 98.43, 99.00, 16.00, 103.00, 65.00, '2019-12-18 15:00:00');
INSERT INTO `departments_data` VALUES (1108, '12:26:48', 99.34, 86.00, 17.00, 94.00, 87.00, '2019-12-18 15:01:00');
INSERT INTO `departments_data` VALUES (1109, '12:26:04', 95.47, 60.00, 19.00, 102.00, 74.00, '2019-12-18 15:01:00');
INSERT INTO `departments_data` VALUES (1110, '12:26:01', 98.15, 69.00, 16.00, 101.00, 79.00, '2019-12-18 15:01:00');
INSERT INTO `departments_data` VALUES (1111, '12:26:48', 96.20, 69.00, 19.00, 113.00, 65.00, '2019-12-18 15:02:00');
INSERT INTO `departments_data` VALUES (1112, '12:26:04', 95.59, 63.00, 18.00, 124.00, 78.00, '2019-12-18 15:02:05');
INSERT INTO `departments_data` VALUES (1113, '12:26:01', 99.11, 87.00, 16.00, 115.00, 64.00, '2019-12-18 15:02:07');
INSERT INTO `departments_data` VALUES (1114, '12:26:48', 97.34, 70.00, 17.00, 133.00, 68.00, '2019-12-18 15:03:00');
INSERT INTO `departments_data` VALUES (1115, '12:26:04', 96.40, 73.00, 17.00, 125.00, 84.00, '2019-12-18 15:03:00');
INSERT INTO `departments_data` VALUES (1116, '12:26:01', 95.38, 80.00, 17.00, 101.00, 77.00, '2019-12-18 15:03:00');
INSERT INTO `departments_data` VALUES (1117, '12:26:48', 95.85, 92.00, 16.00, 104.00, 85.00, '2019-12-18 15:04:00');
INSERT INTO `departments_data` VALUES (1118, '12:26:04', 96.11, 71.00, 17.00, 132.00, 88.00, '2019-12-18 15:04:00');
INSERT INTO `departments_data` VALUES (1119, '12:26:01', 99.95, 84.00, 19.00, 114.00, 77.00, '2019-12-18 15:04:00');
INSERT INTO `departments_data` VALUES (1120, '12:26:48', 95.11, 80.00, 19.00, 109.00, 87.00, '2019-12-18 15:05:00');
INSERT INTO `departments_data` VALUES (1121, '12:26:04', 95.39, 67.00, 16.00, 109.00, 72.00, '2019-12-18 15:05:00');
INSERT INTO `departments_data` VALUES (1122, '12:26:01', 96.59, 88.00, 17.00, 119.00, 60.00, '2019-12-18 15:05:00');
INSERT INTO `departments_data` VALUES (1123, '12:26:48', 98.19, 84.00, 19.00, 109.00, 84.00, '2019-12-18 15:06:00');
INSERT INTO `departments_data` VALUES (1124, '12:26:04', 97.89, 62.00, 19.00, 99.00, 63.00, '2019-12-18 15:06:00');
INSERT INTO `departments_data` VALUES (1125, '12:26:01', 98.56, 73.00, 16.00, 117.00, 72.00, '2019-12-18 15:06:00');
INSERT INTO `departments_data` VALUES (1126, '12:26:48', 98.69, 60.00, 17.00, 130.00, 76.00, '2019-12-18 15:07:00');
INSERT INTO `departments_data` VALUES (1127, '12:26:04', 95.23, 92.00, 17.00, 102.00, 86.00, '2019-12-18 15:07:00');
INSERT INTO `departments_data` VALUES (1128, '12:26:01', 97.87, 79.00, 19.00, 129.00, 70.00, '2019-12-18 15:07:00');
INSERT INTO `departments_data` VALUES (1129, '12:26:48', 97.20, 75.00, 16.00, 136.00, 71.00, '2019-12-18 15:08:00');
INSERT INTO `departments_data` VALUES (1130, '12:26:04', 95.25, 75.00, 17.00, 93.00, 71.00, '2019-12-18 15:08:01');
INSERT INTO `departments_data` VALUES (1131, '12:26:01', 98.52, 70.00, 19.00, 138.00, 75.00, '2019-12-18 15:08:02');
INSERT INTO `departments_data` VALUES (1132, '12:26:48', 95.92, 84.00, 17.00, 93.00, 72.00, '2019-12-18 15:09:00');
INSERT INTO `departments_data` VALUES (1133, '12:26:04', 99.69, 89.00, 18.00, 90.00, 67.00, '2019-12-18 15:09:00');
INSERT INTO `departments_data` VALUES (1134, '12:26:01', 95.15, 81.00, 16.00, 128.00, 84.00, '2019-12-18 15:09:00');
INSERT INTO `departments_data` VALUES (1135, '12:26:48', 96.14, 86.00, 19.00, 133.00, 85.00, '2019-12-18 15:10:00');
INSERT INTO `departments_data` VALUES (1136, '12:26:04', 98.84, 71.00, 17.00, 133.00, 73.00, '2019-12-18 15:10:00');
INSERT INTO `departments_data` VALUES (1137, '12:26:01', 99.90, 82.00, 18.00, 92.00, 70.00, '2019-12-18 15:10:00');
INSERT INTO `departments_data` VALUES (1138, '12:26:48', 98.96, 94.00, 17.00, 118.00, 80.00, '2019-12-18 15:11:00');
INSERT INTO `departments_data` VALUES (1139, '12:26:04', 97.04, 93.00, 18.00, 112.00, 72.00, '2019-12-18 15:11:00');
INSERT INTO `departments_data` VALUES (1140, '12:26:01', 95.16, 76.00, 16.00, 90.00, 76.00, '2019-12-18 15:11:00');
INSERT INTO `departments_data` VALUES (1141, '12:26:48', 98.55, 69.00, 19.00, 124.00, 77.00, '2019-12-18 15:12:00');
INSERT INTO `departments_data` VALUES (1142, '12:26:04', 99.06, 96.00, 16.00, 139.00, 83.00, '2019-12-18 15:12:00');
INSERT INTO `departments_data` VALUES (1143, '12:26:01', 95.94, 70.00, 17.00, 116.00, 75.00, '2019-12-18 15:12:00');
INSERT INTO `departments_data` VALUES (1144, '12:26:48', 99.71, 76.00, 16.00, 121.00, 61.00, '2019-12-18 15:13:00');
INSERT INTO `departments_data` VALUES (1145, '12:26:04', 97.56, 91.00, 17.00, 94.00, 67.00, '2019-12-18 15:13:00');
INSERT INTO `departments_data` VALUES (1146, '12:26:01', 99.89, 74.00, 18.00, 95.00, 89.00, '2019-12-18 15:13:00');
INSERT INTO `departments_data` VALUES (1147, '12:26:48', 98.73, 87.00, 18.00, 103.00, 77.00, '2019-12-18 15:14:00');
INSERT INTO `departments_data` VALUES (1148, '12:26:04', 99.26, 75.00, 18.00, 95.00, 76.00, '2019-12-18 15:14:00');
INSERT INTO `departments_data` VALUES (1149, '12:26:01', 95.43, 87.00, 19.00, 131.00, 82.00, '2019-12-18 15:14:00');
INSERT INTO `departments_data` VALUES (1150, '12:26:48', 95.16, 91.00, 17.00, 97.00, 78.00, '2019-12-18 15:15:00');
INSERT INTO `departments_data` VALUES (1151, '12:26:04', 96.67, 98.00, 19.00, 94.00, 84.00, '2019-12-18 15:15:00');
INSERT INTO `departments_data` VALUES (1152, '12:26:01', 99.78, 77.00, 18.00, 114.00, 76.00, '2019-12-18 15:15:00');
INSERT INTO `departments_data` VALUES (1153, '12:26:48', 95.35, 76.00, 16.00, 91.00, 84.00, '2019-12-18 15:16:00');
INSERT INTO `departments_data` VALUES (1154, '12:26:04', 96.76, 84.00, 17.00, 127.00, 74.00, '2019-12-18 15:16:00');
INSERT INTO `departments_data` VALUES (1155, '12:26:01', 98.04, 92.00, 18.00, 126.00, 79.00, '2019-12-18 15:16:00');
INSERT INTO `departments_data` VALUES (1156, '12:26:48', 99.92, 98.00, 18.00, 118.00, 87.00, '2019-12-18 15:17:00');
INSERT INTO `departments_data` VALUES (1157, '12:26:04', 96.47, 67.00, 19.00, 120.00, 71.00, '2019-12-18 15:17:00');
INSERT INTO `departments_data` VALUES (1158, '12:26:01', 95.40, 80.00, 18.00, 137.00, 84.00, '2019-12-18 15:17:00');
INSERT INTO `departments_data` VALUES (1159, '12:26:48', 99.82, 83.00, 16.00, 123.00, 89.00, '2019-12-18 15:18:00');
INSERT INTO `departments_data` VALUES (1160, '12:26:04', 97.66, 93.00, 16.00, 95.00, 69.00, '2019-12-18 15:18:00');
INSERT INTO `departments_data` VALUES (1161, '12:26:01', 98.88, 61.00, 16.00, 98.00, 66.00, '2019-12-18 15:18:00');
INSERT INTO `departments_data` VALUES (1162, '12:26:48', 99.91, 94.00, 19.00, 97.00, 64.00, '2019-12-18 15:19:00');
INSERT INTO `departments_data` VALUES (1163, '12:26:04', 99.38, 60.00, 17.00, 97.00, 71.00, '2019-12-18 15:19:00');
INSERT INTO `departments_data` VALUES (1164, '12:26:01', 95.22, 77.00, 19.00, 99.00, 80.00, '2019-12-18 15:19:00');
INSERT INTO `departments_data` VALUES (1165, '12:26:48', 98.45, 84.00, 16.00, 133.00, 85.00, '2019-12-18 15:20:00');
INSERT INTO `departments_data` VALUES (1166, '12:26:04', 96.36, 61.00, 16.00, 109.00, 71.00, '2019-12-18 15:20:00');
INSERT INTO `departments_data` VALUES (1167, '12:26:01', 96.18, 72.00, 19.00, 136.00, 86.00, '2019-12-18 15:20:00');
INSERT INTO `departments_data` VALUES (1168, '12:26:48', 98.85, 91.00, 16.00, 115.00, 84.00, '2019-12-18 15:21:00');
INSERT INTO `departments_data` VALUES (1169, '12:26:04', 99.14, 94.00, 18.00, 135.00, 71.00, '2019-12-18 15:21:00');
INSERT INTO `departments_data` VALUES (1170, '12:26:01', 99.46, 85.00, 17.00, 131.00, 78.00, '2019-12-18 15:21:00');
INSERT INTO `departments_data` VALUES (1171, '12:26:48', 97.54, 68.00, 18.00, 129.00, 73.00, '2019-12-18 15:22:00');
INSERT INTO `departments_data` VALUES (1172, '12:26:04', 96.89, 78.00, 19.00, 123.00, 84.00, '2019-12-18 15:22:00');
INSERT INTO `departments_data` VALUES (1173, '12:26:01', 97.51, 62.00, 17.00, 125.00, 70.00, '2019-12-18 15:22:00');
INSERT INTO `departments_data` VALUES (1174, '12:26:48', 96.63, 86.00, 16.00, 124.00, 75.00, '2019-12-18 15:23:00');
INSERT INTO `departments_data` VALUES (1175, '12:26:04', 99.36, 97.00, 16.00, 94.00, 64.00, '2019-12-18 15:23:00');
INSERT INTO `departments_data` VALUES (1176, '12:26:01', 95.72, 83.00, 17.00, 120.00, 74.00, '2019-12-18 15:23:00');
INSERT INTO `departments_data` VALUES (1177, '12:26:48', 97.50, 87.00, 19.00, 134.00, 78.00, '2019-12-18 15:24:00');
INSERT INTO `departments_data` VALUES (1178, '12:26:04', 95.66, 70.00, 19.00, 121.00, 86.00, '2019-12-18 15:24:00');
INSERT INTO `departments_data` VALUES (1179, '12:26:01', 98.02, 73.00, 16.00, 112.00, 71.00, '2019-12-18 15:24:00');
INSERT INTO `departments_data` VALUES (1180, '12:26:48', 98.52, 85.00, 16.00, 115.00, 73.00, '2019-12-18 15:25:00');
INSERT INTO `departments_data` VALUES (1181, '12:26:04', 96.90, 93.00, 17.00, 94.00, 74.00, '2019-12-18 15:25:00');
INSERT INTO `departments_data` VALUES (1182, '12:26:01', 98.96, 79.00, 17.00, 99.00, 74.00, '2019-12-18 15:25:00');
INSERT INTO `departments_data` VALUES (1183, '12:26:48', 98.24, 66.00, 19.00, 132.00, 69.00, '2019-12-18 15:26:00');
INSERT INTO `departments_data` VALUES (1184, '12:26:04', 97.26, 77.00, 17.00, 121.00, 71.00, '2019-12-18 15:26:00');
INSERT INTO `departments_data` VALUES (1185, '12:26:01', 96.78, 97.00, 18.00, 110.00, 65.00, '2019-12-18 15:26:00');
INSERT INTO `departments_data` VALUES (1186, '12:26:48', 96.80, 61.00, 17.00, 109.00, 77.00, '2019-12-18 15:27:00');
INSERT INTO `departments_data` VALUES (1187, '12:26:04', 98.46, 98.00, 16.00, 105.00, 77.00, '2019-12-18 15:27:00');
INSERT INTO `departments_data` VALUES (1188, '12:26:01', 97.87, 72.00, 16.00, 112.00, 61.00, '2019-12-18 15:27:00');
INSERT INTO `departments_data` VALUES (1189, '12:26:48', 95.55, 62.00, 16.00, 96.00, 86.00, '2019-12-18 15:28:00');
INSERT INTO `departments_data` VALUES (1190, '12:26:04', 98.17, 79.00, 18.00, 133.00, 78.00, '2019-12-18 15:28:00');
INSERT INTO `departments_data` VALUES (1191, '12:26:01', 95.49, 82.00, 16.00, 115.00, 65.00, '2019-12-18 15:28:00');
INSERT INTO `departments_data` VALUES (1192, '12:26:48', 97.62, 85.00, 17.00, 132.00, 89.00, '2019-12-18 15:29:00');
INSERT INTO `departments_data` VALUES (1193, '12:26:04', 95.30, 85.00, 17.00, 94.00, 65.00, '2019-12-18 15:29:00');
INSERT INTO `departments_data` VALUES (1194, '12:26:01', 96.42, 84.00, 17.00, 104.00, 82.00, '2019-12-18 15:29:00');
INSERT INTO `departments_data` VALUES (1195, '12:26:48', 98.63, 99.00, 17.00, 100.00, 76.00, '2019-12-18 15:30:00');
INSERT INTO `departments_data` VALUES (1196, '12:26:04', 97.90, 67.00, 19.00, 130.00, 65.00, '2019-12-18 15:30:00');
INSERT INTO `departments_data` VALUES (1197, '12:26:01', 99.92, 65.00, 16.00, 98.00, 82.00, '2019-12-18 15:30:00');
INSERT INTO `departments_data` VALUES (1198, '12:26:48', 97.07, 78.00, 17.00, 96.00, 61.00, '2019-12-18 15:31:00');
INSERT INTO `departments_data` VALUES (1199, '12:26:04', 99.93, 86.00, 18.00, 105.00, 66.00, '2019-12-18 15:31:00');
INSERT INTO `departments_data` VALUES (1200, '12:26:01', 98.43, 95.00, 19.00, 118.00, 61.00, '2019-12-18 15:31:00');
INSERT INTO `departments_data` VALUES (1201, '12:26:48', 97.60, 96.00, 16.00, 139.00, 77.00, '2019-12-18 15:32:00');
INSERT INTO `departments_data` VALUES (1202, '12:26:04', 97.67, 62.00, 16.00, 118.00, 64.00, '2019-12-18 15:32:00');
INSERT INTO `departments_data` VALUES (1203, '12:26:01', 97.59, 92.00, 16.00, 121.00, 62.00, '2019-12-18 15:32:00');
INSERT INTO `departments_data` VALUES (1204, '12:26:48', 97.03, 70.00, 16.00, 137.00, 73.00, '2019-12-18 15:33:00');
INSERT INTO `departments_data` VALUES (1205, '12:26:04', 98.29, 66.00, 18.00, 99.00, 85.00, '2019-12-18 15:33:00');
INSERT INTO `departments_data` VALUES (1206, '12:26:01', 99.07, 86.00, 16.00, 138.00, 63.00, '2019-12-18 15:33:00');
INSERT INTO `departments_data` VALUES (1207, '12:26:48', 97.28, 67.00, 16.00, 129.00, 62.00, '2019-12-18 15:34:00');
INSERT INTO `departments_data` VALUES (1208, '12:26:04', 96.36, 65.00, 19.00, 119.00, 62.00, '2019-12-18 15:34:00');
INSERT INTO `departments_data` VALUES (1209, '12:26:01', 96.22, 84.00, 19.00, 137.00, 73.00, '2019-12-18 15:34:00');
INSERT INTO `departments_data` VALUES (1210, '12:26:48', 98.97, 83.00, 19.00, 104.00, 88.00, '2019-12-18 15:35:00');
INSERT INTO `departments_data` VALUES (1211, '12:26:04', 98.14, 91.00, 18.00, 93.00, 69.00, '2019-12-18 15:35:00');
INSERT INTO `departments_data` VALUES (1212, '12:26:01', 95.82, 60.00, 19.00, 138.00, 87.00, '2019-12-18 15:35:00');
INSERT INTO `departments_data` VALUES (1213, '12:26:48', 97.78, 69.00, 16.00, 90.00, 70.00, '2019-12-18 15:36:00');
INSERT INTO `departments_data` VALUES (1214, '12:26:04', 97.05, 94.00, 19.00, 138.00, 77.00, '2019-12-18 15:36:00');
INSERT INTO `departments_data` VALUES (1215, '12:26:01', 99.75, 94.00, 17.00, 96.00, 81.00, '2019-12-18 15:36:00');
INSERT INTO `departments_data` VALUES (1216, '12:26:48', 98.40, 81.00, 18.00, 108.00, 78.00, '2019-12-18 15:37:00');
INSERT INTO `departments_data` VALUES (1217, '12:26:04', 95.44, 66.00, 19.00, 113.00, 84.00, '2019-12-18 15:37:00');
INSERT INTO `departments_data` VALUES (1218, '12:26:01', 96.53, 97.00, 17.00, 91.00, 62.00, '2019-12-18 15:37:00');
INSERT INTO `departments_data` VALUES (1219, '12:26:48', 99.51, 60.00, 19.00, 120.00, 60.00, '2019-12-18 15:38:00');
INSERT INTO `departments_data` VALUES (1220, '12:26:04', 98.06, 62.00, 18.00, 103.00, 78.00, '2019-12-18 15:38:00');
INSERT INTO `departments_data` VALUES (1221, '12:26:01', 95.47, 88.00, 19.00, 107.00, 65.00, '2019-12-18 15:38:00');
INSERT INTO `departments_data` VALUES (1222, '12:26:48', 99.79, 84.00, 17.00, 106.00, 80.00, '2019-12-18 15:39:00');
INSERT INTO `departments_data` VALUES (1223, '12:26:04', 96.29, 66.00, 19.00, 115.00, 74.00, '2019-12-18 15:39:00');
INSERT INTO `departments_data` VALUES (1224, '12:26:01', 98.74, 76.00, 19.00, 111.00, 61.00, '2019-12-18 15:39:00');
INSERT INTO `departments_data` VALUES (1225, '12:26:48', 99.25, 93.00, 17.00, 122.00, 72.00, '2019-12-18 15:40:00');
INSERT INTO `departments_data` VALUES (1226, '12:26:04', 95.08, 93.00, 18.00, 122.00, 73.00, '2019-12-18 15:40:00');
INSERT INTO `departments_data` VALUES (1227, '12:26:01', 95.89, 91.00, 16.00, 122.00, 67.00, '2019-12-18 15:40:00');
INSERT INTO `departments_data` VALUES (1228, '12:26:48', 96.05, 94.00, 19.00, 109.00, 87.00, '2019-12-18 15:41:00');
INSERT INTO `departments_data` VALUES (1229, '12:26:04', 96.44, 94.00, 16.00, 133.00, 86.00, '2019-12-18 15:41:00');
INSERT INTO `departments_data` VALUES (1230, '12:26:01', 97.97, 81.00, 18.00, 95.00, 61.00, '2019-12-18 15:41:00');
INSERT INTO `departments_data` VALUES (1231, '12:26:48', 96.60, 79.00, 18.00, 116.00, 85.00, '2019-12-18 15:42:00');
INSERT INTO `departments_data` VALUES (1232, '12:26:04', 97.45, 99.00, 17.00, 103.00, 66.00, '2019-12-18 15:42:00');
INSERT INTO `departments_data` VALUES (1233, '12:26:01', 96.80, 88.00, 16.00, 95.00, 72.00, '2019-12-18 15:42:00');
INSERT INTO `departments_data` VALUES (1234, '12:26:48', 95.12, 71.00, 18.00, 125.00, 65.00, '2019-12-18 15:43:00');
INSERT INTO `departments_data` VALUES (1235, '12:26:04', 99.56, 94.00, 19.00, 99.00, 74.00, '2019-12-18 15:43:00');
INSERT INTO `departments_data` VALUES (1236, '12:26:01', 95.43, 90.00, 17.00, 128.00, 61.00, '2019-12-18 15:43:00');
INSERT INTO `departments_data` VALUES (1237, '12:26:48', 97.81, 72.00, 19.00, 106.00, 81.00, '2019-12-18 15:44:00');
INSERT INTO `departments_data` VALUES (1238, '12:26:04', 98.45, 97.00, 19.00, 117.00, 89.00, '2019-12-18 15:44:00');
INSERT INTO `departments_data` VALUES (1239, '12:26:01', 98.19, 62.00, 16.00, 101.00, 89.00, '2019-12-18 15:44:00');
INSERT INTO `departments_data` VALUES (1240, '12:26:48', 97.14, 85.00, 18.00, 103.00, 83.00, '2019-12-18 15:45:00');
INSERT INTO `departments_data` VALUES (1241, '12:26:04', 95.00, 70.00, 18.00, 116.00, 63.00, '2019-12-18 15:45:00');
INSERT INTO `departments_data` VALUES (1242, '12:26:01', 95.48, 69.00, 18.00, 133.00, 70.00, '2019-12-18 15:45:00');
INSERT INTO `departments_data` VALUES (1243, '12:26:48', 98.28, 62.00, 17.00, 115.00, 78.00, '2019-12-18 15:46:00');
INSERT INTO `departments_data` VALUES (1244, '12:26:04', 96.84, 89.00, 18.00, 122.00, 84.00, '2019-12-18 15:46:00');
INSERT INTO `departments_data` VALUES (1245, '12:26:01', 98.91, 76.00, 16.00, 139.00, 78.00, '2019-12-18 15:46:00');
INSERT INTO `departments_data` VALUES (1246, '12:26:48', 96.63, 76.00, 16.00, 122.00, 65.00, '2019-12-18 15:47:00');
INSERT INTO `departments_data` VALUES (1247, '12:26:04', 97.10, 99.00, 18.00, 110.00, 88.00, '2019-12-18 15:47:00');
INSERT INTO `departments_data` VALUES (1248, '12:26:01', 95.31, 86.00, 18.00, 116.00, 82.00, '2019-12-18 15:47:00');
INSERT INTO `departments_data` VALUES (1249, '12:26:48', 99.13, 76.00, 18.00, 122.00, 80.00, '2019-12-18 15:48:00');
INSERT INTO `departments_data` VALUES (1250, '12:26:04', 96.82, 60.00, 16.00, 129.00, 81.00, '2019-12-18 15:48:00');
INSERT INTO `departments_data` VALUES (1251, '12:26:01', 98.47, 72.00, 17.00, 111.00, 84.00, '2019-12-18 15:48:00');
INSERT INTO `departments_data` VALUES (1252, '12:26:48', 97.46, 87.00, 19.00, 132.00, 71.00, '2019-12-18 15:49:00');
INSERT INTO `departments_data` VALUES (1253, '12:26:04', 99.09, 63.00, 16.00, 124.00, 78.00, '2019-12-18 15:49:00');
INSERT INTO `departments_data` VALUES (1254, '12:26:01', 97.73, 90.00, 16.00, 133.00, 72.00, '2019-12-18 15:49:00');
INSERT INTO `departments_data` VALUES (1255, '12:26:48', 99.04, 98.00, 19.00, 101.00, 79.00, '2019-12-18 15:50:00');
INSERT INTO `departments_data` VALUES (1256, '12:26:04', 96.24, 94.00, 16.00, 138.00, 69.00, '2019-12-18 15:50:00');
INSERT INTO `departments_data` VALUES (1257, '12:26:01', 98.65, 69.00, 19.00, 118.00, 82.00, '2019-12-18 15:50:00');
INSERT INTO `departments_data` VALUES (1258, '12:26:48', 97.72, 89.00, 18.00, 135.00, 61.00, '2019-12-18 15:51:00');
INSERT INTO `departments_data` VALUES (1259, '12:26:04', 96.36, 61.00, 16.00, 98.00, 84.00, '2019-12-18 15:51:00');
INSERT INTO `departments_data` VALUES (1260, '12:26:01', 96.98, 99.00, 17.00, 138.00, 87.00, '2019-12-18 15:51:00');
INSERT INTO `departments_data` VALUES (1261, '12:26:48', 96.11, 65.00, 18.00, 90.00, 73.00, '2019-12-18 15:52:00');
INSERT INTO `departments_data` VALUES (1262, '12:26:04', 99.59, 86.00, 16.00, 116.00, 87.00, '2019-12-18 15:52:00');
INSERT INTO `departments_data` VALUES (1263, '12:26:01', 99.00, 88.00, 17.00, 101.00, 82.00, '2019-12-18 15:52:00');
INSERT INTO `departments_data` VALUES (1264, '12:26:48', 97.43, 84.00, 16.00, 118.00, 77.00, '2019-12-18 15:53:00');
INSERT INTO `departments_data` VALUES (1265, '12:26:04', 96.51, 96.00, 16.00, 131.00, 81.00, '2019-12-18 15:53:00');
INSERT INTO `departments_data` VALUES (1266, '12:26:01', 96.12, 81.00, 19.00, 111.00, 64.00, '2019-12-18 15:53:00');
INSERT INTO `departments_data` VALUES (1267, '12:26:48', 95.95, 74.00, 16.00, 90.00, 83.00, '2019-12-18 15:54:00');
INSERT INTO `departments_data` VALUES (1268, '12:26:04', 98.64, 79.00, 19.00, 133.00, 66.00, '2019-12-18 15:54:00');
INSERT INTO `departments_data` VALUES (1269, '12:26:01', 98.81, 64.00, 19.00, 127.00, 66.00, '2019-12-18 15:54:00');
INSERT INTO `departments_data` VALUES (1270, '12:26:48', 95.17, 67.00, 19.00, 132.00, 74.00, '2019-12-18 15:55:00');
INSERT INTO `departments_data` VALUES (1271, '12:26:04', 98.80, 69.00, 18.00, 101.00, 84.00, '2019-12-18 15:55:00');
INSERT INTO `departments_data` VALUES (1272, '12:26:01', 97.07, 67.00, 18.00, 133.00, 70.00, '2019-12-18 15:55:00');
INSERT INTO `departments_data` VALUES (1273, '12:26:48', 96.64, 75.00, 17.00, 121.00, 70.00, '2019-12-18 15:56:00');
INSERT INTO `departments_data` VALUES (1274, '12:26:04', 95.47, 99.00, 17.00, 104.00, 68.00, '2019-12-18 15:56:00');
INSERT INTO `departments_data` VALUES (1275, '12:26:01', 98.69, 79.00, 18.00, 119.00, 64.00, '2019-12-18 15:56:00');
INSERT INTO `departments_data` VALUES (1276, '12:26:48', 97.45, 88.00, 17.00, 96.00, 70.00, '2019-12-18 15:57:00');
INSERT INTO `departments_data` VALUES (1277, '12:26:04', 99.59, 90.00, 16.00, 123.00, 66.00, '2019-12-18 15:57:00');
INSERT INTO `departments_data` VALUES (1278, '12:26:01', 99.82, 73.00, 19.00, 109.00, 73.00, '2019-12-18 15:57:00');
INSERT INTO `departments_data` VALUES (1279, '12:26:48', 97.90, 97.00, 18.00, 90.00, 82.00, '2019-12-18 15:58:00');
INSERT INTO `departments_data` VALUES (1280, '12:26:04', 99.97, 68.00, 19.00, 100.00, 88.00, '2019-12-18 15:58:00');
INSERT INTO `departments_data` VALUES (1281, '12:26:01', 95.47, 60.00, 18.00, 137.00, 83.00, '2019-12-18 15:58:00');
INSERT INTO `departments_data` VALUES (1282, '12:26:48', 95.83, 80.00, 17.00, 129.00, 78.00, '2019-12-18 15:59:00');
INSERT INTO `departments_data` VALUES (1283, '12:26:04', 95.97, 91.00, 16.00, 111.00, 67.00, '2019-12-18 15:59:00');
INSERT INTO `departments_data` VALUES (1284, '12:26:01', 98.65, 76.00, 18.00, 112.00, 74.00, '2019-12-18 15:59:00');
INSERT INTO `departments_data` VALUES (1285, '12:26:48', 98.05, 66.00, 19.00, 134.00, 76.00, '2019-12-18 16:00:00');
INSERT INTO `departments_data` VALUES (1286, '12:26:04', 99.21, 94.00, 18.00, 133.00, 69.00, '2019-12-18 16:00:00');
INSERT INTO `departments_data` VALUES (1287, '12:26:01', 99.55, 63.00, 19.00, 107.00, 67.00, '2019-12-18 16:00:00');
INSERT INTO `departments_data` VALUES (1288, '12:26:48', 95.95, 86.00, 17.00, 99.00, 74.00, '2019-12-18 16:01:00');
INSERT INTO `departments_data` VALUES (1289, '12:26:04', 99.63, 64.00, 19.00, 131.00, 68.00, '2019-12-18 16:01:00');
INSERT INTO `departments_data` VALUES (1290, '12:26:01', 96.72, 78.00, 16.00, 120.00, 75.00, '2019-12-18 16:01:00');
INSERT INTO `departments_data` VALUES (1291, '12:26:48', 97.08, 76.00, 18.00, 130.00, 89.00, '2019-12-18 16:02:00');
INSERT INTO `departments_data` VALUES (1292, '12:26:04', 95.99, 95.00, 16.00, 93.00, 72.00, '2019-12-18 16:02:00');
INSERT INTO `departments_data` VALUES (1293, '12:26:01', 98.58, 89.00, 16.00, 117.00, 60.00, '2019-12-18 16:02:00');
INSERT INTO `departments_data` VALUES (1294, '12:26:48', 95.27, 62.00, 18.00, 118.00, 68.00, '2019-12-18 16:03:00');
INSERT INTO `departments_data` VALUES (1295, '12:26:04', 95.07, 82.00, 18.00, 95.00, 78.00, '2019-12-18 16:03:00');
INSERT INTO `departments_data` VALUES (1296, '12:26:01', 95.76, 69.00, 16.00, 101.00, 61.00, '2019-12-18 16:03:00');
INSERT INTO `departments_data` VALUES (1297, '12:26:48', 98.23, 61.00, 18.00, 125.00, 64.00, '2019-12-18 16:04:00');
INSERT INTO `departments_data` VALUES (1298, '12:26:04', 99.49, 63.00, 19.00, 127.00, 69.00, '2019-12-18 16:04:00');
INSERT INTO `departments_data` VALUES (1299, '12:26:01', 96.06, 76.00, 19.00, 118.00, 82.00, '2019-12-18 16:04:00');
INSERT INTO `departments_data` VALUES (1300, '12:26:48', 95.58, 96.00, 16.00, 93.00, 82.00, '2019-12-18 16:05:00');
INSERT INTO `departments_data` VALUES (1301, '12:26:04', 95.96, 95.00, 18.00, 139.00, 65.00, '2019-12-18 16:05:00');
INSERT INTO `departments_data` VALUES (1302, '12:26:01', 98.59, 85.00, 16.00, 99.00, 70.00, '2019-12-18 16:05:00');
INSERT INTO `departments_data` VALUES (1303, '12:26:48', 95.89, 83.00, 16.00, 101.00, 78.00, '2019-12-18 16:06:00');
INSERT INTO `departments_data` VALUES (1304, '12:26:04', 95.74, 70.00, 19.00, 111.00, 67.00, '2019-12-18 16:06:00');
INSERT INTO `departments_data` VALUES (1305, '12:26:01', 99.23, 75.00, 17.00, 125.00, 62.00, '2019-12-18 16:06:00');
INSERT INTO `departments_data` VALUES (1306, '12:26:48', 98.47, 84.00, 18.00, 96.00, 64.00, '2019-12-18 16:07:00');
INSERT INTO `departments_data` VALUES (1307, '12:26:04', 97.63, 84.00, 17.00, 137.00, 69.00, '2019-12-18 16:07:00');
INSERT INTO `departments_data` VALUES (1308, '12:26:01', 97.16, 93.00, 16.00, 130.00, 72.00, '2019-12-18 16:07:00');
INSERT INTO `departments_data` VALUES (1309, '12:26:48', 99.06, 61.00, 19.00, 135.00, 63.00, '2019-12-18 16:08:00');
INSERT INTO `departments_data` VALUES (1310, '12:26:04', 97.17, 80.00, 16.00, 116.00, 75.00, '2019-12-18 16:08:00');
INSERT INTO `departments_data` VALUES (1311, '12:26:01', 98.60, 93.00, 18.00, 93.00, 76.00, '2019-12-18 16:08:00');
INSERT INTO `departments_data` VALUES (1312, '12:26:48', 99.03, 97.00, 18.00, 138.00, 77.00, '2019-12-18 16:09:00');
INSERT INTO `departments_data` VALUES (1313, '12:26:04', 96.02, 80.00, 18.00, 103.00, 60.00, '2019-12-18 16:09:00');
INSERT INTO `departments_data` VALUES (1314, '12:26:01', 96.34, 73.00, 19.00, 133.00, 85.00, '2019-12-18 16:09:00');
INSERT INTO `departments_data` VALUES (1315, '12:26:48', 98.22, 88.00, 19.00, 135.00, 77.00, '2019-12-18 16:10:00');
INSERT INTO `departments_data` VALUES (1316, '12:26:04', 96.05, 82.00, 18.00, 91.00, 65.00, '2019-12-18 16:10:00');
INSERT INTO `departments_data` VALUES (1317, '12:26:01', 99.40, 60.00, 18.00, 121.00, 81.00, '2019-12-18 16:10:00');
INSERT INTO `departments_data` VALUES (1318, '12:26:48', 97.49, 62.00, 16.00, 121.00, 62.00, '2019-12-18 16:11:00');
INSERT INTO `departments_data` VALUES (1319, '12:26:04', 95.08, 72.00, 18.00, 104.00, 67.00, '2019-12-18 16:11:00');
INSERT INTO `departments_data` VALUES (1320, '12:26:01', 97.00, 76.00, 16.00, 128.00, 70.00, '2019-12-18 16:11:00');
INSERT INTO `departments_data` VALUES (1321, '12:26:48', 96.00, 63.00, 18.00, 118.00, 66.00, '2019-12-18 16:12:00');
INSERT INTO `departments_data` VALUES (1322, '12:26:04', 95.24, 68.00, 16.00, 134.00, 72.00, '2019-12-18 16:12:00');
INSERT INTO `departments_data` VALUES (1323, '12:26:01', 99.61, 89.00, 16.00, 108.00, 60.00, '2019-12-18 16:12:00');
INSERT INTO `departments_data` VALUES (1324, '12:26:48', 95.42, 70.00, 16.00, 102.00, 67.00, '2019-12-18 16:13:00');
INSERT INTO `departments_data` VALUES (1325, '12:26:04', 97.09, 76.00, 16.00, 118.00, 83.00, '2019-12-18 16:13:00');
INSERT INTO `departments_data` VALUES (1326, '12:26:01', 95.21, 88.00, 19.00, 126.00, 84.00, '2019-12-18 16:13:00');
INSERT INTO `departments_data` VALUES (1327, '12:26:48', 95.61, 97.00, 16.00, 96.00, 84.00, '2019-12-18 16:14:00');
INSERT INTO `departments_data` VALUES (1328, '12:26:04', 96.12, 70.00, 17.00, 103.00, 89.00, '2019-12-18 16:14:00');
INSERT INTO `departments_data` VALUES (1329, '12:26:01', 99.90, 94.00, 18.00, 118.00, 67.00, '2019-12-18 16:14:00');
INSERT INTO `departments_data` VALUES (1330, '12:26:48', 96.63, 78.00, 19.00, 100.00, 76.00, '2019-12-18 16:15:00');
INSERT INTO `departments_data` VALUES (1331, '12:26:04', 98.89, 64.00, 19.00, 100.00, 82.00, '2019-12-18 16:15:00');
INSERT INTO `departments_data` VALUES (1332, '12:26:01', 99.34, 99.00, 16.00, 119.00, 68.00, '2019-12-18 16:15:00');
INSERT INTO `departments_data` VALUES (1333, '12:26:48', 98.23, 63.00, 17.00, 96.00, 76.00, '2019-12-18 16:16:00');
INSERT INTO `departments_data` VALUES (1334, '12:26:04', 99.01, 73.00, 18.00, 136.00, 71.00, '2019-12-18 16:16:00');
INSERT INTO `departments_data` VALUES (1335, '12:26:01', 99.37, 78.00, 19.00, 93.00, 71.00, '2019-12-18 16:16:00');
INSERT INTO `departments_data` VALUES (1336, '12:26:48', 96.52, 95.00, 17.00, 101.00, 63.00, '2019-12-18 16:17:00');
INSERT INTO `departments_data` VALUES (1337, '12:26:04', 96.19, 80.00, 16.00, 119.00, 67.00, '2019-12-18 16:17:00');
INSERT INTO `departments_data` VALUES (1338, '12:26:01', 99.11, 61.00, 17.00, 120.00, 82.00, '2019-12-18 16:17:00');
INSERT INTO `departments_data` VALUES (1339, '12:26:48', 99.65, 82.00, 17.00, 108.00, 62.00, '2019-12-18 16:18:00');
INSERT INTO `departments_data` VALUES (1340, '12:26:04', 98.72, 88.00, 16.00, 101.00, 62.00, '2019-12-18 16:18:00');
INSERT INTO `departments_data` VALUES (1341, '12:26:01', 99.14, 67.00, 19.00, 91.00, 80.00, '2019-12-18 16:18:00');
INSERT INTO `departments_data` VALUES (1342, '12:26:48', 97.40, 97.00, 18.00, 132.00, 66.00, '2019-12-18 16:19:00');
INSERT INTO `departments_data` VALUES (1343, '12:26:04', 97.85, 65.00, 16.00, 135.00, 71.00, '2019-12-18 16:19:00');
INSERT INTO `departments_data` VALUES (1344, '12:26:01', 99.90, 68.00, 16.00, 109.00, 66.00, '2019-12-18 16:19:00');
INSERT INTO `departments_data` VALUES (1345, '12:26:48', 96.60, 75.00, 19.00, 131.00, 61.00, '2019-12-18 16:20:00');
INSERT INTO `departments_data` VALUES (1346, '12:26:04', 99.44, 68.00, 17.00, 106.00, 73.00, '2019-12-18 16:20:00');
INSERT INTO `departments_data` VALUES (1347, '12:26:01', 95.54, 79.00, 16.00, 131.00, 70.00, '2019-12-18 16:20:00');
INSERT INTO `departments_data` VALUES (1348, '12:26:48', 98.45, 74.00, 19.00, 126.00, 65.00, '2019-12-18 16:21:00');
INSERT INTO `departments_data` VALUES (1349, '12:26:04', 98.70, 68.00, 18.00, 110.00, 76.00, '2019-12-18 16:21:00');
INSERT INTO `departments_data` VALUES (1350, '12:26:01', 99.46, 97.00, 17.00, 127.00, 77.00, '2019-12-18 16:21:00');
INSERT INTO `departments_data` VALUES (1351, '12:26:48', 98.02, 98.00, 16.00, 138.00, 70.00, '2019-12-18 16:22:00');
INSERT INTO `departments_data` VALUES (1352, '12:26:04', 95.66, 95.00, 16.00, 138.00, 73.00, '2019-12-18 16:22:00');
INSERT INTO `departments_data` VALUES (1353, '12:26:01', 99.84, 82.00, 16.00, 97.00, 82.00, '2019-12-18 16:22:00');
INSERT INTO `departments_data` VALUES (1354, '12:26:48', 98.63, 82.00, 19.00, 113.00, 66.00, '2019-12-18 16:23:00');
INSERT INTO `departments_data` VALUES (1355, '12:26:04', 98.82, 75.00, 18.00, 132.00, 86.00, '2019-12-18 16:23:00');
INSERT INTO `departments_data` VALUES (1356, '12:26:01', 99.97, 91.00, 16.00, 113.00, 83.00, '2019-12-18 16:23:00');
INSERT INTO `departments_data` VALUES (1357, '12:26:48', 96.77, 90.00, 19.00, 115.00, 65.00, '2019-12-18 16:24:00');
INSERT INTO `departments_data` VALUES (1358, '12:26:04', 96.89, 94.00, 17.00, 103.00, 76.00, '2019-12-18 16:24:00');
INSERT INTO `departments_data` VALUES (1359, '12:26:01', 98.29, 68.00, 16.00, 130.00, 75.00, '2019-12-18 16:24:00');
INSERT INTO `departments_data` VALUES (1360, '12:26:48', 95.23, 73.00, 17.00, 112.00, 63.00, '2019-12-18 16:25:00');
INSERT INTO `departments_data` VALUES (1361, '12:26:04', 96.88, 70.00, 16.00, 103.00, 71.00, '2019-12-18 16:25:00');
INSERT INTO `departments_data` VALUES (1362, '12:26:01', 95.81, 93.00, 18.00, 139.00, 75.00, '2019-12-18 16:25:00');
INSERT INTO `departments_data` VALUES (1363, '12:26:48', 97.31, 77.00, 17.00, 109.00, 60.00, '2019-12-18 16:26:00');
INSERT INTO `departments_data` VALUES (1364, '12:26:04', 95.29, 96.00, 19.00, 126.00, 85.00, '2019-12-18 16:26:00');
INSERT INTO `departments_data` VALUES (1365, '12:26:01', 97.54, 81.00, 16.00, 128.00, 85.00, '2019-12-18 16:26:00');
INSERT INTO `departments_data` VALUES (1366, '12:26:48', 95.87, 85.00, 19.00, 97.00, 87.00, '2019-12-18 16:27:00');
INSERT INTO `departments_data` VALUES (1367, '12:26:04', 96.60, 85.00, 17.00, 130.00, 76.00, '2019-12-18 16:27:00');
INSERT INTO `departments_data` VALUES (1368, '12:26:01', 96.11, 94.00, 18.00, 109.00, 64.00, '2019-12-18 16:27:00');
INSERT INTO `departments_data` VALUES (1369, '12:26:48', 97.52, 61.00, 18.00, 129.00, 87.00, '2019-12-18 16:28:00');
INSERT INTO `departments_data` VALUES (1370, '12:26:04', 99.18, 96.00, 17.00, 114.00, 89.00, '2019-12-18 16:28:00');
INSERT INTO `departments_data` VALUES (1371, '12:26:01', 95.00, 85.00, 16.00, 119.00, 67.00, '2019-12-18 16:28:00');
INSERT INTO `departments_data` VALUES (1372, '12:26:48', 99.14, 78.00, 19.00, 130.00, 77.00, '2019-12-18 16:29:00');
INSERT INTO `departments_data` VALUES (1373, '12:26:04', 98.18, 75.00, 16.00, 104.00, 71.00, '2019-12-18 16:29:00');
INSERT INTO `departments_data` VALUES (1374, '12:26:01', 98.41, 61.00, 17.00, 98.00, 84.00, '2019-12-18 16:29:00');
INSERT INTO `departments_data` VALUES (1375, '12:26:48', 96.17, 74.00, 18.00, 112.00, 72.00, '2019-12-18 16:30:00');
INSERT INTO `departments_data` VALUES (1376, '12:26:04', 98.08, 74.00, 18.00, 125.00, 78.00, '2019-12-18 16:30:00');
INSERT INTO `departments_data` VALUES (1377, '12:26:01', 98.91, 93.00, 17.00, 92.00, 77.00, '2019-12-18 16:30:00');
INSERT INTO `departments_data` VALUES (1378, '12:26:48', 99.44, 76.00, 17.00, 99.00, 73.00, '2019-12-18 16:31:00');
INSERT INTO `departments_data` VALUES (1379, '12:26:04', 97.22, 88.00, 18.00, 99.00, 79.00, '2019-12-18 16:31:00');
INSERT INTO `departments_data` VALUES (1380, '12:26:01', 97.68, 93.00, 18.00, 124.00, 87.00, '2019-12-18 16:31:00');
INSERT INTO `departments_data` VALUES (1381, '12:26:48', 99.18, 75.00, 16.00, 113.00, 66.00, '2019-12-18 16:32:00');
INSERT INTO `departments_data` VALUES (1382, '12:26:04', 99.43, 68.00, 19.00, 135.00, 76.00, '2019-12-18 16:32:00');
INSERT INTO `departments_data` VALUES (1383, '12:26:01', 95.85, 78.00, 19.00, 136.00, 68.00, '2019-12-18 16:32:00');
INSERT INTO `departments_data` VALUES (1384, '12:26:48', 95.49, 75.00, 19.00, 104.00, 72.00, '2019-12-18 16:33:00');
INSERT INTO `departments_data` VALUES (1385, '12:26:04', 98.44, 92.00, 19.00, 117.00, 75.00, '2019-12-18 16:33:00');
INSERT INTO `departments_data` VALUES (1386, '12:26:01', 97.23, 63.00, 17.00, 128.00, 63.00, '2019-12-18 16:33:00');
INSERT INTO `departments_data` VALUES (1387, '12:26:48', 98.06, 95.00, 18.00, 114.00, 77.00, '2019-12-18 16:34:00');
INSERT INTO `departments_data` VALUES (1388, '12:26:04', 98.22, 72.00, 17.00, 96.00, 77.00, '2019-12-18 16:34:00');
INSERT INTO `departments_data` VALUES (1389, '12:26:01', 99.23, 83.00, 17.00, 135.00, 83.00, '2019-12-18 16:34:00');
INSERT INTO `departments_data` VALUES (1390, '12:26:48', 96.68, 85.00, 17.00, 131.00, 68.00, '2019-12-18 16:35:00');
INSERT INTO `departments_data` VALUES (1391, '12:26:04', 97.95, 64.00, 17.00, 135.00, 66.00, '2019-12-18 16:35:00');
INSERT INTO `departments_data` VALUES (1392, '12:26:01', 95.75, 96.00, 16.00, 104.00, 87.00, '2019-12-18 16:35:00');
INSERT INTO `departments_data` VALUES (1393, '12:26:48', 99.15, 99.00, 18.00, 115.00, 67.00, '2019-12-18 16:36:00');
INSERT INTO `departments_data` VALUES (1394, '12:26:04', 97.67, 88.00, 17.00, 90.00, 82.00, '2019-12-18 16:36:00');
INSERT INTO `departments_data` VALUES (1395, '12:26:01', 98.50, 76.00, 16.00, 138.00, 65.00, '2019-12-18 16:36:00');
INSERT INTO `departments_data` VALUES (1396, '12:26:48', 95.51, 72.00, 17.00, 127.00, 68.00, '2019-12-18 16:37:00');
INSERT INTO `departments_data` VALUES (1397, '12:26:04', 98.59, 75.00, 19.00, 98.00, 65.00, '2019-12-18 16:37:00');
INSERT INTO `departments_data` VALUES (1398, '12:26:01', 97.13, 89.00, 18.00, 104.00, 65.00, '2019-12-18 16:37:04');
INSERT INTO `departments_data` VALUES (1399, '12:26:48', 97.96, 61.00, 17.00, 92.00, 69.00, '2019-12-18 16:38:00');
INSERT INTO `departments_data` VALUES (1400, '12:26:04', 95.30, 81.00, 18.00, 131.00, 89.00, '2019-12-18 16:38:00');
INSERT INTO `departments_data` VALUES (1401, '12:26:01', 97.32, 90.00, 17.00, 133.00, 86.00, '2019-12-18 16:38:00');
INSERT INTO `departments_data` VALUES (1402, '12:26:48', 96.03, 68.00, 16.00, 113.00, 76.00, '2019-12-18 16:39:00');
INSERT INTO `departments_data` VALUES (1403, '12:26:04', 95.42, 96.00, 16.00, 106.00, 89.00, '2019-12-18 16:39:00');
INSERT INTO `departments_data` VALUES (1404, '12:26:01', 96.78, 94.00, 19.00, 132.00, 68.00, '2019-12-18 16:39:00');
INSERT INTO `departments_data` VALUES (1405, '12:26:48', 96.24, 71.00, 17.00, 125.00, 83.00, '2019-12-18 16:40:00');
INSERT INTO `departments_data` VALUES (1406, '12:26:04', 99.50, 83.00, 18.00, 105.00, 71.00, '2019-12-18 16:40:00');
INSERT INTO `departments_data` VALUES (1407, '12:26:01', 96.80, 66.00, 18.00, 139.00, 74.00, '2019-12-18 16:40:00');
INSERT INTO `departments_data` VALUES (1408, '12:26:48', 95.71, 74.00, 19.00, 136.00, 66.00, '2019-12-18 16:41:00');
INSERT INTO `departments_data` VALUES (1409, '12:26:04', 98.31, 89.00, 19.00, 115.00, 83.00, '2019-12-18 16:41:00');
INSERT INTO `departments_data` VALUES (1410, '12:26:01', 95.03, 75.00, 17.00, 115.00, 68.00, '2019-12-18 16:41:00');
INSERT INTO `departments_data` VALUES (1411, '12:26:48', 97.48, 79.00, 18.00, 111.00, 83.00, '2019-12-18 16:42:00');
INSERT INTO `departments_data` VALUES (1412, '12:26:04', 98.67, 99.00, 16.00, 95.00, 69.00, '2019-12-18 16:42:00');
INSERT INTO `departments_data` VALUES (1413, '12:26:01', 97.28, 66.00, 16.00, 100.00, 69.00, '2019-12-18 16:42:00');
INSERT INTO `departments_data` VALUES (1414, '12:26:48', 99.22, 76.00, 16.00, 122.00, 88.00, '2019-12-18 16:43:00');
INSERT INTO `departments_data` VALUES (1415, '12:26:04', 97.31, 96.00, 18.00, 124.00, 72.00, '2019-12-18 16:43:00');
INSERT INTO `departments_data` VALUES (1416, '12:26:01', 98.76, 86.00, 19.00, 121.00, 65.00, '2019-12-18 16:43:00');
INSERT INTO `departments_data` VALUES (1417, '12:26:48', 97.45, 91.00, 18.00, 133.00, 61.00, '2019-12-18 16:44:00');
INSERT INTO `departments_data` VALUES (1418, '12:26:04', 95.28, 68.00, 18.00, 111.00, 87.00, '2019-12-18 16:44:00');
INSERT INTO `departments_data` VALUES (1419, '12:26:01', 95.44, 99.00, 16.00, 126.00, 88.00, '2019-12-18 16:44:00');
INSERT INTO `departments_data` VALUES (1420, '12:26:48', 95.43, 95.00, 19.00, 139.00, 86.00, '2019-12-18 16:45:00');
INSERT INTO `departments_data` VALUES (1421, '12:26:04', 98.33, 64.00, 18.00, 102.00, 62.00, '2019-12-18 16:45:00');
INSERT INTO `departments_data` VALUES (1422, '12:26:01', 97.73, 98.00, 16.00, 117.00, 70.00, '2019-12-18 16:45:00');
INSERT INTO `departments_data` VALUES (1423, '12:26:48', 98.03, 95.00, 16.00, 105.00, 74.00, '2019-12-18 16:46:00');
INSERT INTO `departments_data` VALUES (1424, '12:26:04', 95.54, 98.00, 17.00, 93.00, 88.00, '2019-12-18 16:46:00');
INSERT INTO `departments_data` VALUES (1425, '12:26:01', 99.74, 98.00, 18.00, 93.00, 66.00, '2019-12-18 16:46:00');
INSERT INTO `departments_data` VALUES (1426, '12:26:48', 97.03, 91.00, 19.00, 118.00, 67.00, '2019-12-18 16:47:00');
INSERT INTO `departments_data` VALUES (1427, '12:26:04', 95.57, 87.00, 16.00, 139.00, 89.00, '2019-12-18 16:47:00');
INSERT INTO `departments_data` VALUES (1428, '12:26:01', 99.30, 78.00, 19.00, 90.00, 60.00, '2019-12-18 16:47:00');
INSERT INTO `departments_data` VALUES (1429, '12:26:48', 99.98, 98.00, 17.00, 128.00, 69.00, '2019-12-18 16:48:00');
INSERT INTO `departments_data` VALUES (1430, '12:26:04', 95.01, 94.00, 19.00, 107.00, 70.00, '2019-12-18 16:48:00');
INSERT INTO `departments_data` VALUES (1431, '12:26:01', 98.67, 73.00, 17.00, 107.00, 75.00, '2019-12-18 16:48:00');
INSERT INTO `departments_data` VALUES (1432, '12:26:48', 95.99, 80.00, 18.00, 116.00, 85.00, '2019-12-18 16:49:00');
INSERT INTO `departments_data` VALUES (1433, '12:26:04', 97.62, 90.00, 18.00, 99.00, 62.00, '2019-12-18 16:49:00');
INSERT INTO `departments_data` VALUES (1434, '12:26:01', 97.12, 74.00, 18.00, 126.00, 62.00, '2019-12-18 16:49:00');
INSERT INTO `departments_data` VALUES (1435, '12:26:48', 96.09, 77.00, 19.00, 110.00, 79.00, '2019-12-18 16:50:00');
INSERT INTO `departments_data` VALUES (1436, '12:26:04', 99.83, 89.00, 18.00, 125.00, 61.00, '2019-12-18 16:50:00');
INSERT INTO `departments_data` VALUES (1437, '12:26:01', 96.51, 85.00, 16.00, 90.00, 78.00, '2019-12-18 16:50:00');
INSERT INTO `departments_data` VALUES (1438, '12:26:48', 99.93, 88.00, 16.00, 90.00, 80.00, '2019-12-18 16:51:00');
INSERT INTO `departments_data` VALUES (1439, '12:26:04', 97.87, 89.00, 19.00, 104.00, 85.00, '2019-12-18 16:51:00');
INSERT INTO `departments_data` VALUES (1440, '12:26:01', 96.47, 90.00, 16.00, 138.00, 80.00, '2019-12-18 16:51:00');
INSERT INTO `departments_data` VALUES (1441, '12:26:48', 97.95, 67.00, 16.00, 101.00, 64.00, '2019-12-18 16:52:00');
INSERT INTO `departments_data` VALUES (1442, '12:26:04', 96.65, 97.00, 18.00, 138.00, 74.00, '2019-12-18 16:52:00');
INSERT INTO `departments_data` VALUES (1443, '12:26:01', 97.81, 63.00, 17.00, 109.00, 65.00, '2019-12-18 16:52:00');
INSERT INTO `departments_data` VALUES (1444, '12:26:48', 95.61, 69.00, 16.00, 108.00, 77.00, '2019-12-18 16:53:00');
INSERT INTO `departments_data` VALUES (1445, '12:26:04', 99.38, 64.00, 17.00, 127.00, 70.00, '2019-12-18 16:53:00');
INSERT INTO `departments_data` VALUES (1446, '12:26:01', 99.45, 67.00, 17.00, 123.00, 64.00, '2019-12-18 16:53:00');
INSERT INTO `departments_data` VALUES (1447, '12:26:48', 99.88, 94.00, 16.00, 101.00, 84.00, '2019-12-18 16:54:00');
INSERT INTO `departments_data` VALUES (1448, '12:26:04', 99.08, 87.00, 18.00, 119.00, 61.00, '2019-12-18 16:54:00');
INSERT INTO `departments_data` VALUES (1449, '12:26:01', 95.24, 61.00, 16.00, 100.00, 76.00, '2019-12-18 16:54:00');
INSERT INTO `departments_data` VALUES (1450, '12:26:48', 96.16, 76.00, 16.00, 134.00, 65.00, '2019-12-18 16:55:00');
INSERT INTO `departments_data` VALUES (1451, '12:26:04', 96.50, 82.00, 19.00, 123.00, 73.00, '2019-12-18 16:55:00');
INSERT INTO `departments_data` VALUES (1452, '12:26:01', 97.62, 81.00, 18.00, 119.00, 88.00, '2019-12-18 16:55:00');
INSERT INTO `departments_data` VALUES (1453, '12:26:48', 97.27, 90.00, 16.00, 91.00, 66.00, '2019-12-18 16:56:00');
INSERT INTO `departments_data` VALUES (1454, '12:26:04', 99.06, 87.00, 18.00, 102.00, 74.00, '2019-12-18 16:56:00');
INSERT INTO `departments_data` VALUES (1455, '12:26:01', 98.40, 89.00, 16.00, 97.00, 85.00, '2019-12-18 16:56:00');
INSERT INTO `departments_data` VALUES (1456, '12:26:48', 98.07, 62.00, 18.00, 101.00, 81.00, '2019-12-18 16:57:00');
INSERT INTO `departments_data` VALUES (1457, '12:26:04', 99.51, 88.00, 17.00, 97.00, 73.00, '2019-12-18 16:57:00');
INSERT INTO `departments_data` VALUES (1458, '12:26:01', 95.92, 70.00, 16.00, 92.00, 67.00, '2019-12-18 16:57:00');
INSERT INTO `departments_data` VALUES (1459, '12:26:48', 95.52, 64.00, 19.00, 117.00, 66.00, '2019-12-18 16:58:00');
INSERT INTO `departments_data` VALUES (1460, '12:26:04', 95.12, 93.00, 17.00, 108.00, 62.00, '2019-12-18 16:58:00');
INSERT INTO `departments_data` VALUES (1461, '12:26:01', 96.61, 61.00, 17.00, 128.00, 62.00, '2019-12-18 16:58:00');
INSERT INTO `departments_data` VALUES (1462, '12:26:48', 97.94, 73.00, 16.00, 90.00, 68.00, '2019-12-18 16:59:00');
INSERT INTO `departments_data` VALUES (1463, '12:26:04', 96.89, 64.00, 19.00, 132.00, 79.00, '2019-12-18 16:59:00');
INSERT INTO `departments_data` VALUES (1464, '12:26:01', 99.47, 89.00, 16.00, 130.00, 81.00, '2019-12-18 16:59:00');
INSERT INTO `departments_data` VALUES (1465, '12:26:48', 98.32, 79.00, 16.00, 134.00, 83.00, '2019-12-18 17:00:00');
INSERT INTO `departments_data` VALUES (1466, '12:26:04', 95.85, 77.00, 18.00, 130.00, 74.00, '2019-12-18 17:00:00');
INSERT INTO `departments_data` VALUES (1467, '12:26:01', 98.84, 77.00, 16.00, 105.00, 88.00, '2019-12-18 17:00:00');
INSERT INTO `departments_data` VALUES (1468, '12:26:48', 95.94, 84.00, 18.00, 103.00, 88.00, '2019-12-18 17:01:00');
INSERT INTO `departments_data` VALUES (1469, '12:26:04', 98.00, 60.00, 16.00, 131.00, 70.00, '2019-12-18 17:01:00');
INSERT INTO `departments_data` VALUES (1470, '12:26:01', 98.62, 62.00, 19.00, 112.00, 71.00, '2019-12-18 17:01:00');
INSERT INTO `departments_data` VALUES (1471, '12:26:48', 95.75, 71.00, 18.00, 126.00, 69.00, '2019-12-18 17:02:00');
INSERT INTO `departments_data` VALUES (1472, '12:26:04', 96.57, 89.00, 17.00, 99.00, 86.00, '2019-12-18 17:02:00');
INSERT INTO `departments_data` VALUES (1473, '12:26:01', 99.10, 94.00, 19.00, 104.00, 66.00, '2019-12-18 17:02:00');
INSERT INTO `departments_data` VALUES (1474, '12:26:48', 95.22, 79.00, 17.00, 133.00, 73.00, '2019-12-18 17:03:00');
INSERT INTO `departments_data` VALUES (1475, '12:26:04', 95.50, 91.00, 16.00, 101.00, 69.00, '2019-12-18 17:03:00');
INSERT INTO `departments_data` VALUES (1476, '12:26:01', 99.49, 65.00, 17.00, 125.00, 72.00, '2019-12-18 17:03:00');

-- ----------------------------
-- Table structure for departments_device
-- ----------------------------
DROP TABLE IF EXISTS `departments_device`;
CREATE TABLE `departments_device`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NULL DEFAULT NULL,
  `device_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `device_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creat_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `last_upload_time` datetime(0) NULL DEFAULT NULL,
  `last_offline_upload_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments_device
-- ----------------------------
INSERT INTO `departments_device` VALUES (1, 1, '000001', NULL, '12:26:48', '2019-09-18 15:55:25', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (3, 1, '3456', NULL, '12:26:01', '2019-10-09 17:48:40', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (4, 1, '123', NULL, '12:26:02', '2019-10-09 17:54:59', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (5, 1, '234', NULL, '12:26:03', '2019-10-09 17:55:06', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (6, 1, '567', NULL, '12:26:04', '2019-10-09 17:58:22', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (7, 1, '456', NULL, '12:26:05', '2019-10-09 17:59:16', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (8, 1, '67890', NULL, '12:26:06', '2019-10-09 18:07:32', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (9, 1, '789', NULL, '12:26:07', '2019-10-10 10:18:46', NULL, NULL, NULL, 1);
INSERT INTO `departments_device` VALUES (10, 1, '901', NULL, '12:26:08', '2019-10-10 10:18:54', NULL, NULL, NULL, 1);
INSERT INTO `departments_device` VALUES (11, 1, '902', NULL, '12:26:09', '2019-10-10 10:18:59', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (12, 1, '901', NULL, '12:26:11', '2019-10-10 10:19:12', NULL, NULL, NULL, 1);
INSERT INTO `departments_device` VALUES (13, 1, '901', NULL, '12:26:12', '2019-10-24 17:26:26', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (14, 1, '903', NULL, '12:26:13', '2019-10-24 17:26:32', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (15, 1, '904', NULL, '12:26:14', '2019-10-24 17:26:38', NULL, NULL, NULL, 0);
INSERT INTO `departments_device` VALUES (16, 1, '905', NULL, '12:26:15', '2019-10-24 17:26:45', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for departments_hospital
-- ----------------------------
DROP TABLE IF EXISTS `departments_hospital`;
CREATE TABLE `departments_hospital`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments_hospital
-- ----------------------------
INSERT INTO `departments_hospital` VALUES (1, '荆门二医');
INSERT INTO `departments_hospital` VALUES (2, '阳新妇幼');
INSERT INTO `departments_hospital` VALUES (3, '省中医院');
INSERT INTO `departments_hospital` VALUES (4, '江夏协和分院');
INSERT INTO `departments_hospital` VALUES (5, '黄石中心医院');
INSERT INTO `departments_hospital` VALUES (7, '荆门石化');
INSERT INTO `departments_hospital` VALUES (9, '三峡中心');
INSERT INTO `departments_hospital` VALUES (10, '汉川人民医院');
INSERT INTO `departments_hospital` VALUES (13, '同济医院');
INSERT INTO `departments_hospital` VALUES (14, '湖北省妇幼保健院');
INSERT INTO `departments_hospital` VALUES (15, '应城妇幼保健院');
INSERT INTO `departments_hospital` VALUES (16, '中部战区总医院');
INSERT INTO `departments_hospital` VALUES (17, '咸宁中医院');
INSERT INTO `departments_hospital` VALUES (18, '深圳龙岗骨科医院');
INSERT INTO `departments_hospital` VALUES (19, '山阴医疗集团');
INSERT INTO `departments_hospital` VALUES (20, '遵义航天医院');
INSERT INTO `departments_hospital` VALUES (21, '新洲妇幼保健院');
INSERT INTO `departments_hospital` VALUES (22, '十堰太和医院');
INSERT INTO `departments_hospital` VALUES (23, '宜昌市三医院');
INSERT INTO `departments_hospital` VALUES (24, '宜昌妇幼保健院');
INSERT INTO `departments_hospital` VALUES (25, '恩施州中心医院');
INSERT INTO `departments_hospital` VALUES (26, '荆州市中心医院');
INSERT INTO `departments_hospital` VALUES (28, '孝感妇幼保健院');

-- ----------------------------
-- Table structure for departments_patient
-- ----------------------------
DROP TABLE IF EXISTS `departments_patient`;
CREATE TABLE `departments_patient`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '患者ID',
  `section_id` int(11) UNSIGNED NOT NULL COMMENT '管理员ID',
  `caseno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '病历号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名',
  `sex` tinyint(1) NOT NULL DEFAULT 2 COMMENT '性别：1男，2女',
  `age` int(2) NULL DEFAULT NULL COMMENT '年龄',
  `creat_time` datetime(0) NOT NULL COMMENT '添加时间',
  `doctor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `history` tinyint(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '子用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments_patient
-- ----------------------------
INSERT INTO `departments_patient` VALUES (1, 1, '000001', '张梅梅', 1, 16, '2019-09-20 15:30:10', '01', 0);
INSERT INTO `departments_patient` VALUES (2, 1, '000002', '张梅梅2', 2, 18, '2019-09-20 15:32:24', '01', 0);
INSERT INTO `departments_patient` VALUES (4, 1, '0004', 'asd', 2, 12, '2019-10-15 14:28:33', NULL, 0);
INSERT INTO `departments_patient` VALUES (5, 1, '0006', 'wed', 2, 32, '2019-10-15 14:28:57', NULL, 0);
INSERT INTO `departments_patient` VALUES (6, 1, '0008', 'erw', 1, 23, '2019-10-15 14:29:21', NULL, 0);

-- ----------------------------
-- Table structure for departments_room
-- ----------------------------
DROP TABLE IF EXISTS `departments_room`;
CREATE TABLE `departments_room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) UNSIGNED NOT NULL COMMENT '科室id',
  `room_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creat_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` tinyint(4) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments_room
-- ----------------------------
INSERT INTO `departments_room` VALUES (1, 1, '1号病房', '2019-09-18 09:18:47', 0);
INSERT INTO `departments_room` VALUES (2, 1, '2号病房', '2019-09-22 17:32:29', 1);
INSERT INTO `departments_room` VALUES (3, 1, '3病房', '2019-10-15 14:26:58', 0);
INSERT INTO `departments_room` VALUES (4, 1, '4病房', '2019-10-15 14:28:05', 0);
INSERT INTO `departments_room` VALUES (6, 1, '2病房', '2019-10-24 17:33:00', 0);

-- ----------------------------
-- Table structure for departments_room_bed_dev_pat
-- ----------------------------
DROP TABLE IF EXISTS `departments_room_bed_dev_pat`;
CREATE TABLE `departments_room_bed_dev_pat`  (
  `rid` int(11) NOT NULL COMMENT '病房id',
  `bid` int(11) NOT NULL COMMENT '病床id',
  `did` int(11) NULL DEFAULT NULL COMMENT '设备id',
  `pid` int(11) NULL DEFAULT NULL COMMENT '患者id',
  PRIMARY KEY (`rid`, `bid`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  INDEX `bid`(`bid`) USING BTREE,
  CONSTRAINT `bid` FOREIGN KEY (`bid`) REFERENCES `departments_bed` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rid` FOREIGN KEY (`rid`) REFERENCES `departments_room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments_room_bed_dev_pat
-- ----------------------------
INSERT INTO `departments_room_bed_dev_pat` VALUES (3, 739, NULL, NULL);
INSERT INTO `departments_room_bed_dev_pat` VALUES (3, 740, 1, 4);
INSERT INTO `departments_room_bed_dev_pat` VALUES (4, 741, 7, NULL);
INSERT INTO `departments_room_bed_dev_pat` VALUES (4, 742, 6, 5);
INSERT INTO `departments_room_bed_dev_pat` VALUES (4, 743, 8, NULL);
INSERT INTO `departments_room_bed_dev_pat` VALUES (4, 744, 3, 6);
INSERT INTO `departments_room_bed_dev_pat` VALUES (6, 748, 11, NULL);
INSERT INTO `departments_room_bed_dev_pat` VALUES (6, 749, 13, NULL);

-- ----------------------------
-- Table structure for departments_section
-- ----------------------------
DROP TABLE IF EXISTS `departments_section`;
CREATE TABLE `departments_section`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hospital_id` int(11) NULL DEFAULT NULL,
  `creat_time` datetime(0) NULL DEFAULT NULL,
  `is_deleted` int(2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '科室文档' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments_section
-- ----------------------------
INSERT INTO `departments_section` VALUES (1, '儿科', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (2, '儿科', 2, NULL, 0);
INSERT INTO `departments_section` VALUES (3, '儿科', 3, NULL, 0);
INSERT INTO `departments_section` VALUES (4, '新生儿科', 4, NULL, 0);
INSERT INTO `departments_section` VALUES (5, '新生儿科', 5, NULL, 0);
INSERT INTO `departments_section` VALUES (6, 'ICU', 10, NULL, 0);
INSERT INTO `departments_section` VALUES (7, '儿科', 7, NULL, 0);
INSERT INTO `departments_section` VALUES (8, '新生儿科', 7, NULL, 0);
INSERT INTO `departments_section` VALUES (9, '一期临床', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (10, '肿瘤科', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (11, '呼吸内科一病区', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (12, '呼吸内科二病区', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (13, '呼吸科', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (14, '小儿骨科', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (15, '妇产科', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (16, '儿科一病区', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (17, '内科', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (18, '二病区', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (19, '神经内科', 2, NULL, 0);
INSERT INTO `departments_section` VALUES (20, '呼吸科', 3, NULL, 0);
INSERT INTO `departments_section` VALUES (21, '儿科', 5, NULL, 0);
INSERT INTO `departments_section` VALUES (22, '骨科三病区', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (23, '大内科', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (24, '儿科', 21, NULL, 0);
INSERT INTO `departments_section` VALUES (25, '急诊科', 1, NULL, 0);
INSERT INTO `departments_section` VALUES (26, '神经外科', 2, NULL, 0);
INSERT INTO `departments_section` VALUES (27, '大内科', 15, NULL, 0);
INSERT INTO `departments_section` VALUES (28, '儿科', 13, NULL, 0);

-- ----------------------------
-- Procedure structure for createPatient
-- ----------------------------
DROP PROCEDURE IF EXISTS `createPatient`;
delimiter ;;
CREATE PROCEDURE `createPatient`(IN s INT , IN casenos VARCHAR(100))
BEGIN
  DECLARE s int DEFAULT 0;
	DECLARE age int DEFAULT 0;
	DECLARE weight DECIMAL DEFAULT 0;
	DECLARE height DECIMAL DEFAULT 0;
	DECLARE
		i INT UNSIGNED DEFAULT 0;
		DECLARE sectionId INT; 
	declare section_list CURSOR FOR SELECT id from departments_section ;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET s=1;
	OPEN section_list; 
		-- 将游标中的值赋值给变量，要注意sql结果列的顺序
		FETCH section_list INTO sectionId; 
while s<>1 do
		set i = 0 ;
		while i < 100 do
		set age = round((RAND()*60) + 10);
		set height = IF(age < 13 ,round((RAND()*40) + 75),round((RAND()*55) + 140));
		set weight = height*(RAND() + 0.5)*0.5;
	INSERT INTO departments_patient (
		section_id,
		caseno,
		NAME,
		sex,
		age,
		height,
		weight,
		bell,
		history,
		device_mac,
		level_max,
		level_middle,
		level_min,
		part 
	) 
	VALUE
		( s,
		"医院名字", 
		"1",
		round(RAND()),
 age, 
height,
weight, 0 , 0, "ea" , 36.5 ,37.0 ,37.8 , round(RAND()));
	
	SET i = i + 1;
end while;
FETCH section_list INTO sectionId; 
end while;


END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
