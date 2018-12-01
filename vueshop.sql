/*
 Navicat Premium Data Transfer

 Source Server         : localmysql
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : vueshop

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 01/12/2018 15:49:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add permission', 1, 'add_permission');
INSERT INTO `auth_permission` VALUES (2, 'Can change permission', 1, 'change_permission');
INSERT INTO `auth_permission` VALUES (3, 'Can delete permission', 1, 'delete_permission');
INSERT INTO `auth_permission` VALUES (4, 'Can view permission', 1, 'view_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (9, 'Can add content type', 3, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (10, 'Can change content type', 3, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can delete content type', 3, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can view content type', 3, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 4, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 4, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 4, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can view session', 4, 'view_session');
INSERT INTO `auth_permission` VALUES (17, 'Can add 用户', 5, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (18, 'Can change 用户', 5, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (19, 'Can delete 用户', 5, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (20, 'Can view 用户', 5, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (21, 'Can add 短信验证', 6, 'add_verifycode');
INSERT INTO `auth_permission` VALUES (22, 'Can change 短信验证', 6, 'change_verifycode');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 短信验证', 6, 'delete_verifycode');
INSERT INTO `auth_permission` VALUES (24, 'Can view 短信验证', 6, 'view_verifycode');
INSERT INTO `auth_permission` VALUES (25, 'Can add 首页轮播', 7, 'add_banner');
INSERT INTO `auth_permission` VALUES (26, 'Can change 首页轮播', 7, 'change_banner');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 首页轮播', 7, 'delete_banner');
INSERT INTO `auth_permission` VALUES (28, 'Can view 首页轮播', 7, 'view_banner');
INSERT INTO `auth_permission` VALUES (29, 'Can add 商品信息', 8, 'add_goods');
INSERT INTO `auth_permission` VALUES (30, 'Can change 商品信息', 8, 'change_goods');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 商品信息', 8, 'delete_goods');
INSERT INTO `auth_permission` VALUES (32, 'Can view 商品信息', 8, 'view_goods');
INSERT INTO `auth_permission` VALUES (33, 'Can add 商品类别', 9, 'add_goodscategory');
INSERT INTO `auth_permission` VALUES (34, 'Can change 商品类别', 9, 'change_goodscategory');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 商品类别', 9, 'delete_goodscategory');
INSERT INTO `auth_permission` VALUES (36, 'Can view 商品类别', 9, 'view_goodscategory');
INSERT INTO `auth_permission` VALUES (37, 'Can add 宣传品牌', 10, 'add_goodscategorybrand');
INSERT INTO `auth_permission` VALUES (38, 'Can change 宣传品牌', 10, 'change_goodscategorybrand');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 宣传品牌', 10, 'delete_goodscategorybrand');
INSERT INTO `auth_permission` VALUES (40, 'Can view 宣传品牌', 10, 'view_goodscategorybrand');
INSERT INTO `auth_permission` VALUES (41, 'Can add 商品轮播', 11, 'add_goodsimage');
INSERT INTO `auth_permission` VALUES (42, 'Can change 商品轮播', 11, 'change_goodsimage');
INSERT INTO `auth_permission` VALUES (43, 'Can delete 商品轮播', 11, 'delete_goodsimage');
INSERT INTO `auth_permission` VALUES (44, 'Can view 商品轮播', 11, 'view_goodsimage');
INSERT INTO `auth_permission` VALUES (45, 'Can add 热搜排行', 12, 'add_hotsearchwords');
INSERT INTO `auth_permission` VALUES (46, 'Can change 热搜排行', 12, 'change_hotsearchwords');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 热搜排行', 12, 'delete_hotsearchwords');
INSERT INTO `auth_permission` VALUES (48, 'Can view 热搜排行', 12, 'view_hotsearchwords');
INSERT INTO `auth_permission` VALUES (49, 'Can add 首页广告', 13, 'add_indexad');
INSERT INTO `auth_permission` VALUES (50, 'Can change 首页广告', 13, 'change_indexad');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 首页广告', 13, 'delete_indexad');
INSERT INTO `auth_permission` VALUES (52, 'Can view 首页广告', 13, 'view_indexad');
INSERT INTO `auth_permission` VALUES (53, 'Can add 订单商品', 14, 'add_ordergoods');
INSERT INTO `auth_permission` VALUES (54, 'Can change 订单商品', 14, 'change_ordergoods');
INSERT INTO `auth_permission` VALUES (55, 'Can delete 订单商品', 14, 'delete_ordergoods');
INSERT INTO `auth_permission` VALUES (56, 'Can view 订单商品', 14, 'view_ordergoods');
INSERT INTO `auth_permission` VALUES (57, 'Can add 订单信息', 15, 'add_orderinfo');
INSERT INTO `auth_permission` VALUES (58, 'Can change 订单信息', 15, 'change_orderinfo');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 订单信息', 15, 'delete_orderinfo');
INSERT INTO `auth_permission` VALUES (60, 'Can view 订单信息', 15, 'view_orderinfo');
INSERT INTO `auth_permission` VALUES (61, 'Can add 购物车喵', 16, 'add_shoppingcart');
INSERT INTO `auth_permission` VALUES (62, 'Can change 购物车喵', 16, 'change_shoppingcart');
INSERT INTO `auth_permission` VALUES (63, 'Can delete 购物车喵', 16, 'delete_shoppingcart');
INSERT INTO `auth_permission` VALUES (64, 'Can view 购物车喵', 16, 'view_shoppingcart');
INSERT INTO `auth_permission` VALUES (65, 'Can add 收货地址', 17, 'add_useraddress');
INSERT INTO `auth_permission` VALUES (66, 'Can change 收货地址', 17, 'change_useraddress');
INSERT INTO `auth_permission` VALUES (67, 'Can delete 收货地址', 17, 'delete_useraddress');
INSERT INTO `auth_permission` VALUES (68, 'Can view 收货地址', 17, 'view_useraddress');
INSERT INTO `auth_permission` VALUES (69, 'Can add 用户收藏', 18, 'add_userfav');
INSERT INTO `auth_permission` VALUES (70, 'Can change 用户收藏', 18, 'change_userfav');
INSERT INTO `auth_permission` VALUES (71, 'Can delete 用户收藏', 18, 'delete_userfav');
INSERT INTO `auth_permission` VALUES (72, 'Can view 用户收藏', 18, 'view_userfav');
INSERT INTO `auth_permission` VALUES (73, 'Can add 用户留言', 19, 'add_userleavingmessage');
INSERT INTO `auth_permission` VALUES (74, 'Can change 用户留言', 19, 'change_userleavingmessage');
INSERT INTO `auth_permission` VALUES (75, 'Can delete 用户留言', 19, 'delete_userleavingmessage');
INSERT INTO `auth_permission` VALUES (76, 'Can view 用户留言', 19, 'view_userleavingmessage');
INSERT INTO `auth_permission` VALUES (77, 'Can add log entry', 20, 'add_logentry');
INSERT INTO `auth_permission` VALUES (78, 'Can change log entry', 20, 'change_logentry');
INSERT INTO `auth_permission` VALUES (79, 'Can delete log entry', 20, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (80, 'Can view log entry', 20, 'view_logentry');
INSERT INTO `auth_permission` VALUES (81, 'Can add Bookmark', 21, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (82, 'Can change Bookmark', 21, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (83, 'Can delete Bookmark', 21, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (84, 'Can view Bookmark', 21, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (85, 'Can add User Setting', 22, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (86, 'Can change User Setting', 22, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (87, 'Can delete User Setting', 22, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (88, 'Can view User Setting', 22, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (89, 'Can add User Widget', 23, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (90, 'Can change User Widget', 23, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (91, 'Can delete User Widget', 23, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (92, 'Can view User Widget', 23, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (93, 'Can add log entry', 24, 'add_log');
INSERT INTO `auth_permission` VALUES (94, 'Can change log entry', 24, 'change_log');
INSERT INTO `auth_permission` VALUES (95, 'Can delete log entry', 24, 'delete_log');
INSERT INTO `auth_permission` VALUES (96, 'Can view log entry', 24, 'view_log');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (20, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (1, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (7, 'goods', 'banner');
INSERT INTO `django_content_type` VALUES (8, 'goods', 'goods');
INSERT INTO `django_content_type` VALUES (9, 'goods', 'goodscategory');
INSERT INTO `django_content_type` VALUES (10, 'goods', 'goodscategorybrand');
INSERT INTO `django_content_type` VALUES (11, 'goods', 'goodsimage');
INSERT INTO `django_content_type` VALUES (12, 'goods', 'hotsearchwords');
INSERT INTO `django_content_type` VALUES (13, 'goods', 'indexad');
INSERT INTO `django_content_type` VALUES (4, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (14, 'trade', 'ordergoods');
INSERT INTO `django_content_type` VALUES (15, 'trade', 'orderinfo');
INSERT INTO `django_content_type` VALUES (16, 'trade', 'shoppingcart');
INSERT INTO `django_content_type` VALUES (5, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (6, 'users', 'verifycode');
INSERT INTO `django_content_type` VALUES (17, 'user_operation', 'useraddress');
INSERT INTO `django_content_type` VALUES (18, 'user_operation', 'userfav');
INSERT INTO `django_content_type` VALUES (19, 'user_operation', 'userleavingmessage');
INSERT INTO `django_content_type` VALUES (21, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (24, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (22, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (23, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-11-22 08:29:10.531914');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-11-22 08:29:10.652922');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-11-22 08:29:11.012955');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-11-22 08:29:11.077966');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-11-22 08:29:11.090966');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-11-22 08:29:11.103968');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-11-22 08:29:11.117980');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-11-22 08:29:11.121969');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-11-22 08:29:11.130981');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-11-22 08:29:11.143972');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2018-11-22 08:29:11.153971');
INSERT INTO `django_migrations` VALUES (12, 'goods', '0001_initial', '2018-11-22 08:29:11.914327');
INSERT INTO `django_migrations` VALUES (13, 'sessions', '0001_initial', '2018-11-22 08:29:11.970319');
INSERT INTO `django_migrations` VALUES (14, 'users', '0001_initial', '2018-11-22 08:29:12.379653');
INSERT INTO `django_migrations` VALUES (15, 'trade', '0001_initial', '2018-11-22 08:29:12.547667');
INSERT INTO `django_migrations` VALUES (16, 'trade', '0002_auto_20181122_1629', '2018-11-22 08:29:13.022777');
INSERT INTO `django_migrations` VALUES (17, 'user_operation', '0001_initial', '2018-11-22 08:29:13.122780');
INSERT INTO `django_migrations` VALUES (18, 'user_operation', '0002_auto_20181122_1629', '2018-11-22 08:29:13.662838');
INSERT INTO `django_migrations` VALUES (19, 'admin', '0001_initial', '2018-11-22 09:01:02.895295');
INSERT INTO `django_migrations` VALUES (20, 'admin', '0002_logentry_remove_auto_add', '2018-11-22 09:01:02.914296');
INSERT INTO `django_migrations` VALUES (21, 'admin', '0003_logentry_add_action_flag_choices', '2018-11-22 09:01:02.931297');
INSERT INTO `django_migrations` VALUES (22, 'xadmin', '0001_initial', '2018-11-22 09:01:03.289324');
INSERT INTO `django_migrations` VALUES (23, 'xadmin', '0002_log', '2018-11-22 09:01:03.503342');
INSERT INTO `django_migrations` VALUES (24, 'xadmin', '0003_auto_20160715_0100', '2018-11-22 09:01:03.583346');
INSERT INTO `django_migrations` VALUES (25, 'users', '0002_auto_20181127_2342', '2018-11-27 23:42:48.770994');
INSERT INTO `django_migrations` VALUES (26, 'goods', '0002_auto_20181130_1354', '2018-11-30 13:54:32.470323');
INSERT INTO `django_migrations` VALUES (27, 'user_operation', '0003_auto_20181130_1354', '2018-11-30 13:54:32.575275');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('y5ube4qbsr1rokla8yjnvk38bolkiyzk', 'MTdlMDQ1NmRiNzFiMDkyNzU1ZjBjMTA0YjMzMWNmOGJkZjgwMjM1Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjI2NjAzMjA4YjY3MjI1NGRhMDE3Mjk4ZjI0MzEyNGNmNTRiOTMzN2QiLCJMSVNUX1FVRVJZIjpbWyJnb29kcyIsImluZGV4YWQiXSwiIl19', '2018-12-15 12:39:53.351478');

-- ----------------------------
-- Table structure for goods_banner
-- ----------------------------
DROP TABLE IF EXISTS `goods_banner`;
CREATE TABLE `goods_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_banner_goods_id_99e23129_fk_goods_goods_id`(`goods_id`) USING BTREE,
  CONSTRAINT `goods_banner_goods_id_99e23129_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_banner
-- ----------------------------
INSERT INTO `goods_banner` VALUES (1, 'banner/banner1.jpg', 1, '2018-12-01 12:10:00.000000', 1);
INSERT INTO `goods_banner` VALUES (2, 'banner/banner3.jpg', 2, '2018-12-01 12:11:00.000000', 2);
INSERT INTO `goods_banner` VALUES (3, 'banner/banner2.jpg', 3, '2018-12-01 12:11:00.000000', 3);

-- ----------------------------
-- Table structure for goods_goods
-- ----------------------------
DROP TABLE IF EXISTS `goods_goods`;
CREATE TABLE `goods_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_sn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_num` int(11) NOT NULL,
  `sold_num` int(11) NOT NULL,
  `fav_num` int(11) NOT NULL,
  `goods_num` int(11) NOT NULL,
  `market_price` double NOT NULL,
  `shop_price` double NOT NULL,
  `goods_brief` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goods_desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ship_free` tinyint(1) NOT NULL,
  `goods_front_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  `is_hot` tinyint(1) NOT NULL,
  `add_time` datetime(6) NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id`(`category_id`) USING BTREE,
  CONSTRAINT `goods_goods_category_id_da3507dd_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_goods
-- ----------------------------
INSERT INTO `goods_goods` VALUES (1, 'fruit01', '新鲜水果甜蜜香脆单果约800克', 0, 0, 0, 0, 232, 156, '食用百香果可以增加胃部饱腹感，减少余热量的摄入，还可以吸附胆固醇和胆汁之类有机分子，抑制人体对脂肪的吸收。因此，长期食用有利于改善人体营养吸收结构，降低体内脂肪，塑造健康优美体态。', '<p><img src=\"http://127.0.0.1:8000/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"http://127.0.0.1:8000/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"http://127.0.0.1:8000/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/1_P_1449024889889.jpg', 0, 0, '2018-11-22 19:26:00.000000', 20);
INSERT INTO `goods_goods` VALUES (2, '', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 0, 0, 0, 0, 106, 88, '前腿+后腿+羊排共8斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/2_P_1448945810202.jpg', 0, 0, '2018-11-22 19:26:30.823750', 7);
INSERT INTO `goods_goods` VALUES (3, '', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', 0, 0, 0, 0, 286, 238, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/7_P_1448945104883.jpg', 0, 0, '2018-11-22 19:26:30.832751', 15);
INSERT INTO `goods_goods` VALUES (4, '', '日本蒜蓉粉丝扇贝270克6只装', 0, 0, 0, 0, 156, 108, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/47_P_1448946213263.jpg', 0, 0, '2018-11-22 19:26:30.841751', 20);
INSERT INTO `goods_goods` VALUES (5, '', '内蒙新鲜牛肉1斤清真生鲜牛肉火锅食材', 0, 0, 0, 0, 106, 88, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/10_P_1448944572085.jpg', 0, 0, '2018-11-22 19:26:30.850751', 7);
INSERT INTO `goods_goods` VALUES (6, '', '乌拉圭进口牛肉卷特级肥牛卷', 0, 0, 0, 0, 90, 75, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/4_P_1448945381985.jpg', 0, 0, '2018-11-22 19:26:30.864754', 21);
INSERT INTO `goods_goods` VALUES (7, '', '五星眼肉牛排套餐8片装原味原切生鲜牛肉', 0, 0, 0, 0, 150, 125, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/8_P_1448945032810.jpg', 0, 0, '2018-11-22 19:26:30.875754', 23);
INSERT INTO `goods_goods` VALUES (8, '', '澳洲进口120天谷饲牛仔骨4份原味生鲜', 0, 0, 0, 0, 31, 26, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/11_P_1448944388277.jpg', 0, 0, '2018-11-22 19:26:30.887755', 7);
INSERT INTO `goods_goods` VALUES (9, '', '潮香村澳洲进口牛排家庭团购套餐20片', 0, 0, 0, 0, 239, 199, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/6_P_1448945167279.jpg', 0, 0, '2018-11-22 19:26:30.901758', 22);
INSERT INTO `goods_goods` VALUES (10, '', '爱食派内蒙古呼伦贝尔冷冻生鲜牛腱子肉1000g', 0, 0, 0, 0, 202, 168, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/9_P_1448944791617.jpg', 0, 0, '2018-11-22 19:26:30.911758', 20);
INSERT INTO `goods_goods` VALUES (11, '', '澳洲进口牛尾巴300g新鲜肥牛肉', 0, 0, 0, 0, 306, 255, '新鲜羊羔肉整只共15斤，原生态大山放牧羊羔，曾经的皇室贡品，央视推荐，2005年北京招待全球财金首脑。五层专用包装箱+真空包装+冰袋+保鲜箱+顺丰冷链发货，路途保质期8天', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/3_P_1448945490837.jpg', 0, 0, '2018-11-22 19:26:30.926759', 2);
INSERT INTO `goods_goods` VALUES (12, '', '新疆巴尔鲁克生鲜牛排眼肉牛扒1200g', 0, 0, 0, 0, 126, 88, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/48_P_1448943988970.jpg', 0, 0, '2018-11-22 19:26:30.937758', 7);
INSERT INTO `goods_goods` VALUES (13, '', '澳洲进口安格斯牛切片上脑牛排1000g', 0, 0, 0, 0, 144, 120, '澳大利亚是国际公认的没有疯牛病和口蹄疫的国家。为了保持澳大利亚产品的高标准，澳大利亚牛肉业和各级政府共同努力简历了严格的标准和体系，以保证生产的整体化和产品的可追溯性', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/5_P_1448945270390.jpg', 0, 0, '2018-11-22 19:26:30.951758', 12);
INSERT INTO `goods_goods` VALUES (14, '', '帐篷出租', 0, 0, 0, 0, 120, 100, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'images/201705/goods_img/53_P_1495068879687.jpg', 0, 0, '2018-11-22 19:26:30.964760', 21);
INSERT INTO `goods_goods` VALUES (15, '', '52度茅台集团国隆双喜酒500mlx6', 0, 0, 0, 0, 23, 19, '贵州茅台酒厂（集团）保健酒业有限公司生产，是以“龙”字打头的酒水。中国龙文化上下8000年，源远而流长，龙的形象是一种符号、一种意绪、一种血肉相联的情感。', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/16_P_1448947194687.jpg', 0, 0, '2018-11-22 19:26:30.972760', 37);
INSERT INTO `goods_goods` VALUES (16, '', '52度水井坊臻酿八號500ml', 0, 0, 0, 0, 43, 36, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/14_P_1448947354031.jpg', 0, 0, '2018-11-22 19:26:30.980761', 36);
INSERT INTO `goods_goods` VALUES (17, '', '53度茅台仁酒500ml', 0, 0, 0, 0, 190, 158, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/12_P_1448947547989.jpg', 0, 0, '2018-11-22 19:26:30.991762', 32);
INSERT INTO `goods_goods` VALUES (18, '', '双响炮洋酒JimBeamwhiskey美国白占边', 0, 0, 0, 0, 38, 28, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/46_P_1448946598711.jpg', 0, 0, '2018-11-22 19:26:30.999762', 29);
INSERT INTO `goods_goods` VALUES (19, '', '西夫拉姆进口洋酒小酒版', 0, 0, 0, 0, 55, 46, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/21_P_1448946793276.jpg', 0, 0, '2018-11-22 19:26:31.011762', 36);
INSERT INTO `goods_goods` VALUES (20, '', '茅台53度飞天茅台500ml', 0, 0, 0, 0, 22, 18, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/15_P_1448947257324.jpg', 0, 0, '2018-11-22 19:26:31.026764', 30);
INSERT INTO `goods_goods` VALUES (21, '', '52度兰陵·紫气东来1600mL山东名酒', 0, 0, 0, 0, 42, 35, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/13_P_1448947460386.jpg', 0, 0, '2018-11-22 19:26:31.038768', 29);
INSERT INTO `goods_goods` VALUES (22, '', 'JohnnieWalker尊尼获加黑牌威士忌', 0, 0, 0, 0, 24, 20, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/50_P_1448946543091.jpg', 0, 0, '2018-11-22 19:26:31.052768', 36);
INSERT INTO `goods_goods` VALUES (23, '', '人头马CLUB特优香槟干邑350ml', 0, 0, 0, 0, 31, 26, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/51_P_1448946466595.jpg', 0, 0, '2018-11-22 19:26:31.062770', 30);
INSERT INTO `goods_goods` VALUES (24, '', '张裕干红葡萄酒750ml*6支', 0, 0, 0, 0, 54, 45, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/17_P_1448947102246.jpg', 0, 0, '2018-11-22 19:26:31.072769', 31);
INSERT INTO `goods_goods` VALUES (25, '', '原瓶原装进口洋酒烈酒法国云鹿XO白兰地', 0, 0, 0, 0, 46, 38, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/20_P_1448946850602.jpg', 0, 0, '2018-11-22 19:26:31.080770', 29);
INSERT INTO `goods_goods` VALUES (26, '', '法国原装进口圣贝克干红葡萄酒750ml', 0, 0, 0, 0, 82, 68, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/19_P_1448946951581.jpg', 0, 0, '2018-11-22 19:26:31.089769', 25);
INSERT INTO `goods_goods` VALUES (27, '', '法国百利威干红葡萄酒AOP级6支装', 0, 0, 0, 0, 67, 56, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/18_P_1448947011435.jpg', 0, 0, '2018-11-22 19:26:31.101770', 25);
INSERT INTO `goods_goods` VALUES (28, '', '芝华士12年苏格兰威士忌700ml', 0, 0, 0, 0, 71, 59, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/22_P_1448946729629.jpg', 0, 0, '2018-11-22 19:26:31.110771', 30);
INSERT INTO `goods_goods` VALUES (29, '', '深蓝伏特加巴维兰利口酒送预调酒', 0, 0, 0, 0, 31, 18, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/45_P_1448946661303.jpg', 0, 0, '2018-11-22 19:26:31.121775', 36);
INSERT INTO `goods_goods` VALUES (30, '', '赣南脐橙特级果10斤装', 0, 0, 0, 0, 43, 36, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/32_P_1448948525620.jpg', 0, 0, '2018-11-22 19:26:31.131788', 62);
INSERT INTO `goods_goods` VALUES (31, '', '泰国菠萝蜜16-18斤1个装', 0, 0, 0, 0, 11, 9, '【懒人吃法】菠萝蜜果肉，冰袋保鲜，收货就吃，冰爽Q脆甜，2斤装，全国顺丰空运包邮，发出后48小时内可达，一线城市基本隔天可达', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/30_P_1448948663450.jpg', 0, 0, '2018-11-22 19:26:31.140984', 66);
INSERT INTO `goods_goods` VALUES (32, '', '四川双流草莓新鲜水果礼盒2盒', 0, 0, 0, 0, 22, 18, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/31_P_1448948598947.jpg', 0, 0, '2018-11-22 19:26:31.154774', 70);
INSERT INTO `goods_goods` VALUES (33, '', '新鲜头茬非洲冰草冰菜', 0, 0, 0, 0, 67, 56, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/35_P_1448948333610.jpg', 0, 0, '2018-11-22 19:26:31.165775', 58);
INSERT INTO `goods_goods` VALUES (34, '', '仿真蔬菜水果果蔬菜模型', 0, 0, 0, 0, 6, 5, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/36_P_1448948234405.jpg', 0, 0, '2018-11-22 19:26:31.175776', 58);
INSERT INTO `goods_goods` VALUES (35, '', '现摘芭乐番石榴台湾珍珠芭乐', 0, 0, 0, 0, 28, 23, '海南产精品释迦果,\n        释迦是水果中的贵族,\n        产量少,\n        味道很甜,\n        奶香十足,\n        非常可口,\n        果裹果园顺丰空运,\n        保证新鲜.果子个大,\n        一斤1-2个左右,\n        大个头的果子更尽兴!\n        ', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/33_P_1448948479966.jpg', 0, 0, '2018-11-22 19:26:31.186777', 62);
INSERT INTO `goods_goods` VALUES (36, '', '潍坊萝卜5斤/箱礼盒', 0, 0, 0, 0, 46, 38, '脐橙规格是65-90MM左右（标准果果径平均70MM左右，精品果果径平均80MM左右），一斤大概有2-4个左右，脐橙产自江西省赣州市信丰县安西镇，全过程都是采用农家有机肥种植，生态天然', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/34_P_1448948399009.jpg', 0, 0, '2018-11-22 19:26:31.199777', 70);
INSERT INTO `goods_goods` VALUES (37, '', '休闲零食膨化食品焦糖/奶油/椒麻味', 0, 0, 0, 0, 154, 99, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/43_P_1448948762645.jpg', 0, 0, '2018-11-22 19:26:31.207778', 74);
INSERT INTO `goods_goods` VALUES (38, '', '蒙牛未来星儿童成长牛奶骨力型190ml*15盒', 0, 0, 0, 0, 84, 70, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/38_P_1448949220255.jpg', 0, 0, '2018-11-22 19:26:31.215780', 105);
INSERT INTO `goods_goods` VALUES (39, '', '蒙牛特仑苏有机奶250ml×12盒', 0, 0, 0, 0, 70, 32, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/44_P_1448948850187.jpg', 0, 0, '2018-11-22 19:26:31.222784', 103);
INSERT INTO `goods_goods` VALUES (40, '', '1元支付测试商品', 0, 0, 0, 0, 1, 1, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'images/201511/goods_img/49_P_1448162819889.jpg', 0, 0, '2018-11-22 19:26:31.231784', 102);
INSERT INTO `goods_goods` VALUES (41, '', '德运全脂新鲜纯牛奶1L*10盒装整箱', 0, 0, 0, 0, 70, 58, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/40_P_1448949038702.jpg', 0, 0, '2018-11-22 19:26:31.239781', 103);
INSERT INTO `goods_goods` VALUES (42, '', '木糖醇红枣早餐奶即食豆奶粉538g', 0, 0, 0, 0, 38, 32, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/39_P_1448949115481.jpg', 0, 0, '2018-11-22 19:26:31.247781', 106);
INSERT INTO `goods_goods` VALUES (43, '', '高钙液体奶200ml*24盒', 0, 0, 0, 0, 26, 22, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/41_P_1448948980358.jpg', 0, 0, '2018-11-22 19:26:31.256782', 107);
INSERT INTO `goods_goods` VALUES (44, '', '新西兰进口全脂奶粉900g', 0, 0, 0, 0, 720, 600, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/37_P_1448949284365.jpg', 0, 0, '2018-11-22 19:26:31.263783', 104);
INSERT INTO `goods_goods` VALUES (45, 'yl01', '伊利官方直营全脂营养舒化奶250ml*12盒*2提', 0, 0, 0, 0, 43, 36, '修改 伊利官方直营全脂营养舒化奶250ml*12盒*2提', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 1, 'goods/images/42_P_1448948895193.jpg', 1, 0, '2018-11-22 19:26:00.000000', 103);
INSERT INTO `goods_goods` VALUES (46, 'czy01', '维纳斯橄榄菜籽油5L/桶', 0, 0, 0, 0, 187, 156, '维纳斯橄榄菜籽油5L/桶', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 1, 'goods/images/27_P_1448947771805.jpg', 1, 0, '2018-11-22 19:26:00.000000', 51);
INSERT INTO `goods_goods` VALUES (47, 'rice450', '糙米450gx3包粮油米面', 0, 0, 0, 0, 18, 15, '糙米450gx3包粮油米面', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/> </p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/> </p>', 1, 'goods/images/23_P_1448948070348.jpg', 0, 0, '2018-11-22 19:26:00.000000', 41);
INSERT INTO `goods_goods` VALUES (48, '', '精炼一级大豆油5L色拉油粮油食用油', 0, 0, 0, 0, 54, 45, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/26_P_1448947825754.jpg', 0, 0, '2018-11-22 19:26:31.295787', 56);
INSERT INTO `goods_goods` VALUES (49, '', '橄榄玉米油5L*2桶', 0, 0, 0, 0, 31, 26, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/28_P_1448947699948.jpg', 0, 0, '2018-11-22 19:26:31.306156', 54);
INSERT INTO `goods_goods` VALUES (50, '', '山西黑米农家黑米4斤', 0, 0, 0, 0, 11, 9, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/24_P_1448948023823.jpg', 0, 0, '2018-11-22 19:26:31.321789', 55);
INSERT INTO `goods_goods` VALUES (51, '', '稻园牌稻米油粮油米糠油绿色植物油', 0, 0, 0, 0, 14, 12, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/25_P_1448947875346.jpg', 0, 0, '2018-11-22 19:26:31.334802', 47);
INSERT INTO `goods_goods` VALUES (52, '', '融氏纯玉米胚芽油5l桶', 0, 0, 0, 0, 14, 12, '', '<p><img src=\"/media/goods/images/2_20170719161405_249.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161414_628.jpg\" title=\"\" alt=\"2.jpg\"/></p><p><img src=\"/media/goods/images/2_20170719161435_381.jpg\" title=\"\" alt=\"2.jpg\"/></p>', 1, 'goods/images/29_P_1448947631994.jpg', 0, 0, '2018-11-22 19:26:31.343788', 41);

-- ----------------------------
-- Table structure for goods_goodsbrand
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodsbrand`;
CREATE TABLE `goods_goodsbrand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_goodsbrand_category_id_6fc84a73_fk_goods_goodscategory_id`(`category_id`) USING BTREE,
  CONSTRAINT `goods_goodsbrand_category_id_6fc84a73_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_goodsbrand
-- ----------------------------
INSERT INTO `goods_goodsbrand` VALUES (1, '发育宝', '发育宝', 'brands/sxsp-3.jpg', '2018-12-01 12:33:00.000000', 1);
INSERT INTO `goods_goodsbrand` VALUES (2, '艾尔', '艾尔', 'brands/sxsp-2.jpg', '2018-12-01 12:35:00.000000', 1);
INSERT INTO `goods_goodsbrand` VALUES (3, '金赏', '金赏', 'brands/sxsp-1.jpg', '2018-12-01 12:35:00.000000', 1);
INSERT INTO `goods_goodsbrand` VALUES (4, '金赏', '金赏', 'brands/sxsp-1_8b2R4rA.jpg', '2018-12-01 12:36:00.000000', 24);
INSERT INTO `goods_goodsbrand` VALUES (5, '托儿索', '托儿索', 'brands/lyfs-1.jpg', '2018-12-01 12:36:00.000000', 24);
INSERT INTO `goods_goodsbrand` VALUES (6, 'ppp', 'ppp', 'brands/lyfs-1_aW8GQiX.jpg', '2018-12-01 12:37:00.000000', 24);

-- ----------------------------
-- Table structure for goods_goodscategory
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodscategory`;
CREATE TABLE `goods_goodscategory`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_type` int(11) NOT NULL,
  `is_tab` tinyint(1) NOT NULL,
  `add_time` datetime(6) NULL,
  `parent_category_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo`(`parent_category_id`) USING BTREE,
  CONSTRAINT `goods_goodscategory_parent_category_id_ccec2509_fk_goods_goo` FOREIGN KEY (`parent_category_id`) REFERENCES `goods_goodscategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_goodscategory
-- ----------------------------
INSERT INTO `goods_goodscategory` VALUES (1, '生鲜食品', 'sxsp', '生鲜食品', 1, 1, '2018-11-22 19:16:00.000000', NULL);
INSERT INTO `goods_goodscategory` VALUES (2, '精品肉类', 'jprl', '', 2, 0, '2018-11-22 19:16:10.978446', 1);
INSERT INTO `goods_goodscategory` VALUES (3, '羊肉', 'yr', '', 3, 0, '2018-11-22 19:16:10.982430', 2);
INSERT INTO `goods_goodscategory` VALUES (4, '禽类', 'ql', '', 3, 0, '2018-11-22 19:16:10.990447', 2);
INSERT INTO `goods_goodscategory` VALUES (5, '猪肉', 'zr', '', 3, 0, '2018-11-22 19:16:10.994432', 2);
INSERT INTO `goods_goodscategory` VALUES (6, '牛肉', 'nr', '', 3, 0, '2018-11-22 19:16:10.997430', 2);
INSERT INTO `goods_goodscategory` VALUES (7, '海鲜水产', 'hxsc', '', 2, 0, '2018-11-22 19:16:11.001430', 1);
INSERT INTO `goods_goodscategory` VALUES (8, '参鲍', 'cb', '', 3, 0, '2018-11-22 19:16:11.004452', 7);
INSERT INTO `goods_goodscategory` VALUES (9, '鱼', 'yu', '', 3, 0, '2018-11-22 19:16:11.009432', 7);
INSERT INTO `goods_goodscategory` VALUES (10, '虾', 'xia', '', 3, 0, '2018-11-22 19:16:11.013431', 7);
INSERT INTO `goods_goodscategory` VALUES (11, '蟹/贝', 'xb', '', 3, 0, '2018-11-22 19:16:11.016432', 7);
INSERT INTO `goods_goodscategory` VALUES (12, '蛋制品', 'dzp', '', 2, 0, '2018-11-22 19:16:11.020432', 1);
INSERT INTO `goods_goodscategory` VALUES (13, '松花蛋/咸鸭蛋', 'xhd_xyd', '', 3, 0, '2018-11-22 19:16:11.023434', 12);
INSERT INTO `goods_goodscategory` VALUES (14, '鸡蛋', 'jd', '', 3, 0, '2018-11-22 19:16:11.027450', 12);
INSERT INTO `goods_goodscategory` VALUES (15, '叶菜类', 'ycl', '', 2, 0, '2018-11-22 19:16:11.031463', 1);
INSERT INTO `goods_goodscategory` VALUES (16, '生菜', 'sc', '', 3, 0, '2018-11-22 19:16:11.034453', 15);
INSERT INTO `goods_goodscategory` VALUES (17, '菠菜', 'bc', '', 3, 0, '2018-11-22 19:16:11.038433', 15);
INSERT INTO `goods_goodscategory` VALUES (18, '圆椒', 'yj', '', 3, 0, '2018-11-22 19:16:11.041451', 15);
INSERT INTO `goods_goodscategory` VALUES (19, '西兰花', 'xlh', '', 3, 0, '2018-11-22 19:16:11.045436', 15);
INSERT INTO `goods_goodscategory` VALUES (20, '根茎类', 'gjl', '', 2, 0, '2018-11-22 19:16:11.048439', 1);
INSERT INTO `goods_goodscategory` VALUES (21, '茄果类', 'qgl', '', 2, 0, '2018-11-22 19:16:11.052435', 1);
INSERT INTO `goods_goodscategory` VALUES (22, '菌菇类', 'jgl', '', 2, 0, '2018-11-22 19:16:11.056435', 1);
INSERT INTO `goods_goodscategory` VALUES (23, '进口生鲜', 'jksx', '', 2, 0, '2018-11-22 19:16:11.059463', 1);
INSERT INTO `goods_goodscategory` VALUES (24, '酒水饮料', 'jsyl', '酒水饮料', 1, 1, '2018-11-22 19:16:00.000000', NULL);
INSERT INTO `goods_goodscategory` VALUES (25, '白酒', 'bk', '', 2, 0, '2018-11-22 19:16:11.065443', 24);
INSERT INTO `goods_goodscategory` VALUES (26, '五粮液', 'wly', '', 3, 0, '2018-11-22 19:16:11.068453', 25);
INSERT INTO `goods_goodscategory` VALUES (27, '泸州老窖', 'lzlj', '', 3, 0, '2018-11-22 19:16:11.071455', 25);
INSERT INTO `goods_goodscategory` VALUES (28, '茅台', 'mt', '', 3, 0, '2018-11-22 19:16:11.074454', 25);
INSERT INTO `goods_goodscategory` VALUES (29, '葡萄酒', 'ptj', '', 2, 0, '2018-11-22 19:16:11.077437', 24);
INSERT INTO `goods_goodscategory` VALUES (30, '洋酒', 'yj', '', 2, 0, '2018-11-22 19:16:11.080437', 24);
INSERT INTO `goods_goodscategory` VALUES (31, '啤酒', 'pj', '', 2, 0, '2018-11-22 19:16:11.084437', 24);
INSERT INTO `goods_goodscategory` VALUES (32, '其他酒品', 'qtjp', '', 2, 0, '2018-11-22 19:16:11.087439', 24);
INSERT INTO `goods_goodscategory` VALUES (33, '其他品牌', 'qtpp', '', 3, 0, '2018-11-22 19:16:11.091437', 32);
INSERT INTO `goods_goodscategory` VALUES (34, '黄酒', 'hj', '', 3, 0, '2018-11-22 19:16:11.094438', 32);
INSERT INTO `goods_goodscategory` VALUES (35, '养生酒', 'ysj', '', 3, 0, '2018-11-22 19:16:11.097439', 32);
INSERT INTO `goods_goodscategory` VALUES (36, '饮料/水', 'yls', '', 2, 0, '2018-11-22 19:16:11.100439', 24);
INSERT INTO `goods_goodscategory` VALUES (37, '红酒', 'hj', '', 2, 0, '2018-11-22 19:16:11.103442', 24);
INSERT INTO `goods_goodscategory` VALUES (38, '白兰地', 'bld', '', 3, 0, '2018-11-22 19:16:11.107458', 37);
INSERT INTO `goods_goodscategory` VALUES (39, '威士忌', 'wsj', '', 3, 0, '2018-11-22 19:16:11.109441', 37);
INSERT INTO `goods_goodscategory` VALUES (40, '粮油副食', '粮油副食', '粮油副食', 1, 1, '2018-11-22 19:16:00.000000', NULL);
INSERT INTO `goods_goodscategory` VALUES (41, '食用油', '食用油', '', 2, 0, '2018-11-22 19:16:11.116457', 40);
INSERT INTO `goods_goodscategory` VALUES (42, '其他食用油', '其他食用油', '', 3, 0, '2018-11-22 19:16:11.119441', 41);
INSERT INTO `goods_goodscategory` VALUES (43, '菜仔油', '菜仔油', '', 3, 0, '2018-11-22 19:16:11.123441', 41);
INSERT INTO `goods_goodscategory` VALUES (44, '花生油', '花生油', '', 3, 0, '2018-11-22 19:16:11.126458', 41);
INSERT INTO `goods_goodscategory` VALUES (45, '橄榄油', '橄榄油', '', 3, 0, '2018-11-22 19:16:11.129458', 41);
INSERT INTO `goods_goodscategory` VALUES (46, '礼盒', '礼盒', '', 3, 0, '2018-11-22 19:16:11.132440', 41);
INSERT INTO `goods_goodscategory` VALUES (47, '米面杂粮', '米面杂粮', '', 2, 0, '2018-11-22 19:16:11.135458', 40);
INSERT INTO `goods_goodscategory` VALUES (48, '面粉/面条', '面粉/面条', '', 3, 0, '2018-11-22 19:16:11.138458', 47);
INSERT INTO `goods_goodscategory` VALUES (49, '大米', '大米', '', 3, 0, '2018-11-22 19:16:11.140442', 47);
INSERT INTO `goods_goodscategory` VALUES (50, '意大利面', '意大利面', '', 3, 0, '2018-11-22 19:16:11.143441', 47);
INSERT INTO `goods_goodscategory` VALUES (51, '厨房调料', '厨房调料', '', 2, 0, '2018-11-22 19:16:11.146459', 40);
INSERT INTO `goods_goodscategory` VALUES (52, '调味油/汁', '调味油/汁', '', 3, 0, '2018-11-22 19:16:11.149459', 51);
INSERT INTO `goods_goodscategory` VALUES (53, '酱油/醋', '酱油/醋', '', 3, 0, '2018-11-22 19:16:11.152442', 51);
INSERT INTO `goods_goodscategory` VALUES (54, '南北干货', '南北干货', '', 2, 0, '2018-11-22 19:16:11.155444', 40);
INSERT INTO `goods_goodscategory` VALUES (55, '方便速食', '方便速食', '', 2, 0, '2018-11-22 19:16:11.158442', 40);
INSERT INTO `goods_goodscategory` VALUES (56, '调味品', '调味品', '', 2, 0, '2018-11-22 19:16:11.161461', 40);
INSERT INTO `goods_goodscategory` VALUES (57, '蔬菜水果', '蔬菜水果', '蔬菜水果', 1, 1, '2018-11-22 19:16:00.000000', NULL);
INSERT INTO `goods_goodscategory` VALUES (58, '有机蔬菜', '有机蔬菜', '', 2, 0, '2018-11-22 19:16:11.168445', 57);
INSERT INTO `goods_goodscategory` VALUES (59, '西红柿', '西红柿', '', 3, 0, '2018-11-22 19:16:11.171461', 58);
INSERT INTO `goods_goodscategory` VALUES (60, '韭菜', '韭菜', '', 3, 0, '2018-11-22 19:16:11.174444', 58);
INSERT INTO `goods_goodscategory` VALUES (61, '青菜', '青菜', '', 3, 0, '2018-11-22 19:16:11.177443', 58);
INSERT INTO `goods_goodscategory` VALUES (62, '精选蔬菜', '精选蔬菜', '', 2, 0, '2018-11-22 19:16:11.180444', 57);
INSERT INTO `goods_goodscategory` VALUES (63, '甘蓝', '甘蓝', '', 3, 0, '2018-11-22 19:16:11.183448', 62);
INSERT INTO `goods_goodscategory` VALUES (64, '胡萝卜', '胡萝卜', '', 3, 0, '2018-11-22 19:16:11.187748', 62);
INSERT INTO `goods_goodscategory` VALUES (65, '黄瓜', '黄瓜', '', 3, 0, '2018-11-22 19:16:11.191447', 62);
INSERT INTO `goods_goodscategory` VALUES (66, '进口水果', '进口水果', '', 2, 0, '2018-11-22 19:16:11.195445', 57);
INSERT INTO `goods_goodscategory` VALUES (67, '火龙果', '火龙果', '', 3, 0, '2018-11-22 19:16:11.199462', 66);
INSERT INTO `goods_goodscategory` VALUES (68, '菠萝蜜', '菠萝蜜', '', 3, 0, '2018-11-22 19:16:11.205445', 66);
INSERT INTO `goods_goodscategory` VALUES (69, '奇异果', '奇异果', '', 3, 0, '2018-11-22 19:16:11.208611', 66);
INSERT INTO `goods_goodscategory` VALUES (70, '国产水果', '国产水果', '', 2, 0, '2018-11-22 19:16:11.212447', 57);
INSERT INTO `goods_goodscategory` VALUES (71, '水果礼盒', '水果礼盒', '', 3, 0, '2018-11-22 19:16:11.216449', 70);
INSERT INTO `goods_goodscategory` VALUES (72, '苹果', '苹果', '', 3, 0, '2018-11-22 19:16:11.219452', 70);
INSERT INTO `goods_goodscategory` VALUES (73, '雪梨', '雪梨', '', 3, 0, '2018-11-22 19:16:11.222447', 70);
INSERT INTO `goods_goodscategory` VALUES (74, '休闲食品', '休闲食品', '休闲食品', 1, 1, '2018-11-22 19:16:00.000000', NULL);
INSERT INTO `goods_goodscategory` VALUES (75, '休闲零食', '休闲零食', '', 2, 0, '2018-11-22 19:16:11.232461', 74);
INSERT INTO `goods_goodscategory` VALUES (76, '果冻', '果冻', '', 3, 0, '2018-11-22 19:16:11.235448', 75);
INSERT INTO `goods_goodscategory` VALUES (77, '枣类', '枣类', '', 3, 0, '2018-11-22 19:16:11.239466', 75);
INSERT INTO `goods_goodscategory` VALUES (78, '蜜饯', '蜜饯', '', 3, 0, '2018-11-22 19:16:11.242449', 75);
INSERT INTO `goods_goodscategory` VALUES (79, '肉类零食', '肉类零食', '', 3, 0, '2018-11-22 19:16:11.246463', 75);
INSERT INTO `goods_goodscategory` VALUES (80, '坚果炒货', '坚果炒货', '', 3, 0, '2018-11-22 19:16:11.249453', 75);
INSERT INTO `goods_goodscategory` VALUES (81, '糖果', '糖果', '', 2, 0, '2018-11-22 19:16:11.253454', 74);
INSERT INTO `goods_goodscategory` VALUES (82, '创意喜糖', '创意喜糖', '', 3, 0, '2018-11-22 19:16:11.257464', 81);
INSERT INTO `goods_goodscategory` VALUES (83, '口香糖', '口香糖', '', 3, 0, '2018-11-22 19:16:11.260451', 81);
INSERT INTO `goods_goodscategory` VALUES (84, '软糖', '软糖', '', 3, 0, '2018-11-22 19:16:11.264470', 81);
INSERT INTO `goods_goodscategory` VALUES (85, '棒棒糖', '棒棒糖', '', 3, 0, '2018-11-22 19:16:11.267450', 81);
INSERT INTO `goods_goodscategory` VALUES (86, '巧克力', '巧克力', '', 2, 0, '2018-11-22 19:16:11.271465', 74);
INSERT INTO `goods_goodscategory` VALUES (87, '夹心巧克力', '夹心巧克力', '', 3, 0, '2018-11-22 19:16:11.274468', 86);
INSERT INTO `goods_goodscategory` VALUES (88, '白巧克力', '白巧克力', '', 3, 0, '2018-11-22 19:16:11.278464', 86);
INSERT INTO `goods_goodscategory` VALUES (89, '松露巧克力', '松露巧克力', '', 3, 0, '2018-11-22 19:16:11.281463', 86);
INSERT INTO `goods_goodscategory` VALUES (90, '黑巧克力', '黑巧克力', '', 3, 0, '2018-11-22 19:16:11.284468', 86);
INSERT INTO `goods_goodscategory` VALUES (91, '肉干肉脯/豆干', '肉干肉脯/豆干', '', 2, 0, '2018-11-22 19:16:11.287452', 74);
INSERT INTO `goods_goodscategory` VALUES (92, '牛肉干', '牛肉干', '', 3, 0, '2018-11-22 19:16:11.290453', 91);
INSERT INTO `goods_goodscategory` VALUES (93, '猪肉脯', '猪肉脯', '', 3, 0, '2018-11-22 19:16:11.294455', 91);
INSERT INTO `goods_goodscategory` VALUES (94, '牛肉粒', '牛肉粒', '', 3, 0, '2018-11-22 19:16:11.297472', 91);
INSERT INTO `goods_goodscategory` VALUES (95, '猪肉干', '猪肉干', '', 3, 0, '2018-11-22 19:16:11.300468', 91);
INSERT INTO `goods_goodscategory` VALUES (96, '鱿鱼丝/鱼干', '鱿鱼丝/鱼干', '', 2, 0, '2018-11-22 19:16:11.303454', 74);
INSERT INTO `goods_goodscategory` VALUES (97, '鱿鱼足', '鱿鱼足', '', 3, 0, '2018-11-22 19:16:11.306455', 96);
INSERT INTO `goods_goodscategory` VALUES (98, '鱿鱼丝', '鱿鱼丝', '', 3, 0, '2018-11-22 19:16:11.309454', 96);
INSERT INTO `goods_goodscategory` VALUES (99, '墨鱼/乌贼', '墨鱼/乌贼', '', 3, 0, '2018-11-22 19:16:11.312467', 96);
INSERT INTO `goods_goodscategory` VALUES (100, '鱿鱼仔', '鱿鱼仔', '', 3, 0, '2018-11-22 19:16:11.315548', 96);
INSERT INTO `goods_goodscategory` VALUES (101, '鱿鱼片', '鱿鱼片', '', 3, 0, '2018-11-22 19:16:11.318473', 96);
INSERT INTO `goods_goodscategory` VALUES (102, '奶类食品', '奶类食品', '', 1, 0, '2018-11-22 19:16:11.321674', NULL);
INSERT INTO `goods_goodscategory` VALUES (103, '进口奶品', '进口奶品', '', 2, 0, '2018-11-22 19:16:11.324475', 102);
INSERT INTO `goods_goodscategory` VALUES (104, '国产奶品', '国产奶品', '', 2, 0, '2018-11-22 19:16:11.327456', 102);
INSERT INTO `goods_goodscategory` VALUES (105, '奶粉', '奶粉', '', 2, 0, '2018-11-22 19:16:11.331455', 102);
INSERT INTO `goods_goodscategory` VALUES (106, '有机奶', '有机奶', '', 2, 0, '2018-11-22 19:16:11.334455', 102);
INSERT INTO `goods_goodscategory` VALUES (107, '原料奶', '原料奶', '', 2, 0, '2018-11-22 19:16:11.337471', 102);
INSERT INTO `goods_goodscategory` VALUES (108, '天然干货', '天然干货', '', 1, 0, '2018-11-22 19:16:11.340471', NULL);
INSERT INTO `goods_goodscategory` VALUES (109, '菌菇类', '菌菇类', '', 2, 0, '2018-11-22 19:16:11.343457', 108);
INSERT INTO `goods_goodscategory` VALUES (110, '腌干海产', '腌干海产', '', 2, 0, '2018-11-22 19:16:11.346456', 108);
INSERT INTO `goods_goodscategory` VALUES (111, '汤料', '汤料', '', 2, 0, '2018-11-22 19:16:11.350457', 108);
INSERT INTO `goods_goodscategory` VALUES (112, '豆类', '豆类', '', 2, 0, '2018-11-22 19:16:11.353458', 108);
INSERT INTO `goods_goodscategory` VALUES (113, '干菜/菜干', '干菜/菜干', '', 2, 0, '2018-11-22 19:16:11.356456', 108);
INSERT INTO `goods_goodscategory` VALUES (114, '干果/果干', '干果/果干', '', 2, 0, '2018-11-22 19:16:11.358456', 108);
INSERT INTO `goods_goodscategory` VALUES (115, '豆制品', '豆制品', '', 2, 0, '2018-11-22 19:16:11.361457', 108);
INSERT INTO `goods_goodscategory` VALUES (116, '腊味', '腊味', '', 2, 0, '2018-11-22 19:16:11.364458', 108);
INSERT INTO `goods_goodscategory` VALUES (117, '精选茗茶', '精选茗茶', '', 1, 0, '2018-11-22 19:16:11.367458', NULL);
INSERT INTO `goods_goodscategory` VALUES (118, '白茶', '白茶', '', 2, 0, '2018-11-22 19:16:11.370458', 117);
INSERT INTO `goods_goodscategory` VALUES (119, '红茶', '红茶', '', 2, 0, '2018-11-22 19:16:11.373458', 117);
INSERT INTO `goods_goodscategory` VALUES (120, '绿茶', '绿茶', '', 2, 0, '2018-11-22 19:16:11.376459', 117);

-- ----------------------------
-- Table structure for goods_goodsimage
-- ----------------------------
DROP TABLE IF EXISTS `goods_goodsimage`;
CREATE TABLE `goods_goodsimage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` datetime(6) NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id`(`goods_id`) USING BTREE,
  CONSTRAINT `goods_goodsimage_goods_id_08cb23b1_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_goodsimage
-- ----------------------------
INSERT INTO `goods_goodsimage` VALUES (1, 'goods/images/1_P_1449024889889.jpg', '2018-11-22 19:26:30.802751', 1);
INSERT INTO `goods_goodsimage` VALUES (2, '2_20170719161405_249.jpg', '2018-11-22 19:26:30.808750', 1);
INSERT INTO `goods_goodsimage` VALUES (3, '2_20170719161414_628.jpg', '2018-11-22 19:26:30.811752', 1);
INSERT INTO `goods_goodsimage` VALUES (4, 'goods/images/1_P_1449024889018.jpg', '2018-11-22 19:26:30.817752', 1);
INSERT INTO `goods_goodsimage` VALUES (5, 'goods/images/1_P_1449024889287.jpg', '2018-11-22 19:26:30.820750', 1);
INSERT INTO `goods_goodsimage` VALUES (6, 'goods/images/2_P_1448945810202.jpg', '2018-11-22 19:26:30.827750', 2);
INSERT INTO `goods_goodsimage` VALUES (7, 'goods/images/2_P_1448945810814.jpg', '2018-11-22 19:26:30.829751', 2);
INSERT INTO `goods_goodsimage` VALUES (8, 'goods/images/7_P_1448945104883.jpg', '2018-11-22 19:26:30.836752', 3);
INSERT INTO `goods_goodsimage` VALUES (9, 'goods/images/7_P_1448945104734.jpg', '2018-11-22 19:26:30.838751', 3);
INSERT INTO `goods_goodsimage` VALUES (10, 'goods/images/47_P_1448946213263.jpg', '2018-11-22 19:26:30.845752', 4);
INSERT INTO `goods_goodsimage` VALUES (11, 'goods/images/47_P_1448946213157.jpg', '2018-11-22 19:26:30.847751', 4);
INSERT INTO `goods_goodsimage` VALUES (12, 'goods/images/10_P_1448944572085.jpg', '2018-11-22 19:26:30.855753', 5);
INSERT INTO `goods_goodsimage` VALUES (13, 'goods/images/10_P_1448944572532.jpg', '2018-11-22 19:26:30.858753', 5);
INSERT INTO `goods_goodsimage` VALUES (14, 'goods/images/10_P_1448944572872.jpg', '2018-11-22 19:26:30.861754', 5);
INSERT INTO `goods_goodsimage` VALUES (15, 'goods/images/4_P_1448945381985.jpg', '2018-11-22 19:26:30.870754', 6);
INSERT INTO `goods_goodsimage` VALUES (16, 'goods/images/4_P_1448945381013.jpg', '2018-11-22 19:26:30.872754', 6);
INSERT INTO `goods_goodsimage` VALUES (17, 'goods/images/8_P_1448945032810.jpg', '2018-11-22 19:26:30.880755', 7);
INSERT INTO `goods_goodsimage` VALUES (18, 'goods/images/8_P_1448945032646.jpg', '2018-11-22 19:26:30.883755', 7);
INSERT INTO `goods_goodsimage` VALUES (19, 'goods/images/11_P_1448944388277.jpg', '2018-11-22 19:26:30.891757', 8);
INSERT INTO `goods_goodsimage` VALUES (20, 'goods/images/11_P_1448944388034.jpg', '2018-11-22 19:26:30.894755', 8);
INSERT INTO `goods_goodsimage` VALUES (21, 'goods/images/11_P_1448944388201.jpg', '2018-11-22 19:26:30.898755', 8);
INSERT INTO `goods_goodsimage` VALUES (22, 'goods/images/6_P_1448945167279.jpg', '2018-11-22 19:26:30.905757', 9);
INSERT INTO `goods_goodsimage` VALUES (23, 'goods/images/6_P_1448945167015.jpg', '2018-11-22 19:26:30.908757', 9);
INSERT INTO `goods_goodsimage` VALUES (24, 'goods/images/9_P_1448944791617.jpg', '2018-11-22 19:26:30.915757', 10);
INSERT INTO `goods_goodsimage` VALUES (25, 'goods/images/9_P_1448944791129.jpg', '2018-11-22 19:26:30.918758', 10);
INSERT INTO `goods_goodsimage` VALUES (26, 'goods/images/9_P_1448944791077.jpg', '2018-11-22 19:26:30.921757', 10);
INSERT INTO `goods_goodsimage` VALUES (27, 'goods/images/9_P_1448944791229.jpg', '2018-11-22 19:26:30.924759', 10);
INSERT INTO `goods_goodsimage` VALUES (28, 'goods/images/3_P_1448945490837.jpg', '2018-11-22 19:26:30.931759', 11);
INSERT INTO `goods_goodsimage` VALUES (29, 'goods/images/3_P_1448945490084.jpg', '2018-11-22 19:26:30.934758', 11);
INSERT INTO `goods_goodsimage` VALUES (30, 'goods/images/48_P_1448943988970.jpg', '2018-11-22 19:26:30.942759', 12);
INSERT INTO `goods_goodsimage` VALUES (31, 'goods/images/48_P_1448943988898.jpg', '2018-11-22 19:26:30.945758', 12);
INSERT INTO `goods_goodsimage` VALUES (32, 'goods/images/48_P_1448943988439.jpg', '2018-11-22 19:26:30.948758', 12);
INSERT INTO `goods_goodsimage` VALUES (33, 'goods/images/5_P_1448945270390.jpg', '2018-11-22 19:26:30.956759', 13);
INSERT INTO `goods_goodsimage` VALUES (34, 'goods/images/5_P_1448945270067.jpg', '2018-11-22 19:26:30.959760', 13);
INSERT INTO `goods_goodsimage` VALUES (35, 'goods/images/5_P_1448945270432.jpg', '2018-11-22 19:26:30.962760', 13);
INSERT INTO `goods_goodsimage` VALUES (36, 'images/201705/goods_img/53_P_1495068879687.jpg', '2018-11-22 19:26:30.969762', 14);
INSERT INTO `goods_goodsimage` VALUES (37, 'goods/images/16_P_1448947194687.jpg', '2018-11-22 19:26:30.977760', 15);
INSERT INTO `goods_goodsimage` VALUES (38, 'goods/images/14_P_1448947354031.jpg', '2018-11-22 19:26:30.985761', 16);
INSERT INTO `goods_goodsimage` VALUES (39, 'goods/images/14_P_1448947354433.jpg', '2018-11-22 19:26:30.988762', 16);
INSERT INTO `goods_goodsimage` VALUES (40, 'goods/images/12_P_1448947547989.jpg', '2018-11-22 19:26:30.996761', 17);
INSERT INTO `goods_goodsimage` VALUES (41, 'goods/images/46_P_1448946598711.jpg', '2018-11-22 19:26:31.004763', 18);
INSERT INTO `goods_goodsimage` VALUES (42, 'goods/images/46_P_1448946598301.jpg', '2018-11-22 19:26:31.007762', 18);
INSERT INTO `goods_goodsimage` VALUES (43, 'goods/images/21_P_1448946793276.jpg', '2018-11-22 19:26:31.017764', 19);
INSERT INTO `goods_goodsimage` VALUES (44, 'goods/images/21_P_1448946793153.jpg', '2018-11-22 19:26:31.021764', 19);
INSERT INTO `goods_goodsimage` VALUES (45, 'goods/images/15_P_1448947257324.jpg', '2018-11-22 19:26:31.031764', 20);
INSERT INTO `goods_goodsimage` VALUES (46, 'goods/images/15_P_1448947257580.jpg', '2018-11-22 19:26:31.035767', 20);
INSERT INTO `goods_goodsimage` VALUES (47, 'goods/images/13_P_1448947460386.jpg', '2018-11-22 19:26:31.043766', 21);
INSERT INTO `goods_goodsimage` VALUES (48, 'goods/images/13_P_1448947460276.jpg', '2018-11-22 19:26:31.046766', 21);
INSERT INTO `goods_goodsimage` VALUES (49, 'goods/images/13_P_1448947460353.jpg', '2018-11-22 19:26:31.048768', 21);
INSERT INTO `goods_goodsimage` VALUES (50, 'goods/images/50_P_1448946543091.jpg', '2018-11-22 19:26:31.057768', 22);
INSERT INTO `goods_goodsimage` VALUES (51, 'goods/images/50_P_1448946542182.jpg', '2018-11-22 19:26:31.059769', 22);
INSERT INTO `goods_goodsimage` VALUES (52, 'goods/images/51_P_1448946466595.jpg', '2018-11-22 19:26:31.067769', 23);
INSERT INTO `goods_goodsimage` VALUES (53, 'goods/images/51_P_1448946466208.jpg', '2018-11-22 19:26:31.070768', 23);
INSERT INTO `goods_goodsimage` VALUES (54, 'goods/images/17_P_1448947102246.jpg', '2018-11-22 19:26:31.077769', 24);
INSERT INTO `goods_goodsimage` VALUES (55, 'goods/images/20_P_1448946850602.jpg', '2018-11-22 19:26:31.086770', 25);
INSERT INTO `goods_goodsimage` VALUES (56, 'goods/images/19_P_1448946951581.jpg', '2018-11-22 19:26:31.095770', 26);
INSERT INTO `goods_goodsimage` VALUES (57, 'goods/images/19_P_1448946951726.jpg', '2018-11-22 19:26:31.098770', 26);
INSERT INTO `goods_goodsimage` VALUES (58, 'goods/images/18_P_1448947011435.jpg', '2018-11-22 19:26:31.107771', 27);
INSERT INTO `goods_goodsimage` VALUES (59, 'goods/images/22_P_1448946729629.jpg', '2018-11-22 19:26:31.116771', 28);
INSERT INTO `goods_goodsimage` VALUES (60, 'goods/images/45_P_1448946661303.jpg', '2018-11-22 19:26:31.127773', 29);
INSERT INTO `goods_goodsimage` VALUES (61, 'goods/images/32_P_1448948525620.jpg', '2018-11-22 19:26:31.137791', 30);
INSERT INTO `goods_goodsimage` VALUES (62, 'goods/images/30_P_1448948663450.jpg', '2018-11-22 19:26:31.146775', 31);
INSERT INTO `goods_goodsimage` VALUES (63, 'goods/images/30_P_1448948662571.jpg', '2018-11-22 19:26:31.149774', 31);
INSERT INTO `goods_goodsimage` VALUES (64, 'goods/images/30_P_1448948663221.jpg', '2018-11-22 19:26:31.151775', 31);
INSERT INTO `goods_goodsimage` VALUES (65, 'goods/images/31_P_1448948598947.jpg', '2018-11-22 19:26:31.159775', 32);
INSERT INTO `goods_goodsimage` VALUES (66, 'goods/images/31_P_1448948598475.jpg', '2018-11-22 19:26:31.162775', 32);
INSERT INTO `goods_goodsimage` VALUES (67, 'goods/images/35_P_1448948333610.jpg', '2018-11-22 19:26:31.170776', 33);
INSERT INTO `goods_goodsimage` VALUES (68, 'goods/images/35_P_1448948333313.jpg', '2018-11-22 19:26:31.172777', 33);
INSERT INTO `goods_goodsimage` VALUES (69, 'goods/images/36_P_1448948234405.jpg', '2018-11-22 19:26:31.180776', 34);
INSERT INTO `goods_goodsimage` VALUES (70, 'goods/images/36_P_1448948234250.jpg', '2018-11-22 19:26:31.183777', 34);
INSERT INTO `goods_goodsimage` VALUES (71, 'goods/images/33_P_1448948479966.jpg', '2018-11-22 19:26:31.193777', 35);
INSERT INTO `goods_goodsimage` VALUES (72, 'goods/images/33_P_1448948479886.jpg', '2018-11-22 19:26:31.196777', 35);
INSERT INTO `goods_goodsimage` VALUES (73, 'goods/images/34_P_1448948399009.jpg', '2018-11-22 19:26:31.204779', 36);
INSERT INTO `goods_goodsimage` VALUES (74, 'goods/images/43_P_1448948762645.jpg', '2018-11-22 19:26:31.212778', 37);
INSERT INTO `goods_goodsimage` VALUES (75, 'goods/images/38_P_1448949220255.jpg', '2018-11-22 19:26:31.220782', 38);
INSERT INTO `goods_goodsimage` VALUES (76, 'goods/images/44_P_1448948850187.jpg', '2018-11-22 19:26:31.228780', 39);
INSERT INTO `goods_goodsimage` VALUES (77, 'images/201511/goods_img/49_P_1448162819889.jpg', '2018-11-22 19:26:31.236782', 40);
INSERT INTO `goods_goodsimage` VALUES (78, 'goods/images/40_P_1448949038702.jpg', '2018-11-22 19:26:31.244781', 41);
INSERT INTO `goods_goodsimage` VALUES (79, 'goods/images/39_P_1448949115481.jpg', '2018-11-22 19:26:31.253786', 42);
INSERT INTO `goods_goodsimage` VALUES (80, 'goods/images/41_P_1448948980358.jpg', '2018-11-22 19:26:31.260782', 43);
INSERT INTO `goods_goodsimage` VALUES (81, 'goods/images/37_P_1448949284365.jpg', '2018-11-22 19:26:31.268796', 44);
INSERT INTO `goods_goodsimage` VALUES (82, 'goods/images/42_P_1448948895193.jpg', '2018-11-22 19:26:31.276799', 45);
INSERT INTO `goods_goodsimage` VALUES (83, 'goods/images/27_P_1448947771805.jpg', '2018-11-22 19:26:31.285104', 46);
INSERT INTO `goods_goodsimage` VALUES (84, 'goods/images/23_P_1448948070348.jpg', '2018-11-22 19:26:31.293788', 47);
INSERT INTO `goods_goodsimage` VALUES (85, 'goods/images/26_P_1448947825754.jpg', '2018-11-22 19:26:31.301789', 48);
INSERT INTO `goods_goodsimage` VALUES (86, 'goods/images/28_P_1448947699948.jpg', '2018-11-22 19:26:31.315788', 49);
INSERT INTO `goods_goodsimage` VALUES (87, 'goods/images/28_P_1448947699777.jpg', '2018-11-22 19:26:31.318789', 49);
INSERT INTO `goods_goodsimage` VALUES (88, 'goods/images/24_P_1448948023823.jpg', '2018-11-22 19:26:31.325788', 50);
INSERT INTO `goods_goodsimage` VALUES (89, 'goods/images/24_P_1448948023977.jpg', '2018-11-22 19:26:31.328791', 50);
INSERT INTO `goods_goodsimage` VALUES (90, 'goods/images/25_P_1448947875346.jpg', '2018-11-22 19:26:31.340788', 51);
INSERT INTO `goods_goodsimage` VALUES (91, 'goods/images/29_P_1448947631994.jpg', '2018-11-22 19:26:31.349789', 52);

-- ----------------------------
-- Table structure for goods_hotsearchwords
-- ----------------------------
DROP TABLE IF EXISTS `goods_hotsearchwords`;
CREATE TABLE `goods_hotsearchwords`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for goods_indexad
-- ----------------------------
DROP TABLE IF EXISTS `goods_indexad`;
CREATE TABLE `goods_indexad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goods_indexad_category_id_cf834e34_fk_goods_goodscategory_id`(`category_id`) USING BTREE,
  INDEX `goods_indexad_goods_id_e1361e4f_fk_goods_goods_id`(`goods_id`) USING BTREE,
  CONSTRAINT `goods_indexad_category_id_cf834e34_fk_goods_goodscategory_id` FOREIGN KEY (`category_id`) REFERENCES `goods_goodscategory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `goods_indexad_goods_id_e1361e4f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_indexad
-- ----------------------------
INSERT INTO `goods_indexad` VALUES (1, 1, 1);
INSERT INTO `goods_indexad` VALUES (2, 24, 15);

-- ----------------------------
-- Table structure for trade_ordergoods
-- ----------------------------
DROP TABLE IF EXISTS `trade_ordergoods`;
CREATE TABLE `trade_ordergoods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_num` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id`(`goods_id`) USING BTREE,
  INDEX `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id`(`order_id`) USING BTREE,
  CONSTRAINT `trade_ordergoods_goods_id_e77dc520_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `trade_ordergoods_order_id_e046f633_fk_trade_orderinfo_id` FOREIGN KEY (`order_id`) REFERENCES `trade_orderinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade_ordergoods
-- ----------------------------
INSERT INTO `trade_ordergoods` VALUES (1, 2, '2018-11-30 22:05:35.680209', 1, 1);
INSERT INTO `trade_ordergoods` VALUES (2, 1, '2018-11-30 22:05:35.699218', 15, 1);

-- ----------------------------
-- Table structure for trade_orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `trade_orderinfo`;
CREATE TABLE `trade_orderinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nonce_str` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trade_no` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pay_status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pay_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_script` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_mount` double NOT NULL,
  `pay_time` datetime(6) NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `signer_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `singer_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_sn`(`order_sn`) USING BTREE,
  UNIQUE INDEX `nonce_str`(`nonce_str`) USING BTREE,
  UNIQUE INDEX `trade_no`(`trade_no`) USING BTREE,
  INDEX `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `trade_orderinfo_user_id_08ffa22c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade_orderinfo
-- ----------------------------
INSERT INTO `trade_orderinfo` VALUES (1, '20181130220535192', NULL, NULL, 'paying', 'alipay', '测试', 331, NULL, '浙江省宁波市海曙区阿里巴巴', '马云', '15858585858', '2018-11-30 22:05:35.668229', 1);

-- ----------------------------
-- Table structure for trade_shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `trade_shoppingcart`;
CREATE TABLE `trade_shoppingcart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nums` int(11) NOT NULL,
  `add_time` datetime(6) NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `trade_shoppingcart_user_id_goods_id_92225e66_uniq`(`user_id`, `goods_id`) USING BTREE,
  INDEX `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id`(`goods_id`) USING BTREE,
  CONSTRAINT `trade_shoppingcart_goods_id_8b0f3cb4_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `trade_shoppingcart_user_id_da423c9c_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trade_shoppingcart
-- ----------------------------
INSERT INTO `trade_shoppingcart` VALUES (1, 1, '2018-11-30 19:22:54.199432', 2, 7);

-- ----------------------------
-- Table structure for user_operation_useraddress
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_useraddress`;
CREATE TABLE `user_operation_useraddress`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `district` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `signer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `signer_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_operation_usera_user_id_fe128593_fk_users_use`(`user_id`) USING BTREE,
  CONSTRAINT `user_operation_usera_user_id_fe128593_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_operation_useraddress
-- ----------------------------
INSERT INTO `user_operation_useraddress` VALUES (1, '浙江省', '杭州市', '上城区', '阿里巴巴', '马云', '15858585888', '2018-11-30 14:06:31.335676', 7);
INSERT INTO `user_operation_useraddress` VALUES (2, '浙江省', '宁波市', '海曙区', '阿里巴巴', '马云', '15858585858', '2018-11-30 22:05:20.716250', 1);

-- ----------------------------
-- Table structure for user_operation_userfav
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userfav`;
CREATE TABLE `user_operation_userfav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_operation_userfav_user_id_goods_id_2dbadda7_uniq`(`user_id`, `goods_id`) USING BTREE,
  INDEX `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id`(`goods_id`) USING BTREE,
  CONSTRAINT `user_operation_userfav_goods_id_57fc554f_fk_goods_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_operation_userfav_user_id_4e4de070_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_operation_userfav
-- ----------------------------
INSERT INTO `user_operation_userfav` VALUES (2, '2018-11-28 14:50:00.000000', 1, 7);

-- ----------------------------
-- Table structure for user_operation_userleavingmessage
-- ----------------------------
DROP TABLE IF EXISTS `user_operation_userleavingmessage`;
CREATE TABLE `user_operation_userleavingmessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` int(11) NOT NULL,
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` datetime(6) NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_operation_userl_user_id_70d909d6_fk_users_use`(`user_id`) USING BTREE,
  CONSTRAINT `user_operation_userl_user_id_70d909d6_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_operation_userleavingmessage
-- ----------------------------
INSERT INTO `user_operation_userleavingmessage` VALUES (1, 1, '测试', 'test', '', '2018-11-30 13:54:34.828981', 7);

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (1, 'pbkdf2_sha256$120000$yvUl6oYJQmHX$q00t1j+O3mJHt8uJ6RHf6llNIgWGBYB6jbZyixN5B2c=', '2018-11-27 22:34:33.333404', 1, 'admin', '', '', 1, 1, '2018-11-22 11:18:09.182813', NULL, NULL, 'female', '', 'admin@qq.com');
INSERT INTO `users_userprofile` VALUES (2, 'pbkdf2_sha256$120000$CpOTjgmrMbRD$qXphJwJvGex3nOa3D6FIVl1/TWgXkpPupHg7K9NPwqs=', NULL, 0, '15858585858', '', '', 0, 1, '2018-11-27 22:51:02.234556', NULL, NULL, 'female', '15858585858', NULL);
INSERT INTO `users_userprofile` VALUES (4, 'pbkdf2_sha256$120000$2r1rnK9DiTdd$WWyw8eFNzCZkXu62jfsXP+vK3s6TPDFMhIUwmwafScg=', NULL, 0, '15858585855', '', '', 0, 1, '2018-11-27 22:59:50.216765', NULL, NULL, 'female', '15858585855', NULL);
INSERT INTO `users_userprofile` VALUES (7, 'pbkdf2_sha256$120000$e1m7TGv0Cmmv$0g1LP2tTPCWRfXER1ene5e8QHfB9ZeNaP0kCpwG5F6M=', NULL, 0, '15858585888', '', '', 0, 1, '2018-11-28 09:22:02.232087', '马云', '2018-11-15', 'female', '15858585888', NULL);
INSERT INTO `users_userprofile` VALUES (8, 'pbkdf2_sha256$120000$kgJjXKVP3eDR$fjeIPxKN2cGqmbkJZRlV4wi+qk4dRZ5rCW2xOFKy1F8=', NULL, 0, '15858585899', '', '', 0, 1, '2018-11-28 09:29:27.470890', NULL, NULL, 'female', '15858585899', NULL);
INSERT INTO `users_userprofile` VALUES (9, 'pbkdf2_sha256$120000$IYMYJv8JlBE5$nJwUg1DIy4fcf6JNCA2gSN1OPipPBONInUjVGaZYdpE=', NULL, 0, '15858585800', '', '', 0, 1, '2018-11-28 09:30:43.320773', NULL, NULL, 'female', '15858585800', NULL);

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_us_permission_id_393136b6_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `users_verifycode`;
CREATE TABLE `users_verifycode`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_verifycode
-- ----------------------------
INSERT INTO `users_verifycode` VALUES (1, '1234', '15858585858', '2018-11-27 22:34:00.000000');
INSERT INTO `users_verifycode` VALUES (2, '1234', '15858585858', '2018-11-27 22:49:00.000000');
INSERT INTO `users_verifycode` VALUES (3, '1234', '15858585855', '2018-11-27 22:57:00.000000');
INSERT INTO `users_verifycode` VALUES (4, '1234', '15858585888', '2018-11-28 00:01:00.000000');
INSERT INTO `users_verifycode` VALUES (5, '1234', '15858585888', '2018-11-28 08:59:00.000000');
INSERT INTO `users_verifycode` VALUES (6, '1234', '15858585888', '2018-11-28 09:21:00.000000');
INSERT INTO `users_verifycode` VALUES (7, '1234', '15858585899', '2018-11-28 09:28:00.000000');
INSERT INTO `users_verifycode` VALUES (8, '1234', '15858585800', '2018-11-28 09:30:00.000000');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (1, '2018-11-23 14:09:23.191093', '127.0.0.1', '1', '生鲜食品', 'change', '修改 desc 和 is_tab', 9, 1);
INSERT INTO `xadmin_log` VALUES (2, '2018-11-23 14:10:04.682071', '127.0.0.1', '24', '酒水饮料', 'change', '修改 desc 和 is_tab', 9, 1);
INSERT INTO `xadmin_log` VALUES (3, '2018-11-23 14:10:19.489353', '127.0.0.1', '40', '粮油副食', 'change', '修改 desc 和 is_tab', 9, 1);
INSERT INTO `xadmin_log` VALUES (4, '2018-11-23 14:10:35.853924', '127.0.0.1', '57', '蔬菜水果', 'change', '修改 desc 和 is_tab', 9, 1);
INSERT INTO `xadmin_log` VALUES (5, '2018-11-23 14:10:50.320617', '127.0.0.1', '74', '休闲食品', 'change', '修改 desc 和 is_tab', 9, 1);
INSERT INTO `xadmin_log` VALUES (6, '2018-11-27 22:35:15.954686', '127.0.0.1', '1', '1234', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (7, '2018-11-27 22:49:36.787736', '127.0.0.1', '2', '1234', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (8, '2018-11-27 22:57:56.931820', '127.0.0.1', '3', '1234', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (9, '2018-11-28 00:01:54.799887', '127.0.0.1', '4', '1234', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (10, '2018-11-28 09:00:02.176006', '127.0.0.1', '5', '1234', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (11, '2018-11-28 09:05:25.279549', '127.0.0.1', '6', '1234', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (12, '2018-11-28 09:13:46.112728', '127.0.0.1', '6', '1234', 'change', '修改 add_time', 6, 1);
INSERT INTO `xadmin_log` VALUES (13, '2018-11-28 09:21:44.402693', '127.0.0.1', '6', '1234', 'change', '修改 add_time', 6, 1);
INSERT INTO `xadmin_log` VALUES (14, '2018-11-28 09:28:24.087097', '127.0.0.1', '7', '1234', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (15, '2018-11-28 09:30:33.519931', '127.0.0.1', '8', '1234', 'create', '已添加。', 6, 1);
INSERT INTO `xadmin_log` VALUES (16, '2018-11-28 12:16:21.076589', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_sn 和 goods_desc', 8, 1);
INSERT INTO `xadmin_log` VALUES (17, '2018-11-28 12:43:33.588224', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'change', '修改 goods_desc', 8, 1);
INSERT INTO `xadmin_log` VALUES (18, '2018-11-28 13:55:41.215191', '127.0.0.1', '1', 'admin', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (19, '2018-11-28 14:50:34.404317', '127.0.0.1', '2', '15858585888', 'create', '已添加。', 18, 1);
INSERT INTO `xadmin_log` VALUES (20, '2018-12-01 12:11:47.597422', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (21, '2018-12-01 12:11:58.485633', '127.0.0.1', '2', '田然牛肉大黄瓜条生鲜牛肉冷冻真空黄牛', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (22, '2018-12-01 12:12:06.305145', '127.0.0.1', '3', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', 'create', '已添加。', 7, 1);
INSERT INTO `xadmin_log` VALUES (23, '2018-12-01 12:16:35.595581', '127.0.0.1', '45', '伊利官方直营全脂营养舒化奶250ml*12盒*2提', 'change', '修改 goods_sn，goods_brief，goods_desc 和 is_new', 8, 1);
INSERT INTO `xadmin_log` VALUES (24, '2018-12-01 12:17:09.243494', '127.0.0.1', '46', '维纳斯橄榄菜籽油5L/桶', 'change', '修改 goods_sn，goods_brief 和 goods_desc', 8, 1);
INSERT INTO `xadmin_log` VALUES (25, '2018-12-01 12:17:22.089591', '127.0.0.1', '46', '维纳斯橄榄菜籽油5L/桶', 'change', '修改 is_new', 8, 1);
INSERT INTO `xadmin_log` VALUES (26, '2018-12-01 12:18:02.933653', '127.0.0.1', '47', '糙米450gx3包粮油米面', 'change', '修改 goods_sn，goods_brief 和 goods_desc', 8, 1);
INSERT INTO `xadmin_log` VALUES (27, '2018-12-01 12:35:22.207317', '127.0.0.1', '1', '发育宝', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (28, '2018-12-01 12:35:43.790103', '127.0.0.1', '2', '艾尔', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (29, '2018-12-01 12:36:10.671521', '127.0.0.1', '3', '金赏', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (30, '2018-12-01 12:36:27.289009', '127.0.0.1', '4', '金赏', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (31, '2018-12-01 12:36:57.375494', '127.0.0.1', '5', '托儿索', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (32, '2018-12-01 12:37:14.769434', '127.0.0.1', '6', 'ppp', 'create', '已添加。', 10, 1);
INSERT INTO `xadmin_log` VALUES (33, '2018-12-01 12:38:05.956588', '127.0.0.1', '1', '新鲜水果甜蜜香脆单果约800克', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (34, '2018-12-01 12:39:00.281379', '127.0.0.1', '2', '酣畅家庭菲力牛排10片澳洲生鲜牛肉团购套餐', 'create', '已添加。', 13, 1);
INSERT INTO `xadmin_log` VALUES (35, '2018-12-01 12:39:53.187467', '127.0.0.1', '2', '52度茅台集团国隆双喜酒500mlx6', 'change', '修改 category 和 goods', 13, 1);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
