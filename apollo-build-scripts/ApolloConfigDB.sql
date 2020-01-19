/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.18
Source Server Version : 50724
Source Host           : 192.168.0.18:3306
Source Database       : ApolloConfigDB

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-01-19 18:56:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for App
-- ----------------------------
DROP TABLE IF EXISTS `App`;
CREATE TABLE `App` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '应用名',
  `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '部门Id',
  `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '部门名字',
  `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
  `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';

-- ----------------------------
-- Records of App
-- ----------------------------
INSERT INTO `App` VALUES ('1', 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'default', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
INSERT INTO `App` VALUES ('2', 'seata', 'apollo-server', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'apollo', '2020-01-17 11:28:40', 'apollo', '2020-01-17 11:28:40');
INSERT INTO `App` VALUES ('3', 'mytx', 'tx-server', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'apollo', '2020-01-19 11:15:19', 'apollo', '2020-01-19 11:15:19');

-- ----------------------------
-- Table structure for AppNamespace
-- ----------------------------
DROP TABLE IF EXISTS `AppNamespace`;
CREATE TABLE `AppNamespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace名字，注意，需要全局唯一',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'app id',
  `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace的format类型',
  `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace是否为公共',
  `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId` (`AppId`),
  KEY `Name_AppId` (`Name`,`AppId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
INSERT INTO `AppNamespace` VALUES ('1', 'application', 'SampleApp', 'properties', '\0', 'default app namespace', '\0', '', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
INSERT INTO `AppNamespace` VALUES ('2', 'application', 'seata', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `AppNamespace` VALUES ('3', 'application', 'mytx', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2020-01-19 11:15:19', 'apollo', '2020-01-19 11:15:19');

-- ----------------------------
-- Table structure for Audit
-- ----------------------------
DROP TABLE IF EXISTS `Audit`;
CREATE TABLE `Audit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `EntityName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '表名',
  `EntityId` int(10) unsigned DEFAULT NULL COMMENT '记录ID',
  `OpName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '操作类型',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COMMENT='日志审计表';

-- ----------------------------
-- Records of Audit
-- ----------------------------
INSERT INTO `Audit` VALUES ('1', 'Item', '2', 'INSERT', null, '\0', 'apollo', '2020-01-07 09:59:02', null, '2020-01-07 09:59:02');
INSERT INTO `Audit` VALUES ('2', 'Release', '2', 'INSERT', null, '\0', 'apollo', '2020-01-07 09:59:35', null, '2020-01-07 09:59:35');
INSERT INTO `Audit` VALUES ('3', 'ReleaseHistory', '2', 'INSERT', null, '\0', 'apollo', '2020-01-07 09:59:35', null, '2020-01-07 09:59:35');
INSERT INTO `Audit` VALUES ('4', 'Item', '2', 'UPDATE', null, '\0', 'apollo', '2020-01-07 10:05:39', null, '2020-01-07 10:05:39');
INSERT INTO `Audit` VALUES ('5', 'Release', '3', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:05:43', null, '2020-01-07 10:05:43');
INSERT INTO `Audit` VALUES ('6', 'ReleaseHistory', '3', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:05:43', null, '2020-01-07 10:05:43');
INSERT INTO `Audit` VALUES ('7', 'Item', '2', 'UPDATE', null, '\0', 'apollo', '2020-01-07 10:09:59', null, '2020-01-07 10:09:59');
INSERT INTO `Audit` VALUES ('8', 'Release', '4', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:10:03', null, '2020-01-07 10:10:03');
INSERT INTO `Audit` VALUES ('9', 'ReleaseHistory', '4', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:10:03', null, '2020-01-07 10:10:03');
INSERT INTO `Audit` VALUES ('10', 'Item', '2', 'UPDATE', null, '\0', 'apollo', '2020-01-07 10:11:09', null, '2020-01-07 10:11:09');
INSERT INTO `Audit` VALUES ('11', 'Release', '5', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:11:12', null, '2020-01-07 10:11:12');
INSERT INTO `Audit` VALUES ('12', 'ReleaseHistory', '5', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:11:12', null, '2020-01-07 10:11:12');
INSERT INTO `Audit` VALUES ('13', 'Item', '2', 'DELETE', null, '\0', 'apollo', '2020-01-07 10:34:06', null, '2020-01-07 10:34:06');
INSERT INTO `Audit` VALUES ('14', 'Release', '6', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:35:23', null, '2020-01-07 10:35:23');
INSERT INTO `Audit` VALUES ('15', 'ReleaseHistory', '6', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:35:23', null, '2020-01-07 10:35:23');
INSERT INTO `Audit` VALUES ('16', 'Item', '3', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:36:17', null, '2020-01-07 10:36:17');
INSERT INTO `Audit` VALUES ('17', 'Release', '7', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:36:22', null, '2020-01-07 10:36:22');
INSERT INTO `Audit` VALUES ('18', 'ReleaseHistory', '7', 'INSERT', null, '\0', 'apollo', '2020-01-07 10:36:22', null, '2020-01-07 10:36:22');
INSERT INTO `Audit` VALUES ('19', 'App', '2', 'INSERT', null, '\0', 'apollo', '2020-01-17 11:28:41', null, '2020-01-17 11:28:41');
INSERT INTO `Audit` VALUES ('20', 'AppNamespace', '2', 'INSERT', null, '\0', 'apollo', '2020-01-17 11:28:41', null, '2020-01-17 11:28:41');
INSERT INTO `Audit` VALUES ('21', 'Cluster', '2', 'INSERT', null, '\0', 'apollo', '2020-01-17 11:28:41', null, '2020-01-17 11:28:41');
INSERT INTO `Audit` VALUES ('22', 'Namespace', '2', 'INSERT', null, '\0', 'apollo', '2020-01-17 11:28:41', null, '2020-01-17 11:28:41');
INSERT INTO `Audit` VALUES ('23', 'Item', '4', 'INSERT', null, '\0', 'apollo', '2020-01-17 11:38:14', null, '2020-01-17 11:38:14');
INSERT INTO `Audit` VALUES ('24', 'Item', '5', 'INSERT', null, '\0', 'apollo', '2020-01-17 11:38:50', null, '2020-01-17 11:38:50');
INSERT INTO `Audit` VALUES ('25', 'Item', '6', 'INSERT', null, '\0', 'apollo', '2020-01-17 11:39:26', null, '2020-01-17 11:39:26');
INSERT INTO `Audit` VALUES ('26', 'Release', '8', 'INSERT', null, '\0', 'apollo', '2020-01-17 12:00:41', null, '2020-01-17 12:00:41');
INSERT INTO `Audit` VALUES ('27', 'ReleaseHistory', '8', 'INSERT', null, '\0', 'apollo', '2020-01-17 12:00:41', null, '2020-01-17 12:00:41');
INSERT INTO `Audit` VALUES ('28', 'Item', '7', 'INSERT', null, '\0', 'apollo', '2020-01-17 13:48:55', null, '2020-01-17 13:48:55');
INSERT INTO `Audit` VALUES ('29', 'Item', '7', 'UPDATE', null, '\0', 'apollo', '2020-01-17 13:49:15', null, '2020-01-17 13:49:15');
INSERT INTO `Audit` VALUES ('30', 'Item', '8', 'INSERT', null, '\0', 'apollo', '2020-01-17 13:50:27', null, '2020-01-17 13:50:27');
INSERT INTO `Audit` VALUES ('31', 'Item', '9', 'INSERT', null, '\0', 'apollo', '2020-01-17 13:51:05', null, '2020-01-17 13:51:05');
INSERT INTO `Audit` VALUES ('32', 'Release', '9', 'INSERT', null, '\0', 'apollo', '2020-01-17 13:51:23', null, '2020-01-17 13:51:23');
INSERT INTO `Audit` VALUES ('33', 'ReleaseHistory', '9', 'INSERT', null, '\0', 'apollo', '2020-01-17 13:51:23', null, '2020-01-17 13:51:23');
INSERT INTO `Audit` VALUES ('34', 'Item', '10', 'INSERT', null, '\0', 'apollo', '2020-01-17 13:54:02', null, '2020-01-17 13:54:02');
INSERT INTO `Audit` VALUES ('35', 'Item', '10', 'UPDATE', null, '\0', 'apollo', '2020-01-17 13:54:21', null, '2020-01-17 13:54:21');
INSERT INTO `Audit` VALUES ('36', 'Item', '11', 'INSERT', null, '\0', 'apollo', '2020-01-17 13:54:36', null, '2020-01-17 13:54:36');
INSERT INTO `Audit` VALUES ('37', 'Item', '12', 'INSERT', null, '\0', 'apollo', '2020-01-17 13:54:57', null, '2020-01-17 13:54:57');
INSERT INTO `Audit` VALUES ('38', 'Release', '10', 'INSERT', null, '\0', 'apollo', '2020-01-17 13:55:05', null, '2020-01-17 13:55:05');
INSERT INTO `Audit` VALUES ('39', 'ReleaseHistory', '10', 'INSERT', null, '\0', 'apollo', '2020-01-17 13:55:05', null, '2020-01-17 13:55:05');
INSERT INTO `Audit` VALUES ('40', 'App', '3', 'INSERT', null, '\0', 'apollo', '2020-01-19 11:15:19', null, '2020-01-19 11:15:19');
INSERT INTO `Audit` VALUES ('41', 'AppNamespace', '3', 'INSERT', null, '\0', 'apollo', '2020-01-19 11:15:19', null, '2020-01-19 11:15:19');
INSERT INTO `Audit` VALUES ('42', 'Cluster', '3', 'INSERT', null, '\0', 'apollo', '2020-01-19 11:15:19', null, '2020-01-19 11:15:19');
INSERT INTO `Audit` VALUES ('43', 'Namespace', '3', 'INSERT', null, '\0', 'apollo', '2020-01-19 11:15:19', null, '2020-01-19 11:15:19');
INSERT INTO `Audit` VALUES ('44', 'Item', '13', 'INSERT', null, '\0', 'apollo', '2020-01-19 11:16:11', null, '2020-01-19 11:16:11');
INSERT INTO `Audit` VALUES ('45', 'Item', '14', 'INSERT', null, '\0', 'apollo', '2020-01-19 11:16:51', null, '2020-01-19 11:16:51');
INSERT INTO `Audit` VALUES ('46', 'Item', '15', 'INSERT', null, '\0', 'apollo', '2020-01-19 11:17:38', null, '2020-01-19 11:17:38');
INSERT INTO `Audit` VALUES ('47', 'Item', '16', 'INSERT', null, '\0', 'apollo', '2020-01-19 11:18:22', null, '2020-01-19 11:18:22');
INSERT INTO `Audit` VALUES ('48', 'Release', '11', 'INSERT', null, '\0', 'apollo', '2020-01-19 11:20:31', null, '2020-01-19 11:20:31');
INSERT INTO `Audit` VALUES ('49', 'ReleaseHistory', '11', 'INSERT', null, '\0', 'apollo', '2020-01-19 11:20:31', null, '2020-01-19 11:20:31');
INSERT INTO `Audit` VALUES ('50', 'Item', '17', 'INSERT', null, '\0', 'apollo', '2020-01-19 12:08:27', null, '2020-01-19 12:08:27');
INSERT INTO `Audit` VALUES ('51', 'Release', '12', 'INSERT', null, '\0', 'apollo', '2020-01-19 12:08:33', null, '2020-01-19 12:08:33');
INSERT INTO `Audit` VALUES ('52', 'ReleaseHistory', '12', 'INSERT', null, '\0', 'apollo', '2020-01-19 12:08:33', null, '2020-01-19 12:08:33');
INSERT INTO `Audit` VALUES ('53', 'Item', '17', 'DELETE', null, '\0', 'apollo', '2020-01-19 12:12:44', null, '2020-01-19 12:12:44');
INSERT INTO `Audit` VALUES ('54', 'Release', '13', 'INSERT', null, '\0', 'apollo', '2020-01-19 12:12:49', null, '2020-01-19 12:12:49');
INSERT INTO `Audit` VALUES ('55', 'ReleaseHistory', '13', 'INSERT', null, '\0', 'apollo', '2020-01-19 12:12:49', null, '2020-01-19 12:12:49');
INSERT INTO `Audit` VALUES ('56', 'Item', '18', 'INSERT', null, '\0', 'apollo', '2020-01-19 12:13:23', null, '2020-01-19 12:13:23');
INSERT INTO `Audit` VALUES ('57', 'Release', '14', 'INSERT', null, '\0', 'apollo', '2020-01-19 12:13:27', null, '2020-01-19 12:13:27');
INSERT INTO `Audit` VALUES ('58', 'ReleaseHistory', '14', 'INSERT', null, '\0', 'apollo', '2020-01-19 12:13:27', null, '2020-01-19 12:13:27');
INSERT INTO `Audit` VALUES ('59', 'Item', '18', 'UPDATE', null, '\0', 'apollo', '2020-01-19 13:04:15', null, '2020-01-19 13:04:15');
INSERT INTO `Audit` VALUES ('60', 'Release', '15', 'INSERT', null, '\0', 'apollo', '2020-01-19 13:04:21', null, '2020-01-19 13:04:21');
INSERT INTO `Audit` VALUES ('61', 'ReleaseHistory', '15', 'INSERT', null, '\0', 'apollo', '2020-01-19 13:04:21', null, '2020-01-19 13:04:21');

-- ----------------------------
-- Table structure for Cluster
-- ----------------------------
DROP TABLE IF EXISTS `Cluster`;
CREATE TABLE `Cluster` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '集群名字',
  `AppId` varchar(32) NOT NULL DEFAULT '' COMMENT 'App id',
  `ParentClusterId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父cluster',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_AppId_Name` (`AppId`,`Name`),
  KEY `IX_ParentClusterId` (`ParentClusterId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='集群';

-- ----------------------------
-- Records of Cluster
-- ----------------------------
INSERT INTO `Cluster` VALUES ('1', 'default', 'SampleApp', '0', '\0', '', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
INSERT INTO `Cluster` VALUES ('2', 'default', 'seata', '0', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Cluster` VALUES ('3', 'default', 'mytx', '0', '\0', 'apollo', '2020-01-19 11:15:19', 'apollo', '2020-01-19 11:15:19');

-- ----------------------------
-- Table structure for Commit
-- ----------------------------
DROP TABLE IF EXISTS `Commit`;
CREATE TABLE `Commit` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ChangeSets` longtext NOT NULL COMMENT '修改变更集',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Comment` varchar(500) DEFAULT NULL COMMENT '备注',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `AppId` (`AppId`(191)),
  KEY `ClusterName` (`ClusterName`(191)),
  KEY `NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COMMENT='commit 历史表';

-- ----------------------------
-- Records of Commit
-- ----------------------------
INSERT INTO `Commit` VALUES ('1', '{\"createItems\":[{\"namespaceId\":1,\"key\":\"gateway.server.port\",\"value\":\"8100\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-07 09:59:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-07 09:59:02\"}],\"updateItems\":[],\"deleteItems\":[]}', 'SampleApp', 'default', 'application', null, '\0', 'apollo', '2020-01-07 09:59:02', 'apollo', '2020-01-07 09:59:02');
INSERT INTO `Commit` VALUES ('2', '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"gateway.server.port\",\"value\":\"8100\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-07 09:59:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-07 09:59:02\"},\"newItem\":{\"namespaceId\":1,\"key\":\"gateway.server.port\",\"value\":\"8091\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-07 09:59:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-07 10:05:38\"}}],\"deleteItems\":[]}', 'SampleApp', 'default', 'application', null, '\0', 'apollo', '2020-01-07 10:05:39', 'apollo', '2020-01-07 10:05:39');
INSERT INTO `Commit` VALUES ('3', '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"gateway.server.port\",\"value\":\"8091\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-07 09:59:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-07 10:05:39\"},\"newItem\":{\"namespaceId\":1,\"key\":\"gateway.server.port\",\"value\":\"8092\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-07 09:59:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-07 10:09:59\"}}],\"deleteItems\":[]}', 'SampleApp', 'default', 'application', null, '\0', 'apollo', '2020-01-07 10:09:59', 'apollo', '2020-01-07 10:09:59');
INSERT INTO `Commit` VALUES ('4', '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":1,\"key\":\"gateway.server.port\",\"value\":\"8092\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-07 09:59:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-07 10:09:59\"},\"newItem\":{\"namespaceId\":1,\"key\":\"gateway.server.port\",\"value\":\"8093\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-07 09:59:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-07 10:11:09\"}}],\"deleteItems\":[]}', 'SampleApp', 'default', 'application', null, '\0', 'apollo', '2020-01-07 10:11:09', 'apollo', '2020-01-07 10:11:09');
INSERT INTO `Commit` VALUES ('5', '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":1,\"key\":\"gateway.server.port\",\"value\":\"8093\",\"comment\":\"\",\"lineNum\":2,\"id\":2,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-07 09:59:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-07 10:34:05\"}]}', 'SampleApp', 'default', 'application', null, '\0', 'apollo', '2020-01-07 10:34:06', 'apollo', '2020-01-07 10:34:06');
INSERT INTO `Commit` VALUES ('6', '{\"createItems\":[{\"namespaceId\":1,\"key\":\"article.server.port\",\"value\":\"8091\",\"lineNum\":2,\"id\":3,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-07 10:36:16\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-07 10:36:16\"}],\"updateItems\":[],\"deleteItems\":[]}', 'SampleApp', 'default', 'application', null, '\0', 'apollo', '2020-01-07 10:36:17', 'apollo', '2020-01-07 10:36:17');
INSERT INTO `Commit` VALUES ('7', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"cloud.datasource.account.url\",\"value\":\"jdbc:mysql://192.168.0.18:3306/account_seata\",\"lineNum\":1,\"id\":4,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 11:38:13\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 11:38:13\"}],\"updateItems\":[],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 11:38:14', 'apollo', '2020-01-17 11:38:14');
INSERT INTO `Commit` VALUES ('8', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"cloud.datasource.account.username\",\"value\":\"root\",\"lineNum\":2,\"id\":5,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 11:38:49\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 11:38:49\"}],\"updateItems\":[],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 11:38:50', 'apollo', '2020-01-17 11:38:50');
INSERT INTO `Commit` VALUES ('9', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"cloud.datasource.account.password\",\"value\":\"SaaSTest123!\",\"lineNum\":3,\"id\":6,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 11:39:26\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 11:39:26\"}],\"updateItems\":[],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 11:39:27', 'apollo', '2020-01-17 11:39:27');
INSERT INTO `Commit` VALUES ('10', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"cloud.datasource.storage.url\",\"value\":\"1\",\"lineNum\":4,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 13:48:54\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 13:48:54\"}],\"updateItems\":[],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 13:48:55', 'apollo', '2020-01-17 13:48:55');
INSERT INTO `Commit` VALUES ('11', '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":2,\"key\":\"cloud.datasource.storage.url\",\"value\":\"1\",\"lineNum\":4,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 13:48:55\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 13:48:55\"},\"newItem\":{\"namespaceId\":2,\"key\":\"cloud.datasource.storage.url\",\"value\":\"jdbc:mysql://192.168.0.18:3306/storage_seata\",\"comment\":\"\",\"lineNum\":4,\"id\":7,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 13:48:55\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 13:49:14\"}}],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 13:49:15', 'apollo', '2020-01-17 13:49:15');
INSERT INTO `Commit` VALUES ('12', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"cloud.datasource.storage.username\",\"value\":\"root\",\"lineNum\":5,\"id\":8,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 13:50:27\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 13:50:27\"}],\"updateItems\":[],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 13:50:28', 'apollo', '2020-01-17 13:50:28');
INSERT INTO `Commit` VALUES ('13', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"cloud.datasource.storage.password\",\"value\":\"SaaSTest123!\",\"lineNum\":6,\"id\":9,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 13:51:04\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 13:51:04\"}],\"updateItems\":[],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 13:51:05', 'apollo', '2020-01-17 13:51:05');
INSERT INTO `Commit` VALUES ('14', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"cloud.datasource.order.url\",\"value\":\"1\",\"lineNum\":7,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 13:54:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 13:54:02\"}],\"updateItems\":[],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 13:54:03', 'apollo', '2020-01-17 13:54:03');
INSERT INTO `Commit` VALUES ('15', '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":2,\"key\":\"cloud.datasource.order.url\",\"value\":\"1\",\"lineNum\":7,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 13:54:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 13:54:02\"},\"newItem\":{\"namespaceId\":2,\"key\":\"cloud.datasource.order.url\",\"value\":\"jdbc:mysql://192.168.0.18:3306/order_seata\",\"comment\":\"\",\"lineNum\":7,\"id\":10,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 13:54:02\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 13:54:20\"}}],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 13:54:21', 'apollo', '2020-01-17 13:54:21');
INSERT INTO `Commit` VALUES ('16', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"cloud.datasource.order.username\",\"value\":\"root\",\"lineNum\":8,\"id\":11,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 13:54:36\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 13:54:36\"}],\"updateItems\":[],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 13:54:36', 'apollo', '2020-01-17 13:54:36');
INSERT INTO `Commit` VALUES ('17', '{\"createItems\":[{\"namespaceId\":2,\"key\":\"cloud.datasource.order.password\",\"value\":\"SaaSTest123!\",\"lineNum\":9,\"id\":12,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-17 13:54:57\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-17 13:54:57\"}],\"updateItems\":[],\"deleteItems\":[]}', 'seata', 'default', 'application', null, '\0', 'apollo', '2020-01-17 13:54:57', 'apollo', '2020-01-17 13:54:57');
INSERT INTO `Commit` VALUES ('18', '{\"createItems\":[{\"namespaceId\":3,\"key\":\"cloud.datasource.username\",\"value\":\"root\",\"lineNum\":1,\"id\":13,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-19 11:16:11\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-19 11:16:11\"}],\"updateItems\":[],\"deleteItems\":[]}', 'mytx', 'default', 'application', null, '\0', 'apollo', '2020-01-19 11:16:11', 'apollo', '2020-01-19 11:16:11');
INSERT INTO `Commit` VALUES ('19', '{\"createItems\":[{\"namespaceId\":3,\"key\":\"cloud.datasource.password\",\"value\":\"SaaSTest123!\",\"lineNum\":2,\"id\":14,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-19 11:16:50\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-19 11:16:50\"}],\"updateItems\":[],\"deleteItems\":[]}', 'mytx', 'default', 'application', null, '\0', 'apollo', '2020-01-19 11:16:51', 'apollo', '2020-01-19 11:16:51');
INSERT INTO `Commit` VALUES ('20', '{\"createItems\":[{\"namespaceId\":3,\"key\":\"cloud.tx.datasource.stock.url\",\"value\":\"jdbc:mysql://192.168.0.18:3306/stock\",\"lineNum\":3,\"id\":15,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-19 11:17:38\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-19 11:17:38\"}],\"updateItems\":[],\"deleteItems\":[]}', 'mytx', 'default', 'application', null, '\0', 'apollo', '2020-01-19 11:17:38', 'apollo', '2020-01-19 11:17:38');
INSERT INTO `Commit` VALUES ('21', '{\"createItems\":[{\"namespaceId\":3,\"key\":\"cloud.tx.datasource.order.url\",\"value\":\"jdbc:mysql://192.168.0.18:3306/order\",\"lineNum\":4,\"id\":16,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-19 11:18:22\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-19 11:18:22\"}],\"updateItems\":[],\"deleteItems\":[]}', 'mytx', 'default', 'application', null, '\0', 'apollo', '2020-01-19 11:18:22', 'apollo', '2020-01-19 11:18:22');
INSERT INTO `Commit` VALUES ('22', '{\"createItems\":[{\"namespaceId\":3,\"key\":\"cloud.datasource.message.url\",\"value\":\"jdbc:mysql://192.168.0.18:3306/tc\",\"lineNum\":5,\"id\":17,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-19 12:08:26\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-19 12:08:26\"}],\"updateItems\":[],\"deleteItems\":[]}', 'mytx', 'default', 'application', null, '\0', 'apollo', '2020-01-19 12:08:27', 'apollo', '2020-01-19 12:08:27');
INSERT INTO `Commit` VALUES ('23', '{\"createItems\":[],\"updateItems\":[],\"deleteItems\":[{\"namespaceId\":3,\"key\":\"cloud.datasource.message.url\",\"value\":\"jdbc:mysql://192.168.0.18:3306/tc\",\"lineNum\":5,\"id\":17,\"isDeleted\":true,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-19 12:08:27\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-19 12:12:44\"}]}', 'mytx', 'default', 'application', null, '\0', 'apollo', '2020-01-19 12:12:44', 'apollo', '2020-01-19 12:12:44');
INSERT INTO `Commit` VALUES ('24', '{\"createItems\":[{\"namespaceId\":3,\"key\":\"cloud.tx.datasource.message.url\",\"value\":\"jdbc:mysql://192.168.0.18:3306/tx\",\"lineNum\":5,\"id\":18,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-19 12:13:22\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-19 12:13:22\"}],\"updateItems\":[],\"deleteItems\":[]}', 'mytx', 'default', 'application', null, '\0', 'apollo', '2020-01-19 12:13:23', 'apollo', '2020-01-19 12:13:23');
INSERT INTO `Commit` VALUES ('25', '{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":3,\"key\":\"cloud.tx.datasource.message.url\",\"value\":\"jdbc:mysql://192.168.0.18:3306/tx\",\"lineNum\":5,\"id\":18,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-19 12:13:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-19 12:13:23\"},\"newItem\":{\"namespaceId\":3,\"key\":\"cloud.tx.datasource.message.url\",\"value\":\"jdbc:mysql://192.168.0.18:3306/tc\",\"comment\":\"\",\"lineNum\":5,\"id\":18,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2020-01-19 12:13:23\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2020-01-19 13:04:15\"}}],\"deleteItems\":[]}', 'mytx', 'default', 'application', null, '\0', 'apollo', '2020-01-19 13:04:16', 'apollo', '2020-01-19 13:04:16');

-- ----------------------------
-- Table structure for GrayReleaseRule
-- ----------------------------
DROP TABLE IF EXISTS `GrayReleaseRule`;
CREATE TABLE `GrayReleaseRule` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'branch name',
  `Rules` varchar(16000) DEFAULT '[]' COMMENT '灰度规则',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '灰度对应的release',
  `BranchStatus` tinyint(2) DEFAULT '1' COMMENT '灰度分支状态: 0:删除分支,1:正在使用的规则 2：全量发布',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='灰度规则表';

-- ----------------------------
-- Records of GrayReleaseRule
-- ----------------------------

-- ----------------------------
-- Table structure for Instance
-- ----------------------------
DROP TABLE IF EXISTS `Instance`;
CREATE TABLE `Instance` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `DataCenter` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
  `Ip` varchar(32) NOT NULL DEFAULT '' COMMENT 'instance ip',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`AppId`,`ClusterName`,`Ip`,`DataCenter`),
  KEY `IX_IP` (`Ip`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='使用配置的应用实例';

-- ----------------------------
-- Records of Instance
-- ----------------------------
INSERT INTO `Instance` VALUES ('1', 'SampleApp', 'default', '', '10.0.75.1', '2020-01-07 10:08:50', '2020-01-07 10:08:50');
INSERT INTO `Instance` VALUES ('2', 'seata', 'default', '', '10.0.75.1', '2020-01-17 12:00:42', '2020-01-17 12:00:42');
INSERT INTO `Instance` VALUES ('3', 'mytx', 'default', '', '10.0.75.1', '2020-01-19 11:27:30', '2020-01-19 11:27:30');

-- ----------------------------
-- Table structure for InstanceConfig
-- ----------------------------
DROP TABLE IF EXISTS `InstanceConfig`;
CREATE TABLE `InstanceConfig` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `InstanceId` int(11) unsigned DEFAULT NULL COMMENT 'Instance Id',
  `ConfigAppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
  `ConfigClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
  `ConfigNamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `ReleaseDeliveryTime` timestamp NULL DEFAULT NULL COMMENT '配置获取时间',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_UNIQUE_KEY` (`InstanceId`,`ConfigAppId`,`ConfigNamespaceName`),
  KEY `IX_ReleaseKey` (`ReleaseKey`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Valid_Namespace` (`ConfigAppId`,`ConfigClusterName`,`ConfigNamespaceName`,`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='应用实例的配置信息';

-- ----------------------------
-- Records of InstanceConfig
-- ----------------------------
INSERT INTO `InstanceConfig` VALUES ('1', '1', 'SampleApp', 'default', 'application', '20200107103622-1dc5d3c90b52d186', '2020-01-07 10:36:22', '2020-01-07 10:08:49', '2020-01-08 10:26:27');
INSERT INTO `InstanceConfig` VALUES ('2', '2', 'seata', 'default', 'application', '20200117135505-8f8a7d158c30ab31', '2020-01-17 13:55:05', '2020-01-17 12:00:41', '2020-01-17 13:55:06');
INSERT INTO `InstanceConfig` VALUES ('3', '3', 'mytx', 'default', 'application', '20200119130420-40beccb57eb13077', '2020-01-19 13:04:21', '2020-01-19 11:27:30', '2020-01-19 13:04:22');

-- ----------------------------
-- Table structure for Item
-- ----------------------------
DROP TABLE IF EXISTS `Item`;
CREATE TABLE `Item` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `Key` varchar(128) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Value` longtext NOT NULL COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `LineNum` int(10) unsigned DEFAULT '0' COMMENT '行号',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_GroupId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='配置项目';

-- ----------------------------
-- Records of Item
-- ----------------------------
INSERT INTO `Item` VALUES ('1', '1', 'timeout', '100', 'sample timeout配置', '1', '\0', 'default', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
INSERT INTO `Item` VALUES ('2', '1', 'gateway.server.port', '8093', '', '2', '', 'apollo', '2020-01-07 09:59:02', 'apollo', '2020-01-07 10:34:06');
INSERT INTO `Item` VALUES ('3', '1', 'article.server.port', '8091', null, '2', '\0', 'apollo', '2020-01-07 10:36:17', 'apollo', '2020-01-07 10:36:17');
INSERT INTO `Item` VALUES ('4', '2', 'cloud.datasource.account.url', 'jdbc:mysql://192.168.0.18:3306/account_seata', null, '1', '\0', 'apollo', '2020-01-17 11:38:14', 'apollo', '2020-01-17 11:38:14');
INSERT INTO `Item` VALUES ('5', '2', 'cloud.datasource.account.username', 'root', null, '2', '\0', 'apollo', '2020-01-17 11:38:50', 'apollo', '2020-01-17 11:38:50');
INSERT INTO `Item` VALUES ('6', '2', 'cloud.datasource.account.password', 'SaaSTest123!', null, '3', '\0', 'apollo', '2020-01-17 11:39:26', 'apollo', '2020-01-17 11:39:26');
INSERT INTO `Item` VALUES ('7', '2', 'cloud.datasource.storage.url', 'jdbc:mysql://192.168.0.18:3306/storage_seata', '', '4', '\0', 'apollo', '2020-01-17 13:48:55', 'apollo', '2020-01-17 13:49:15');
INSERT INTO `Item` VALUES ('8', '2', 'cloud.datasource.storage.username', 'root', null, '5', '\0', 'apollo', '2020-01-17 13:50:27', 'apollo', '2020-01-17 13:50:27');
INSERT INTO `Item` VALUES ('9', '2', 'cloud.datasource.storage.password', 'SaaSTest123!', null, '6', '\0', 'apollo', '2020-01-17 13:51:05', 'apollo', '2020-01-17 13:51:05');
INSERT INTO `Item` VALUES ('10', '2', 'cloud.datasource.order.url', 'jdbc:mysql://192.168.0.18:3306/order_seata', '', '7', '\0', 'apollo', '2020-01-17 13:54:02', 'apollo', '2020-01-17 13:54:21');
INSERT INTO `Item` VALUES ('11', '2', 'cloud.datasource.order.username', 'root', null, '8', '\0', 'apollo', '2020-01-17 13:54:36', 'apollo', '2020-01-17 13:54:36');
INSERT INTO `Item` VALUES ('12', '2', 'cloud.datasource.order.password', 'SaaSTest123!', null, '9', '\0', 'apollo', '2020-01-17 13:54:57', 'apollo', '2020-01-17 13:54:57');
INSERT INTO `Item` VALUES ('13', '3', 'cloud.datasource.username', 'root', null, '1', '\0', 'apollo', '2020-01-19 11:16:11', 'apollo', '2020-01-19 11:16:11');
INSERT INTO `Item` VALUES ('14', '3', 'cloud.datasource.password', 'SaaSTest123!', null, '2', '\0', 'apollo', '2020-01-19 11:16:51', 'apollo', '2020-01-19 11:16:51');
INSERT INTO `Item` VALUES ('15', '3', 'cloud.tx.datasource.stock.url', 'jdbc:mysql://192.168.0.18:3306/stock', null, '3', '\0', 'apollo', '2020-01-19 11:17:38', 'apollo', '2020-01-19 11:17:38');
INSERT INTO `Item` VALUES ('16', '3', 'cloud.tx.datasource.order.url', 'jdbc:mysql://192.168.0.18:3306/order', null, '4', '\0', 'apollo', '2020-01-19 11:18:22', 'apollo', '2020-01-19 11:18:22');
INSERT INTO `Item` VALUES ('17', '3', 'cloud.datasource.message.url', 'jdbc:mysql://192.168.0.18:3306/tc', null, '5', '', 'apollo', '2020-01-19 12:08:27', 'apollo', '2020-01-19 12:12:44');
INSERT INTO `Item` VALUES ('18', '3', 'cloud.tx.datasource.message.url', 'jdbc:mysql://192.168.0.18:3306/tc', '', '5', '\0', 'apollo', '2020-01-19 12:13:23', 'apollo', '2020-01-19 13:04:15');

-- ----------------------------
-- Table structure for Namespace
-- ----------------------------
DROP TABLE IF EXISTS `Namespace`;
CREATE TABLE `Namespace` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_NamespaceName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='命名空间';

-- ----------------------------
-- Records of Namespace
-- ----------------------------
INSERT INTO `Namespace` VALUES ('1', 'SampleApp', 'default', 'application', '\0', 'default', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
INSERT INTO `Namespace` VALUES ('2', 'seata', 'default', 'application', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Namespace` VALUES ('3', 'mytx', 'default', 'application', '\0', 'apollo', '2020-01-19 11:15:19', 'apollo', '2020-01-19 11:15:19');

-- ----------------------------
-- Table structure for NamespaceLock
-- ----------------------------
DROP TABLE IF EXISTS `NamespaceLock`;
CREATE TABLE `NamespaceLock` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '集群NamespaceId',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT 'default' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `IsDeleted` bit(1) DEFAULT b'0' COMMENT '软删除',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_NamespaceId` (`NamespaceId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='namespace的编辑锁';

-- ----------------------------
-- Records of NamespaceLock
-- ----------------------------

-- ----------------------------
-- Table structure for Release
-- ----------------------------
DROP TABLE IF EXISTS `Release`;
CREATE TABLE `Release` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '发布的Key',
  `Name` varchar(64) NOT NULL DEFAULT 'default' COMMENT '发布名字',
  `Comment` varchar(256) DEFAULT NULL COMMENT '发布说明',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `Configurations` longtext NOT NULL COMMENT '发布配置',
  `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否废弃',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId_ClusterName_GroupName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ReleaseKey` (`ReleaseKey`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='发布';

-- ----------------------------
-- Records of Release
-- ----------------------------
INSERT INTO `Release` VALUES ('1', '20161009155425-d3a0749c6e20bc15', '20161009155424-release', 'Sample发布', 'SampleApp', 'default', 'application', '{\"timeout\":\"100\"}', '\0', '\0', 'default', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
INSERT INTO `Release` VALUES ('2', '20200107095934-1dc5d3c90b52d181', '20200107095917-release', '网关端口', 'SampleApp', 'default', 'application', '{\"gateway.server.port\":\"8100\",\"timeout\":\"100\"}', '\0', '\0', 'apollo', '2020-01-07 09:59:35', 'apollo', '2020-01-07 09:59:35');
INSERT INTO `Release` VALUES ('3', '20200107100543-1dc5d3c90b52d182', '20200107100540-release', '网关端口', 'SampleApp', 'default', 'application', '{\"gateway.server.port\":\"8091\",\"timeout\":\"100\"}', '\0', '\0', 'apollo', '2020-01-07 10:05:43', 'apollo', '2020-01-07 10:05:43');
INSERT INTO `Release` VALUES ('4', '20200107101003-1dc5d3c90b52d183', '20200107101001-release', '网关端口', 'SampleApp', 'default', 'application', '{\"gateway.server.port\":\"8092\",\"timeout\":\"100\"}', '\0', '\0', 'apollo', '2020-01-07 10:10:03', 'apollo', '2020-01-07 10:10:03');
INSERT INTO `Release` VALUES ('5', '20200107101112-1dc5d3c90b52d184', '20200107101110-release', '网关端口', 'SampleApp', 'default', 'application', '{\"gateway.server.port\":\"8093\",\"timeout\":\"100\"}', '\0', '\0', 'apollo', '2020-01-07 10:11:12', 'apollo', '2020-01-07 10:11:12');
INSERT INTO `Release` VALUES ('6', '20200107103523-1dc5d3c90b52d185', '20200107103520-release', '', 'SampleApp', 'default', 'application', '{\"timeout\":\"100\"}', '\0', '\0', 'apollo', '2020-01-07 10:35:23', 'apollo', '2020-01-07 10:35:23');
INSERT INTO `Release` VALUES ('7', '20200107103622-1dc5d3c90b52d186', '20200107103620-release', '', 'SampleApp', 'default', 'application', '{\"article.server.port\":\"8091\",\"timeout\":\"100\"}', '\0', '\0', 'apollo', '2020-01-07 10:36:22', 'apollo', '2020-01-07 10:36:22');
INSERT INTO `Release` VALUES ('8', '20200117120040-8f8a7d158c30ab2f', '20200117120020-release', 'account数据库', 'seata', 'default', 'application', '{\"cloud.datasource.account.password\":\"SaaSTest123!\",\"cloud.datasource.account.username\":\"root\",\"cloud.datasource.account.url\":\"jdbc:mysql://192.168.0.18:3306/account_seata\"}', '\0', '\0', 'apollo', '2020-01-17 12:00:41', 'apollo', '2020-01-17 12:00:41');
INSERT INTO `Release` VALUES ('9', '20200117135122-8f8a7d158c30ab30', '20200117135113-release', 'storage数据库', 'seata', 'default', 'application', '{\"cloud.datasource.account.password\":\"SaaSTest123!\",\"cloud.datasource.storage.url\":\"jdbc:mysql://192.168.0.18:3306/storage_seata\",\"cloud.datasource.storage.username\":\"root\",\"cloud.datasource.account.username\":\"root\",\"cloud.datasource.account.url\":\"jdbc:mysql://192.168.0.18:3306/account_seata\",\"cloud.datasource.storage.password\":\"SaaSTest123!\"}', '\0', '\0', 'apollo', '2020-01-17 13:51:23', 'apollo', '2020-01-17 13:51:23');
INSERT INTO `Release` VALUES ('10', '20200117135505-8f8a7d158c30ab31', '20200117135459-release', 'order数据库', 'seata', 'default', 'application', '{\"cloud.datasource.order.password\":\"SaaSTest123!\",\"cloud.datasource.account.password\":\"SaaSTest123!\",\"cloud.datasource.storage.url\":\"jdbc:mysql://192.168.0.18:3306/storage_seata\",\"cloud.datasource.storage.username\":\"root\",\"cloud.datasource.account.username\":\"root\",\"cloud.datasource.order.username\":\"root\",\"cloud.datasource.account.url\":\"jdbc:mysql://192.168.0.18:3306/account_seata\",\"cloud.datasource.order.url\":\"jdbc:mysql://192.168.0.18:3306/order_seata\",\"cloud.datasource.storage.password\":\"SaaSTest123!\"}', '\0', '\0', 'apollo', '2020-01-17 13:55:05', 'apollo', '2020-01-17 13:55:05');
INSERT INTO `Release` VALUES ('11', '20200119112030-40beccb57eb13073', '20200119112027-release', '', 'mytx', 'default', 'application', '{\"cloud.datasource.username\":\"root\",\"cloud.tx.datasource.stock.url\":\"jdbc:mysql://192.168.0.18:3306/stock\",\"cloud.tx.datasource.order.url\":\"jdbc:mysql://192.168.0.18:3306/order\",\"cloud.datasource.password\":\"SaaSTest123!\"}', '\0', '\0', 'apollo', '2020-01-19 11:20:31', 'apollo', '2020-01-19 11:20:31');
INSERT INTO `Release` VALUES ('12', '20200119120832-40beccb57eb13074', '20200119120828-release', '', 'mytx', 'default', 'application', '{\"cloud.datasource.message.url\":\"jdbc:mysql://192.168.0.18:3306/tc\",\"cloud.datasource.username\":\"root\",\"cloud.tx.datasource.stock.url\":\"jdbc:mysql://192.168.0.18:3306/stock\",\"cloud.tx.datasource.order.url\":\"jdbc:mysql://192.168.0.18:3306/order\",\"cloud.datasource.password\":\"SaaSTest123!\"}', '\0', '\0', 'apollo', '2020-01-19 12:08:33', 'apollo', '2020-01-19 12:08:33');
INSERT INTO `Release` VALUES ('13', '20200119121248-40beccb57eb13075', '20200119121246-release', '', 'mytx', 'default', 'application', '{\"cloud.datasource.username\":\"root\",\"cloud.tx.datasource.stock.url\":\"jdbc:mysql://192.168.0.18:3306/stock\",\"cloud.tx.datasource.order.url\":\"jdbc:mysql://192.168.0.18:3306/order\",\"cloud.datasource.password\":\"SaaSTest123!\"}', '\0', '\0', 'apollo', '2020-01-19 12:12:49', 'apollo', '2020-01-19 12:12:49');
INSERT INTO `Release` VALUES ('14', '20200119121327-40beccb57eb13076', '20200119121325-release', '', 'mytx', 'default', 'application', '{\"cloud.datasource.username\":\"root\",\"cloud.tx.datasource.stock.url\":\"jdbc:mysql://192.168.0.18:3306/stock\",\"cloud.tx.datasource.message.url\":\"jdbc:mysql://192.168.0.18:3306/tx\",\"cloud.tx.datasource.order.url\":\"jdbc:mysql://192.168.0.18:3306/order\",\"cloud.datasource.password\":\"SaaSTest123!\"}', '\0', '\0', 'apollo', '2020-01-19 12:13:27', 'apollo', '2020-01-19 12:13:27');
INSERT INTO `Release` VALUES ('15', '20200119130420-40beccb57eb13077', '20200119130418-release', '', 'mytx', 'default', 'application', '{\"cloud.datasource.username\":\"root\",\"cloud.tx.datasource.stock.url\":\"jdbc:mysql://192.168.0.18:3306/stock\",\"cloud.tx.datasource.message.url\":\"jdbc:mysql://192.168.0.18:3306/tc\",\"cloud.tx.datasource.order.url\":\"jdbc:mysql://192.168.0.18:3306/order\",\"cloud.datasource.password\":\"SaaSTest123!\"}', '\0', '\0', 'apollo', '2020-01-19 13:04:21', 'apollo', '2020-01-19 13:04:21');

-- ----------------------------
-- Table structure for ReleaseHistory
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseHistory`;
CREATE TABLE `ReleaseHistory` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `AppId` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT '发布分支名',
  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联的Release Id',
  `PreviousReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '前一次发布的ReleaseId',
  `Operation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布类型，0: 普通发布，1: 回滚，2: 灰度发布，3: 灰度规则更新，4: 灰度合并回主分支发布，5: 主分支发布灰度自动发布，6: 主分支回滚灰度自动发布，7: 放弃灰度',
  `OperationContext` longtext NOT NULL COMMENT '发布上下文信息',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`,`BranchName`),
  KEY `IX_ReleaseId` (`ReleaseId`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='发布历史';

-- ----------------------------
-- Records of ReleaseHistory
-- ----------------------------
INSERT INTO `ReleaseHistory` VALUES ('1', 'SampleApp', 'default', 'application', 'default', '1', '0', '0', '{}', '\0', 'apollo', '2020-01-06 17:39:11', 'apollo', '2020-01-06 17:39:11');
INSERT INTO `ReleaseHistory` VALUES ('2', 'SampleApp', 'default', 'application', 'default', '2', '1', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-07 09:59:35', 'apollo', '2020-01-07 09:59:35');
INSERT INTO `ReleaseHistory` VALUES ('3', 'SampleApp', 'default', 'application', 'default', '3', '2', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-07 10:05:43', 'apollo', '2020-01-07 10:05:43');
INSERT INTO `ReleaseHistory` VALUES ('4', 'SampleApp', 'default', 'application', 'default', '4', '3', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-07 10:10:03', 'apollo', '2020-01-07 10:10:03');
INSERT INTO `ReleaseHistory` VALUES ('5', 'SampleApp', 'default', 'application', 'default', '5', '4', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-07 10:11:12', 'apollo', '2020-01-07 10:11:12');
INSERT INTO `ReleaseHistory` VALUES ('6', 'SampleApp', 'default', 'application', 'default', '6', '5', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-07 10:35:23', 'apollo', '2020-01-07 10:35:23');
INSERT INTO `ReleaseHistory` VALUES ('7', 'SampleApp', 'default', 'application', 'default', '7', '6', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-07 10:36:22', 'apollo', '2020-01-07 10:36:22');
INSERT INTO `ReleaseHistory` VALUES ('8', 'seata', 'default', 'application', 'default', '8', '0', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-17 12:00:41', 'apollo', '2020-01-17 12:00:41');
INSERT INTO `ReleaseHistory` VALUES ('9', 'seata', 'default', 'application', 'default', '9', '8', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-17 13:51:23', 'apollo', '2020-01-17 13:51:23');
INSERT INTO `ReleaseHistory` VALUES ('10', 'seata', 'default', 'application', 'default', '10', '9', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-17 13:55:05', 'apollo', '2020-01-17 13:55:05');
INSERT INTO `ReleaseHistory` VALUES ('11', 'mytx', 'default', 'application', 'default', '11', '0', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-19 11:20:31', 'apollo', '2020-01-19 11:20:31');
INSERT INTO `ReleaseHistory` VALUES ('12', 'mytx', 'default', 'application', 'default', '12', '11', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-19 12:08:33', 'apollo', '2020-01-19 12:08:33');
INSERT INTO `ReleaseHistory` VALUES ('13', 'mytx', 'default', 'application', 'default', '13', '12', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-19 12:12:49', 'apollo', '2020-01-19 12:12:49');
INSERT INTO `ReleaseHistory` VALUES ('14', 'mytx', 'default', 'application', 'default', '14', '13', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-19 12:13:27', 'apollo', '2020-01-19 12:13:27');
INSERT INTO `ReleaseHistory` VALUES ('15', 'mytx', 'default', 'application', 'default', '15', '14', '0', '{\"isEmergencyPublish\":false}', '\0', 'apollo', '2020-01-19 13:04:21', 'apollo', '2020-01-19 13:04:21');

-- ----------------------------
-- Table structure for ReleaseMessage
-- ----------------------------
DROP TABLE IF EXISTS `ReleaseMessage`;
CREATE TABLE `ReleaseMessage` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `Message` varchar(1024) NOT NULL DEFAULT '' COMMENT '发布的消息内容',
  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_Message` (`Message`(191))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='发布消息';

-- ----------------------------
-- Records of ReleaseMessage
-- ----------------------------
INSERT INTO `ReleaseMessage` VALUES ('6', 'SampleApp+default+application', '2020-01-07 10:36:22');
INSERT INTO `ReleaseMessage` VALUES ('9', 'seata+default+application', '2020-01-17 13:55:05');
INSERT INTO `ReleaseMessage` VALUES ('14', 'mytx+default+application', '2020-01-19 13:04:21');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
  `Cluster` varchar(32) NOT NULL DEFAULT 'default' COMMENT '配置对应的集群，default为不针对特定的集群',
  `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '配置项值',
  `Comment` varchar(1024) DEFAULT '' COMMENT '注释',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_Key` (`Key`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES ('1', 'eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔', '\0', 'default', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
INSERT INTO `ServerConfig` VALUES ('2', 'namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关', '\0', 'default', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
INSERT INTO `ServerConfig` VALUES ('3', 'item.value.length.limit', 'default', '20000', 'item value最大长度限制', '\0', 'default', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
INSERT INTO `ServerConfig` VALUES ('4', 'config-service.cache.enabled', 'default', 'false', 'ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！', '\0', 'default', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
INSERT INTO `ServerConfig` VALUES ('5', 'item.key.length.limit', 'default', '128', 'item key 最大长度限制', '\0', 'default', '2020-01-06 17:39:11', '', '2020-01-06 17:39:11');
