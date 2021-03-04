/*
 Navicat Premium Data Transfer

 Source Server         : 本地连接
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : 127.0.0.1:3306
 Source Schema         : o2o

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 27/05/2020 10:30:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_area`;
CREATE TABLE `tb_area`  (
  `area_id` int(2) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`area_id`) USING BTREE,
  UNIQUE INDEX `UK_AREA`(`area_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_area
-- ----------------------------
INSERT INTO `tb_area` VALUES (1, '东苑', 1, NULL, NULL);
INSERT INTO `tb_area` VALUES (2, '西苑', 2, NULL, NULL);
INSERT INTO `tb_area` VALUES (4, '北苑', 2, '2019-11-29 14:40:07', '2019-11-29 14:40:07');

-- ----------------------------
-- Table structure for tb_cart
-- ----------------------------
DROP TABLE IF EXISTS `tb_cart`;
CREATE TABLE `tb_cart`  (
  `cart_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL,
  `product_id` int(100) NULL DEFAULT NULL,
  `num` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE,
  INDEX `fk_cart_local_auth`(`user_id`) USING BTREE,
  INDEX `fk_cart_product`(`product_id`) USING BTREE,
  CONSTRAINT `fk_cart_local_auth` FOREIGN KEY (`user_id`) REFERENCES `tb_local_auth` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_head_line
-- ----------------------------
DROP TABLE IF EXISTS `tb_head_line`;
CREATE TABLE `tb_head_line`  (
  `line_id` int(100) NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) NULL DEFAULT NULL,
  `line_link` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `line_img` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `poster1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `poster2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NOT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`line_id`) USING BTREE,
  INDEX `fk_headline_shop`(`shop_id`) USING BTREE,
  CONSTRAINT `fk_headline_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_head_line
-- ----------------------------
INSERT INTO `tb_head_line` VALUES (18, 1, '/frontend/search?shopId=1', '\\upload\\home\\2019113015555179655.jpg', 'JUST DO IT', '活出风采', 10000, 1, '2019-11-30 07:55:51', '2019-11-30 07:55:51');
INSERT INTO `tb_head_line` VALUES (19, 36, '/frontend/search?shopId=36', '\\upload\\home\\2019120115592143329.jpg', 'MAKE TO BE REMAKE', '重制未来', 9000, 1, '2019-12-01 07:59:21', '2019-12-01 07:59:21');

-- ----------------------------
-- Table structure for tb_local_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_local_auth`;
CREATE TABLE `tb_local_auth`  (
  `local_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `username` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`local_auth_id`) USING BTREE,
  UNIQUE INDEX `uk_local_profile`(`username`) USING BTREE,
  INDEX `fk_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `tb_person_info` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_local_auth
-- ----------------------------
INSERT INTO `tb_local_auth` VALUES (2, 1, 'Marical', 's05bse6q2qlb9qblls96s592y55y556s', '2019-11-16 10:41:36', '2019-11-17 08:55:40');
INSERT INTO `tb_local_auth` VALUES (4, 2, 'buy', 's05bse6q2qlb9qblls96s592y55y556s', '2019-11-17 08:50:22', NULL);
INSERT INTO `tb_local_auth` VALUES (7, 7, 'admin', '50565y5q2b92b9b2265q2b5s2b550ye6', '2019-11-17 00:00:00', NULL);
INSERT INTO `tb_local_auth` VALUES (10, 11, 'Jasons', 's05bse6q2qlb9qblls96s592y55y556s', '2019-12-02 09:41:30', '2019-12-02 09:41:30');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`  (
  `order_id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NULL DEFAULT NULL,
  `shop_id` int(10) NULL DEFAULT NULL,
  `product_id` int(100) NULL DEFAULT NULL,
  `count` int(10) NULL DEFAULT NULL,
  `status` int(10) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `fk_order_local_auth`(`user_id`) USING BTREE,
  INDEX `fk_order_product`(`product_id`) USING BTREE,
  INDEX `fk_order_shop`(`shop_id`) USING BTREE,
  CONSTRAINT `fk_order_local_auth` FOREIGN KEY (`user_id`) REFERENCES `tb_local_auth` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES (25, 11, 1, 25, 1, 2, '2019-12-02 09:42:24');
INSERT INTO `tb_order` VALUES (26, 1, 1, 25, 1, 1, '2019-12-02 09:44:09');
INSERT INTO `tb_order` VALUES (27, 2, 1, 22, 2, 2, '2019-12-07 15:46:51');
INSERT INTO `tb_order` VALUES (28, 2, 1, 28, 1, 0, '2019-12-07 15:46:51');
INSERT INTO `tb_order` VALUES (29, 2, 1, 25, 1, 0, '2019-12-07 15:46:51');
INSERT INTO `tb_order` VALUES (30, 2, 1, 23, 1, 2, '2019-12-29 08:33:21');
INSERT INTO `tb_order` VALUES (31, 2, 1, 22, 1, 0, '2020-05-24 06:42:28');
INSERT INTO `tb_order` VALUES (32, 2, 1, 22, 1, 2, '2020-05-24 07:00:21');

-- ----------------------------
-- Table structure for tb_person_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_person_info`;
CREATE TABLE `tb_person_info`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profile_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0 COMMENT '0:禁止登录,1:允许使用本系统',
  `user_type` int(2) NOT NULL DEFAULT 1 COMMENT '1:买家,2:商家,3:超级管理员',
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_person_info
-- ----------------------------
INSERT INTO `tb_person_info` VALUES (1, 'marical', 'test', 'test', '1', 1, 2, NULL, NULL);
INSERT INTO `tb_person_info` VALUES (2, '测试2', 'test2', 'test2', '2', 1, 1, NULL, NULL);
INSERT INTO `tb_person_info` VALUES (7, 'admin', NULL, 'admin@', '1', 1, 3, '2019-10-10 00:00:00', '2019-11-11 00:00:00');
INSERT INTO `tb_person_info` VALUES (8, '吴泽锋', NULL, '475679188@qq.com', '男', 1, 1, '2019-11-30 07:29:01', '2019-11-30 07:29:01');
INSERT INTO `tb_person_info` VALUES (9, '吴泽锋', NULL, '475679188@qq.com', '男', 1, 1, '2019-11-30 07:30:54', '2019-11-30 07:30:54');
INSERT INTO `tb_person_info` VALUES (10, '哈哈', NULL, '75819235@qq.com', '男', 1, 1, '2019-11-30 07:32:15', '2019-11-30 07:32:15');
INSERT INTO `tb_person_info` VALUES (11, 'Jason', NULL, '43493535@qq.com', '男', 1, 1, '2019-12-02 09:41:29', '2019-12-02 09:41:29');

-- ----------------------------
-- Table structure for tb_product
-- ----------------------------
DROP TABLE IF EXISTS `tb_product`;
CREATE TABLE `tb_product`  (
  `product_id` int(100) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img_addr` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `normal_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promotion_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `product_brand_id` int(11) NULL DEFAULT NULL,
  `product_category_id` int(11) NULL DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `fk_product_shop`(`shop_id`) USING BTREE,
  INDEX `fk_product_brand`(`product_brand_id`) USING BTREE,
  INDEX `fk_product_category`(`product_category_id`) USING BTREE,
  CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand_id`) REFERENCES `tb_product_brand` (`product_brand_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_category` FOREIGN KEY (`product_category_id`) REFERENCES `tb_product_category` (`product_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_product_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_product
-- ----------------------------
INSERT INTO `tb_product` VALUES (22, 'Nike Air Jordan XXXIV PF', 'Air Jordan XXXIV PF 男子篮球鞋续写文化符号传承的辉煌篇章。', '\\upload\\item\\shop\\1\\2019120110360857898.jpg', '1899', '1499', 1499, '2019-12-01 02:36:08', '2019-12-01 02:36:08', 1, 22, 15, 1);
INSERT INTO `tb_product` VALUES (23, 'Nike Benassi JDI', 'Benassi JDI 拖鞋鞋面添加衬里，巧妙融入醒目标志，缔造柔软舒适感和出色运动风范。泡棉中底和外底，打造轻质减震防护效果。', '\\upload\\item\\shop\\1\\2019120110372336418.jpg', '299', '199', 199, '2019-12-01 02:37:23', '2019-12-01 02:37:23', 1, 22, 44, 1);
INSERT INTO `tb_product` VALUES (24, 'Nike React Element 55', 'Nike React Element 55 By You 从元素周期表中的活性元素汲取设计灵感，可供随时自主调节贴合度。运用醒目配色和金属色点缀组合，打造真正富有爆发力的运动体验。', '\\upload\\item\\shop\\1\\2019120110382067366.jpg', '1299', '899', 899, '2019-12-01 02:38:20', '2019-12-01 02:38:20', 1, 22, 45, 1);
INSERT INTO `tb_product` VALUES (25, 'Nike Zoom Fly 3', '从 Vaporfly 汲取灵感，Nike Zoom Fly 3 男子跑步鞋为长距离跑者打造比赛日所需的出众舒适和耐穿体验。碳纤维板提供强劲动力，助你一路向前，体验畅跑乐趣。', '\\upload\\item\\shop\\1\\2019120110390616017.jpg', '1299', '1099', 1099, '2019-12-01 02:39:06', '2019-12-01 02:39:06', 1, 22, 14, 1);
INSERT INTO `tb_product` VALUES (26, 'Nike Zoom Stefan Janoski OG', 'Nike Zoom Stefan Janoski OG 男子滑板鞋从传奇运动员汲取创作灵感，依托优质翻毛皮鞋面和轻薄的缓震配置，塑就经典利落外观和响应灵敏的减震防护效果。灵活橡胶外底融入人字形抓地底纹，缔造卓越的抓地力和触板感。', '\\upload\\item\\shop\\1\\2019120110500992732.jpg', '799', '699', 699, '2019-12-01 02:50:09', '2019-12-01 02:50:09', 1, 22, 16, 1);
INSERT INTO `tb_product` VALUES (27, '芝加哥公牛队 Nike Pro', '戴上芝加哥公牛队 Nike Pro NBA 运动帽，彰显球队荣耀。采用全棉斜纹面料结合经典高帽冠、平整帽檐设计，塑就非凡舒适感受和复古外观。', '\\upload\\item\\shop\\1\\2019120111052174110.jpg', '299', '249', 249, '2019-12-01 03:05:20', '2019-12-01 03:05:20', 1, 22, 35, 1);
INSERT INTO `tb_product` VALUES (28, '波士顿凯尔特人队 Courtside', '波士顿凯尔特人队 Courtside Nike NBA 双面穿夹克从球队的 Statement Edition 球衣中汲取灵感，提供两种出众造型选择。一面采用光滑缎面材质，胸前和后身巧搭醒目球队标志。另一面采用绗缝设计，带来截然不同的造型和质感。', '\\upload\\item\\shop\\1\\2019120111074539654.jpg', '1299', '1199', 1199, '2019-12-01 03:07:45', '2019-12-01 03:07:45', 1, 22, 40, 1);
INSERT INTO `tb_product` VALUES (29, '孟菲斯灰熊队 Classic', '一些 NBA 队衣堪称经典，让人无法忘怀。孟菲斯灰熊队 Classic NBA T恤再现传统球队标志，为新一代球迷带来复古外观。', '\\upload\\item\\shop\\1\\2019120111151313703.jpg', '299', '259', 259, '2019-12-01 03:15:13', '2019-12-01 03:15:13', 1, 22, 8, 1);
INSERT INTO `tb_product` VALUES (30, 'NikeLab Collection', 'NikeLab Collection 连衣裙采用网眼布面料结合加长设计，是日常穿搭的主打单品。', '\\upload\\item\\shop\\1\\2019120111181241384.jpg', '799', '699', 699, '2019-12-01 03:18:12', '2019-12-01 03:18:12', 1, 22, 39, 1);
INSERT INTO `tb_product` VALUES (31, 'Nike SB', 'Nike SB 上衣由 Ishod Wair 联合设计，是一款轻盈叠搭单品，采用耐穿面料，助你从日出到日落全力冲锋。', '\\upload\\item\\shop\\1\\2019120111215912625.jpg', '799', '699', 699, '2019-12-01 03:21:59', '2019-12-01 03:21:59', 1, 22, 10, 1);
INSERT INTO `tb_product` VALUES (32, 'Nike Therma Tapered', ' Nike Therma Tapered男子训练长裤帮助锁住热量，令身体保持温暖。Dri-FIT 技术，在训练时帮助保持干爽舒适。侧边口袋和媒体播放器存放袋，便于存储基本物件。', '\\upload\\item\\shop\\1\\2019120111253859110.jpg', '449', '359', 359, '2019-12-01 03:25:38', '2019-12-01 03:25:38', 1, 22, 11, 1);
INSERT INTO `tb_product` VALUES (33, 'NikeLab Collection', 'NikeLab Collection 女子针织裙采用轻盈不易撕裂面料和匠心剪裁设计，塑就柔美外观、透气感受和多元造型。可调节腰部，缔造个性化贴合感。', '\\upload\\item\\shop\\1\\2019120111343582473.jpg', '699', '599', 599, '2019-12-01 03:34:35', '2019-12-01 03:34:35', 1, 22, 42, 1);
INSERT INTO `tb_product` VALUES (34, '孟菲斯灰熊队 Classic Edition Nike NBA Swingman', '孟菲斯灰熊队 Classic Edition Nike NBA Swingman 男子短裤的设计灵感源自球员征战赛场所穿的短裤，采用导湿速干的双面针织面料结合挚爱球队经典队服的设计细节匠心打造。', '\\upload\\item\\shop\\1\\2019120111365796810.jpg', '599', '499', 499, '2019-12-01 03:36:57', '2019-12-01 03:36:57', 1, 22, 12, 1);
INSERT INTO `tb_product` VALUES (35, 'Nike casual 长裤', 'Nike 长裤从篮球鞋款汲取灵感，融入格纹设计，侧边采用全长按扣设计，易于穿脱。', '\\upload\\item\\shop\\1\\2019120111395017524.jpg', '699', '459', 459, '2019-12-01 03:39:50', '2019-12-01 03:39:50', 1, 22, 12, 1);
INSERT INTO `tb_product` VALUES (36, 'Nike ACG ', 'Nike ACG 针织帽舒适贴合，营造温暖感受，助力户外冒险。', '\\upload\\item\\shop\\1\\2019120111465735856.jpg', '299', '199', 199, '2019-12-01 03:46:57', '2020-05-24 07:02:02', 1, 22, 36, 1);
INSERT INTO `tb_product` VALUES (37, 'ZARA 贝壳饰帽子', 'ZARA 贝壳饰帽子-2 贝壳镶饰编织帽。', '\\upload\\item\\shop\\1\\2019120112025986879.jpg', '255', '199', 199, '2019-12-01 04:02:59', '2019-12-01 04:02:59', 1, 9, 37, 37);
INSERT INTO `tb_product` VALUES (38, 'ZARA 亮饰贝蕾帽', 'ZARA 亮饰贝蕾帽', '\\upload\\item\\shop\\1\\2019120112060152494.jpg', '199', '159', 159, '2019-12-01 04:06:01', '2019-12-01 04:06:01', 1, 9, 5, 37);
INSERT INTO `tb_product` VALUES (39, 'ZARA纬纱丝带饰牛仔帽', 'ZARA纬纱丝带饰牛仔帽', '\\upload\\item\\shop\\37\\2019120115361291442.jpg', '299', '199', 299, '2019-12-01 07:36:12', '2019-12-01 07:36:12', 1, 9, 6, 37);

-- ----------------------------
-- Table structure for tb_product_brand
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_brand`;
CREATE TABLE `tb_product_brand`  (
  `product_brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_brand_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `priority` int(2) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `shop_id` int(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_brand_id`) USING BTREE,
  INDEX `fk_procate_shop`(`shop_id`) USING BTREE,
  CONSTRAINT `fk_procate_shop` FOREIGN KEY (`shop_id`) REFERENCES `tb_shop` (`shop_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_product_brand
-- ----------------------------
INSERT INTO `tb_product_brand` VALUES (9, 'ZARA', 1000, '2019-11-30 08:05:43', 37);
INSERT INTO `tb_product_brand` VALUES (22, 'NIKE', 1000, '2019-11-28 02:18:35', 1);
INSERT INTO `tb_product_brand` VALUES (27, 'ADIDAS', 1000, '2019-12-01 07:16:22', 36);
INSERT INTO `tb_product_brand` VALUES (28, 'PUMA', 1000, '2019-12-01 07:16:46', 38);

-- ----------------------------
-- Table structure for tb_product_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_category`;
CREATE TABLE `tb_product_category`  (
  `product_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `product_category_img` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`product_category_id`) USING BTREE,
  INDEX `fk_product_category_self`(`parent_id`) USING BTREE,
  CONSTRAINT `fk_product_category_self` FOREIGN KEY (`parent_id`) REFERENCES `tb_product_category` (`product_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_product_category
-- ----------------------------
INSERT INTO `tb_product_category` VALUES (1, '帽子', '\\upload\\item\\shopcategory\\2017061223272255687.png', 100, NULL, NULL, NULL);
INSERT INTO `tb_product_category` VALUES (2, '衣服', '\\upload\\item\\shopcategory\\2017061223273314635.png', 99, NULL, NULL, NULL);
INSERT INTO `tb_product_category` VALUES (3, '裤子', '\\upload\\item\\shopcategory\\2017061223274213433.png', 98, NULL, NULL, NULL);
INSERT INTO `tb_product_category` VALUES (4, '鞋子', '\\upload\\item\\shopcategory\\2017061223275121460.png', 97, NULL, NULL, NULL);
INSERT INTO `tb_product_category` VALUES (5, '贝蕾帽', '\\upload\\item\\shopcategory\\2017061223280082147.png', 96, NULL, NULL, 1);
INSERT INTO `tb_product_category` VALUES (6, '牛仔帽', '\\upload\\item\\shopcategory\\2017061223281361578.png', 95, NULL, NULL, 1);
INSERT INTO `tb_product_category` VALUES (8, 'T恤', '\\upload\\item\\shopcategory\\', 79, NULL, NULL, 2);
INSERT INTO `tb_product_category` VALUES (9, '衬衣', '\\upload\\item\\shopcategory\\', 76, NULL, NULL, 2);
INSERT INTO `tb_product_category` VALUES (10, '风衣', '\\upload\\item\\shopcategory\\', 74, NULL, NULL, 2);
INSERT INTO `tb_product_category` VALUES (11, '运动裤', '\\upload\\item\\shopcategory\\', 59, NULL, NULL, 3);
INSERT INTO `tb_product_category` VALUES (12, '短裤', '\\upload\\item\\shopcategory\\', 58, NULL, NULL, 3);
INSERT INTO `tb_product_category` VALUES (13, '休闲裤', '\\upload\\item\\shopcategory\\', 56, NULL, NULL, 3);
INSERT INTO `tb_product_category` VALUES (14, '跑鞋', '\\upload\\item\\shopcategory\\', 57, NULL, NULL, 4);
INSERT INTO `tb_product_category` VALUES (15, '篮球鞋', '\\upload\\item\\shopcategory\\', 50, NULL, NULL, 4);
INSERT INTO `tb_product_category` VALUES (16, '板鞋', '\\upload\\item\\shopcategory\\', 49, NULL, NULL, 4);
INSERT INTO `tb_product_category` VALUES (31, '礼帽', NULL, 95, '2019-11-29 04:15:23', '2019-11-29 04:15:23', 1);
INSERT INTO `tb_product_category` VALUES (35, '鸭舌帽', NULL, 95, '2019-11-30 07:34:49', '2019-11-30 07:34:49', 1);
INSERT INTO `tb_product_category` VALUES (36, '针织帽', NULL, 95, '2019-11-30 07:34:59', '2019-11-30 07:34:59', 1);
INSERT INTO `tb_product_category` VALUES (37, '太阳帽', NULL, 95, '2019-11-30 07:35:08', '2019-11-30 07:35:08', 1);
INSERT INTO `tb_product_category` VALUES (38, '西装', NULL, 75, '2019-11-30 07:35:40', '2019-11-30 07:35:40', 2);
INSERT INTO `tb_product_category` VALUES (39, '连衣裙', NULL, 78, '2019-11-30 07:35:40', '2019-11-30 07:35:40', 2);
INSERT INTO `tb_product_category` VALUES (40, '夹克', NULL, 95, '2019-11-30 07:35:54', '2019-11-30 07:35:54', 2);
INSERT INTO `tb_product_category` VALUES (41, '牛仔裤', NULL, 56, '2019-11-30 07:36:49', '2019-11-30 07:36:49', 3);
INSERT INTO `tb_product_category` VALUES (42, '裙子', NULL, 59, '2019-11-30 07:36:49', '2019-11-30 07:36:49', 3);
INSERT INTO `tb_product_category` VALUES (43, '西裤', NULL, 58, '2019-11-30 07:36:49', '2019-11-30 07:36:49', 3);
INSERT INTO `tb_product_category` VALUES (44, '拖鞋', NULL, 59, '2019-11-30 07:38:05', '2019-11-30 07:38:05', 4);
INSERT INTO `tb_product_category` VALUES (45, '休闲鞋', NULL, 59, '2019-11-30 07:38:05', '2019-11-30 07:38:05', 4);
INSERT INTO `tb_product_category` VALUES (46, '高跟鞋', NULL, 59, '2019-11-30 07:38:05', '2019-11-30 07:38:05', 4);

-- ----------------------------
-- Table structure for tb_product_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_img`;
CREATE TABLE `tb_product_img`  (
  `product_img_id` int(20) NOT NULL AUTO_INCREMENT,
  `img_addr` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(2) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `product_id` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`product_img_id`) USING BTREE,
  INDEX `fk_proimg_product`(`product_id`) USING BTREE,
  CONSTRAINT `fk_proimg_product` FOREIGN KEY (`product_id`) REFERENCES `tb_product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_product_img
-- ----------------------------
INSERT INTO `tb_product_img` VALUES (61, '\\upload\\item\\shop\\1\\2019120110360899824.jpg', NULL, NULL, '2019-12-01 02:36:08', 22);
INSERT INTO `tb_product_img` VALUES (62, '\\upload\\item\\shop\\1\\2019120110360853598.jpg', NULL, NULL, '2019-12-01 02:36:08', 22);
INSERT INTO `tb_product_img` VALUES (63, '\\upload\\item\\shop\\1\\2019120110372336301.jpg', NULL, NULL, '2019-12-01 02:37:23', 23);
INSERT INTO `tb_product_img` VALUES (64, '\\upload\\item\\shop\\1\\2019120110372354846.jpg', NULL, NULL, '2019-12-01 02:37:23', 23);
INSERT INTO `tb_product_img` VALUES (65, '\\upload\\item\\shop\\1\\2019120110382074932.jpg', NULL, NULL, '2019-12-01 02:38:20', 24);
INSERT INTO `tb_product_img` VALUES (66, '\\upload\\item\\shop\\1\\2019120110382046533.jpg', NULL, NULL, '2019-12-01 02:38:20', 24);
INSERT INTO `tb_product_img` VALUES (67, '\\upload\\item\\shop\\1\\2019120110390654097.jpg', NULL, NULL, '2019-12-01 02:39:06', 25);
INSERT INTO `tb_product_img` VALUES (68, '\\upload\\item\\shop\\1\\2019120110390690136.jpg', NULL, NULL, '2019-12-01 02:39:06', 25);
INSERT INTO `tb_product_img` VALUES (69, '\\upload\\item\\shop\\1\\2019120110500935497.jpg', NULL, NULL, '2019-12-01 02:50:09', 26);
INSERT INTO `tb_product_img` VALUES (70, '\\upload\\item\\shop\\1\\2019120110500996003.jpg', NULL, NULL, '2019-12-01 02:50:09', 26);
INSERT INTO `tb_product_img` VALUES (71, '\\upload\\item\\shop\\1\\2019120111052127684.jpg', NULL, NULL, '2019-12-01 03:05:21', 27);
INSERT INTO `tb_product_img` VALUES (72, '\\upload\\item\\shop\\1\\2019120111074523770.jpg', NULL, NULL, '2019-12-01 03:07:45', 28);
INSERT INTO `tb_product_img` VALUES (73, '\\upload\\item\\shop\\1\\2019120111151392623.jpg', NULL, NULL, '2019-12-01 03:15:13', 29);
INSERT INTO `tb_product_img` VALUES (74, '\\upload\\item\\shop\\1\\2019120111181224265.jpg', NULL, NULL, '2019-12-01 03:18:12', 30);
INSERT INTO `tb_product_img` VALUES (75, '\\upload\\item\\shop\\1\\2019120111215963608.jpg', NULL, NULL, '2019-12-01 03:21:59', 31);
INSERT INTO `tb_product_img` VALUES (76, '\\upload\\item\\shop\\1\\2019120111253855943.jpg', NULL, NULL, '2019-12-01 03:25:38', 32);
INSERT INTO `tb_product_img` VALUES (77, '\\upload\\item\\shop\\1\\2019120111343577407.jpg', NULL, NULL, '2019-12-01 03:34:35', 33);
INSERT INTO `tb_product_img` VALUES (78, '\\upload\\item\\shop\\1\\2019120111365769330.jpg', NULL, NULL, '2019-12-01 03:36:57', 34);
INSERT INTO `tb_product_img` VALUES (79, '\\upload\\item\\shop\\1\\2019120111395014417.jpg', NULL, NULL, '2019-12-01 03:39:50', 35);
INSERT INTO `tb_product_img` VALUES (80, '\\upload\\item\\shop\\1\\2019120111465786153.jpg', NULL, NULL, '2019-12-01 03:46:57', 36);
INSERT INTO `tb_product_img` VALUES (81, '\\upload\\item\\shop\\1\\2019120112025913827.jpg', NULL, NULL, '2019-12-01 04:02:59', 37);
INSERT INTO `tb_product_img` VALUES (82, '\\upload\\item\\shop\\1\\2019120112060174954.jpg', NULL, NULL, '2019-12-01 04:06:01', 38);
INSERT INTO `tb_product_img` VALUES (83, '\\upload\\item\\shop\\37\\2019120115361213464.jpg', NULL, NULL, '2019-12-01 07:36:12', 39);

-- ----------------------------
-- Table structure for tb_product_sell_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_sell_daily`;
CREATE TABLE `tb_product_sell_daily`  (
  `product_id` int(100) NULL DEFAULT NULL,
  `shop_id` int(10) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `total` int(10) NULL DEFAULT 0,
  INDEX `fk_product_sell_product`(`product_id`) USING BTREE,
  INDEX `fk_product_sell_shop`(`shop_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tb_shop
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop`;
CREATE TABLE `tb_shop`  (
  `shop_id` int(10) NOT NULL AUTO_INCREMENT,
  `owner_id` int(10) NOT NULL COMMENT '店铺创建者',
  `area_id` int(5) NULL DEFAULT NULL,
  `shop_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `shop_desc` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_addr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shop_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(3) NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `last_edit_time` datetime NULL DEFAULT NULL,
  `enable_status` int(2) NOT NULL DEFAULT 0,
  `advice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`shop_id`) USING BTREE,
  INDEX `fk_shop_area`(`area_id`) USING BTREE,
  INDEX `fk_shop_profile`(`owner_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tb_shop
-- ----------------------------
INSERT INTO `tb_shop` VALUES (1, 1, 1, '广东NIKE旗舰店', '本商铺创立于2018年，总部位于广东省广州市越秀区北京路38号，总店面积10000平方米', '广东省广州市越秀区北京路38号', '15815648684', '\\upload\\item\\shop\\1\\2019110223585993180.jpg', 10, '2019-10-23 22:47:16', '2019-11-30 07:59:30', 1, '');
INSERT INTO `tb_shop` VALUES (36, 1, 2, '广东ADIDAS旗舰店', '本商铺创立于2018年，总部位于广东省广州市越秀区北京路38号，总店面积10000平方米', '广东省广州市越秀区北京路39号', '17801261358', '\\upload\\item\\shop\\36\\2019111922102847404.jpg', 50, '2019-10-30 08:40:40', '2020-05-24 07:03:10', 1, NULL);
INSERT INTO `tb_shop` VALUES (37, 1, 1, '广东ZARA旗舰店', '本商铺创立于2018年，总部位于广东省广州市越秀区北京路38号，总店面积10000平方米', '广东省广州市越秀区北京路40号', '17801261348', NULL, 40, NULL, NULL, 1, NULL);
INSERT INTO `tb_shop` VALUES (38, 1, 1, '广东PUMA旗舰店', '本商铺创立于2018年，总部位于广东省广州市越秀区北京路38号，总店面积10000平方米', '广东省广州市越秀区北京路41号', '17801261448', NULL, 30, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for tb_wechat_auth
-- ----------------------------
DROP TABLE IF EXISTS `tb_wechat_auth`;
CREATE TABLE `tb_wechat_auth`  (
  `wechat_auth_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `open_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`wechat_auth_id`) USING BTREE,
  UNIQUE INDEX `open_id`(`open_id`) USING BTREE,
  INDEX `fk_wechat_profile`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
