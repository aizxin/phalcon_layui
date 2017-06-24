/*
Navicat MySQL Data Transfer

Source Server         : phpstudy
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : phalblog

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-06-24 12:55:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '权限父id',
  `ismenu` int(1) NOT NULL DEFAULT '0' COMMENT '是否是菜单',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限图标',
  `issort` int(255) NOT NULL DEFAULT '0' COMMENT '权限排序',
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '0', '1', '主页管理', 'admin/manage', '主页管理', 'fa fa-home', '0', null, '2017-04-11 20:28:42', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('2', '0', '1', '权限管理', 'rbac/manage', '权限管理', 'fa fa-sitemap', '1', null, '2017-04-11 20:29:47', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('3', '1', '1', '网站主页', 'admin/index', '网站主页', 'fa fa-home', '0', null, '2017-04-13 17:02:54', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('4', '2', '1', '管理员管理', 'admin/user', '管理员管理', 'fa fa-user', '1', null, '2017-04-13 11:58:19', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('5', '2', '1', '角色管理', 'admin/role', '角色管理', 'fa fa-bullhorn', '2', null, '2017-04-13 12:20:44', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('6', '2', '1', '节点管理', 'admin/permission', '节点管理', 'fa fa-arrows', '3', null, '2017-04-13 12:21:31', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('7', '6', '0', '节点添加视图', 'admin/permission/create', '节点添加视图', '', '1', null, '2017-04-13 12:22:21', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('8', '6', '0', '节点添加操作', 'admin/permission/store', '节点添加操作', '', '2', null, '2017-04-13 12:23:11', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('9', '6', '0', '节点更新视图', 'admin/permission/edit', '节点更新视图', '', '1', null, '2017-04-13 12:24:18', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('10', '6', '0', '节点更新操作', 'admin/permission/update', '节点更新操作', '', '1', null, '2017-04-13 12:25:02', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('11', '6', '0', '节点删除', 'admin/permission/destroy', '节点删除', '', '1', null, '2017-04-13 12:25:55', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('12', '5', '0', '角色添加视图', 'admin/role/create', '角色添加视图', '', '1', null, '2017-04-13 12:32:26', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('13', '5', '0', '角色添加操作', 'role.store', '角色添加操作', null, '1', null, '2017-04-13 12:44:37', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('14', '5', '0', '角色更新视图', 'role.edit', '角色更新视图', null, '1', null, '2017-04-13 12:58:03', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('15', '5', '0', '角色更新操作', 'role.update', '角色更新操作', null, '1', null, '2017-04-13 13:01:53', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('16', '5', '0', '角色删除操作', 'role.destroy', '角色删除操作', null, '1', null, '2017-04-13 13:07:18', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('17', '4', '0', '管理员添加视图', 'user.create', '管理员添加视图', null, '1', null, '2017-04-13 13:15:47', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('18', '4', '0', '管理员添加操作', 'user.store', '管理员添加操作', null, '1', null, '2017-04-13 13:17:28', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('19', '4', '0', '管理员更新视图', 'user.edit', '管理员更新视图', null, '1', null, '2017-04-13 13:18:14', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('20', '4', '0', '管理员更新操作', 'user.update', '管理员更新操作', null, '1', null, '2017-04-13 13:18:40', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('21', '4', '0', '管理员删除操作', 'user.destroy', '管理员删除操作', null, '1', null, '2017-04-13 13:19:58', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('22', '0', '1', '文章管理', 'article.manage', '文章管理', 'fa fa-calendar-o', '2', null, '2017-04-13 16:39:42', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('24', '5', '0', '角色权限', 'role.permission', '角色权限', null, '1', null, '2017-04-13 18:53:10', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('25', '4', '0', '管理员详情', 'user.show', '管理员详情', null, '1', null, '2017-04-17 14:44:39', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('26', '5', '0', '角色详情', 'role.show', '角色详情', null, '1', null, '2017-04-17 14:45:13', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('27', '4', '0', '角色分配', 'user.role', '角色分配', null, '1', null, '2017-04-17 15:55:01', '2017-06-24 12:38:57');
INSERT INTO `permissions` VALUES ('28', '22', '1', '文章分类', 'article.category.index', '文章分类管理', 'fa fa-clone', '1', null, '2017-04-17 16:10:38', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('29', '28', '0', '文章分类添加操作', 'article.category.store', '文章分类添加操作', null, '1', null, '2017-04-18 12:17:03', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('30', '28', '0', '文章分类添加视图', 'article.category.create', '文章添加视图', null, '1', null, '2017-04-18 12:18:11', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('31', '28', '0', '文章分类更新视图', 'article.category.edit', '文章分类更新视图', null, '1', null, '2017-04-18 12:19:17', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('32', '28', '0', '文章分类删除', 'article.category.destroy', '文章分类删除', null, '1', null, '2017-04-18 12:20:24', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('40', '22', '1', '文章列表', 'article.index', '文章列表', 'fa fa-reorder', '1', null, '2017-04-19 12:05:05', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('41', '40', '0', '文章添加视图', 'article.create', '文章添加视图', null, '1', null, '2017-04-19 12:06:23', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('42', '40', '0', '文章添加操作', 'article.store', '文章添加操作', null, '1', null, '2017-04-19 12:07:10', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('43', '40', '0', '文章更新视图', 'article.edit', '文章更新视图', null, '1', null, '2017-04-19 12:07:57', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('44', '40', '0', '文章更新操作', 'article.update', '文章更新操作', null, '1', null, '2017-04-19 12:09:18', '2017-06-20 21:35:10');
INSERT INTO `permissions` VALUES ('45', '40', '0', '文章删除', 'article.destroy', '文章删除', null, '1', null, '2017-04-19 12:10:02', '2017-06-20 21:35:10');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '超级管理员', 'admin', '超级管理员', '1', '2017-04-07 13:07:50', '2017-06-24 12:36:32');
INSERT INTO `roles` VALUES ('2', '普通用户', 'user', '普通用户', '1', '2017-04-07 13:07:50', '2017-06-24 12:38:57');
INSERT INTO `roles` VALUES ('5', '测试', 'test', 'test', '1', '2017-06-18 14:36:58', '2017-06-18 14:56:26');
INSERT INTO `roles` VALUES ('7', 'tets', 'tets', 'tets', '1', '2017-06-18 22:19:21', '2017-06-20 21:34:07');

-- ----------------------------
-- Table structure for roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=543 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` VALUES ('361', '116', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('360', '115', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('359', '114', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('358', '113', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('357', '112', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('356', '111', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('355', '110', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('354', '109', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('353', '108', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('352', '107', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('351', '106', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('350', '105', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('349', '104', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('348', '103', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('347', '92', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('346', '90', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('345', '89', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('344', '88', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('343', '87', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('342', '86', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('341', '85', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('340', '84', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('339', '94', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('338', '76', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('337', '75', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('336', '74', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('335', '73', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('334', '72', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('333', '71', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('332', '70', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('331', '69', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('330', '68', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('329', '67', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('328', '66', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('327', '65', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('326', '64', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('480', '45', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('479', '44', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('478', '43', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('477', '42', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('476', '41', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('475', '40', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('474', '32', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('325', '63', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('324', '62', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('323', '61', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('322', '60', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('321', '59', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('320', '58', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('319', '57', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('318', '56', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('473', '31', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('472', '30', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('471', '29', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('470', '28', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('469', '27', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('468', '26', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('467', '25', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('466', '24', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('465', '22', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('464', '21', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('463', '20', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('462', '19', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('461', '18', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('460', '17', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('317', '55', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('316', '54', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('315', '53', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('314', '52', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('313', '51', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('459', '16', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('458', '15', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('457', '14', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('456', '13', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('455', '12', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('454', '11', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('453', '10', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('452', '9', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('451', '8', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('450', '7', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('449', '6', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('448', '5', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('447', '4', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('312', '50', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('311', '49', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('310', '48', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('309', '47', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('308', '46', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('307', '39', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('306', '38', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('305', '37', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('304', '36', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('303', '35', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('302', '34', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('301', '33', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('300', '45', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('299', '44', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('298', '43', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('297', '42', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('296', '41', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('295', '40', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('294', '32', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('293', '31', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('292', '30', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('291', '29', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('290', '28', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('289', '22', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('288', '3', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('287', '1', '4', '2017-05-04 19:20:33', '2017-05-04 19:20:33');
INSERT INTO `roles_permissions` VALUES ('446', '3', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('445', '2', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('444', '1', '7', null, null);
INSERT INTO `roles_permissions` VALUES ('443', '45', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('442', '44', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('441', '43', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('440', '42', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('439', '41', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('438', '40', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('437', '32', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('436', '31', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('435', '30', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('434', '29', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('433', '28', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('432', '27', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('431', '26', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('430', '25', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('429', '24', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('428', '22', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('427', '21', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('426', '20', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('425', '19', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('424', '18', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('423', '17', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('542', '27', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('541', '26', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('540', '25', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('539', '24', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('538', '21', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('537', '20', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('536', '19', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('535', '18', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('534', '17', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('533', '16', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('532', '15', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('531', '14', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('530', '13', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('529', '12', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('528', '11', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('527', '10', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('526', '9', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('525', '8', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('524', '7', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('523', '6', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('422', '16', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('421', '15', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('420', '14', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('419', '13', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('418', '12', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('417', '11', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('522', '5', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('521', '4', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('520', '3', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('519', '2', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('416', '10', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('415', '9', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('518', '1', '2', null, null);
INSERT INTO `roles_permissions` VALUES ('414', '8', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('413', '7', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('412', '6', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('411', '5', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('410', '4', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('409', '3', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('408', '2', '1', null, null);
INSERT INTO `roles_permissions` VALUES ('407', '1', '1', null, null);

-- ----------------------------
-- Table structure for roles_users
-- ----------------------------
DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE `roles_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles_users
-- ----------------------------
INSERT INTO `roles_users` VALUES ('8', '2', '10', null, null);
INSERT INTO `roles_users` VALUES ('2', '2', '2', '2017-04-07 13:07:51', '2017-04-07 13:07:51');
INSERT INTO `roles_users` VALUES ('5', '4', '3', '2017-05-04 19:21:12', '2017-05-04 19:21:12');
INSERT INTO `roles_users` VALUES ('4', '2', '4', '2017-04-07 13:07:51', '2017-04-07 13:07:51');
INSERT INTO `roles_users` VALUES ('7', '1', '1', null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('10', '测试', 'ceshi', null, '9c6d2b085a88acd25b22f42207b719f0cfe0ff84', null, '2017-06-20 22:46:52', '2017-06-24 12:38:46');
INSERT INTO `users` VALUES ('1', '管理员', 'admin', null, '00e16ca9f73de8880085d1630cf31f3384a574f8', null, '2017-06-17 19:39:22', '2017-06-24 12:36:32');
