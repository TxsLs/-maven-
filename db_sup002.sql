/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : localhost:3306
 Source Schema         : db_sup002

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 01/03/2024 11:40:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ckin
-- ----------------------------
DROP TABLE IF EXISTS `ckin`;
CREATE TABLE `ckin`  (
  `inid` int(7) NOT NULL AUTO_INCREMENT,
  `proid` int(7) NOT NULL COMMENT '商品id',
  `pname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `num` bigint(25) NULL DEFAULT 100 COMMENT '商品数量',
  `indate` date NULL DEFAULT NULL COMMENT '时间',
  `marks` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `price` bigint(25) NULL DEFAULT NULL COMMENT '单价',
  `sumprice` bigint(25) NULL DEFAULT NULL COMMENT '总价',
  PRIMARY KEY (`inid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '进货表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ckin
-- ----------------------------
INSERT INTO `ckin` VALUES (121, 1260300, '苹果', 100, '2024-03-27', '', 1, 100);
INSERT INTO `ckin` VALUES (122, 1260300, '苹果', 1000, '2024-03-27', '', 2, 2000);
INSERT INTO `ckin` VALUES (123, 5287527, '瓜子', 10, '2019-05-01', '', 10, 100);
INSERT INTO `ckin` VALUES (124, 5287527, '瓜子', 100, '2019-05-02', '', 9, 900);
INSERT INTO `ckin` VALUES (125, 8556504, '绿萝', 100, '2019-05-02', NULL, NULL, 0);
INSERT INTO `ckin` VALUES (126, 241677, '怡宝矿泉水', 100, '2019-05-12', NULL, NULL, 0);
INSERT INTO `ckin` VALUES (127, 241677, '怡宝矿泉水', 20, '2019-05-12', NULL, NULL, 0);
INSERT INTO `ckin` VALUES (128, 241677, '怡宝矿泉水', 100, '2019-05-12', NULL, NULL, 0);
INSERT INTO `ckin` VALUES (129, 4186601, '春联', 100, '2024-02-27', NULL, NULL, 0);
INSERT INTO `ckin` VALUES (130, 5287527, '瓜子', 10, '2024-03-01', NULL, NULL, 0);
INSERT INTO `ckin` VALUES (131, 2925172, '春联', 100, '2024-03-01', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ckretire
-- ----------------------------
DROP TABLE IF EXISTS `ckretire`;
CREATE TABLE `ckretire`  (
  `inid` int(8) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `proid` int(8) NOT NULL COMMENT '商品id',
  `pname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `num` int(25) NULL DEFAULT NULL COMMENT '数量',
  `indate` date NULL DEFAULT NULL COMMENT '时间',
  `retdate` date NULL DEFAULT NULL COMMENT '时间',
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `marks` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`inid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存预警表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ckretire
-- ----------------------------
INSERT INTO `ckretire` VALUES (123, 5287527, '瓜子', 100, NULL, '2019-05-11', NULL, '');

-- ----------------------------
-- Table structure for cusretire
-- ----------------------------
DROP TABLE IF EXISTS `cusretire`;
CREATE TABLE `cusretire`  (
  `saleid` int(25) NOT NULL COMMENT '订单id',
  `proid` int(25) NOT NULL COMMENT '商品id',
  `pname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` double(25, 3) NULL DEFAULT NULL COMMENT '单价',
  `num` int(25) NULL DEFAULT NULL COMMENT '数量',
  `total` double(25, 3) NULL DEFAULT NULL COMMENT '总价',
  `saledate` date NULL DEFAULT NULL,
  `retdate` date NULL DEFAULT NULL COMMENT '日期',
  `reason` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `marks` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`saleid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '临期商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cusretire
-- ----------------------------
INSERT INTO `cusretire` VALUES (3718799, 1260300, '苹果', NULL, 10, NULL, NULL, '2019-04-12', NULL, '');
INSERT INTO `cusretire` VALUES (5595579, 1260300, '苹果', NULL, 6, NULL, NULL, '2019-04-19', NULL, '');
INSERT INTO `cusretire` VALUES (8749456, 241677, '怡宝矿泉水', NULL, 10, NULL, NULL, '2019-05-12', NULL, '');

-- ----------------------------
-- Table structure for custom
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom`  (
  `cusid` int(25) NOT NULL COMMENT '客户id',
  `cusname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户名称',
  `tel` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `person` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `address` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `emali` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`cusid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of custom
-- ----------------------------
INSERT INTO `custom` VALUES (5, '5', NULL, NULL, NULL, NULL);
INSERT INTO `custom` VALUES (101, '张三', '18888888888', '', '', '192@qq.com');

-- ----------------------------
-- Table structure for dailysale
-- ----------------------------
DROP TABLE IF EXISTS `dailysale`;
CREATE TABLE `dailysale`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proid` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `num` bigint(25) NULL DEFAULT NULL COMMENT '数量',
  `price` bigint(25) NULL DEFAULT NULL COMMENT '总价',
  `createtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `timestamp` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 963 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每日销售信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dailysale
-- ----------------------------
INSERT INTO `dailysale` VALUES (352, 1260300, '苹果', 11, 253, '2024-02-28', 1709049600000);
INSERT INTO `dailysale` VALUES (619, 241677, '怡宝矿泉水', 2, 4, '2024-03-01', 1709222400000);
INSERT INTO `dailysale` VALUES (894, 1260300, '苹果', 10, 0, '2024-03-01', 1709222400000);

-- ----------------------------
-- Table structure for kcxx
-- ----------------------------
DROP TABLE IF EXISTS `kcxx`;
CREATE TABLE `kcxx`  (
  `proid` int(25) NOT NULL COMMENT '商品id',
  `pname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `num` int(25) NULL DEFAULT NULL COMMENT '数量',
  `marks` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`proid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kcxx
-- ----------------------------
INSERT INTO `kcxx` VALUES (241677, '怡宝矿泉水', 127, '');
INSERT INTO `kcxx` VALUES (1260300, '苹果', 436, '');
INSERT INTO `kcxx` VALUES (2925172, '春联', 100, NULL);
INSERT INTO `kcxx` VALUES (4186601, '春联', 100, NULL);
INSERT INTO `kcxx` VALUES (5287527, '瓜子', 20, '');
INSERT INTO `kcxx` VALUES (8556504, '绿萝', 100, NULL);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `managerid` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员id',
  `managername` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员名称',
  `card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `sex` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `tel` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `stafftype` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份',
  `pwd` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`managerid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('15203111', '贺彬华', '362430199712207275', '男', '13517064592', '管理员', '1234');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `proid` int(25) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `pname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` double(25, 3) NOT NULL COMMENT '售价',
  `inprice` double(25, 3) NULL DEFAULT NULL COMMENT '进价',
  `prodate` date NULL DEFAULT NULL COMMENT '生产事件',
  `reledate` date NULL DEFAULT NULL COMMENT '过期时间',
  `supname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `protype` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品类型',
  `unit` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '计件方式',
  `marks` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`proid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8556505 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (241677, '怡宝矿泉水', 2.000, 1.000, '2019-01-01', '2019-05-08', '怡宝', '矿泉水', '瓶', '');
INSERT INTO `product` VALUES (1260300, '苹果', 23.000, 17.000, '2019-01-01', '2019-11-15', '百果园', '水果', '斤', '');
INSERT INTO `product` VALUES (2925172, '春联', 1.000, 1.000, '2024-03-01', '2024-03-01', '春联厂家', '消耗品', '自动', '');
INSERT INTO `product` VALUES (4186601, '春联', 1.000, 1.000, '2024-02-27', '2024-02-27', '春联厂家', '消耗品', '自动', '');
INSERT INTO `product` VALUES (5287527, '瓜子', 5.000, 3.000, '2019-04-05', '2019-07-26', '恰恰', '零食', '袋', '');
INSERT INTO `product` VALUES (8556504, '绿萝', 12.000, 7.000, '2019-05-17', '2019-05-25', '花鸟市场', '绿植盆栽', '盆', '');

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale`  (
  `saleid` int(25) NOT NULL COMMENT '订单id',
  `proid` int(25) NOT NULL COMMENT '商品id',
  `pname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` double(25, 3) NULL DEFAULT NULL COMMENT '售价',
  `num` int(25) NULL DEFAULT NULL COMMENT '数量',
  `total` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '总价',
  `saledate` date NULL DEFAULT NULL,
  `cusname` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '客户名称',
  `cusid` varchar(25) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '客户id',
  `marks` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `indate` date NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`saleid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '销售信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sale
-- ----------------------------
INSERT INTO `sale` VALUES (30579, 1260300, '苹果', 23.000, 600, '13800.0', '2024-02-22', '5', '5', '', NULL);
INSERT INTO `sale` VALUES (441570, 1260300, '苹果', 23.000, 1, '23.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (671873, 1260300, '苹果', 23.000, 1, '23.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (1016737, 1260300, '苹果', 23.000, 10, '0.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (1757547, 1260300, '苹果', 23.000, 1, '23.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (1777412, 1260300, '苹果', 23.000, 1, '23.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (1923950, 1260300, '苹果', 23.000, 10, '0.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (2566788, 1260300, '苹果', 23.000, 10, '0.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (3007323, 241677, '怡宝矿泉水', 2.000, 69, '138.0', '2024-02-22', 'hbh', '20', '', NULL);
INSERT INTO `sale` VALUES (3718799, 1260300, '苹果', 23.000, 5, '115.0', '2024-02-22', '10', '324', '1', NULL);
INSERT INTO `sale` VALUES (4136177, 1260300, '苹果', 23.000, 10, '0.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (5271014, 1260300, '苹果', 23.000, 10, '0.0', '2024-03-01', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (5595579, 1260300, '苹果', 23.000, 12, '276.0', '2024-02-22', '10', '2312', '', NULL);
INSERT INTO `sale` VALUES (5904596, 241677, '怡宝矿泉水', 2.000, 2, '4.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (6662081, 1260300, '苹果', 23.000, 10, '0.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (6702222, 1260300, '苹果', 23.000, 1, '23.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (6915831, 1260300, '苹果', 23.000, 1, '23.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (6999477, 1260300, '苹果', 23.000, 10, '230.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (8749456, 241677, '怡宝矿泉水', 2.000, 12, '24.0', '2024-02-22', 'hbh', '134', '', NULL);
INSERT INTO `sale` VALUES (8789327, 1260300, '苹果', 23.000, 1, '23.0', '2024-02-22', '张三', '101', '', NULL);
INSERT INTO `sale` VALUES (9092816, 241677, '怡宝矿泉水', 2.000, 20, '40.0', '2024-02-22', 'hbh', '12', '', NULL);
INSERT INTO `sale` VALUES (9841755, 1260300, '苹果', 23.000, 2, '46.0', '2024-02-22', '1', '2', '', NULL);

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff`  (
  `staffid` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `staffname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stafftype` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwd` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`staffid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('15203122', '贺彬华', '362430199712207275', '男', '13517064592', '普通员工', '123456');
INSERT INTO `staff` VALUES ('15203123', '贺彬华', '234123412341234', '142', '13519081234', '普通员工', '123456');
INSERT INTO `staff` VALUES ('15203124', '小贺同学', '362430199712207275', '男', '13517064592', '普通员工', '123456');
INSERT INTO `staff` VALUES ('154203129', '小贺同学', '362430199712207275', '男', '13517064592', '普通员工', '1234');

-- ----------------------------
-- Table structure for supply
-- ----------------------------
DROP TABLE IF EXISTS `supply`;
CREATE TABLE `supply`  (
  `supid` int(25) NOT NULL AUTO_INCREMENT COMMENT '供应商id',
  `suppname` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '供应商名称',
  `tel` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `person` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `address` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `emali` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`supid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '供应商信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of supply
-- ----------------------------
INSERT INTO `supply` VALUES (16, '百果园', '13517064592', '某总', '吉安永新', '3078343267@qq.com');
INSERT INTO `supply` VALUES (17, '恰恰', '13517064592', '贺天', '吉安永新', '3078343267@qq.com');
INSERT INTO `supply` VALUES (18, '花鸟市场', NULL, NULL, NULL, NULL);
INSERT INTO `supply` VALUES (19, '怡宝', NULL, NULL, NULL, NULL);
INSERT INTO `supply` VALUES (20, '春联厂家', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `protypeid` int(25) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `typename` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`protypeid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (26, '水果');
INSERT INTO `type` VALUES (27, '零食');
INSERT INTO `type` VALUES (28, '绿植盆栽');
INSERT INTO `type` VALUES (29, '矿泉水');
INSERT INTO `type` VALUES (30, '消耗品');

-- ----------------------------
-- Triggers structure for table ckin
-- ----------------------------
DROP TRIGGER IF EXISTS `xgjhxx`;
delimiter ;;
CREATE TRIGGER `xgjhxx` AFTER UPDATE ON `ckin` FOR EACH ROW begin
UPDATE kcxx set num=num+new.num-old.num where proid=new.proid;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ckretire
-- ----------------------------
DROP TRIGGER IF EXISTS `th`;
delimiter ;;
CREATE TRIGGER `th` AFTER INSERT ON `ckretire` FOR EACH ROW BEGIN
UPDATE kcxx set num=num-new.num where proid=new.proid;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table ckretire
-- ----------------------------
DROP TRIGGER IF EXISTS `xgth`;
delimiter ;;
CREATE TRIGGER `xgth` AFTER UPDATE ON `ckretire` FOR EACH ROW BEGIN
update kcxx set num=num+old.num-new.num where proid=new.proid;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table product
-- ----------------------------
DROP TRIGGER IF EXISTS `tg1`;
delimiter ;;
CREATE TRIGGER `tg1` AFTER INSERT ON `product` FOR EACH ROW begin 
set @flag3=(SELECT count(*)  from ckin where proid=NEW.proid);
if(@flag3=0)
THEN
INSERT into ckin(proid,pname,indate) VALUES (NEW.proid,NEW.pname,now());
end if;

set @flag4=(SELECT count(*)  from kcxx where proid=NEW.proid);
if(@flag4=0)
THEN
INSERT INTO kcxx(proid,pname,num) VALUES (NEW.proid,NEW.pname,100);
end if;

set @flag=(select COUNT(*) FROM type where typename=NEW.protype);
if(@flag=0)
then
INSERT INTO type(typename) VALUES(NEW.protype);
end if;

set @flag2=(SELECT count(*)  from supply where suppname=NEW.supname);
if(@flag2=0)
THEN
INSERT INTO supply(suppname) VALUES (NEW.supname);
end if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table type
-- ----------------------------
DROP TRIGGER IF EXISTS `xglb`;
delimiter ;;
CREATE TRIGGER `xglb` AFTER UPDATE ON `type` FOR EACH ROW begin
update product set protype=new.typename where protype=old.typename;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
