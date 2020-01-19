/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.18
Source Server Version : 50724
Source Host           : 192.168.0.18:3306
Source Database       : tc

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-01-19 18:56:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for transaction_message
-- ----------------------------
DROP TABLE IF EXISTS `transaction_message`;
CREATE TABLE `transaction_message` (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `message` varchar(2000) DEFAULT NULL COMMENT '消息内容,json格式',
  `queue` varchar(255) DEFAULT NULL COMMENT '发送的队列',
  `send_system` varchar(255) DEFAULT NULL COMMENT '哪个系统发送的',
  `send_count` int(11) DEFAULT NULL COMMENT '发送次数',
  `create_date` datetime DEFAULT NULL COMMENT '消息创建时间',
  `send_date` datetime DEFAULT NULL COMMENT '最近一次发送消息的时间,每发送一次更新一次',
  `status` tinyint(3) DEFAULT '0' COMMENT '状态：0等待消费  1已消费 2已死亡(默认0)',
  `die_count` int(11) DEFAULT NULL COMMENT '死亡条件，重发多少次后还是失败，标记为死亡消息',
  `customer_date` datetime DEFAULT NULL COMMENT '消息被消费的时间',
  `customer_system` varchar(255) DEFAULT NULL COMMENT '哪个系统消费了消息',
  `die_date` datetime DEFAULT NULL COMMENT '消息死亡时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transaction_message
-- ----------------------------
INSERT INTO `transaction_message` VALUES ('7', '{\"goodsId\":10086}', 'order_create_queue', 'cloud-transaction-stock', '10', '2020-01-19 16:59:08', '2020-01-19 17:22:38', '2', '10', '2020-01-19 17:22:38', null, null);
INSERT INTO `transaction_message` VALUES ('8', '{\"goodsId\":10086}', 'order_create_queue', 'cloud-transaction-stock', '10', '2020-01-19 17:25:59', '2020-01-19 17:35:10', '2', '10', '2020-01-19 17:35:10', null, null);
INSERT INTO `transaction_message` VALUES ('9', '{\"goodsId\":10086}', 'order_create_queue', 'cloud-transaction-stock', '9', '2020-01-19 18:00:36', '2020-01-19 18:09:38', '1', '10', '2020-01-19 18:09:38', 'cloud-transaction-order', null);
