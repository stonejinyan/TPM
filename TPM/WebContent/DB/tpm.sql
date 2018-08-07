/*
 Navicat Premium Data Transfer

 Source Server         : Mysql80
 Source Server Type    : MySQL
 Source Server Version : 50560
 Source Host           : localhost:3306
 Source Schema         : tpm

 Target Server Type    : MySQL
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 03/08/2018 12:01:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_record
-- ----------------------------
DROP TABLE IF EXISTS `account_record`;
CREATE TABLE `account_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_number` int(11) NULL DEFAULT NULL,
  `staff_id` int(11) NULL DEFAULT NULL,
  `replacement_part_id` int(11) NULL DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `total` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `staff_id`(`staff_id`) USING BTREE,
  INDEX `replacement_part_id`(`replacement_part_id`) USING BTREE,
  CONSTRAINT `replacement_part_id` FOREIGN KEY (`replacement_part_id`) REFERENCES `replacement_part` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for check_method
-- ----------------------------
DROP TABLE IF EXISTS `check_method`;
CREATE TABLE `check_method`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of check_method
-- ----------------------------
INSERT INTO `check_method` VALUES (0, '无需校验');
INSERT INTO `check_method` VALUES (1, '内部校验');
INSERT INTO `check_method` VALUES (2, '外部校验');

-- ----------------------------
-- Table structure for critical
-- ----------------------------
DROP TABLE IF EXISTS `critical`;
CREATE TABLE `critical`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of critical
-- ----------------------------
INSERT INTO `critical` VALUES (0, '非关键');
INSERT INTO `critical` VALUES (1, '关键');

-- ----------------------------
-- Table structure for ep
-- ----------------------------
DROP TABLE IF EXISTS `ep`;
CREATE TABLE `ep`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `epid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '设备编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '设备名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '设备描述',
  `status` int(11) NULL DEFAULT NULL COMMENT '设备状态',
  `critical` int(11) NULL DEFAULT NULL COMMENT '关键等级',
  `environmental_impact` int(11) NULL DEFAULT NULL COMMENT '环境影响度',
  `output_impact` int(11) NULL DEFAULT NULL COMMENT '产量影响度',
  `ep_complexity` int(11) NULL DEFAULT NULL COMMENT '设备复杂度',
  `ep_manufacturing_channel` int(11) NULL DEFAULT NULL COMMENT '设备制造渠道',
  `ep_cost` int(11) NULL DEFAULT NULL COMMENT '设备总价',
  `ep_score` double(11, 0) UNSIGNED NULL DEFAULT NULL COMMENT '设备评估分',
  `backup_plan` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备份计划',
  `check_method` int(11) NULL DEFAULT NULL COMMENT '校检方式',
  `check_cycle` int(11) NULL DEFAULT NULL COMMENT '校检周期（单位：月）',
  `check_staff_id` int(11) NULL DEFAULT NULL COMMENT '校验员工',
  `maintain_staff_id` int(11) NULL DEFAULT NULL COMMENT '保养负责人',
  `property_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '固资编号',
  `attribute` int(11) NULL DEFAULT NULL COMMENT '设备类型',
  `save_area_id` int(11) NULL DEFAULT NULL COMMENT '存放区域',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `维修人员`(`maintain_staff_id`) USING BTREE,
  INDEX `校检人员`(`check_staff_id`) USING BTREE,
  INDEX `存放区域`(`save_area_id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `attribute`(`attribute`) USING BTREE,
  INDEX `critical`(`critical`) USING BTREE,
  INDEX `check_method`(`check_method`) USING BTREE,
  CONSTRAINT `维修人员` FOREIGN KEY (`maintain_staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ep_ibfk_1` FOREIGN KEY (`status`) REFERENCES `epstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ep_ibfk_2` FOREIGN KEY (`attribute`) REFERENCES `epattribute` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ep_ibfk_3` FOREIGN KEY (`critical`) REFERENCES `critical` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ep_ibfk_4` FOREIGN KEY (`check_method`) REFERENCES `check_method` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `存放区域` FOREIGN KEY (`save_area_id`) REFERENCES `processline_area` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `校检人员` FOREIGN KEY (`check_staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ep
-- ----------------------------
INSERT INTO `ep` VALUES (1, 'EP-001', '自动线束机', NULL, 1, 1, 4, 10, 7, 4, 4, 6, '使用自动剥线机', 0, 0, 1, 2, NULL, 1, 1);
INSERT INTO `ep` VALUES (3, 'EP-123456', '冲压机', '冲压机', 1, 0, 1, 1, 1, 1, 1, 0, '备份冲压机', 1, 0, 1, 2, '123321', 1, 1);
INSERT INTO `ep` VALUES (4, 'EP-123456', '冲压机', '冲压机', 1, 0, 1, 1, 1, 1, 1, 0, '备份冲压机', 1, 0, 1, 2, '123321', 1, 1);
INSERT INTO `ep` VALUES (5, 'EP-123456', '冲压机', '冲压机', 1, 0, 1, 1, 1, 1, 1, 0, '备份冲压机', 1, 0, 1, 2, '123321', 1, 1);
INSERT INTO `ep` VALUES (6, 'EP-123456', '冲压机', '冲压机', 1, 0, 1, 1, 1, 1, 1, 0, '备份冲压机', 1, 0, 1, 2, '123321', 1, 1);
INSERT INTO `ep` VALUES (7, 'EP-123456', '冲压机', '冲压机', 1, 0, 1, 1, 1, 1, 1, 0, '备份冲压机', 1, 0, 1, 2, '123321', 1, 1);
INSERT INTO `ep` VALUES (8, 'EP-123456', '冲压机', '冲压机', 1, 0, 1, 1, 1, 1, 1, 0, '备份冲压机', 1, 0, 1, 2, '123321', 1, 1);
INSERT INTO `ep` VALUES (9, 'EP-123456', '冲压机', '111', 1, 0, 1, 1, 1, 1, 1, 0, '111', 1, 0, 1, 2, '123321', 1, 1);

-- ----------------------------
-- Table structure for epattribute
-- ----------------------------
DROP TABLE IF EXISTS `epattribute`;
CREATE TABLE `epattribute`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of epattribute
-- ----------------------------
INSERT INTO `epattribute` VALUES (1, '生产设备');
INSERT INTO `epattribute` VALUES (2, '仓储设备');
INSERT INTO `epattribute` VALUES (3, '检测设备');
INSERT INTO `epattribute` VALUES (4, '测试设备');

-- ----------------------------
-- Table structure for epstatus
-- ----------------------------
DROP TABLE IF EXISTS `epstatus`;
CREATE TABLE `epstatus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of epstatus
-- ----------------------------
INSERT INTO `epstatus` VALUES (1, '正常');
INSERT INTO `epstatus` VALUES (2, '维修');
INSERT INTO `epstatus` VALUES (3, '封存');

-- ----------------------------
-- Table structure for maintenance_daily_work_record
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_daily_work_record`;
CREATE TABLE `maintenance_daily_work_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `process_description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` int(11) NULL DEFAULT NULL,
  `pm_id` int(11) NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `staff_id` int(11) NULL DEFAULT NULL,
  `user_time` double NULL DEFAULT NULL,
  `ep_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `staff_id`(`staff_id`) USING BTREE,
  INDEX `pm_id`(`pm_id`) USING BTREE,
  INDEX `ep_id`(`ep_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  CONSTRAINT `maintenance_daily_work_record_ibfk_4` FOREIGN KEY (`type`) REFERENCES `maintenance_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenance_daily_work_record_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenance_daily_work_record_ibfk_2` FOREIGN KEY (`pm_id`) REFERENCES `pm_schedule` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `maintenance_daily_work_record_ibfk_3` FOREIGN KEY (`ep_id`) REFERENCES `ep` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of maintenance_daily_work_record
-- ----------------------------
INSERT INTO `maintenance_daily_work_record` VALUES (6, '设备坏了', '设备好了', 1, 0, '2018-08-02', 1, 5, 1);

-- ----------------------------
-- Table structure for maintenance_type
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_type`;
CREATE TABLE `maintenance_type`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of maintenance_type
-- ----------------------------
INSERT INTO `maintenance_type` VALUES (1, 'PM季度');
INSERT INTO `maintenance_type` VALUES (2, 'PM月度');
INSERT INTO `maintenance_type` VALUES (3, 'RM');
INSERT INTO `maintenance_type` VALUES (4, 'AM-巡线');
INSERT INTO `maintenance_type` VALUES (5, '支援/调机');
INSERT INTO `maintenance_type` VALUES (6, 'Other');

-- ----------------------------
-- Table structure for pm_schedule
-- ----------------------------
DROP TABLE IF EXISTS `pm_schedule`;
CREATE TABLE `pm_schedule`  (
  `id` int(11) NOT NULL,
  `ep_id` int(11) NULL DEFAULT NULL,
  `schedule_time` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ep_id`(`ep_id`) USING BTREE,
  CONSTRAINT `pm_schedule_ibfk_1` FOREIGN KEY (`ep_id`) REFERENCES `ep` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pm_schedule
-- ----------------------------
INSERT INTO `pm_schedule` VALUES (0, 1, '2018-08-02');

-- ----------------------------
-- Table structure for processline_area
-- ----------------------------
DROP TABLE IF EXISTS `processline_area`;
CREATE TABLE `processline_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of processline_area
-- ----------------------------
INSERT INTO `processline_area` VALUES (1, 'FQC/FAT区');
INSERT INTO `processline_area` VALUES (2, 'IQI区');
INSERT INTO `processline_area` VALUES (3, 'KS线');
INSERT INTO `processline_area` VALUES (4, 'PLC线');
INSERT INTO `processline_area` VALUES (5, '包装/成品区');
INSERT INTO `processline_area` VALUES (6, '部装-LVS');
INSERT INTO `processline_area` VALUES (7, '部装-抽屉线');
INSERT INTO `processline_area` VALUES (8, '部装-二次线');
INSERT INTO `processline_area` VALUES (9, '部装-激光区');
INSERT INTO `processline_area` VALUES (10, '部装-框架线');
INSERT INTO `processline_area` VALUES (11, '部装-铜排区');
INSERT INTO `processline_area` VALUES (12, '部装-一次线');
INSERT INTO `processline_area` VALUES (13, '核电线');
INSERT INTO `processline_area` VALUES (14, '库房区');

-- ----------------------------
-- Table structure for replacement_part
-- ----------------------------
DROP TABLE IF EXISTS `replacement_part`;
CREATE TABLE `replacement_part`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `part_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备件id:S-001',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库位',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `specification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备件规格',
  `brand` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `userep` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '适用设备',
  `deliverycycle` int(11) NULL DEFAULT NULL COMMENT '供货周期',
  `partvalue` int(11) NULL DEFAULT NULL COMMENT '配件价值',
  `epcritical` int(11) NULL DEFAULT NULL COMMENT '设备关键度',
  `vicarism` int(11) NULL DEFAULT NULL COMMENT '可替代性',
  `vulnerability` int(11) NULL DEFAULT NULL COMMENT '易损程度',
  `partscore` double(11, 0) NULL DEFAULT NULL COMMENT '备件评估分',
  `critical` double(11, 0) NULL DEFAULT NULL COMMENT '关键等级',
  `boxtype_id` int(11) NULL DEFAULT NULL COMMENT '储存盒尺寸',
  `max` int(11) NULL DEFAULT NULL COMMENT '最大库存',
  `order_number` int(11) NULL DEFAULT NULL COMMENT '订购点',
  `min` int(11) NULL DEFAULT NULL COMMENT '最小库存',
  `number` int(11) NULL DEFAULT NULL COMMENT '库存数量',
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `price` double(10, 2) NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 356 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of replacement_part
-- ----------------------------
INSERT INTO `replacement_part` VALUES (3, 'S-002', 'A1-02A', '分油器', '非标', 'BOSCH', '激光开孔机', 4, 4, 7, 1, 7, 5, 0, NULL, 3, 1, 1, 2, '个', 128.00);
INSERT INTO `replacement_part` VALUES (4, 'S-003', 'A1-03A', '电磁阀', 'DSG-01-3C60-A240-N-50', 'DEKEMA', '铜排加工设备 ', 4, 4, 7, 1, 1, 3, 0, NULL, 6, 3, 2, 6, '个', 0.00);
INSERT INTO `replacement_part` VALUES (5, 'S-004', 'A1-04A', '止回阀', 'MAV-02P-3-B', 'DEKEMA', '铜排加工设备 ', 4, 4, 7, 1, 1, 3, 0, NULL, 4, 3, 2, 6, '个', 0.00);
INSERT INTO `replacement_part` VALUES (6, 'S-005', 'A1-05A', '电磁阀', 'DSG-02-3C6-DL-D22', 'DEKEMA', '铜排加工设备 ', 4, 4, 7, 1, 7, 5, 0, NULL, 2, 1, 1, 1, '个', 0.00);
INSERT INTO `replacement_part` VALUES (7, 'S-006', 'A1-06A', '溢流阀', 'MTV-02P-3', 'DEKEMA', '铜排加工设备 ', 4, 4, 7, 1, 7, 5, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (8, 'S-007', 'A1-07A', '电磁换向阀', '4V310-10', '双星电气', '一次剥线机 ', 4, 4, 7, 1, 7, 5, 0, NULL, 5, 2, 2, 1, '个', 0.00);
INSERT INTO `replacement_part` VALUES (9, 'S-008', 'A1-08A', '滑动电阻', '300瓦 500欧', '松鹤电气', '抽屉检验', 4, 4, 7, 1, 7, 5, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (10, 'S-009', 'A1-09A', '光电开关', 'E3JK-DR12-C', 'OMRON', '通用', 7, 4, 1, 1, 7, 4, 0, NULL, 4, 1, 1, 7, '个', 0.00);
INSERT INTO `replacement_part` VALUES (11, 'S-010', 'A1-10A', '12V电池', '2607335683', 'BOSCH', 'EXACT12', 7, 4, 1, 4, 7, 5, 0, NULL, 15, 3, 2, 7, '个', 780.00);
INSERT INTO `replacement_part` VALUES (12, 'S-011', 'A1-11A', 'KS模具', 'KSC-250A NO.7', NULL, 'KS', 7, 4, 1, 4, 7, 5, 0, NULL, 2, 1, 1, 2, '个', 980.00);
INSERT INTO `replacement_part` VALUES (13, 'S-012', 'A1-12A', 'KS模具', 'KSC-160A NO.7', NULL, 'KS', 7, 4, 1, 4, 7, 5, 0, NULL, 2, 1, 1, 2, '个', 980.00);
INSERT INTO `replacement_part` VALUES (14, 'S-013', 'A1-13A', 'KS模具', 'KSC-160A NO.8', NULL, 'KS', 7, 4, 1, 4, 7, 5, 0, NULL, 2, 1, 1, 2, '个', 980.00);
INSERT INTO `replacement_part` VALUES (15, 'S-014', 'A1-14A', '电钻齿轮箱', '2609199380', 'BOSCH', '手电钻', 7, 4, 1, 1, 7, 4, 0, NULL, 5, 3, 2, 5, '个', 50.00);
INSERT INTO `replacement_part` VALUES (16, 'S-015', 'A1-15A', '手电钻电机', '2609199258', 'BOSCH', '手电钻', 7, 1, 1, 4, 7, 4, 0, NULL, 5, 3, 2, 5, '个', 125.00);
INSERT INTO `replacement_part` VALUES (17, 'S-016', 'A1-16A', '直流电机', '3607031551', 'BOSCH', '电动扭矩', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 3, 2, 6, '个', 135.00);
INSERT INTO `replacement_part` VALUES (18, 'S-017', 'A1-17A', '直流电机', '3607031566', 'BOSCH', '电动扭矩', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 3, 2, 7, '个', 200.88);
INSERT INTO `replacement_part` VALUES (19, 'S-018', 'A1-18A', '直流电机', '3607031652', 'BOSCH', '电动扭矩', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 3, 2, 5, '个', 1467.54);
INSERT INTO `replacement_part` VALUES (20, 'S-019', 'A1-19A', '直流电机', '3607031538', 'BOSCH', '电动扭矩', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 3, 2, 10, '个', 338.52);
INSERT INTO `replacement_part` VALUES (21, 'S-022', 'A1-01B', '辅助触点', 'LADN20C(3NO)', 'Schneider', '通用', 7, 4, 1, 4, 7, 5, 0, NULL, 10, 2, 1, 5, '个', 8.00);
INSERT INTO `replacement_part` VALUES (22, 'S-023', 'A1-02B', '按钮盒', 'JL-BX2', 'control box', '通用', 4, 1, 1, 4, 1, 2, 0, NULL, 7, 2, 1, 5, '个', 8.19);
INSERT INTO `replacement_part` VALUES (23, 'S-024', 'A1-03B', '按钮盒', 'JL-BX1', 'control box', '通用', 4, 1, 1, 4, 1, 2, 0, NULL, 7, 2, 1, 3, '个', 5.85);
INSERT INTO `replacement_part` VALUES (24, 'S-025', 'A1-04B', '辅助触点', 'LADN31C(3NO+1NC)', 'Schneider', '通用', 4, 4, 1, 7, 7, 5, 0, NULL, 10, 3, 2, 10, '个', 26.19);
INSERT INTO `replacement_part` VALUES (25, 'S-026', 'A1-05B', '航空插', NULL, NULL, NULL, 1, 10, 1, 1, 1, 3, 0, NULL, 3, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (26, 'S-027', 'A1-06B', '安全限位开关', 'XCS-E', 'Schneider', 'LT设备', 7, 1, 1, 4, 1, 3, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (27, 'S-028', 'A1-07B', '按钮开关', 'LA38', '长江电气', '通用', 1, 1, 1, 1, 7, 2, 0, NULL, 15, 5, 4, 18, '个', 13.92);
INSERT INTO `replacement_part` VALUES (28, 'S-029', 'A1-08B', '焊头', '非标', '非标', '电阻焊机', 10, 7, 7, 10, 7, 8, 1, NULL, 200, 50, 40, 16, '个', 57.00);
INSERT INTO `replacement_part` VALUES (29, 'S-030', 'A1-09B', '14.4V电池', '2607335711', 'BOSCH', 'ANGLE EXACT60-170', 7, 4, 1, 4, 7, 5, 0, NULL, 3, 2, 1, 6, '个', 383.50);
INSERT INTO `replacement_part` VALUES (30, 'S-031', 'A1-10B', '9.6V电池', '2607335681', 'BOSCH', 'ANGLE EXACT15', 7, 4, 1, 4, 7, 5, 0, NULL, 9, 2, 2, 2, '个', 680.00);
INSERT INTO `replacement_part` VALUES (31, 'S-032', 'A1-11B', '开关电源', 'NES-50-12', '明纬电源', '通用', 4, 4, 1, 1, 1, 2, 0, NULL, 4, 2, 1, 4, '个', 120.00);
INSERT INTO `replacement_part` VALUES (32, 'S-033', 'A1-12B', '开关电源', 'SP-240-24', '明纬电源', '通用', 4, 4, 1, 1, 1, 2, 0, NULL, 4, 2, 1, 3, '个', 265.00);
INSERT INTO `replacement_part` VALUES (33, 'S-034', 'A1-13B', '开关电源', 'SP-75-24', '明纬电源', '通用', 4, 4, 1, 1, 1, 2, 0, NULL, 4, 2, 1, 3, '个', 89.00);
INSERT INTO `replacement_part` VALUES (34, 'S-035', 'A1-14B', '手电钻机头', '2609199786', 'BOSCH', '手电钻', 7, 4, 1, 1, 7, 4, 0, NULL, 3, 2, 1, 3, '个', 135.00);
INSERT INTO `replacement_part` VALUES (35, 'S-036', 'A1-15B', 'IC65N 2P断路器', 'IC65N C 16A', 'Schneider', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 3, 3, 2, 5, '个', 0.00);
INSERT INTO `replacement_part` VALUES (36, 'S-037', 'A1-16B', 'IC65N 2P断路器', 'IC65N C 20A', 'Schneider', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 3, 2, 1, 1, '个', 0.00);
INSERT INTO `replacement_part` VALUES (37, 'S-038', 'A1-17B', 'IC65N 2P断路器', 'IC65N C 32A', 'Schneider', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 3, 2, 1, 1, '个', 0.00);
INSERT INTO `replacement_part` VALUES (38, 'S-039', 'A1-18B', '漏电头', '4P', 'Schneider', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 2, 2, 1, 0, '个', 0.00);
INSERT INTO `replacement_part` VALUES (39, 'S-040', 'A1-19B', '手电钻电机', '2609199253', 'BOSCH', '手电钻', 7, 4, 1, 4, 7, 5, 0, NULL, 5, 2, 1, 2, '个', 125.00);
INSERT INTO `replacement_part` VALUES (40, 'S-043', 'A2-01A', '碳刷', '07520-08', 'MASTERFLEX', '一次压线钳', 7, 4, 1, 1, 7, 4, 0, NULL, 8, 4, 2, 6, '个', 0.00);
INSERT INTO `replacement_part` VALUES (41, 'S-045', 'A2-03A', '感应器', 'D-M9P', 'SMC', 'LT', 7, 4, 1, 1, 7, 4, 0, NULL, 2, 1, 1, 5, '个', 79.00);
INSERT INTO `replacement_part` VALUES (42, 'S-046', 'A2-04A', '9N机头扣圈', '3600106011', 'BOSCH', 'EXACT12', 7, 4, 1, 1, 7, 4, 0, NULL, 5, 2, 1, 25, '个', 0.00);
INSERT INTO `replacement_part` VALUES (43, 'S-047', 'A2-05A', '电磁阀', '2V025-08', 'JELPC', '激光雕刻机', 7, 4, 1, 1, 7, 4, 0, NULL, 2, 1, 1, 2, '个', NULL);
INSERT INTO `replacement_part` VALUES (44, 'S-048', 'A2-06A', '导轨剪切模具', NULL, NULL, '气动导轨剪切机', 7, 4, 1, 1, 7, 4, 0, NULL, 1, 1, 1, 1, '套', NULL);
INSERT INTO `replacement_part` VALUES (45, 'S-049', 'A2-07A', '电感传感器', 'PL-05P', 'FOTEK', 'KOMAX', 7, 4, 1, 1, 7, 4, 0, NULL, 2, 1, 1, 2, '条', NULL);
INSERT INTO `replacement_part` VALUES (46, 'S-050', 'A2-08A', '光纤', 'XUFN12301', 'SCHNEIDER', 'KOMAX', 7, 4, 1, 1, 1, 3, 0, NULL, 2, 1, 1, 2, '条', NULL);
INSERT INTO `replacement_part` VALUES (47, 'S-051', 'A2-09A', '光纤', 'FU-79', 'KEYENCE', 'KOMAX', 7, 4, 1, 1, 1, 3, 0, NULL, 1, 1, 1, 4, '条', NULL);
INSERT INTO `replacement_part` VALUES (48, 'S-052', 'A2-10A', '光感应开关', 'PS-N11N', 'KEYENCE', 'KOMAX', 7, 4, 1, 1, 1, 3, 0, NULL, 2, 1, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (49, 'S-053', 'A2-11A', '辅助开关', 'LAD8N20', 'Schneider', 'LT设备', 7, 1, 1, 1, 7, 3, 0, NULL, 10, 4, 2, 5, '个', 0.00);
INSERT INTO `replacement_part` VALUES (50, 'S-054', 'A2-12A', '指纹开关', 'XB5A2B2M12', 'Schneider', 'FQC门禁', 4, 4, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (51, 'S-055', 'A2-13A', '接近开关', 'XS618B1MBL2', 'TE', '通用', 7, 4, 1, 1, 1, 3, 0, NULL, 6, 2, 2, 3, '个', 0.00);
INSERT INTO `replacement_part` VALUES (52, 'S-056', 'A2-14A', '绿色按钮头', 'ZB2-BW33C', 'Schneider', '通用', 7, 1, 1, 1, 7, 3, 0, NULL, 10, 3, 2, 5, '个', 4.45);
INSERT INTO `replacement_part` VALUES (53, 'S-057', 'A2-15A', '红色按钮头', 'ZB2-BW34C', 'Schneider', '通用', 7, 1, 1, 1, 7, 3, 0, NULL, 10, 3, 2, 15, '个', 4.45);
INSERT INTO `replacement_part` VALUES (54, 'S-058', 'A2-16A', '控制与信号单元', 'ZB2BWB41C', 'Schneider', '通用', 7, 1, 7, 1, 7, 5, 0, NULL, 10, 3, 2, 15, '个', 0.00);
INSERT INTO `replacement_part` VALUES (55, 'S-059', 'A2-17A', '控制与信号单元', 'ZB2BWB31C', 'Schneider', '通用', 7, 1, 7, 1, 7, 5, 0, NULL, 10, 3, 2, 15, '个', 0.00);
INSERT INTO `replacement_part` VALUES (56, 'S-060', 'A2-18A', '手电钻电池12V', '1607A35040G3', 'BOSCH', '手电钻', 7, 4, 1, 1, 7, 4, 0, NULL, 10, 1, 1, 2, '个', NULL);
INSERT INTO `replacement_part` VALUES (57, 'S-061', 'A2-19A', '手电钻电池18V', '2607336905', 'BOSCH', '手电钻', 7, 4, 1, 1, 7, 4, 0, NULL, 10, 1, 1, 3, '个', NULL);
INSERT INTO `replacement_part` VALUES (58, 'S-062', 'A2-20A', '热风枪电池36V', '938', 'STEINEL', '热风枪', 7, 4, 1, 1, 7, 4, 0, NULL, 3, 2, 1, 3, '个', NULL);
INSERT INTO `replacement_part` VALUES (59, 'S-063', 'A2-21A', '控制板带开关', '3607200114', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 6, 1, 2, 2, '个', 2746.29);
INSERT INTO `replacement_part` VALUES (60, 'S-064', 'A2-22A', '控制板带开关', '3607200108', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 6, 3, 2, 4, '个', 2148.30);
INSERT INTO `replacement_part` VALUES (61, 'S-065', 'A2-23A', '控制板带开关', '3607200107', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 6, 2, 1, 1, '个', 1677.72);
INSERT INTO `replacement_part` VALUES (62, 'S-066', 'A2-24A', '开关', '3607200083', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 18, 2, 1, 16, '个', 311.55);
INSERT INTO `replacement_part` VALUES (63, 'S-067', 'A2-25A', '伸缩器', 'CT-M602-B', NULL, '双夹头', 4, 7, 1, 4, 1, 3, 0, NULL, 5, 2, 1, 4, '个', 46.00);
INSERT INTO `replacement_part` VALUES (64, 'S-070', 'A2-01B', '按钮附件', 'ZB2 BZ 102C', 'Schneider', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 10, 3, 2, 5, '个', 0.00);
INSERT INTO `replacement_part` VALUES (65, 'S-071', 'A2-02B', '急停按钮头总成', 'ZB2 BS 540C', 'Schneider', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 5, 2, 2, 1, '套', 0.00);
INSERT INTO `replacement_part` VALUES (66, 'S-072', 'A2-03B', '插座', 'PC34   10A', 'Schneider', '通用', 4, 1, 1, 1, 1, 2, 0, NULL, 10, 3, 2, 4, '个', 0.00);
INSERT INTO `replacement_part` VALUES (67, 'S-073', 'A2-04B', 'XUB光电传感器', 'XUB5APANL2', 'Schneider', '通用', 7, 7, 1, 4, 1, 4, 0, NULL, 10, 3, 2, 10, '个', 92.43);
INSERT INTO `replacement_part` VALUES (68, 'S-074', 'A2-05B', '熔断器座', 'RT14-20', '上海沪工', '通用', 4, 1, 1, 1, 1, 2, 0, NULL, 10, 3, 2, 12, '个', 2.00);
INSERT INTO `replacement_part` VALUES (69, 'S-075', 'A2-06B', '熔断器', '80A', 'SWECANL', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 30, 3, 2, 5, '个', 13.10);
INSERT INTO `replacement_part` VALUES (70, 'S-076', 'A2-07B', '熔断器', '8A', '上海沪工', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 100, 10, 5, 19, '只', 1.40);
INSERT INTO `replacement_part` VALUES (71, 'S-077', 'A2-08B', '接触器', 'CJX2-09', 'CHNT    正泰', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 5, 2, 1, 4, '个', 25.00);
INSERT INTO `replacement_part` VALUES (72, 'S-078', 'A2-09B', 'LED灯珠', 'MR16', NULL, '铜排加工设备', 7, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (73, 'S-079 ', 'A2-10B', '限位开关', 'SD7311', 'SAMD', '通用', 7, 1, 1, 1, 7, 3, 0, NULL, 5, 2, 1, 5, '个', 67.00);
INSERT INTO `replacement_part` VALUES (74, 'S-080', 'A2-11B', '红色指示灯', 'XB2-BVM4LC', 'Schneider', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 5, 2, 1, 5, '个', 14.03);
INSERT INTO `replacement_part` VALUES (75, 'S-081', 'A2-12B', '绿色指示灯', 'XB2-BVM3LC', 'Schneider', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 5, 2, 1, 7, '个', 14.03);
INSERT INTO `replacement_part` VALUES (76, 'S-082', 'A2-13B', '黄色指示灯', 'XB2BW35B1C', 'Schneider', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 10, 3, 3, 4, '个', 14.03);
INSERT INTO `replacement_part` VALUES (77, 'S-084', 'A2-15B', '加热管', '非标', '非标', 'KBC热熔机', 7, 1, 1, 1, 7, 3, 0, NULL, 8, 2, 1, 5, '个', 0.00);
INSERT INTO `replacement_part` VALUES (78, 'S-085', 'A2-16B', '加热管', '12*50   220V   200W', '春兰电热', '热缩管小烤箱', 7, 1, 1, 1, 7, 3, 0, NULL, 6, 1, 1, 2, '根', 0.00);
INSERT INTO `replacement_part` VALUES (79, 'S-086', 'A2-17B', '加热管', '220V  100W', NULL, 'KBC热熔机', 7, 4, 1, 1, 7, 4, 0, NULL, 10, 4, 4, 12, '个', 0.00);
INSERT INTO `replacement_part` VALUES (80, 'S-087', 'A2-18B', '时间继电器', '24V H3Y-4C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 4, 1, 6, '套', NULL);
INSERT INTO `replacement_part` VALUES (81, 'S-088', 'A2-19B', 'PLC电池', 'ER17330', 'MITSUBISHI', 'PLC', 7, 1, 1, 1, 1, 2, 0, NULL, 3, 1, 1, 2, '个', NULL);
INSERT INTO `replacement_part` VALUES (82, 'S-090', 'A2-21B', '空气开关带漏电头', '16A', 'Schneider', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 5, 2, 1, 2, '套', 2.00);
INSERT INTO `replacement_part` VALUES (83, 'S-091', 'A2-22B', '空气开关', '63A', 'Schneider', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (84, 'S-092', 'A2-23B', '空气开关', '40A', 'Schneider', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 5, 2, 1, 0, '个', 0.00);
INSERT INTO `replacement_part` VALUES (85, 'S-093', 'A2-24B', '空气开关带漏电头', '6A', 'Schneider', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 5, 2, 1, 5, '套', 0.00);
INSERT INTO `replacement_part` VALUES (86, 'S-094', 'A2-25B', '漏电头', '2P', NULL, NULL, 7, 1, 1, 1, 1, 2, 0, NULL, 3, 2, 1, 0, '套', 1.00);
INSERT INTO `replacement_part` VALUES (87, 'S-095', 'A2-26B', '漏电头', '4P', 'Schneider', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 5, 2, 1, 0, '个', 0.00);
INSERT INTO `replacement_part` VALUES (88, 'S-097', 'A3-01A', '数字电压表', 'JL5135', '峻岭', '综合测试台', 4, 4, 1, 4, 1, 3, 0, NULL, 2, 1, 1, 2, '个', 148.00);
INSERT INTO `replacement_part` VALUES (89, 'S-098', 'A3-02A', '数字电流表', 'JL5135C', '峻岭', '综合测试台', 4, 4, 1, 4, 1, 3, 0, NULL, 2, 1, 1, 2, '个', 148.00);
INSERT INTO `replacement_part` VALUES (90, 'S-099', 'A3-03A', '三相智能数显仪表', 'YN194U-9K4', '永诺电气', '综合测试台', 4, 4, 1, 4, 1, 3, 0, NULL, 3, 2, 1, 3, '个', 269.00);
INSERT INTO `replacement_part` VALUES (91, 'S-100', 'A3-04A', '夹钳', '非标', '山东高机', '数控冲剪机', 7, 10, 7, 4, 7, 7, 1, NULL, 3, 2, 1, 3, '副', 340.00);
INSERT INTO `replacement_part` VALUES (92, 'S-102', 'A3-06A', '联轴器', '非标', '高机', '数控冲剪机', 4, 7, 7, 4, 1, 5, 0, NULL, 2, 1, 1, 1, '个', 200.00);
INSERT INTO `replacement_part` VALUES (93, 'S-103', 'A3-07A', '状态指示灯', 'XB2-BVM4LC', 'Schneider', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 10, 3, 2, 4, '个', 22.00);
INSERT INTO `replacement_part` VALUES (94, 'S-104', 'A3-08A', '限位开关（机械）', 'ME-8108', 'MJE', '通用', 7, 1, 7, 4, 1, 4, 0, NULL, 5, 3, 2, 9, '个', 24.57);
INSERT INTO `replacement_part` VALUES (95, 'S-105', 'A3-09A', '接近开关（磁性）', 'D-A73', 'SMC', '通用', 7, 1, 7, 4, 1, 4, 0, NULL, 5, 2, 1, 4, '个', 70.00);
INSERT INTO `replacement_part` VALUES (96, 'S-106', 'A3-10A', '接近开关（电感）', 'XS8S173NAL2C', 'Schneider TE', '通用', 7, 1, 7, 4, 1, 4, 0, NULL, 5, 2, 1, 5, '个', 15.15);
INSERT INTO `replacement_part` VALUES (97, 'S-107', 'A3-11A', '接近开关（机械）', 'ZCMD21C12', 'Schneider', '铜排加工设备', 7, 1, 7, 4, 1, 4, 0, NULL, 4, 2, 1, 3, '个', 34.00);
INSERT INTO `replacement_part` VALUES (98, 'S-108', 'A3-12A', '滑轨', 'YG-D818B', 'YAGU', '仓库门', 7, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 2, '套', 47.00);
INSERT INTO `replacement_part` VALUES (99, 'S-109', 'A3-13A', '中间继电器', 'RXM2AB2JD  24DC', 'Schneider', '通用', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 2, 1, 18, '个', 11.02);
INSERT INTO `replacement_part` VALUES (100, 'S-110', 'A3-14A', '中间继电器', 'RXM2AB2P7  230AC', 'Schneider', '通用', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 2, 1, 17, '个', 11.02);
INSERT INTO `replacement_part` VALUES (101, 'S-111', 'A3-15A', '辅助触头', 'LADN11C(1NO+1NC)', 'Schneider', '通用', 7, 1, 1, 4, 7, 4, 0, NULL, 5, 3, 2, 10, '个', 21.00);
INSERT INTO `replacement_part` VALUES (102, 'S-112', 'A3-16A', '中间继电器', 'RXM4AB2JD  12DC', 'Schneider', '通用', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 2, 1, 7, '个', 24.00);
INSERT INTO `replacement_part` VALUES (103, 'S-113', 'A3-17A', '中间继电器', 'RXM4AB1BD  24VDC', 'Schneider', '通用', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 3, 2, 11, '个', 24.00);
INSERT INTO `replacement_part` VALUES (104, 'S-114', 'A3-18A', '中间继电器', 'RXM4AB2P7  230AC', 'Schneider', '通用', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 3, 2, 7, '个', 24.00);
INSERT INTO `replacement_part` VALUES (105, 'S-115', 'A3-19A', '平头金属按钮   红', '12DCXB2BA31C', 'Schneider', '通用', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 3, 2, 7, '套', 11.02);
INSERT INTO `replacement_part` VALUES (106, 'S-116', 'A3-20A', '平头金属按钮   绿', 'XB2-BA3C', 'Schneider', '通用', 7, 1, 1, 4, 7, 4, 0, NULL, 5, 2, 1, 3, '个', 11.02);
INSERT INTO `replacement_part` VALUES (107, 'S-117', 'A3-21A', '83359', 'Castor LR 604 NPPU(C)', NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 3, 2, 1, 2, '个', NULL);
INSERT INTO `replacement_part` VALUES (108, 'S-118', 'A3-22A', '64086', 'Inductive sensorPNP NO L36mm D6.5mm Sn2mm', NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 3, 2, 1, 3, '个', NULL);
INSERT INTO `replacement_part` VALUES (109, 'S-119', 'A3-23A', '37634', 'Guide rod', NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 3, 2, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (110, 'S-120', 'A3-24A', '24655', 'Switch microswitch V-105-1C5', NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 3, 2, 1, 2, '个', NULL);
INSERT INTO `replacement_part` VALUES (111, 'S-121', 'A3-25A', '校正爪件', '0303052/0303053', NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 3, 2, 1, 1, '套', NULL);
INSERT INTO `replacement_part` VALUES (112, 'S-122', 'A3-26A', '气管接头组件', NULL, NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 3, 2, 1, 1, '套', NULL);
INSERT INTO `replacement_part` VALUES (113, 'S-123', 'A3-27A', '密封橡胶组件', NULL, NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 3, 2, 1, 1, '套', NULL);
INSERT INTO `replacement_part` VALUES (114, 'S-127', 'A3-01B', '辅助开关', 'ZB2-BE101C(NO)', 'Schneider', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 15, 5, 2, 16, '个', 21.00);
INSERT INTO `replacement_part` VALUES (115, 'S-128', 'A3-02B', '辅助开关', 'ZB2-BE102C(NC)', 'Schneider', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 15, 5, 2, 16, '个', 21.00);
INSERT INTO `replacement_part` VALUES (116, 'S-129', 'A3-03B', '辅助触头', 'LADN02C(2NC)', 'Schneider', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 15, 5, 2, 10, '个', 21.00);
INSERT INTO `replacement_part` VALUES (117, 'S-130', 'A3-04B', '电磁阀', 'SLG-2.5', '三力信', '铜排加工设备 ', 7, 1, 7, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (118, 'S-132', 'A3-06B', '电磁阀', 'SDHE-0711  10S', 'ATOS', '铜排加工设备 ', 7, 1, 7, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (119, 'S-133', 'A3-07B', '高强度模具弹簧', NULL, NULL, 'KS 60T冲床', 1, 1, 7, 1, 7, 3, 0, NULL, 6, 3, 2, 6, '个', 0.00);
INSERT INTO `replacement_part` VALUES (120, 'S-134', 'A3-08B', '压力继电器', 'SER JCS-02H', 'MPM', '数控冲剪机', 7, 1, 7, 1, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 120.00);
INSERT INTO `replacement_part` VALUES (121, 'S-135', 'A3-09B', '冷却风扇', 'DP200AT', 'SUMOM', '铜排加工设备', 7, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (122, 'S-136', 'A3-10B', '接地胶条', NULL, NULL, '电动叉车', 7, 1, 1, 1, 1, 2, 0, NULL, 5, 2, 1, 4, '条', 0.00);
INSERT INTO `replacement_part` VALUES (123, 'S-137', 'A3-11B', '时间继电器', 'AB-WK-JH', 'ZLAB', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (124, 'S-138', 'A3-12B', '半圆头形键', '非标', '非标', 'KS', 7, 7, 1, 1, 7, 4, 0, NULL, 8, 3, 2, 7, '个', 0.00);
INSERT INTO `replacement_part` VALUES (125, 'S-139', 'A3-13B', '锥形键', '非标', '非标', 'KS', 7, 1, 1, 1, 7, 3, 0, NULL, 8, 2, 1, 4, '个', 7.00);
INSERT INTO `replacement_part` VALUES (126, 'S-140', 'A3-14B', '楔形键', '非标', '非标', 'KS', 7, 1, 1, 1, 7, 3, 0, NULL, 8, 3, 2, 8, '个', 7.00);
INSERT INTO `replacement_part` VALUES (127, 'S-142', 'A3-16B', '接触器', 'CAD32', 'SCHNEIDER', '通用', 7, 1, 1, 1, 7, 3, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (128, 'S-143', 'A3-17B', 'GV2电机保护断路器', 'GV2PM系列', 'Schneider', '通用', 7, 1, 7, 1, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 78.32);
INSERT INTO `replacement_part` VALUES (129, 'S-144', 'A3-18B', 'LC1-E接触器', 'LC1E3210Q5N', 'Schneider', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 3, 2, 1, 5, '个', 46.40);
INSERT INTO `replacement_part` VALUES (130, 'S-145', 'A3-19B', '接触器', 'LC1D12M7C  AC220 12A', 'Schneider', '通用', 7, 4, 1, 1, 1, 3, 0, NULL, 3, 2, 1, 3, '个', 62.38);
INSERT INTO `replacement_part` VALUES (131, 'S-146', 'A3-20B', '继电器座', 'RXZE2M114', 'Schneider', '通用', 7, 1, 1, 1, 1, 2, 0, NULL, 6, 3, 2, 17, '个', 4.64);
INSERT INTO `replacement_part` VALUES (132, 'S-147', 'A3-21B', '日立电批线路板', '91920170020', 'HITACHI', '日立电批', 7, 1, 1, 1, 7, 3, 0, NULL, 10, 4, 2, 8, '个', 168.00);
INSERT INTO `replacement_part` VALUES (133, 'S-148', 'A3-22B', '微动开关', '3609202762', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 15, 6, 4, 12, '个', 124.00);
INSERT INTO `replacement_part` VALUES (134, 'S-149', 'A3-23B', '弹簧扣圈', '3600224006', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 15, 4, 3, 21, '个', 6.43);
INSERT INTO `replacement_part` VALUES (135, 'S-150', 'A3-24B', '球体', '1903230003', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 30, 6, 4, 66, '个', 3.72);
INSERT INTO `replacement_part` VALUES (136, 'S-151', 'A3-25B', '压缩弹簧', '3604610011', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 30, 5, 4, 21, '个', 7.44);
INSERT INTO `replacement_part` VALUES (137, 'S-152', 'A3-26B', '转换块', '3601923022', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 20, 6, 4, 37, '个', 16.00);
INSERT INTO `replacement_part` VALUES (138, 'S-153', 'A3-27B', '挡圈', '3600202020', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 30, 6, 4, 23, '个', 28.83);
INSERT INTO `replacement_part` VALUES (139, 'S-154', 'A4-01', '齿轮箱', '3607030490', 'BOSCH', '电动扭矩', 7, 1, 1, 4, 7, 4, 0, NULL, 15, 3, 2, 8, '个', 251.10);
INSERT INTO `replacement_part` VALUES (140, 'S-155', 'A4-02', '齿轮箱', '3607030469', 'BOSCH', '电动扭矩', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 3, 2, 13, '个', 372.00);
INSERT INTO `replacement_part` VALUES (141, 'S-156', 'A4-03', '电源线', 'OP-007', NULL, 'KOMAX', 1, 1, 1, 1, 1, 1, 0, NULL, 2, 2, 1, 1, '条', NULL);
INSERT INTO `replacement_part` VALUES (142, 'S-157', 'A4-04', '缓冲垫组件', '0037220/0017038', NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 2, 2, 1, 1, '套', NULL);
INSERT INTO `replacement_part` VALUES (143, 'S-158', 'A4-05', '防尘套', '73424', NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 2, 2, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (144, 'S-159', 'A4-06', '夹紧套筒', '3600499022', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 30, 6, 4, 30, '个', 82.80);
INSERT INTO `replacement_part` VALUES (145, 'S-160', 'A4-07', '压缩弹簧', '3604611022', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 20, 6, 4, 23, '个', 11.16);
INSERT INTO `replacement_part` VALUES (146, 'S-161', 'A4-08', '正反转开关拨块', '3601099003', 'BOSCH', '电动扭矩', 7, 4, 1, 1, 7, 4, 0, NULL, 10, 6, 4, 24, '个', 6.13);
INSERT INTO `replacement_part` VALUES (147, 'S-162', 'A4-09', '打印机夹持器', '3476A046（AB）', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 5, 2, 7, '个', NULL);
INSERT INTO `replacement_part` VALUES (148, 'S-157', 'B1-01', '锯片', 'BT/011', 'FUJIRESAW', 'KS铜巴锯切机', 4, 10, 7, 1, 7, 6, 1, NULL, 6, 2, 2, 5, '片', 640.00);
INSERT INTO `replacement_part` VALUES (149, 'S-158', 'B1-02', '锯片', '849703', NULL, '金属锯切机', 10, 10, 7, 1, 7, 7, 1, NULL, 2, 1, 1, 2, '片', 0.00);
INSERT INTO `replacement_part` VALUES (150, 'S-159', 'B1-03', '锯片', '120齿', 'BOSCH', 'KS铜巴锯切机', 4, 10, 1, 1, 7, 4, 0, NULL, 3, 2, 1, 1, '片', 0.00);
INSERT INTO `replacement_part` VALUES (151, 'S-160', 'B1-04', '脚踏开关', 'XPE R310', 'Schneider', '一次剥线机', 4, 4, 7, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 608.00);
INSERT INTO `replacement_part` VALUES (152, 'S-161', 'B1-05', '弹簧气管', '3M    ', '正密', '通用', 4, 1, 1, 1, 7, 3, 0, NULL, 6, 3, 2, 8, '根', 0.00);
INSERT INTO `replacement_part` VALUES (153, 'S-162', 'B1-06', '模具复位簧', '线径5MM', NULL, 'KS', 7, 1, 7, 1, 7, 5, 0, NULL, 4, 2, 1, 4, '个', 0.00);
INSERT INTO `replacement_part` VALUES (154, 'S-163', 'B1-07', '电磁锁', 'XCSE7311', 'SCHNEIDER', 'LT', 7, 1, 7, 1, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (155, 'S-164', 'B1-08', '导向套弹簧', '2.5*16*105', '高机', '数控冲剪机', 4, 1, 7, 1, 1, 3, 0, NULL, 32, 12, 12, 40, '个', 0.00);
INSERT INTO `replacement_part` VALUES (156, 'S-165', 'B1-09', '棘轮式收紧器', '非标', '非标', '翻转台', 7, 1, 1, 1, 7, 3, 0, NULL, 6, 2, 1, 4, '条', 0.00);
INSERT INTO `replacement_part` VALUES (157, 'S-166', 'B1-10', '小型工频轴流风机', '200FZY-D', '富盛电讯', '铜排加工设备 ', 7, 1, 1, 1, 1, 2, 0, NULL, 6, 2, 1, 5, '个', 0.00);
INSERT INTO `replacement_part` VALUES (158, 'S-167', 'B1-13', 'AEH料盘', NULL, 'KOMAX', 'KOMAX', 4, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 2, '个', NULL);
INSERT INTO `replacement_part` VALUES (159, 'S-168', 'B1-14', '三角皮带', 'B-762LI', '盖茨', 'KS铜巴锯切机', 4, 10, 1, 1, 7, 4, 0, NULL, 3, 2, 1, 13, '条', 59.00);
INSERT INTO `replacement_part` VALUES (160, 'S-170', 'B2-01A', '模具复位簧', '扁平线径3*2', NULL, 'LT电缆成型机', 7, 4, 1, 4, 1, 4, 0, NULL, 10, 4, 2, 8, '个', 0.00);
INSERT INTO `replacement_part` VALUES (161, 'S-171', 'B2-02A', '熔管', '32A', '华通', '通用', 1, 1, 1, 4, 7, 3, 0, NULL, 100, 10, 5, 20, '个', 2.77);
INSERT INTO `replacement_part` VALUES (162, 'S-172', 'B2-03A', '熔管', '16A', '华通', '通用', 1, 1, 1, 4, 7, 3, 0, NULL, 100, 10, 5, 19, '个', 2.00);
INSERT INTO `replacement_part` VALUES (163, 'S-173', 'B2-04A', '10MM  Y形三通', '10MM', 'CHPISCO', '通用', 4, 1, 1, 1, 7, 3, 0, NULL, 20, 5, 3, 22, '个', 13.50);
INSERT INTO `replacement_part` VALUES (164, 'S-174', 'B2-05A', '12MM  Y形三通', 'KQ2U12-00A', 'SMC', '通用', 4, 1, 1, 1, 7, 3, 0, NULL, 4, 2, 1, 18, '个', 34.00);
INSERT INTO `replacement_part` VALUES (165, 'S-175', 'B2-06A', '8MM 直角弯头', 'KQ2L08-00A', 'SMC', '通用', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 5, 3, 11, '个', 19.00);
INSERT INTO `replacement_part` VALUES (166, 'S-176', 'B2-07A', 'KS成型机引导头', NULL, NULL, 'KS', 7, 4, 7, 1, 1, 4, 0, NULL, 2, 1, 1, 1, '套', 0.00);
INSERT INTO `replacement_part` VALUES (167, 'S-177', 'B2-08A', '12MM转16MM', '12MM-16MM', 'EASUN', '通用', 4, 7, 1, 4, 7, 4, 0, NULL, 10, 5, 3, 42, '个', 6.20);
INSERT INTO `replacement_part` VALUES (168, 'S-178', 'B2-09A', '10MM气缸接头', '10MM带调压', 'SMC', '通用', 4, 7, 1, 4, 7, 4, 0, NULL, 10, 5, 3, 5, '个', 98.00);
INSERT INTO `replacement_part` VALUES (169, 'S-179', 'B2-10A', '4MM气管快接', '4MM', 'SMC', '通用', 4, 7, 1, 4, 7, 4, 0, NULL, 10, 5, 3, 15, '个', 0.00);
INSERT INTO `replacement_part` VALUES (170, 'S-180', 'B2-11A', '6MM气缸快接', '6MM', 'SMC', '通用', 4, 7, 1, 4, 7, 4, 0, NULL, 10, 1, 3, 10, '个', NULL);
INSERT INTO `replacement_part` VALUES (171, 'S-181', 'B2-12A', '4MM气缸快接', '4MM', 'SMC', '通用', 4, 7, 1, 4, 7, 4, 0, NULL, 10, 5, 3, 10, '个', NULL);
INSERT INTO `replacement_part` VALUES (172, 'S-182', 'B2-13A', '4MM三通快接', '4MM', 'SMC', '通用', 4, 7, 1, 4, 7, 4, 0, NULL, 10, 5, 3, 20, '个', NULL);
INSERT INTO `replacement_part` VALUES (173, 'S-183', 'B2-14A', '6MM L形气缸快接', '6MM', 'SMC', '通用', 4, 7, 1, 4, 7, 4, 0, NULL, 10, 5, 3, 18, '个', NULL);
INSERT INTO `replacement_part` VALUES (174, 'S-198', 'B2-02B', '陶瓷环', 'C2812M11', '大族激光', '激光开孔机', 7, 1, 7, 4, 7, 5, 1, NULL, 2, 1, 1, 5, '个', 0.00);
INSERT INTO `replacement_part` VALUES (175, 'S-199', 'B2-03B', '电磁锁', 'XCSA702', 'SCHNEIDER', 'LT设备', 7, 1, 1, 4, 1, 3, 0, NULL, 2, 1, 1, 1, '个', 0.00);
INSERT INTO `replacement_part` VALUES (176, 'S-200', 'B2-04B', '气缸', 'CDQ2B25-20DMZ', 'SMC', 'LT设备', 7, 1, 1, 4, 1, 3, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (177, 'S-201', 'B2-05B', '8MM直通调压阀', '8MM', 'AKS', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 4, 2, 1, 10, '个', 38.00);
INSERT INTO `replacement_part` VALUES (178, 'S-202', 'B2-06B', '调压阀', '8MM', 'SMC', '通用', 7, 1, 1, 4, 7, 4, 0, NULL, 10, 5, 3, 21, '个', 80.00);
INSERT INTO `replacement_part` VALUES (179, 'S-203', 'B2-07B', '快速接头', '29232', 'SATA', '通用', 7, 1, 1, 4, 1, 3, 0, NULL, 4, 2, 1, 4, '个', 76.00);
INSERT INTO `replacement_part` VALUES (180, 'S-204', 'B2-08B', '滤芯', 'YAG500', '总丰过滤', '激光开孔机', 7, 4, 7, 4, 1, 5, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (181, 'S-205', 'B2-09B', '激光灯管', 'NL7284', 'UK', '激光开孔机', 10, 10, 7, 4, 7, 8, 1, NULL, 4, 2, 1, 6, '支', 0.00);
INSERT INTO `replacement_part` VALUES (182, 'S-206', 'B2-10B', 'L型调压阀', '6MM', 'SMC', '激光开孔机', 7, 1, 1, 1, 7, 3, 0, NULL, 6, 2, 1, 23, '个', 9.00);
INSERT INTO `replacement_part` VALUES (183, 'S-207', 'B2-11B', '模具复位簧', '扁平线径5*2', NULL, 'KS', 4, 4, 1, 4, 7, 4, 0, NULL, 6, 2, 1, 6, '个', 0.00);
INSERT INTO `replacement_part` VALUES (184, 'S-208', 'B2-12B', 'KS超声波母模', '121*112*54MM', NULL, 'KS', 7, 1, 7, 4, 1, 4, 0, NULL, 2, 1, 1, 1, '个', 0.00);
INSERT INTO `replacement_part` VALUES (185, 'S-209', 'B2-13B', 'KS超声波母模', '51*85*126MM', NULL, NULL, 7, 7, 7, 4, 1, 5, 1, NULL, 2, 1, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (186, 'S-210', 'B2-14B', '公气管接头带丝口', ' 1/4', 'FESTO', '通用', 4, 1, 1, 1, 7, 3, 0, NULL, 30, 8, 5, 24, '个', 0.00);
INSERT INTO `replacement_part` VALUES (187, 'S-224', 'B3-01A', '6MM直接', '6MM', 'SMC', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 25, '个', 9.00);
INSERT INTO `replacement_part` VALUES (188, 'S-225', 'B3-02A', '8MM直接', '8MM', 'SMC', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 30, '个', 80.00);
INSERT INTO `replacement_part` VALUES (189, 'S-226', 'B3-03A', '10MM直接', '10MM', 'SMC', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 27, '个', 13.50);
INSERT INTO `replacement_part` VALUES (190, 'S-227', 'B3-04A', '12MM直接', '12MM', 'SMC/山耐斯', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 20, '个', 15.50);
INSERT INTO `replacement_part` VALUES (191, 'S-228', 'B3-05A', '6MM转8MM', '6MM-8MM', 'SMC', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 43, '个', 9.00);
INSERT INTO `replacement_part` VALUES (192, 'S-229', 'B3-06A', '8MM转10MM', '8MM-10MM', 'SMC', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 30, '个', 14.00);
INSERT INTO `replacement_part` VALUES (193, 'S-230', 'B3-07A', '10MM转12MM', '10MM-12MM', 'SMC', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 10, '个', 15.50);
INSERT INTO `replacement_part` VALUES (194, 'S-231', 'B3-08A', '6MM调压气阀', '6MM', 'LSAIAH', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 10, 5, 3, 8, '个', 9.00);
INSERT INTO `replacement_part` VALUES (195, 'S-232', 'B3-09A', '8MM转角快接', '8MM  L型', 'YNT', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 20, '个', 8.00);
INSERT INTO `replacement_part` VALUES (196, 'S-233', 'B3-10A', '8MM三通', '8MM', 'YNT', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 12, '个', 80.00);
INSERT INTO `replacement_part` VALUES (197, 'S-234', 'B3-11A', '15度全反镜片', NULL, 'INFRARED', '激光开孔机', 10, 10, 7, 4, 7, 8, 1, NULL, 3, 2, 1, 3, '片', 0.00);
INSERT INTO `replacement_part` VALUES (198, 'S-235', 'B3-12A', '平面反光镜片', NULL, 'INFRARED', '激光开孔机', 10, 10, 7, 4, 7, 8, 1, NULL, 2, 1, 1, 8, '片', 0.00);
INSERT INTO `replacement_part` VALUES (199, 'S-236', 'B3-13A', '前置保护镜片', NULL, 'INFRARED', '激光开孔机', 10, 10, 7, 4, 7, 8, 1, NULL, 2, 1, 1, 6, '片', 0.00);
INSERT INTO `replacement_part` VALUES (200, 'S-237', 'B3-14A', '球面聚焦镜片', NULL, 'INFRARED', '激光开孔机', 10, 10, 7, 4, 7, 8, 1, NULL, 2, 1, 1, 2, '片', 0.00);
INSERT INTO `replacement_part` VALUES (201, 'S-238', 'B3-15A', '后置保护镜片', NULL, 'INFRARED', '激光开孔机', 10, 10, 7, 4, 7, 8, 1, NULL, 10, 1, 1, 2, '片', 0.00);
INSERT INTO `replacement_part` VALUES (202, 'S-239', 'B3-16A', '相序保护继电器', 'HHD5-E(XJ5)', 'C-LIN', '热缩管烤箱', 4, 4, 7, 1, 1, 3, 0, NULL, 2, 2, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (203, 'S-240', 'B3-17A', '8MM气缸接头（带调压）', '8MM', 'SMC', '通用', 4, 4, 7, 1, 7, 5, 0, NULL, 10, 5, 3, 40, '个', NULL);
INSERT INTO `replacement_part` VALUES (204, NULL, 'B3-18A', '打印头', '1H1-4252-000', '凯普丽标', '丽标打印机', 4, 4, 7, 1, 7, 5, 0, NULL, 3, 1, 1, 0, '个', 600.00);
INSERT INTO `replacement_part` VALUES (205, 'S-243', 'B3-20A', '气缸接头', '6MM', 'SMC', '通用', 4, 4, 7, 1, 7, 5, 0, NULL, 3, 1, 1, 1, '个', 9.00);
INSERT INTO `replacement_part` VALUES (206, 'S-254', 'B3-01B', '10MM三通', '10MM', 'CHPISCO', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 15, '个', 13.50);
INSERT INTO `replacement_part` VALUES (207, 'S-255', 'B3-02B', '12MM三通', '12MM', 'DESTO', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 16, '个', 15.50);
INSERT INTO `replacement_part` VALUES (208, 'S-256', 'B3-03B', '12MM转角直接', '12MM', 'CHPISCO', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 22, '个', 15.50);
INSERT INTO `replacement_part` VALUES (209, 'S-257', 'B3-04B', '三通母插接头', NULL, NULL, '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 5, 2, 1, 4, '套', 0.00);
INSERT INTO `replacement_part` VALUES (210, 'S-258', 'B3-05B', '自锁式公气管接头', NULL, 'SABO', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 6, '个', 0.00);
INSERT INTO `replacement_part` VALUES (211, 'S-259', 'B3-06B', '母气管插头', NULL, 'SABO', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 8, '个', 0.00);
INSERT INTO `replacement_part` VALUES (212, 'S-260', 'B3-07B', '母气管插头带丝口', '29042', 'SATA', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 10, '个', 30.00);
INSERT INTO `replacement_part` VALUES (213, 'S-261', 'B3-08B', '日式外牙公接头', '29422', 'SATA', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 27, '个', 7.00);
INSERT INTO `replacement_part` VALUES (214, 'S-262', 'B3-09B', '公气管接头', NULL, NULL, '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 20, 5, 3, 18, '个', 0.00);
INSERT INTO `replacement_part` VALUES (215, 'S-263', 'B3-10B', '8MM直接带调压', '8MM', 'ATC', '通用', 4, 1, 1, 7, 7, 4, 0, NULL, 10, 5, 3, 22, '个', 80.00);
INSERT INTO `replacement_part` VALUES (216, 'S-264', 'B3-11B', '数据线', '3M  36310', '3M', '激光开孔机', 4, 4, 7, 1, 1, 3, 0, NULL, 2, 1, 1, 1, '条', 32.00);
INSERT INTO `replacement_part` VALUES (217, 'S-265', 'B3-12B', '光电接近开关', '801671', '倍加福', '激光开孔机', 4, 4, 7, 1, 1, 3, 0, NULL, 5, 1, 3, 5, '条', 104.00);
INSERT INTO `replacement_part` VALUES (218, 'S-265', 'B3-13B', '超声波焊机铝块', '非标', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 1, '个', 212.00);
INSERT INTO `replacement_part` VALUES (219, 'S-267', 'B3-14B', '气缸接头10MM', '10MM', NULL, NULL, 4, 1, 1, 1, 7, 3, 0, NULL, 5, 1, 2, 11, '个', NULL);
INSERT INTO `replacement_part` VALUES (220, 'S-269', 'B3-16B', '气嘴', '非标', '非标', '激光开孔机', 4, 4, 7, 1, 7, 5, 0, NULL, 10, 4, 3, 5, '个', 0.00);
INSERT INTO `replacement_part` VALUES (221, 'S-271', 'B3-18B', '模具压件', '非标', '非标', 'LT设备', 7, 4, 1, 1, 7, 4, 0, NULL, 8, 4, 2, 4, '个', 0.00);
INSERT INTO `replacement_part` VALUES (222, 'S-273', 'B3-20B', '三通', '4MM', 'TPM', '通用', 7, 1, 1, 4, 7, 4, 0, NULL, 5, 2, 1, 3, '个', 0.00);
INSERT INTO `replacement_part` VALUES (223, 'S-284', 'C1-01', '剪切机上剪', '180*80*8', '高机', '数控冲剪机', 4, 7, 7, 4, 1, 5, 0, NULL, 4, 3, 2, 4, '片', 0.00);
INSERT INTO `replacement_part` VALUES (224, 'S-285', 'C1-02', '剪切机下剪', '180*49.1*22', '高机', '数控冲剪机', 4, 7, 7, 4, 1, 5, 0, NULL, 4, 2, 2, 1, '片', 0.00);
INSERT INTO `replacement_part` VALUES (225, 'S-286', 'C1-03', ' ', '软性橡胶', '高机', '数控冲剪机', 4, 7, 7, 4, 1, 5, 0, NULL, 6, 3, 2, 5, '个', 0.00);
INSERT INTO `replacement_part` VALUES (226, 'S-287', 'C1-04', '充电座', 'STB3578', 'SYMBOL', NULL, 4, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 4, '台', 0.00);
INSERT INTO `replacement_part` VALUES (227, 'S-288', 'C1-05', '链条驱动滚轮', '非标', '广州秦朝模具', 'KS', 4, 7, 1, 4, 1, 3, 0, NULL, 3, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (228, 'S-289', 'C1-06', '冲孔模具套', '非标', '高机', '数控冲剪机', 4, 7, 7, 4, 1, 5, 0, NULL, 5, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (229, 'S-290', 'C1-07', '冲孔套弹簧', '118', '高机', '数控冲剪机', 4, 7, 7, 4, 1, 5, 0, NULL, 10, 3, 3, 13, '个', 0.00);
INSERT INTO `replacement_part` VALUES (230, 'S-291', 'C1-08', '扫码枪', 'LS3578', 'SYMBOL', NULL, 4, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 4, '台', 0.00);
INSERT INTO `replacement_part` VALUES (231, 'S-292', 'C1-09', '剪切复位辅助弹簧', '非标', '高机', '数控冲剪机', 4, 7, 7, 4, 7, 6, 1, NULL, 50, 32, 32, 63, '个', 0.00);
INSERT INTO `replacement_part` VALUES (232, 'S-293', 'C1-10', '剪切刀复位弹簧', '非标', '高机', '数控冲剪机', 4, 7, 7, 4, 7, 6, 1, NULL, 5, 2, 1, 4, '个', 0.00);
INSERT INTO `replacement_part` VALUES (233, 'S-295', 'C1-12', '光电开关', 'SS2/AN-0A', 'DIETL', '框架包装机', 4, 7, 7, 1, 1, 4, 0, NULL, 5, 2, 1, 4, '个', 50.00);
INSERT INTO `replacement_part` VALUES (234, 'S-296', 'C1-13', '切割锯片', '41-A/F30Q6BF', NULL, NULL, 4, 7, 7, 1, 1, 4, 0, NULL, 2, 1, 1, 4, '片', NULL);
INSERT INTO `replacement_part` VALUES (235, 'S-2967', 'C1-14', '油泵电机', '非标', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, '个', 3800.00);
INSERT INTO `replacement_part` VALUES (236, 'S-298', 'C1-15', '减速电机', '18505589', NULL, NULL, 4, 7, 7, 1, 1, 4, 0, NULL, 2, 1, 1, 1, '台', NULL);
INSERT INTO `replacement_part` VALUES (237, 'S-299', 'C2-01A', '过滤棉', '华东', NULL, NULL, 4, 1, 7, 1, 7, 4, 0, NULL, 2, 1, 1, 8, '片', NULL);
INSERT INTO `replacement_part` VALUES (238, 'S-300', 'C2-02A', '过滤棉', 'APT', NULL, NULL, 4, 1, 7, 1, 7, 4, 0, NULL, 2, 1, 1, 4, '片', 0.00);
INSERT INTO `replacement_part` VALUES (239, 'S-302', 'C2-04A', '接近开关', 'D5A-3200', 'OMRON', 'LT设备', 7, 4, 1, 1, 1, 3, 0, NULL, 3, 2, 1, 0, '套', 89.00);
INSERT INTO `replacement_part` VALUES (240, 'S-304', 'C2-06A', '模具冲头', '17CM', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 5, 3, 2, 6, '套', 380.00);
INSERT INTO `replacement_part` VALUES (241, 'S-305', 'C2-07A', '模具冲头', '13CM', '高机', '数控冲剪机', 7, 4, 1, 4, 7, 5, 0, NULL, 5, 3, 2, 5, '套', 380.00);
INSERT INTO `replacement_part` VALUES (242, 'S-308', 'C2-10A', '电磁锁安装板', NULL, '广州秦朝模具', 'LT设备', 7, 1, 1, 1, 1, 2, 0, NULL, 3, 2, 1, 3, '件', 0.00);
INSERT INTO `replacement_part` VALUES (243, 'S-310', 'C2-12A', '切割锯齿轮', '60MM', '非标加工', '金属切割锯', 7, 4, 1, 7, 7, 5, 1, NULL, 2, 1, 1, 3, '件', 0.00);
INSERT INTO `replacement_part` VALUES (244, 'S-313', 'C2-15A', '模具冲头', '非标', '广州秦朝模具', 'LT设备', 4, 7, 7, 1, 1, 4, 0, NULL, 10, 4, 3, 4, '个', 0.00);
INSERT INTO `replacement_part` VALUES (245, 'S-316', 'C2-18A', '模具复位簧', '扁平线径3*1', '广州秦朝模具', 'LT设备', 7, 1, 7, 1, 1, 4, 0, NULL, 10, 4, 3, 6, '个', 0.00);
INSERT INTO `replacement_part` VALUES (246, 'S-318', 'C2-20A', 'KS翻转链条', '08A-1X 120节', NULL, 'KS', 4, 7, 7, 1, 1, 4, 0, NULL, 5, 2, 1, 3, '条', 0.00);
INSERT INTO `replacement_part` VALUES (247, 'S-320', 'C2-01B', '皮带280XL窄带', '280XL', 'XIANGHONG', '框架包装机', 4, 7, 1, 7, 7, 5, 1, NULL, 10, 5, 3, 12, '条', 0.00);
INSERT INTO `replacement_part` VALUES (248, 'S-321', 'C2-02B', '皮带270XL窄带', '270XL', 'XIANGHONG', '框架包装机', 4, 7, 1, 7, 7, 5, 1, NULL, 10, 4, 3, 9, '条', 0.00);
INSERT INTO `replacement_part` VALUES (249, 'S-322', 'C2-03B', '皮带280XL宽带', '280XL', 'XIANGHONG', '框架包装机', 4, 7, 1, 7, 7, 5, 1, NULL, 10, 4, 3, 8, '条', 0.00);
INSERT INTO `replacement_part` VALUES (250, 'S-323', 'C2-04B', '皮带270XL宽带', '270XL', 'XIANGHONG', '框架包装机', 4, 7, 1, 7, 7, 5, 1, NULL, 10, 5, 3, 12, '条', 0.00);
INSERT INTO `replacement_part` VALUES (251, 'S-324', 'C2-05B', '切刀缓冲条', '耐高温', NULL, '框架包装机', 4, 7, 1, 7, 1, 4, 0, NULL, 2, 1, 1, 2, '米', 0.00);
INSERT INTO `replacement_part` VALUES (252, 'S-325', 'C2-06B', '烘箱轨道链条', NULL, NULL, '框架包装机', 4, 7, 1, 7, 1, 4, 0, NULL, 3, 2, 2, 2, '条', 0.00);
INSERT INTO `replacement_part` VALUES (253, 'S-327', 'C2-08B', '上剪', '225*152*8', '高机', '数控冲剪机', 4, 7, 7, 1, 7, 5, 1, NULL, 2, 1, 1, 2, '套', 0.00);
INSERT INTO `replacement_part` VALUES (254, 'S-329', 'C2-10B', '异形孔底模', NULL, '高机', '数控冲剪机', 7, 1, 7, 4, 1, 4, 0, NULL, 26, 5, 3, 8, '个', 0.00);
INSERT INTO `replacement_part` VALUES (255, 'S-330', 'C2-11B', '圆形孔底模', NULL, '高机', '数控冲剪机', 7, 1, 7, 1, 1, 4, 0, NULL, 15, 5, 3, 11, '个', 0.00);
INSERT INTO `replacement_part` VALUES (256, 'S-334', 'C2-15B', '电磁阀', 'SDKE-1710 10S', '山东高机', '铜排数控冲剪机', 7, 1, 7, 4, 1, 4, 0, NULL, 2, 1, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (257, 'S-336', 'C2-17B', '气缸', 'MGPL20-100', 'SMC', 'LT设备', 7, 1, 1, 4, 1, 3, 0, NULL, 2, 1, 1, 2, '个', 1415.00);
INSERT INTO `replacement_part` VALUES (258, 'S-337', 'C2-18B', '气缸', 'MGPM16-40', 'SMC', 'LT设备', 7, 1, 1, 4, 1, 3, 0, NULL, 2, 1, 1, 2, '个', 796.00);
INSERT INTO `replacement_part` VALUES (259, 'S-341', 'C3-01A', '铆枪工作头', 'LA415-21', '英格索兰', '铆枪', 4, 1, 1, 4, 7, 3, 0, NULL, 4, 2, 2, 4, '个', 0.00);
INSERT INTO `replacement_part` VALUES (260, 'S-342', 'C3-02A', '磁性开关', 'CS1-F', 'AIRTAG', '通用', 4, 1, 1, 4, 7, 3, 0, NULL, 4, 2, 1, 5, '根', 22.00);
INSERT INTO `replacement_part` VALUES (261, 'S-343', 'C3-03A', '热电偶', NULL, NULL, '框架热包机', 4, 1, 1, 4, 7, 3, 0, NULL, 2, 1, 1, 0, '根', 28.00);
INSERT INTO `replacement_part` VALUES (262, 'S-344', 'C3-04A', '塑料轴承', '17MM', NULL, '框架包装机', 4, 1, 1, 4, 7, 3, 0, NULL, 6, 3, 2, 34, '个', 21.00);
INSERT INTO `replacement_part` VALUES (263, 'S-345', 'C3-05A', '塑料轴承', '22MM', '广州秦朝模具', '框架包装机', 4, 1, 1, 4, 7, 3, 0, NULL, 6, 3, 2, 30, '个', 21.00);
INSERT INTO `replacement_part` VALUES (264, 'S-346', 'C3-06A', '充电式剪线钳刀片', '非标', NULL, '预组手持剪线钳', 7, 1, 1, 4, 1, 3, 0, NULL, 5, 2, 1, 2, '套', 210.00);
INSERT INTO `replacement_part` VALUES (265, 'S-347', 'C3-07A', '冲头', NULL, '非标加工', '框架压入机', 4, 1, 1, 4, 7, 3, 0, NULL, 3, 1, 1, 41, '个', 210.00);
INSERT INTO `replacement_part` VALUES (266, 'S-347', 'C3-08A', '冲头安装座', NULL, '非标加工', '框架压入机', 4, 1, 1, 4, 7, 3, 0, NULL, 3, 1, 1, 2, '个', 170.00);
INSERT INTO `replacement_part` VALUES (267, 'S-348', 'C3-09A', '冲头定位座', '平头', '非标加工', '框架压入机', 4, 1, 1, 4, 7, 3, 0, NULL, 2, 1, 1, 3, '个', 170.00);
INSERT INTO `replacement_part` VALUES (268, 'S-349', 'C3-10A', '冲头定位座', '锥头', '非标加工', '框架压入机', 4, 1, 1, 4, 7, 3, 0, NULL, 3, 1, 1, 2, '个', 170.00);
INSERT INTO `replacement_part` VALUES (269, 'S-350', 'C3-11A', '模具冲头', '14.2*18.8', '高机', '数控冲剪机', 4, 4, 1, 7, 1, 3, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (270, 'S-351', 'C3-12A', '模具冲头', '13*18', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 1, '个', 210.00);
INSERT INTO `replacement_part` VALUES (271, 'S-352', 'C3-13A', '模具冲头', '12.2*26.5', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (272, 'S-353', 'C3-14A', '模具冲头', '12*24', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 1, '个', 210.00);
INSERT INTO `replacement_part` VALUES (273, 'S-354', 'C3-15A', '模具冲头', '12.2*17', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 1, '个', 210.00);
INSERT INTO `replacement_part` VALUES (274, 'S-355', 'C3-16A', '模具冲头', '12*20', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (275, 'S-356', 'C3-17A', '模具冲头', '12*17', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (276, 'S-357', 'C3-18A', '模具冲头', '11*16', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 3, '个', 210.00);
INSERT INTO `replacement_part` VALUES (277, 'S-358', 'C3-19A', '模具冲头', '7.7*11.8', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (278, 'S-359', 'C3-20A', '模具冲头', '10.6*26', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (279, 'S-360', 'C3-21A', '顶撑垫片', 'AVDEL', 'AVDEL', '铆枪', 7, 1, 1, 1, 7, 3, 0, NULL, 10, 2, 5, 0, '个', 6.00);
INSERT INTO `replacement_part` VALUES (280, 'S-361', 'C3-22A', '密封胶圈', 'AVDEL', 'AVDEL', '铆枪', 4, 1, 1, 1, 7, 3, 0, NULL, 20, 2, 2, 15, '个', 6.00);
INSERT INTO `replacement_part` VALUES (281, 'S-362', 'C3-23A', 'O形圈', 'AVDEL     07003-00067', 'AVDEL', '铆枪', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 2, 8, 18, '个', 8.00);
INSERT INTO `replacement_part` VALUES (282, 'S-363', 'C3-24A', '弹簧', 'AVDEL     07500-00418', 'AVDEL', '铆枪', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 2, 5, 14, '个', 32.00);
INSERT INTO `replacement_part` VALUES (283, 'S-364', 'C3-25A', '总成护套', 'AVDEL', 'AVDEL', '铆枪', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 2, 3, 11, '个', 6.00);
INSERT INTO `replacement_part` VALUES (284, 'S-365', 'C3-26A', '三爪套', 'AVDEL     07612-02003', 'AVDEL', '铆枪', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 2, 2, 10, '个', 251.00);
INSERT INTO `replacement_part` VALUES (285, 'S-366', 'C3-27A', '塑胶圈', 'AVDEL     07498-03003', 'AVDEL', '铆枪', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 5, 3, 11, '个', 20.00);
INSERT INTO `replacement_part` VALUES (286, 'S-367', 'C3-28A', '爪片6MM', 'AVDEL     07612-02002', 'AVDEL', '铆枪', 4, 1, 1, 1, 7, 3, 0, NULL, 20, 3, 6, 4, '个', 268.00);
INSERT INTO `replacement_part` VALUES (287, 'S-368', 'C3-29A', '顶撑', 'AVDEL     07418-04502', 'AVDEL', '铆枪', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 2, 2, 16, '个', 133.85);
INSERT INTO `replacement_part` VALUES (288, 'S-369', 'C3-30A', '6MM枪嘴', 'AVDEL     07612-02001', 'AVDEL', '铆枪', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 2, 2, 6, '个', 178.00);
INSERT INTO `replacement_part` VALUES (289, 'S-370', 'C3-01B', '定位销', NULL, '非标加工', '框架压入机', 4, 1, 1, 1, 1, 2, 0, NULL, 6, 2, 2, 6, '根', 0.00);
INSERT INTO `replacement_part` VALUES (290, 'S-371', 'C3-02B', '磁性开关', 'CS1-J', 'AIRTAC', '通用', 4, 1, 1, 1, 7, 3, 0, NULL, 2, 1, 1, 13, '条', 0.00);
INSERT INTO `replacement_part` VALUES (291, 'S-372', 'C3-03B', '塑料定位块', NULL, '非标加工', '框架压入机', 4, 1, 1, 1, 7, 3, 0, NULL, 8, 3, 2, 0, '个', 0.00);
INSERT INTO `replacement_part` VALUES (292, 'S-373', 'C3-04B', '定位销安装座', NULL, '非标加工', '框架压入机', 4, 1, 1, 1, 7, 3, 0, NULL, 2, 1, 1, 5, '个', 0.00);
INSERT INTO `replacement_part` VALUES (293, 'S-374', 'C3-05B', '静电手环', NULL, 'PANASONIC', '框架热包机', 4, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 3, '个', 0.00);
INSERT INTO `replacement_part` VALUES (294, 'S-375', 'C3-06B', '接地放电安装座', NULL, 'PANASONIC', '框架热包机', 4, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 5, '个', 0.00);
INSERT INTO `replacement_part` VALUES (295, 'S-376', 'C3-07B', '微动开关', 'RV-166-1C25', 'RENEW', '双夹头压入', 4, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 6, '个', NULL);
INSERT INTO `replacement_part` VALUES (296, 'S-377', 'C3-08B', '液压油管', '40cm*3/8', '非标', '框架压入机', 4, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 2, '条', 115.00);
INSERT INTO `replacement_part` VALUES (297, 'S-378', 'C3-11B', '模具冲头', '16MM', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 5, 3, 2, 5, '个', 210.00);
INSERT INTO `replacement_part` VALUES (298, 'S-379', 'C3-12B', '模具冲头', '14MM', '高机', '数控冲剪机', 7, 4, 1, 4, 7, 5, 0, NULL, 5, 2, 2, 5, '套', 210.00);
INSERT INTO `replacement_part` VALUES (299, 'S-380', 'C3-13B', '模具冲头', '12MM', '高机', '数控冲剪机', 7, 4, 1, 4, 7, 5, 0, NULL, 5, 3, 2, 2, '套', 210.00);
INSERT INTO `replacement_part` VALUES (300, 'S-381', 'C3-14B', '模具冲头', '11MM', '高机', '数控冲剪机', 7, 4, 1, 4, 7, 5, 0, NULL, 5, 3, 2, 5, '套', 210.00);
INSERT INTO `replacement_part` VALUES (301, 'S-382', 'C3-15B', '模具冲头', '10MM', '高机', '数控冲剪机', 7, 4, 1, 4, 7, 5, 0, NULL, 5, 3, 2, 6, '套', 210.00);
INSERT INTO `replacement_part` VALUES (302, 'S-383', 'C3-16B', '模具冲头', '9MM', '高机', '数控冲剪机', 7, 4, 1, 4, 7, 5, 0, NULL, 5, 3, 2, 5, '套', 210.00);
INSERT INTO `replacement_part` VALUES (303, 'S-384', 'C3-17B', '模具冲头', '7MM', '高机', '数控冲剪机', 7, 4, 1, 4, 7, 5, 0, NULL, 5, 3, 2, 1, '套', 210.00);
INSERT INTO `replacement_part` VALUES (304, 'S-385', 'C3-18B', '模具冲头', '6MM', '高机', '数控冲剪机', 7, 4, 1, 4, 7, 5, 0, NULL, 3, 2, 1, 3, '个', 210.00);
INSERT INTO `replacement_part` VALUES (305, 'S-386', 'C3-19B', '模具冲头', '5MM', '高机', '数控冲剪机', 7, 4, 1, 4, 7, 5, 0, NULL, 3, 2, 1, 3, '个', 210.00);
INSERT INTO `replacement_part` VALUES (306, 'S-387', 'C3-20B', '模具冲头', '17*12', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 3, 2, 1, '个', 210.00);
INSERT INTO `replacement_part` VALUES (307, 'S-388', 'C3-22B', 'POP铆枪维护组件', 'POP', 'POP', '数控冲剪机', 4, 1, 1, 1, 1, 2, 0, NULL, 3, 2, 1, 3, '套', 0.00);
INSERT INTO `replacement_part` VALUES (308, 'S-389', 'C3-23B', '6MM枪嘴', 'AVDEL', 'AVDEL', '铆枪AVDEL', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 5, 3, 9, '个', 178.00);
INSERT INTO `replacement_part` VALUES (309, 'S-390', 'C3-24B', '爪片5MM', 'AVDEL', 'AVDEL', '铆枪AVDEL', 4, 1, 1, 1, 7, 3, 0, NULL, 5, 3, 2, 4, '片', NULL);
INSERT INTO `replacement_part` VALUES (310, 'S-391', 'C3-25B', '枪头三爪套', 'A0806-Z03', '霹雳马', '铆枪', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 3, 2, 1, '个', 0.00);
INSERT INTO `replacement_part` VALUES (311, 'S-392', 'C3-26B', '5MM枪嘴', 'AVDEL', 'AVDEL', '铆枪AVDEL', 4, 1, 1, 1, 7, 3, 0, NULL, 20, 5, 3, 13, '个', 178.00);
INSERT INTO `replacement_part` VALUES (312, 'S-393', 'C3-27B', '6MM枪嘴', 'GESIPA', 'GESIPA', '铆枪GESIPA', 4, 1, 1, 1, 7, 3, 0, NULL, 20, 5, 3, 12, '个', 178.00);
INSERT INTO `replacement_part` VALUES (313, 'S-394', 'C3-28B', '6MM枪嘴', 'GESIPA', 'GESIPA', '铆枪GESIPA', 4, 1, 1, 1, 7, 3, 0, NULL, 20, 5, 3, 8, '个', 178.00);
INSERT INTO `replacement_part` VALUES (314, 'S-395', 'C3-29B', '联轴器', 'LA415-18', '英格索兰', '铆枪英格索兰', 4, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (315, 'S-396', 'C3-30B', '喷嘴', 'LA415-60', '英格索兰', '铆枪英格索兰', 4, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 1, '个', 188.00);
INSERT INTO `replacement_part` VALUES (316, 'S-397', 'C4-01A', '7634', 'Sensor cable 180Grad 3*0.25 5m drag chain', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 2, '个', NULL);
INSERT INTO `replacement_part` VALUES (317, 'S-398', 'C4-02A', '7633', 'Sensor cable 90deg 3*0.25 5m drag chain', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 5, '个', NULL);
INSERT INTO `replacement_part` VALUES (318, 'S-399', 'C4-03A', '30264', 'Air hose TU0425B-100', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 3, '米', NULL);
INSERT INTO `replacement_part` VALUES (319, 'S-400', 'C4-04A', '31017', 'Air hose TU0604B-100', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 3, '米', NULL);
INSERT INTO `replacement_part` VALUES (320, 'S-401', 'C4-05A', '31374', 'Air hose TU0805B-100', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 3, '米', NULL);
INSERT INTO `replacement_part` VALUES (321, 'S-402', 'C4-06A', '31415', 'Air hose TU1208B-20', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 3, '米', NULL);
INSERT INTO `replacement_part` VALUES (322, 'S-403', 'C4-07A', '1297', 'Pneumatic oil OFSW-32-1 Liter', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 1, '瓶', NULL);
INSERT INTO `replacement_part` VALUES (323, 'S-404', 'C4-08A', '79951', 'Wire connection sensor swivel side 1Alpha 455', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (324, 'S-405', 'C4-09A', '46121', 'Cylinder DSNU-16-25-PPV-A', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (325, 'S-406', 'C4-10A', '67236', 'Toothed belt STPD 400 DS5M 950', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 1, '条', NULL);
INSERT INTO `replacement_part` VALUES (326, 'S-407', 'C4-11A', '锯片', '金属切割', '英格索兰', '铆枪英格索兰', 4, 1, 1, 1, 1, 2, 0, NULL, 2, 1, 1, 3, '片', 2100.00);
INSERT INTO `replacement_part` VALUES (327, 'S-408', 'C4-12A', '打标机刀头', '1F2336', 'MAX', '打标机', 7, 1, 1, 1, 7, 3, 0, NULL, 5, 2, 3, 15, '盒', 0.00);
INSERT INTO `replacement_part` VALUES (328, 'S-409', 'C4-13A', '电脑剥线机刀片', '非标', NULL, '电脑剥线机', 7, 1, 1, 1, 7, 3, 0, NULL, 3, 1, 2, 2, '对', 0.00);
INSERT INTO `replacement_part` VALUES (329, 'S-410', 'C4-14A', '剥线机传感器', NULL, '禾昌机电', '电脑剥线机', 7, 1, 1, 1, 7, 3, 0, NULL, 2, 1, 1, 2, '个', 0.00);
INSERT INTO `replacement_part` VALUES (330, 'S-411', 'C4-15A', '退料块', '非标', '山东高机', '数控冲剪机', 7, 1, 1, 1, 1, 2, 0, NULL, 5, 2, 2, 5, '个', 120.00);
INSERT INTO `replacement_part` VALUES (331, 'S-412', 'C4-16A', '快速接头', '29242', '世达', '通用', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 2, 2, 22, '个', 14.00);
INSERT INTO `replacement_part` VALUES (332, 'S-413', 'C4-17A', '快速接头', '29222', '世达', '通用', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 2, 2, 16, '个', 14.00);
INSERT INTO `replacement_part` VALUES (333, 'S-414', 'C4-18A', '爪片', 'GESIPA', 'GESIPA', '铆枪GESIPA', 4, 1, 1, 1, 7, 3, 0, NULL, 30, 2, 3, 6, '个', 0.00);
INSERT INTO `replacement_part` VALUES (334, 'S-415', 'C4-19A', '快速接头', '29632', '世达', '通用', 4, 1, 1, 1, 7, 3, 0, NULL, 10, 2, 1, 20, '个', 7.00);
INSERT INTO `replacement_part` VALUES (335, 'S-416', 'C4-20A', 'KS凸台模具冲头', NULL, '广州秦朝模具', 'KS', 7, 4, 1, 4, 7, 5, 0, NULL, 10, 4, 2, 8, '个', 0.00);
INSERT INTO `replacement_part` VALUES (336, 'S-417', 'C4-01B', '66310', 'Toothed belt WT5-16-455', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 2, '条', NULL);
INSERT INTO `replacement_part` VALUES (337, 'S-418', 'C4-02B', '89478', 'Valve 5/2 way valve LS04', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (338, 'S-419', 'C4-03B', '300782', 'Wire connection SW sensores A35x/455', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 1, '条', NULL);
INSERT INTO `replacement_part` VALUES (339, 'S-420', 'C4-04B', '80305', 'Pressure spring 1.1*5.2*33.13', NULL, 'KOMAX', 10, 1, 7, 10, 1, 6, 1, NULL, 2, 1, 1, 2, '个', NULL);
INSERT INTO `replacement_part` VALUES (340, 'S-421', 'C4-05B', '545', 'Fuse 5*20 10 AT', NULL, 'KOMAX', 10, 1, 7, 1, 1, 4, 0, NULL, 2, 1, 1, 10, '个', NULL);
INSERT INTO `replacement_part` VALUES (341, 'S-422', 'C4-06B', '553', 'Fuse 5*20 1AT', NULL, 'KOMAX', 10, 1, 7, 1, 1, 4, 0, NULL, 2, 1, 1, 10, '个', NULL);
INSERT INTO `replacement_part` VALUES (342, 'S-423', 'C4-07B', '6225', 'Fuse 5*20 12.5AT', NULL, 'KOMAX', 10, 1, 7, 1, 1, 4, 0, NULL, 2, 1, 1, 10, '个', NULL);
INSERT INTO `replacement_part` VALUES (343, 'S-424', 'C4-08B', '79774', 'Shock absorber TK10-4M M10*1', NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 2, 1, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (344, 'S-425', 'C4-09B', '70147', 'Tension spring 0.56*5.5*20.8', NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 2, 1, 1, 1, '个', NULL);
INSERT INTO `replacement_part` VALUES (345, 'S-426', 'C4-10B', '65896', 'Hex socket screw M2.5*4 12.9vzb TC588', NULL, 'KOMAX', 10, 1, 7, 4, 1, 5, 0, NULL, 2, 1, 1, 2, '个', NULL);
INSERT INTO `replacement_part` VALUES (346, 'S-427', 'C4-11B', '模具冲头', '7.1*11', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (347, 'S-428', 'C4-12B', '模具冲头', '8.2*11', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 3, '个', 210.00);
INSERT INTO `replacement_part` VALUES (348, 'S-429', 'C4-13B', '模具冲头', '8.5*8.5', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (349, 'S-430', 'C4-14B', '模具冲头', '8.5*11.5', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 1, '个', 210.00);
INSERT INTO `replacement_part` VALUES (350, 'S-431', 'C4-15B', '模具冲头', '9*14', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 1, '个', 210.00);
INSERT INTO `replacement_part` VALUES (351, 'S-432', 'C4-16B', '模具冲头', '9.1*14.5', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 3, '个', 210.00);
INSERT INTO `replacement_part` VALUES (352, 'S-433', 'C4-17B', '模具冲头', '9.2*21', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (353, 'S-434', 'C4-18B', '模具冲头', '9.7*17.3', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (354, 'S-435', 'C4-19B', '模具冲头', '10.2*20', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);
INSERT INTO `replacement_part` VALUES (355, 'S-436', 'C4-20B', '模具冲头', '10.5*14.5', '高机', '数控冲剪机', 7, 4, 1, 4, 1, 4, 0, NULL, 2, 1, 1, 2, '个', 210.00);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sesaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sellphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES (1, 'SESA511463', 'Jinyan.Song', '123456', '15735396830');
INSERT INTO `staff` VALUES (2, 'SESA511464', 'stongjinyan', '123456', '18725342516');

-- ----------------------------
-- Table structure for use_record
-- ----------------------------
DROP TABLE IF EXISTS `use_record`;
CREATE TABLE `use_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) NULL DEFAULT NULL,
  `replacement_part_id` int(11) NULL DEFAULT NULL,
  `maintenance_daily_work_record_id` int(11) NULL DEFAULT NULL,
  `use_number` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `staff_id`(`staff_id`) USING BTREE,
  INDEX `replacement_part_id`(`replacement_part_id`) USING BTREE,
  INDEX `maintenance_daily_work_record_id`(`maintenance_daily_work_record_id`) USING BTREE,
  CONSTRAINT `use_record_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `use_record_ibfk_2` FOREIGN KEY (`replacement_part_id`) REFERENCES `replacement_part` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `use_record_ibfk_3` FOREIGN KEY (`maintenance_daily_work_record_id`) REFERENCES `maintenance_daily_work_record` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of use_record
-- ----------------------------
INSERT INTO `use_record` VALUES (3, 1, 3, 6, 3);
INSERT INTO `use_record` VALUES (4, 1, 4, 6, 3);

-- ----------------------------
-- View structure for eplist
-- ----------------------------
DROP VIEW IF EXISTS `eplist`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `eplist` AS select `ep`.`id` AS `id`,`ep`.`epid` AS `epid`,`ep`.`name` AS `epname`,`ep`.`description` AS `description`,`ep`.`ep_score` AS `ep_score`,`ep`.`backup_plan` AS `backup_plan`,`ep`.`check_cycle` AS `check_cycle`,`checkstaff`.`name` AS `checkstaffname`,`epattribute`.`attribute` AS `attribute`,`epstatus`.`status` AS `status`,`processline_area`.`name` AS `areaname`,`critical`.`name` AS `criticalname`,`maintainstaff`.`name` AS `maintainstaffname`,`check_method`.`name` AS `checkmethodname`,`ep`.`property_id` AS `property_id` from (((((((`ep` join `staff` `checkstaff` on((`ep`.`check_staff_id` = `checkstaff`.`id`))) join `epattribute` on((`ep`.`attribute` = `epattribute`.`id`))) join `epstatus` on((`ep`.`status` = `epstatus`.`id`))) join `processline_area` on((`ep`.`save_area_id` = `processline_area`.`id`))) join `critical` on((`ep`.`critical` = `critical`.`id`))) join `staff` `maintainstaff` on((`ep`.`maintain_staff_id` = `maintainstaff`.`id`))) join `check_method` on((`ep`.`check_method` = `check_method`.`id`)));

-- ----------------------------
-- View structure for equipmentmaintainrecord
-- ----------------------------
DROP VIEW IF EXISTS `equipmentmaintainrecord`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `equipmentmaintainrecord` AS select `maintenance_daily_work_record`.`id` AS `id`,`maintenance_daily_work_record`.`question_description` AS `question_description`,`maintenance_daily_work_record`.`process_description` AS `process_description`,`maintenance_daily_work_record`.`type` AS `type`,`maintenance_daily_work_record`.`pm_id` AS `pm_id`,`maintenance_daily_work_record`.`time` AS `time`,`maintenance_daily_work_record`.`user_time` AS `user_time`,`ep`.`epid` AS `epid`,`ep`.`name` AS `epname`,`processline_area`.`name` AS `areaname`,`staff`.`name` AS `staffname`,`maintenance_type`.`name` AS `maintenancetypename` from ((((`maintenance_daily_work_record` join `ep` on((`maintenance_daily_work_record`.`ep_id` = `ep`.`id`))) join `processline_area` on((`ep`.`save_area_id` = `processline_area`.`id`))) join `staff` on((`maintenance_daily_work_record`.`staff_id` = `staff`.`id`))) join `maintenance_type` on((`maintenance_daily_work_record`.`type` = `maintenance_type`.`id`)));

SET FOREIGN_KEY_CHECKS = 1;
