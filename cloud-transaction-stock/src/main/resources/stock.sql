/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.18
Source Server Version : 50724
Source Host           : 192.168.0.18:3306
Source Database       : stock

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-01-19 18:56:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` bigint(20) NOT NULL,
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `count` int(11) DEFAULT NULL COMMENT '库存数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('1', '10086', '3');
