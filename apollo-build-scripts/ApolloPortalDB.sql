/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.18
Source Server Version : 50724
Source Host           : 192.168.0.18:3306
Source Database       : ApolloPortalDB

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-01-17 18:30:43
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';

-- ----------------------------
-- Records of App
-- ----------------------------
INSERT INTO `App` VALUES ('1', 'SampleApp', 'Sample App', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `App` VALUES ('2', 'seata', 'apollo-server', 'TEST1', '样例部门1', 'apollo', 'apollo@acme.com', '\0', 'apollo', '2020-01-17 11:28:40', 'apollo', '2020-01-17 11:28:40');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='应用namespace定义';

-- ----------------------------
-- Records of AppNamespace
-- ----------------------------
INSERT INTO `AppNamespace` VALUES ('1', 'application', 'SampleApp', 'properties', '\0', 'default app namespace', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `AppNamespace` VALUES ('2', 'application', 'seata', 'properties', '\0', 'default app namespace', '\0', 'apollo', '2020-01-17 11:28:40', 'apollo', '2020-01-17 11:28:40');

-- ----------------------------
-- Table structure for Authorities
-- ----------------------------
DROP TABLE IF EXISTS `Authorities`;
CREATE TABLE `Authorities` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL,
  `Authority` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of Authorities
-- ----------------------------
INSERT INTO `Authorities` VALUES ('1', 'apollo', 'ROLE_user');

-- ----------------------------
-- Table structure for Consumer
-- ----------------------------
DROP TABLE IF EXISTS `Consumer`;
CREATE TABLE `Consumer` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
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
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='开放API消费者';

-- ----------------------------
-- Records of Consumer
-- ----------------------------

-- ----------------------------
-- Table structure for ConsumerAudit
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerAudit`;
CREATE TABLE `ConsumerAudit` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `Uri` varchar(1024) NOT NULL DEFAULT '' COMMENT '访问的Uri',
  `Method` varchar(16) NOT NULL DEFAULT '' COMMENT '访问的Method',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_ConsumerId` (`ConsumerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer审计表';

-- ----------------------------
-- Records of ConsumerAudit
-- ----------------------------

-- ----------------------------
-- Table structure for ConsumerRole
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerRole`;
CREATE TABLE `ConsumerRole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_ConsumerId_RoleId` (`ConsumerId`,`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer和role的绑定表';

-- ----------------------------
-- Records of ConsumerRole
-- ----------------------------

-- ----------------------------
-- Table structure for ConsumerToken
-- ----------------------------
DROP TABLE IF EXISTS `ConsumerToken`;
CREATE TABLE `ConsumerToken` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'ConsumerId',
  `Token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
  `Expires` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token失效时间',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `IX_Token` (`Token`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer token表';

-- ----------------------------
-- Records of ConsumerToken
-- ----------------------------

-- ----------------------------
-- Table structure for Favorite
-- ----------------------------
DROP TABLE IF EXISTS `Favorite`;
CREATE TABLE `Favorite` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UserId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '收藏的用户',
  `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
  `Position` int(32) NOT NULL DEFAULT '10000' COMMENT '收藏顺序',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `AppId` (`AppId`(191)),
  KEY `IX_UserId` (`UserId`),
  KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='应用收藏表';

-- ----------------------------
-- Records of Favorite
-- ----------------------------

-- ----------------------------
-- Table structure for Permission
-- ----------------------------
DROP TABLE IF EXISTS `Permission`;
CREATE TABLE `Permission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `PermissionType` varchar(32) NOT NULL DEFAULT '' COMMENT '权限类型',
  `TargetId` varchar(256) NOT NULL DEFAULT '' COMMENT '权限对象类型',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_TargetId_PermissionType` (`TargetId`(191),`PermissionType`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='permission表';

-- ----------------------------
-- Records of Permission
-- ----------------------------
INSERT INTO `Permission` VALUES ('1', 'CreateCluster', 'SampleApp', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `Permission` VALUES ('2', 'CreateNamespace', 'SampleApp', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `Permission` VALUES ('3', 'AssignRole', 'SampleApp', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `Permission` VALUES ('4', 'ModifyNamespace', 'SampleApp+application', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `Permission` VALUES ('5', 'ReleaseNamespace', 'SampleApp+application', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `Permission` VALUES ('6', 'CreateApplication', 'SystemRole', '\0', 'apollo', '2020-01-06 18:03:54', 'apollo', '2020-01-06 18:03:54');
INSERT INTO `Permission` VALUES ('7', 'ModifyNamespace', 'SampleApp+application+DEV', '\0', 'apollo', '2020-01-07 10:34:49', 'apollo', '2020-01-07 10:34:49');
INSERT INTO `Permission` VALUES ('8', 'ReleaseNamespace', 'SampleApp+application+DEV', '\0', 'apollo', '2020-01-07 10:34:49', 'apollo', '2020-01-07 10:34:49');
INSERT INTO `Permission` VALUES ('9', 'CreateNamespace', 'seata', '\0', 'apollo', '2020-01-17 11:28:40', 'apollo', '2020-01-17 11:28:40');
INSERT INTO `Permission` VALUES ('10', 'CreateCluster', 'seata', '\0', 'apollo', '2020-01-17 11:28:40', 'apollo', '2020-01-17 11:28:40');
INSERT INTO `Permission` VALUES ('11', 'AssignRole', 'seata', '\0', 'apollo', '2020-01-17 11:28:40', 'apollo', '2020-01-17 11:28:40');
INSERT INTO `Permission` VALUES ('12', 'ManageAppMaster', 'seata', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Permission` VALUES ('13', 'ModifyNamespace', 'seata+application', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Permission` VALUES ('14', 'ReleaseNamespace', 'seata+application', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Permission` VALUES ('15', 'ModifyNamespace', 'seata+application+DEV', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Permission` VALUES ('16', 'ReleaseNamespace', 'seata+application+DEV', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');

-- ----------------------------
-- Table structure for Role
-- ----------------------------
DROP TABLE IF EXISTS `Role`;
CREATE TABLE `Role` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleName` varchar(256) NOT NULL DEFAULT '' COMMENT 'Role name',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) NOT NULL DEFAULT 'default' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_RoleName` (`RoleName`(191)),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of Role
-- ----------------------------
INSERT INTO `Role` VALUES ('1', 'Master+SampleApp', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `Role` VALUES ('2', 'ModifyNamespace+SampleApp+application', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `Role` VALUES ('3', 'ReleaseNamespace+SampleApp+application', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `Role` VALUES ('4', 'CreateApplication+SystemRole', '\0', 'apollo', '2020-01-06 18:03:54', 'apollo', '2020-01-06 18:03:54');
INSERT INTO `Role` VALUES ('5', 'ModifyNamespace+SampleApp+application+DEV', '\0', 'apollo', '2020-01-07 10:34:49', 'apollo', '2020-01-07 10:34:49');
INSERT INTO `Role` VALUES ('6', 'ReleaseNamespace+SampleApp+application+DEV', '\0', 'apollo', '2020-01-07 10:34:49', 'apollo', '2020-01-07 10:34:49');
INSERT INTO `Role` VALUES ('7', 'Master+seata', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Role` VALUES ('8', 'ManageAppMaster+seata', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Role` VALUES ('9', 'ModifyNamespace+seata+application', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Role` VALUES ('10', 'ReleaseNamespace+seata+application', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Role` VALUES ('11', 'ModifyNamespace+seata+application+DEV', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `Role` VALUES ('12', 'ReleaseNamespace+seata+application+DEV', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');

-- ----------------------------
-- Table structure for RolePermission
-- ----------------------------
DROP TABLE IF EXISTS `RolePermission`;
CREATE TABLE `RolePermission` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `PermissionId` int(10) unsigned DEFAULT NULL COMMENT 'Permission Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_PermissionId` (`PermissionId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='角色和权限的绑定表';

-- ----------------------------
-- Records of RolePermission
-- ----------------------------
INSERT INTO `RolePermission` VALUES ('1', '1', '1', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `RolePermission` VALUES ('2', '1', '2', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `RolePermission` VALUES ('3', '1', '3', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `RolePermission` VALUES ('4', '2', '4', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `RolePermission` VALUES ('5', '3', '5', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `RolePermission` VALUES ('6', '4', '6', '\0', 'apollo', '2020-01-06 18:03:54', 'apollo', '2020-01-06 18:03:54');
INSERT INTO `RolePermission` VALUES ('7', '5', '7', '\0', 'apollo', '2020-01-07 10:34:49', 'apollo', '2020-01-07 10:34:49');
INSERT INTO `RolePermission` VALUES ('8', '6', '8', '\0', 'apollo', '2020-01-07 10:34:49', 'apollo', '2020-01-07 10:34:49');
INSERT INTO `RolePermission` VALUES ('9', '7', '9', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `RolePermission` VALUES ('10', '7', '10', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `RolePermission` VALUES ('11', '7', '11', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `RolePermission` VALUES ('12', '8', '12', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `RolePermission` VALUES ('13', '9', '13', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `RolePermission` VALUES ('14', '10', '14', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `RolePermission` VALUES ('15', '11', '15', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `RolePermission` VALUES ('16', '12', '16', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');

-- ----------------------------
-- Table structure for ServerConfig
-- ----------------------------
DROP TABLE IF EXISTS `ServerConfig`;
CREATE TABLE `ServerConfig` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '配置项Key',
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='配置服务自身配置';

-- ----------------------------
-- Records of ServerConfig
-- ----------------------------
INSERT INTO `ServerConfig` VALUES ('1', 'apollo.portal.envs', 'dev', '可支持的环境列表', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `ServerConfig` VALUES ('2', 'organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"样例部门1\"},{\"orgId\":\"TEST2\",\"orgName\":\"样例部门2\"}]', '部门列表', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `ServerConfig` VALUES ('3', 'superAdmin', 'apollo', 'Portal超级管理员', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `ServerConfig` VALUES ('4', 'api.readTimeout', '10000', 'http接口read timeout', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `ServerConfig` VALUES ('5', 'consumer.token.salt', 'someSalt', 'consumer token salt', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `ServerConfig` VALUES ('6', 'admin.createPrivateNamespace.switch', 'true', '是否允许项目管理员创建私有namespace', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `ServerConfig` VALUES ('7', 'configView.memberOnly.envs', 'dev', '只对项目成员显示配置信息的环境列表，多个env以英文逗号分隔', '\0', 'default', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');

-- ----------------------------
-- Table structure for UserRole
-- ----------------------------
DROP TABLE IF EXISTS `UserRole`;
CREATE TABLE `UserRole` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `UserId` varchar(128) DEFAULT '' COMMENT '用户身份标识',
  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
  `DataChange_CreatedBy` varchar(32) DEFAULT '' COMMENT '创建人邮箱前缀',
  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `DataChange_LastModifiedBy` varchar(32) DEFAULT '' COMMENT '最后修改人邮箱前缀',
  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
  KEY `IX_RoleId` (`RoleId`),
  KEY `IX_UserId_RoleId` (`UserId`,`RoleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='用户和role的绑定表';

-- ----------------------------
-- Records of UserRole
-- ----------------------------
INSERT INTO `UserRole` VALUES ('1', 'apollo', '1', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `UserRole` VALUES ('2', 'apollo', '2', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `UserRole` VALUES ('3', 'apollo', '3', '\0', '', '2020-01-06 17:39:23', '', '2020-01-06 17:39:23');
INSERT INTO `UserRole` VALUES ('4', 'apollo', '7', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `UserRole` VALUES ('5', 'apollo', '9', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');
INSERT INTO `UserRole` VALUES ('6', 'apollo', '10', '\0', 'apollo', '2020-01-17 11:28:41', 'apollo', '2020-01-17 11:28:41');

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '用户名',
  `Password` varchar(64) NOT NULL DEFAULT 'default' COMMENT '密码',
  `Email` varchar(64) NOT NULL DEFAULT 'default' COMMENT '邮箱地址',
  `Enabled` tinyint(4) DEFAULT NULL COMMENT '是否有效',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of Users
-- ----------------------------
INSERT INTO `Users` VALUES ('1', 'apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo@acme.com', '1');
