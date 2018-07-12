/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : ym_stock

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 11/07/2018 21:17:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Market
-- ----------------------------
DROP TABLE IF EXISTS `Market`;
CREATE TABLE `Market` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL,
  `review_url` varchar(200) DEFAULT NULL,
  `cur_date` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for buy_stock
-- ----------------------------
DROP TABLE IF EXISTS `buy_stock`;
CREATE TABLE `buy_stock` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(20) DEFAULT NULL COMMENT '股票名称',
  `stock_code` varchar(20) DEFAULT NULL COMMENT '股票代码',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `now_price` double DEFAULT NULL COMMENT '现价',
  `day` int(5) DEFAULT NULL COMMENT '跳转多少天',
  `model` varchar(255) DEFAULT NULL COMMENT '1- 回调到开盘价附近；-1-跌破开盘价',
  `yingli` varchar(255) DEFAULT NULL COMMENT '是否盈利',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buy_stock
-- ----------------------------
BEGIN;
INSERT INTO `buy_stock` VALUES (199, '文投控股', '600715', '20180711092525', 7.49, 2, '买入', NULL);
INSERT INTO `buy_stock` VALUES (200, '天地数码', '300743', '20180711092603', 74.8, 2, '买入', NULL);
INSERT INTO `buy_stock` VALUES (201, '奥翔药业', '603229', '20180711092536', 17.5, 1, '买入', NULL);
INSERT INTO `buy_stock` VALUES (202, '诚意药业', '603811', '20180711092603', 30.09, 1, '关注', NULL);
INSERT INTO `buy_stock` VALUES (203, '北京科锐', '002350', '20180711092603', 7.2, 1, '关注', NULL);
INSERT INTO `buy_stock` VALUES (204, 'N明德', '002932', '20180711092603', NULL, 1, '加仓', NULL);
INSERT INTO `buy_stock` VALUES (205, '北京科锐', '002350', '20180711093003', 7.15, 1, '买入', NULL);
INSERT INTO `buy_stock` VALUES (206, '成飞集成', '002190', '20180711093021', 17.7, 2, '关注', NULL);
INSERT INTO `buy_stock` VALUES (207, '科沃斯', '603486', '20180711093027', 65.62, 2, '关注', NULL);
INSERT INTO `buy_stock` VALUES (208, '高德红外', '002414', '20180711093042', 14.82, 1, '关注', NULL);
INSERT INTO `buy_stock` VALUES (209, '诚意药业', '603811', '20180711093130', 29.89, 1, '买入', NULL);
INSERT INTO `buy_stock` VALUES (210, '彩讯股份', '300634', '20180711093136', 44.02, 1, '关注', NULL);
INSERT INTO `buy_stock` VALUES (211, '成飞集成', '002190', '20180711093230', 17.57, 2, '买入', NULL);
INSERT INTO `buy_stock` VALUES (212, '智动力', '300686', '20180711093315', 22.8, 1, '关注', NULL);
INSERT INTO `buy_stock` VALUES (213, '智动力', '300686', '20180711093333', 22.5, 1, '买入', NULL);
INSERT INTO `buy_stock` VALUES (214, '三联虹普', '300384', '20180711093412', 41.41, 1, '关注', NULL);
INSERT INTO `buy_stock` VALUES (215, '科沃斯', '603486', '20180711093548', 64.88, 2, '买入', NULL);
INSERT INTO `buy_stock` VALUES (216, '彩讯股份', '300634', '20180711093554', 43.65, 1, '买入', NULL);
INSERT INTO `buy_stock` VALUES (217, '双杰电气', '300444', '20180711093612', 9.61, 1, '关注', NULL);
INSERT INTO `buy_stock` VALUES (218, '振华股份', '603067', '20180711093642', 12.89, 1, '关注', NULL);
INSERT INTO `buy_stock` VALUES (219, '三联虹普', '300384', '20180711093645', 40.92, 1, '买入', NULL);
INSERT INTO `buy_stock` VALUES (220, '双杰电气', '300444', '20180711093645', 9.49, 1, '买入', NULL);
INSERT INTO `buy_stock` VALUES (221, '振华股份', '603067', '20180711093703', 12.81, 1, '买入', NULL);
INSERT INTO `buy_stock` VALUES (222, '三联虹普', '300384', '20180711093703', 40.08, 1, '加仓', NULL);
INSERT INTO `buy_stock` VALUES (223, '天地数码', '300743', '20180711094312', 77.37, 2, '关注', NULL);
INSERT INTO `buy_stock` VALUES (224, '长江润发', '002435', '20180711095112', 8.2, 1, '关注', NULL);
INSERT INTO `buy_stock` VALUES (225, '长江润发', '002435', '20180711095742', 8.12, 1, '加仓', NULL);
INSERT INTO `buy_stock` VALUES (226, '奥翔药业', '603229', '20180711133900', 16.65, 1, '加仓', NULL);
INSERT INTO `buy_stock` VALUES (227, '潜能恒信', '300191', '20180711135709', 18.33, 2, '关注', NULL);
COMMIT;

-- ----------------------------
-- Table structure for buy_stock_bak
-- ----------------------------
DROP TABLE IF EXISTS `buy_stock_bak`;
CREATE TABLE `buy_stock_bak` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stock_name` varchar(20) DEFAULT NULL COMMENT '股票名称',
  `stock_code` varchar(20) DEFAULT NULL COMMENT '股票代码',
  `create_time` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `now_price` double DEFAULT NULL COMMENT '现价',
  `day` int(5) DEFAULT NULL COMMENT '跳转多少天',
  `model` varchar(255) DEFAULT NULL COMMENT '1- 回调到开盘价附近；-1-跌破开盘价',
  `yingli` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buy_stock_bak
-- ----------------------------
BEGIN;
INSERT INTO `buy_stock_bak` VALUES (65, '山东金泰', '600385', '20180628093205', 9.59, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (68, '安凯客车', '000868', '20180628093506', 5.11, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (69, '文化长城', '300089', '20180628093706', 6.69, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (70, '荣科科技', '300290', '20180628095948', 7.09, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (71, '山东金泰', '600385', '20180628102710', 9.82, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (72, '文化长城', '300089', '20180628102748', 6.62, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (73, '红豆股份', '600400', '20180628102822', 3.72, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (74, '红豆股份', '600400', '20180628105647', 3.68, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (75, '荣科科技', '300290', '20180628144718', 7.01, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (76, '合康新能', '300048', '20180628145109', 2.8, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (77, '合康新能', '300048', '20180628145218', 2.77, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (78, '汉嘉设计', '300746', '20180628145657', 32.65, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (79, ' 金奥博 ', '002917', '20180629093451', 35.44, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (80, '盛弘股份', '300693', '20180629093451', 29.83, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (81, '欣锐科技', '300745', '20180629094021', 75, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (82, ' 金奥博 ', '002917', '20180629094500', 35.88, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (83, '盛弘股份', '300693', '20180629094721', 31.3, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (90, '中矿资源', '002738', '20180702093315', 21.147, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (91, '浙数文化', '600633', '20180702093429', 8.34, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (92, '国新健康', '000503', '20180702100042', 31.2, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (93, '中矿资源', '002738', '20180702133627', 21.74, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (94, '国新健康', '000503', '20180702142309', 30.89, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (95, '宇顺电子', '002289', '20180702144300', 8.92, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (96, '鼎信通讯', '603421', '20180703093626', 19.76, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (97, ' 科沃斯 ', '603486', '20180703093626', 69.36, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (98, '永创智能', '603901', '20180703093629', 11.1, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (99, '会畅通讯', '300578', '20180703093630', 28.15, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (100, '鼎信通讯', '603421', '20180703093708', 19.71, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (101, '永创智能', '603901', '20180703094047', 11.36, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (102, '会畅通讯', '300578', '20180703094600', 27.82, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (103, ' 科沃斯 ', '603486', '20180703101757', 70.7, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (104, '汉嘉设计', '300746', '20180703145500', 35.85, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (108, '中弘股份', '000979', '20180704092903', 1.17, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (109, '奥 特 迅', '002227', '20180704092903', 13.88, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (110, '乐金健康', '300247', '20180704092903', 5.62, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (111, '奥 特 迅', '002227', '20180704093003', 13.8, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (112, '赫美集团', '002356', '20180704093021', 14.07, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (113, '中弘股份', '000979', '20180704093112', 1.15, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (114, '大富科技', '300134', '20180704093203', 10.82, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (115, '乐金健康', '300247', '20180704093221', 5.56, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (116, '大富科技', '300134', '20180704093912', 10.7, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (117, '赫美集团', '002356', '20180704094300', 13.97, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (118, '延江股份', '300658', '20180704141657', 16.02, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (119, '延江股份', '300658', '20180704141830', 15.93, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (120, '翔港科技', '603499', '20180704142147', 30.2, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (121, '德艺文创', '300640', '20180704142930', 13.1, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (124, '捷荣技术', '002855', '20180705092503', 9.6, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (125, '双林股份', '300100', '20180705092503', 12.15, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (126, ' 阿石创 ', '300706', '20180705092503', 58.26, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (127, '安阳钢铁', '600569', '20180705093015', 4.03, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (128, '双林股份', '300100', '20180705093018', 12.42, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (129, '捷荣技术', '002855', '20180705093048', 10.19, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (130, '达志科技', '300530', '20180705093109', 31.4, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (131, '永和智控', '002795', '20180705093348', 23.38, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (132, '永和智控', '002795', '20180705093409', 23.15, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (133, ' 阿石创 ', '300706', '20180705093639', 59.32, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (134, '安阳钢铁', '600569', '20180705093647', 3.99, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (135, '金路集团', '000510', '20180705094118', 5.03, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (136, '达志科技', '300530', '20180705095348', 31.08, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (137, '金路集团', '000510', '20180705135248', 4.99, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (138, '德创环保', '603177', '20180706092921', 13.63, 2, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (139, '冀凯股份', '002691', '20180706092903', 11.25, 2, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (140, '和胜股份', '002824', '20180706092903', 11.6, 2, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (141, '双杰电气', '300444', '20180706092903', 8.5, 2, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (142, '柘中股份', '002346', '20180706093157', 13.12, 2, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (143, '金龙汽车', '600686', '20180706093457', 12.58, 2, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (144, '金路集团', '000510', '20180709101727', 4.95, 3, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (145, '永和智控', '002795', '20180709101727', 22.09, 3, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (146, '双林股份', '300100', '20180709101727', 12.01, 3, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (147, '双杰电气', '300444', '20180709101730', 8.27, 3, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (148, '达志科技', '300530', '20180709101727', 30.53, 3, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (149, ' 阿石创 ', '300706', '20180709101730', 50.8, 3, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (183, '传艺科技', '002866', '20180710092903', 19.98, 2, '加仓', NULL);
INSERT INTO `buy_stock_bak` VALUES (184, '文投控股', '600715', '20180710092850', 8, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (185, '文投控股', '600715', '20180710093004', 7.91, 1, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (186, '一拖股份', '601038', '20180710093034', 5.73, 2, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (187, '一拖股份', '601038', '20180710093116', 5.65, 2, '买入', NULL);
INSERT INTO `buy_stock_bak` VALUES (188, '天地数码', '300743', '20180710093921', 78.1, 1, '关注', NULL);
INSERT INTO `buy_stock_bak` VALUES (189, '天地数码', '300743', '20180710100251', 77, 1, '买入', NULL);
COMMIT;

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(10) DEFAULT NULL COMMENT '股票编码',
  `stock_name` varchar(100) DEFAULT NULL COMMENT '股票名称',
  `type` varchar(20) DEFAULT NULL,
  `sel_time` date DEFAULT NULL COMMENT '入选时间',
  `buy` varchar(10) DEFAULT NULL,
  `season` varchar(500) DEFAULT NULL COMMENT '备注',
  `order_num` int(5) DEFAULT NULL COMMENT '排序',
  `plate` varchar(100) DEFAULT NULL COMMENT '板块',
  `fileUrl` varchar(500) DEFAULT NULL,
  `h_price` double DEFAULT NULL COMMENT '涨停价',
  `l_price` double DEFAULT NULL COMMENT '开盘价',
  `monitor` int(5) DEFAULT NULL COMMENT '是否监控',
  `z_close` double DEFAULT NULL COMMENT '昨天收盘价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1058 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock
-- ----------------------------
BEGIN;
INSERT INTO `stock` VALUES (878, '600099', '林海股份', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 6.56, 5.96, 1, 5.96);
INSERT INTO `stock` VALUES (879, '600360', '华微电子', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 6.97, 6.41, 1, 6.34);
INSERT INTO `stock` VALUES (880, '600614', '鹏起科技', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 5.41, 5, 1, 4.92);
INSERT INTO `stock` VALUES (881, '600645', '中源协和', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 20.63, 18.84, 1, 18.76);
INSERT INTO `stock` VALUES (882, '601038', '一拖股份', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 5.69, 5.68, 1, 5.17);
INSERT INTO `stock` VALUES (883, '603335', ' 迪生力 ', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 7.85, 7.23, 1, 7.14);
INSERT INTO `stock` VALUES (884, '603398', '邦宝益智', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 18.24, 16.5, 1, 16.58);
INSERT INTO `stock` VALUES (885, '603895', '天永智能', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 36.3, 36.3, 1, 33);
INSERT INTO `stock` VALUES (886, '603897', '长城科技', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 34.71, 31.59, 1, 31.55);
INSERT INTO `stock` VALUES (887, '000633', '合金投资', NULL, '2018-07-06', NULL, NULL, 0, '深市主板', NULL, 4.77, 4.37, 1, 4.34);
INSERT INTO `stock` VALUES (888, '000713', '丰乐种业', NULL, '2018-07-06', NULL, NULL, 0, '深市主板', NULL, 7.14, 6.54, 1, 6.49);
INSERT INTO `stock` VALUES (889, '000757', '浩物股份', NULL, '2018-07-06', NULL, NULL, 0, '深市主板', NULL, 5.63, 5.32, 1, 5.12);
INSERT INTO `stock` VALUES (890, '000892', '欢瑞世纪', NULL, '2018-07-06', NULL, NULL, 0, '深市主板', NULL, 5.39, 4.9, 1, 4.9);
INSERT INTO `stock` VALUES (891, '002112', '三变科技', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 6.53, 6.05, 1, 5.94);
INSERT INTO `stock` VALUES (892, '002175', '东方网络', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 3.82, 3.5, 1, 3.47);
INSERT INTO `stock` VALUES (893, '002584', '西陇科学', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 8.51, 7.6, 1, 7.74);
INSERT INTO `stock` VALUES (894, '002606', '大连电瓷', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 5.96, 5.32, 1, 5.42);
INSERT INTO `stock` VALUES (895, '002642', ' 荣之联 ', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 9.46, 8.7, 1, 8.6);
INSERT INTO `stock` VALUES (896, '002760', '凤形股份', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 16.53, 15.06, 1, 15.03);
INSERT INTO `stock` VALUES (897, '002772', '众兴菌业', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 8.36, 7.68, 1, 7.6);
INSERT INTO `stock` VALUES (898, '002866', '传艺科技', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 31.28, 30, 1, 28.44);
INSERT INTO `stock` VALUES (899, '002927', '泰永长征', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 39.18, 39, 1, 35.62);
INSERT INTO `stock` VALUES (900, '300038', ' 梅泰诺 ', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 10.86, 10.55, 1, 9.87);
INSERT INTO `stock` VALUES (901, '300134', '大富科技', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 11.48, 10.38, 1, 10.44);
INSERT INTO `stock` VALUES (902, '300283', '温州宏丰', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 4.77, 4.44, 1, 4.34);
INSERT INTO `stock` VALUES (903, '300452', '山河药辅', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 14.75, 13.5, 1, 13.41);
INSERT INTO `stock` VALUES (904, '300540', '深冷股份', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 16.57, 14.87, 1, 15.06);
INSERT INTO `stock` VALUES (905, '300598', '诚迈科技', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 31.7, 28.34, 1, 28.82);
INSERT INTO `stock` VALUES (906, '300686', ' 智动力 ', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 19.91, 18.5, 1, 18.1);
INSERT INTO `stock` VALUES (907, '300743', '天地数码', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 72.71, 67.8, 1, 66.1);
INSERT INTO `stock` VALUES (935, '600176', '中国巨石', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 9.97, 9.1, 1, 9.06);
INSERT INTO `stock` VALUES (936, '600576', '祥源文化', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 5.36, 4.88, 1, 4.87);
INSERT INTO `stock` VALUES (937, '600619', '海立股份', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 12.39, 11.29, 1, 11.26);
INSERT INTO `stock` VALUES (938, '600715', '文投控股', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 7.95, 7.95, 1, 7.23);
INSERT INTO `stock` VALUES (939, '600763', '通策医疗', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 52.73, 48.4, 1, 47.94);
INSERT INTO `stock` VALUES (940, '600801', '华新水泥', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 16.47, 14.99, 1, 14.97);
INSERT INTO `stock` VALUES (941, '600810', '神马股份', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 15.03, 13.9, 1, 13.66);
INSERT INTO `stock` VALUES (942, '600812', '华北制药', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 4.73, 4.34, 1, 4.3);
INSERT INTO `stock` VALUES (943, '600856', '中天能源', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 6.22, 5.74, 1, 5.65);
INSERT INTO `stock` VALUES (944, '603067', '振华股份', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 12.73, 11.63, 1, 11.57);
INSERT INTO `stock` VALUES (945, '603105', 'N芯能', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 6.96, 5.8, 1, 4.83);
INSERT INTO `stock` VALUES (946, '603127', '昭衍新药', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 57.29, 52.73, 1, 52.1);
INSERT INTO `stock` VALUES (947, '603486', '科沃斯', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 70, 64.99, 1, 63.64);
INSERT INTO `stock` VALUES (948, '603605', '珀莱雅', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 45.3, 41.6, 1, 41.18);
INSERT INTO `stock` VALUES (949, '603800', '道森股份', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 16.84, 15.38, 1, 15.31);
INSERT INTO `stock` VALUES (950, '603895', '天永智能', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 39.93, 37, 1, 36.3);
INSERT INTO `stock` VALUES (951, '603963', '大理药业', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 22.11, 20.3, 1, 20.1);
INSERT INTO `stock` VALUES (952, '603998', '方盛制药', NULL, '2018-07-09', NULL, NULL, 0, '沪市主板', NULL, 8.18, 7.45, 1, 7.44);
INSERT INTO `stock` VALUES (953, '000636', '风华高科', NULL, '2018-07-09', NULL, NULL, 0, '深市主板', NULL, 17.73, 17.4, 1, 16.12);
INSERT INTO `stock` VALUES (954, '000788', '北大医药', NULL, '2018-07-09', NULL, NULL, 0, '深市主板', NULL, 7.06, 6.6, 1, 6.42);
INSERT INTO `stock` VALUES (955, '000935', '四川双马', NULL, '2018-07-09', NULL, NULL, 0, '深市主板', NULL, 15.97, 14.57, 1, 14.52);
INSERT INTO `stock` VALUES (956, '002056', '横店东磁', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 7.37, 6.91, 1, 6.7);
INSERT INTO `stock` VALUES (957, '002190', '成飞集成', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 18.29, 17.58, 1, 16.63);
INSERT INTO `stock` VALUES (958, '002202', '金风科技', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 12.93, 12.15, 1, 11.75);
INSERT INTO `stock` VALUES (959, '002218', '拓日新能', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 3.06, 2.78, 1, 2.78);
INSERT INTO `stock` VALUES (960, '002234', '民和股份', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 11.89, 11.5, 1, 10.81);
INSERT INTO `stock` VALUES (961, '002350', '北京科锐', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 6.61, 6.54, 1, 6.01);
INSERT INTO `stock` VALUES (962, '002365', '永安药业', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 14.43, 13.2, 1, 13.12);
INSERT INTO `stock` VALUES (963, '002458', '益生股份', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 19.48, 18.5, 1, 17.71);
INSERT INTO `stock` VALUES (964, '002531', '天顺风能', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 3.98, 3.71, 1, 3.62);
INSERT INTO `stock` VALUES (965, '002553', '南方轴承', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 6.75, 6.22, 1, 6.14);
INSERT INTO `stock` VALUES (966, '002575', '群兴玩具', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 4.07, 3.83, 1, 3.7);
INSERT INTO `stock` VALUES (967, '002600', '领益智造', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 5.04, 4.6, 1, 4.58);
INSERT INTO `stock` VALUES (968, '002629', '仁智股份', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 4.88, 4.54, 1, 4.44);
INSERT INTO `stock` VALUES (969, '002795', '永和智控', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 23.44, 21.04, 1, 21.31);
INSERT INTO `stock` VALUES (970, '002830', '名雕股份', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 20.14, 18.18, 1, 18.31);
INSERT INTO `stock` VALUES (971, '002908', '德生科技', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 39.22, 34.45, 1, 35.65);
INSERT INTO `stock` VALUES (972, '002921', '联诚精密', NULL, '2018-07-09', NULL, NULL, 0, '中小板', NULL, 39.51, 35.43, 1, 35.92);
INSERT INTO `stock` VALUES (973, '300084', '海默科技', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 5.23, 4.75, 1, 4.75);
INSERT INTO `stock` VALUES (974, '300132', '青松股份', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 11.44, 10.91, 1, 10.4);
INSERT INTO `stock` VALUES (975, '300191', '潜能恒信', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 19.68, 18.17, 1, 17.89);
INSERT INTO `stock` VALUES (976, '300347', '泰格医药', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 62.79, 57.8, 1, 57.08);
INSERT INTO `stock` VALUES (977, '300390', '天华超净', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 9.36, 9, 1, 8.51);
INSERT INTO `stock` VALUES (978, '300409', '道氏技术', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 39.17, 36.65, 1, 35.61);
INSERT INTO `stock` VALUES (979, '300416', '苏试试验', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 20.32, 18.5, 1, 18.47);
INSERT INTO `stock` VALUES (980, '300425', '环能科技', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 4.94, 4.69, 1, 4.49);
INSERT INTO `stock` VALUES (981, '300439', '美康生物', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 22.88, 20.8, 1, 20.8);
INSERT INTO `stock` VALUES (982, '300444', '双杰电气', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 9.21, 8.43, 1, 8.37);
INSERT INTO `stock` VALUES (983, '300469', '信息发展', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 21.81, 20.09, 1, 19.83);
INSERT INTO `stock` VALUES (984, '300604', '长川科技', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 38.5, 36, 1, 35);
INSERT INTO `stock` VALUES (985, '300647', '超频三', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 25.3, 22.92, 1, 23);
INSERT INTO `stock` VALUES (986, '300673', '佩蒂股份', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 46.53, 42.37, 1, 42.3);
INSERT INTO `stock` VALUES (987, '300686', '智动力', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 21.9, 19.91, 1, 19.91);
INSERT INTO `stock` VALUES (988, '300690', '双一科技', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 25.98, 23.98, 1, 23.62);
INSERT INTO `stock` VALUES (989, '300707', '威唐工业', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 29.22, 26.52, 1, 26.56);
INSERT INTO `stock` VALUES (990, '300743', '天地数码', NULL, '2018-07-09', NULL, NULL, 0, '创业板', NULL, 79.98, 77.35, 1, 72.71);
INSERT INTO `stock` VALUES (991, '600133', '东湖高新', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 6.29, 5.79, 1, 5.72);
INSERT INTO `stock` VALUES (992, '600139', '西部资源', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 4.46, 4.04, 1, 4.05);
INSERT INTO `stock` VALUES (993, '600380', '健康元', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 11.58, 10.55, 1, 10.53);
INSERT INTO `stock` VALUES (994, '600532', '宏达矿业', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 4.02, 3.45, 1, 3.65);
INSERT INTO `stock` VALUES (995, '600579', '天华院', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 10.49, 9.56, 1, 9.54);
INSERT INTO `stock` VALUES (996, '600784', '鲁银投资', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 5.49, 4.92, 1, 4.99);
INSERT INTO `stock` VALUES (997, '600866', '星湖科技', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 3.96, 3.6, 1, 3.6);
INSERT INTO `stock` VALUES (998, '600929', '湖南盐业', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 15.55, 14.24, 1, 14.14);
INSERT INTO `stock` VALUES (999, '600983', '惠而浦', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 6.94, 6.33, 1, 6.31);
INSERT INTO `stock` VALUES (1000, '601330', '绿色动力', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 23.02, 20.5, 1, 20.93);
INSERT INTO `stock` VALUES (1001, '603058', '永吉股份', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 12.09, 11.34, 1, 10.99);
INSERT INTO `stock` VALUES (1002, '603067', '振华股份', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 14, 12.87, 1, 12.73);
INSERT INTO `stock` VALUES (1003, '603229', '奥翔药业', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 18.35, 18.34, 1, 16.68);
INSERT INTO `stock` VALUES (1004, '603309', '维力医疗', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 12.95, 11.87, 1, 11.77);
INSERT INTO `stock` VALUES (1005, '603348', '文灿股份', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 39.42, 37.17, 1, 35.84);
INSERT INTO `stock` VALUES (1006, '603520', '司太立', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 22.45, 20.47, 1, 20.41);
INSERT INTO `stock` VALUES (1007, '603596', '伯特利', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 35.6, 32.46, 1, 32.36);
INSERT INTO `stock` VALUES (1008, '603683', '晶华新材', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 25.52, 23.14, 1, 23.2);
INSERT INTO `stock` VALUES (1009, '603811', '诚意药业', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 29.91, 29.91, 1, 27.19);
INSERT INTO `stock` VALUES (1010, '603819', '神力股份', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 19.02, 17.34, 1, 17.29);
INSERT INTO `stock` VALUES (1011, '603963', '大理药业', NULL, '2018-07-10', NULL, NULL, 0, '沪市主板', NULL, 24.32, 23.58, 1, 22.11);
INSERT INTO `stock` VALUES (1012, '000593', '大通燃气', NULL, '2018-07-10', NULL, NULL, 0, '深市主板', NULL, 6.07, 5.58, 1, 5.52);
INSERT INTO `stock` VALUES (1013, '000736', '中交地产', NULL, '2018-07-10', NULL, NULL, 0, '深市主板', NULL, 11.1, 10.11, 1, 10.09);
INSERT INTO `stock` VALUES (1014, '000762', '西藏矿业', NULL, '2018-07-10', NULL, NULL, 0, '深市主板', NULL, 10.37, 9.45, 1, 9.43);
INSERT INTO `stock` VALUES (1015, '002302', '西部建设', NULL, '2018-07-10', NULL, NULL, 0, '中小板', NULL, 11.52, 10.47, 1, 10.47);
INSERT INTO `stock` VALUES (1016, '002350', '北京科锐', NULL, '2018-07-10', NULL, NULL, 0, '中小板', NULL, 7.27, 7.2, 1, 6.61);
INSERT INTO `stock` VALUES (1017, '002370', '亚太药业', NULL, '2018-07-10', NULL, NULL, 0, '中小板', NULL, 13.89, 12.72, 1, 12.63);
INSERT INTO `stock` VALUES (1018, '002395', '双象股份', NULL, '2018-07-10', NULL, NULL, 0, '中小板', NULL, 14.75, 13.41, 1, 13.41);
INSERT INTO `stock` VALUES (1019, '002414', '高德红外', NULL, '2018-07-10', NULL, NULL, 0, '中小板', NULL, 15.38, 14.72, 1, 13.98);
INSERT INTO `stock` VALUES (1020, '002435', '长江润发', NULL, '2018-07-10', NULL, NULL, 0, '中小板', NULL, 8.94, 8.12, 1, 8.13);
INSERT INTO `stock` VALUES (1021, '002703', '浙江世宝', NULL, '2018-07-10', NULL, NULL, 0, '中小板', NULL, 5.07, 4.62, 1, 4.61);
INSERT INTO `stock` VALUES (1022, '002872', '天圣制药', NULL, '2018-07-10', NULL, NULL, 0, '中小板', NULL, 21.36, 18.91, 1, 19.42);
INSERT INTO `stock` VALUES (1023, '002873', '新天药业', NULL, '2018-07-10', NULL, NULL, 0, '中小板', NULL, 26.43, 24.22, 1, 24.03);
INSERT INTO `stock` VALUES (1024, '002932', 'N明德', NULL, '2018-07-10', NULL, NULL, 0, '中小板', NULL, 29.45, 24.54, 1, 20.45);
INSERT INTO `stock` VALUES (1025, '300076', 'GQY视讯', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 5.48, 5.01, 1, 4.98);
INSERT INTO `stock` VALUES (1026, '300310', '宜通世纪', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 5.96, 5.43, 1, 5.42);
INSERT INTO `stock` VALUES (1027, '300384', '三联虹普', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 44.35, 41, 1, 40.32);
INSERT INTO `stock` VALUES (1028, '300390', '天华超净', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 10.3, 9.84, 1, 9.36);
INSERT INTO `stock` VALUES (1029, '300444', '双杰电气', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 10.13, 9.53, 1, 9.21);
INSERT INTO `stock` VALUES (1030, '300477', '合纵科技', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 20.66, 18.88, 1, 18.78);
INSERT INTO `stock` VALUES (1031, '300497', '富祥股份', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 19.72, 17.95, 1, 17.93);
INSERT INTO `stock` VALUES (1032, '300612', '宣亚国际', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 25.31, 23, 1, 23.01);
INSERT INTO `stock` VALUES (1033, '300634', '彩讯股份', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 46.41, 43.67, 1, 42.19);
INSERT INTO `stock` VALUES (1034, '300648', '星云股份', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 26.72, 25.56, 1, 24.29);
INSERT INTO `stock` VALUES (1035, '300665', '飞鹿股份', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 14.2, 12.98, 1, 12.91);
INSERT INTO `stock` VALUES (1036, '300677', '英科医疗', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 25.6, 22.75, 1, 23.27);
INSERT INTO `stock` VALUES (1037, '300686', '智动力', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 24.09, 22.62, 1, 21.9);
INSERT INTO `stock` VALUES (1038, '300701', '森霸传感', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 50.71, 46.1, 1, 46.1);
INSERT INTO `stock` VALUES (1039, '300705', '九典制药', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 23.5, 21.33, 1, 21.36);
INSERT INTO `stock` VALUES (1040, '300715', '凯伦股份', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 24.09, 21.68, 1, 21.9);
INSERT INTO `stock` VALUES (1041, '300718', '长盛轴承', NULL, '2018-07-10', NULL, NULL, 0, '创业板', NULL, 19.95, 18.14, 1, 18.14);
INSERT INTO `stock` VALUES (1042, '600532', '宏达矿业', NULL, '2018-07-11', NULL, NULL, 0, '沪市主板', NULL, 4.42, 3.75, 1, 4.02);
INSERT INTO `stock` VALUES (1043, '600810', '神马股份', NULL, '2018-07-11', NULL, NULL, 0, '沪市主板', NULL, 17.25, 16.03, 1, 15.68);
INSERT INTO `stock` VALUES (1044, '601330', '绿色动力', NULL, '2018-07-11', NULL, NULL, 0, '沪市主板', NULL, 25.32, 25, 1, 23.02);
INSERT INTO `stock` VALUES (1045, '603085', '天成自控', NULL, '2018-07-11', NULL, NULL, 0, '沪市主板', NULL, 17.72, 15.3, 1, 16.11);
INSERT INTO `stock` VALUES (1046, '603690', '至纯科技', NULL, '2018-07-11', NULL, NULL, 0, '沪市主板', NULL, 22.13, 20.6, 1, 20.12);
INSERT INTO `stock` VALUES (1047, '603843', '正平股份', NULL, '2018-07-11', NULL, NULL, 0, '沪市主板', NULL, 8.34, 7.5, 1, 7.58);
INSERT INTO `stock` VALUES (1048, '002112', '三变科技', NULL, '2018-07-11', NULL, NULL, 0, '中小板', NULL, 7.59, 6.74, 1, 6.9);
INSERT INTO `stock` VALUES (1049, '002150', '通润装备', NULL, '2018-07-11', NULL, NULL, 0, '中小板', NULL, 6.85, 6.3, 1, 6.23);
INSERT INTO `stock` VALUES (1050, '002160', '常铝股份', NULL, '2018-07-11', NULL, NULL, 0, '中小板', NULL, 4.63, 4.27, 1, 4.21);
INSERT INTO `stock` VALUES (1051, '002746', '仙坛股份', NULL, '2018-07-11', NULL, NULL, 0, '中小板', NULL, 13.09, 12.6, 1, 11.9);
INSERT INTO `stock` VALUES (1052, '002806', '华锋股份', NULL, '2018-07-11', NULL, NULL, 0, '中小板', NULL, 32.74, 29.12, 1, 29.76);
INSERT INTO `stock` VALUES (1053, '300139', '晓程科技', NULL, '2018-07-11', NULL, NULL, 0, '创业板', NULL, 12.19, 10.65, 1, 11.08);
INSERT INTO `stock` VALUES (1054, '300278', '华昌达', NULL, '2018-07-11', NULL, NULL, 0, '创业板', NULL, 9.99, 9.25, 1, 9.08);
INSERT INTO `stock` VALUES (1055, '300618', '寒锐钴业', NULL, '2018-07-11', NULL, NULL, 0, '创业板', NULL, 144.66, 127, 1, 131.51);
INSERT INTO `stock` VALUES (1056, '300662', '科锐国际', NULL, '2018-07-11', NULL, NULL, 0, '创业板', NULL, 23.73, 22, 1, 21.57);
INSERT INTO `stock` VALUES (1057, '300705', '九典制药', NULL, '2018-07-11', NULL, NULL, 0, '创业板', NULL, 25.85, 23.1, 1, 23.5);
COMMIT;

-- ----------------------------
-- Table structure for stock_bak
-- ----------------------------
DROP TABLE IF EXISTS `stock_bak`;
CREATE TABLE `stock_bak` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(10) DEFAULT NULL,
  `stock_name` varchar(100) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `sel_time` date DEFAULT NULL,
  `buy` varchar(10) DEFAULT NULL,
  `season` varchar(500) DEFAULT NULL,
  `order_num` int(5) DEFAULT NULL,
  `plate` varchar(100) DEFAULT NULL,
  `fileUrl` varchar(500) DEFAULT NULL,
  `h_price` double DEFAULT NULL,
  `l_price` double DEFAULT NULL,
  `monitor` int(5) DEFAULT NULL,
  `z_close` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stock_bak
-- ----------------------------
BEGIN;
INSERT INTO `stock_bak` VALUES (227, '600156', '华升股份', NULL, '2018-06-27', NULL, NULL, 0, '沪市主板', NULL, 4.08, 3.73, 1, NULL);
INSERT INTO `stock_bak` VALUES (228, '600385', '山东金泰', NULL, '2018-06-27', NULL, NULL, 0, '沪市主板', NULL, 9.82, 9.82, 1, NULL);
INSERT INTO `stock_bak` VALUES (229, '600400', '红豆股份', NULL, '2018-06-27', NULL, NULL, 0, '沪市主板', NULL, 3.69, 3.69, 1, NULL);
INSERT INTO `stock_bak` VALUES (230, '600495', '晋西车轴', NULL, '2018-06-27', NULL, NULL, 0, '沪市主板', NULL, 3.88, 3.51, 1, NULL);
INSERT INTO `stock_bak` VALUES (231, '600536', '中国软件', NULL, '2018-06-27', NULL, NULL, 0, '沪市主板', NULL, 19.83, 18.99, 1, NULL);
INSERT INTO `stock_bak` VALUES (232, '603010', '万盛股份', NULL, '2018-06-27', NULL, NULL, 0, '沪市主板', NULL, 19.17, 17.66, 1, NULL);
INSERT INTO `stock_bak` VALUES (233, '603165', '荣晟环保', NULL, '2018-06-27', NULL, NULL, 0, '沪市主板', NULL, 22.32, 20.52, 1, NULL);
INSERT INTO `stock_bak` VALUES (234, '603335', ' 迪生力 ', NULL, '2018-06-27', NULL, NULL, 0, '沪市主板', NULL, 7.69, 7, 1, NULL);
INSERT INTO `stock_bak` VALUES (235, '603605', ' 珀莱雅 ', NULL, '2018-06-27', NULL, NULL, 0, '沪市主板', NULL, 38.59, 36.55, 1, NULL);
INSERT INTO `stock_bak` VALUES (236, '000555', '神州信息', NULL, '2018-06-27', NULL, NULL, 0, '深市主板', NULL, 11.86, 11.65, 1, NULL);
INSERT INTO `stock_bak` VALUES (237, '000677', '恒天海龙', NULL, '2018-06-27', NULL, NULL, 0, '深市主板', NULL, 3.88, 3.53, 1, NULL);
INSERT INTO `stock_bak` VALUES (238, '000757', '浩物股份', NULL, '2018-06-27', NULL, NULL, 0, '深市主板', NULL, 5.71, 5.25, 1, NULL);
INSERT INTO `stock_bak` VALUES (239, '000795', ' 英洛华 ', NULL, '2018-06-27', NULL, NULL, 0, '深市主板', NULL, 4.68, 4.21, 1, NULL);
INSERT INTO `stock_bak` VALUES (240, '000868', '安凯客车', NULL, '2018-06-27', NULL, NULL, 0, '深市主板', NULL, 5.27, 5.07, 1, NULL);
INSERT INTO `stock_bak` VALUES (241, '002083', '孚日股份', NULL, '2018-06-27', NULL, NULL, 0, '中小板', NULL, 5.57, 5.12, 1, NULL);
INSERT INTO `stock_bak` VALUES (242, '002684', '猛狮科技', NULL, '2018-06-27', NULL, NULL, 0, '中小板', NULL, 11.32, 10.05, 1, NULL);
INSERT INTO `stock_bak` VALUES (243, '002725', '跃岭股份', NULL, '2018-06-27', NULL, NULL, 0, '中小板', NULL, 12.99, 11.88, 1, NULL);
INSERT INTO `stock_bak` VALUES (244, '002774', '快意电梯', NULL, '2018-06-27', NULL, NULL, 0, '中小板', NULL, 9.42, 8.68, 1, NULL);
INSERT INTO `stock_bak` VALUES (245, '002850', ' 科达利 ', NULL, '2018-06-27', NULL, NULL, 0, '中小板', NULL, 28.58, 25.74, 1, NULL);
INSERT INTO `stock_bak` VALUES (246, '002863', '今飞凯达', NULL, '2018-06-27', NULL, NULL, 0, '中小板', NULL, 8.37, 7.6, 1, NULL);
INSERT INTO `stock_bak` VALUES (247, '002931', '锋龙股份', NULL, '2018-06-27', NULL, NULL, 0, '中小板', NULL, 49.49, 45.55, 1, NULL);
INSERT INTO `stock_bak` VALUES (248, '300048', '合康新能', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 2.97, 2.78, 1, NULL);
INSERT INTO `stock_bak` VALUES (249, '300089', '文化长城', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 6.85, 6.63, 1, NULL);
INSERT INTO `stock_bak` VALUES (250, '300139', '晓程科技', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 10.97, 10.35, 1, NULL);
INSERT INTO `stock_bak` VALUES (251, '300153', '科泰电源', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 8.11, 7.43, 1, NULL);
INSERT INTO `stock_bak` VALUES (252, '300290', '荣科科技', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 7.4, 7.02, 1, NULL);
INSERT INTO `stock_bak` VALUES (253, '300345', '红宇新材', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 7.94, 7.03, 1, NULL);
INSERT INTO `stock_bak` VALUES (254, '300604', '长川科技', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 32.43, 30.14, 1, NULL);
INSERT INTO `stock_bak` VALUES (256, '300655', '晶瑞股份', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 17.46, 16.1, 1, NULL);
INSERT INTO `stock_bak` VALUES (257, '300667', '必创科技', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 36.94, 33.37, 1, NULL);
INSERT INTO `stock_bak` VALUES (258, '300690', '双一科技', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 25.84, 23.49, 1, NULL);
INSERT INTO `stock_bak` VALUES (259, '300693', '盛弘股份', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 28.45, 25.47, 1, NULL);
INSERT INTO `stock_bak` VALUES (260, '300715', '凯伦股份', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 24.24, 22.41, 1, NULL);
INSERT INTO `stock_bak` VALUES (261, '300746', '汉嘉设计', NULL, '2018-06-27', NULL, NULL, 0, '创业板', NULL, 35.68, 32.35, 1, NULL);
INSERT INTO `stock_bak` VALUES (262, '600250', '南纺股份', NULL, '2018-06-28', NULL, NULL, 0, '沪市主板', NULL, 6.9, 6.38, 1, NULL);
INSERT INTO `stock_bak` VALUES (263, '600448', '华纺股份', NULL, '2018-06-28', NULL, NULL, 0, '沪市主板', NULL, 4.71, 4.45, 1, NULL);
INSERT INTO `stock_bak` VALUES (264, '600478', ' 科力远 ', NULL, '2018-06-28', NULL, NULL, 0, '沪市主板', NULL, 4.88, 4.47, 1, NULL);
INSERT INTO `stock_bak` VALUES (265, '603081', '大丰实业', NULL, '2018-06-28', NULL, NULL, 0, '沪市主板', NULL, 14.63, 13.33, 1, NULL);
INSERT INTO `stock_bak` VALUES (266, '000678', '襄阳轴承', NULL, '2018-06-28', NULL, NULL, 0, '深市主板', NULL, 5.18, 4.75, 1, NULL);
INSERT INTO `stock_bak` VALUES (267, '002289', '宇顺电子', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 9.01, 8.16, 1, NULL);
INSERT INTO `stock_bak` VALUES (268, '002357', '富临运业', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 8.61, 8.61, 1, NULL);
INSERT INTO `stock_bak` VALUES (269, '002494', '华斯股份', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 7.92, 7.22, 1, NULL);
INSERT INTO `stock_bak` VALUES (270, '002580', '圣阳股份', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 6.11, 5.5, 1, NULL);
INSERT INTO `stock_bak` VALUES (271, '002591', '恒大高新', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 7.16, 6.53, 1, NULL);
INSERT INTO `stock_bak` VALUES (272, '002684', '猛狮科技', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 12.45, 11.2, 1, NULL);
INSERT INTO `stock_bak` VALUES (273, '002729', ' 好利来 ', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 26.19, 23.7, 1, NULL);
INSERT INTO `stock_bak` VALUES (274, '002777', '久远银海', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 27.16, 24.5, 1, NULL);
INSERT INTO `stock_bak` VALUES (275, '002860', ' 星帅尔 ', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 20.32, 18.61, 1, NULL);
INSERT INTO `stock_bak` VALUES (276, '002898', '赛隆药业', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 20.77, 18.98, 1, NULL);
INSERT INTO `stock_bak` VALUES (277, '002917', ' 金奥博 ', NULL, '2018-06-28', NULL, NULL, 0, '中小板', NULL, 38.09, 35.85, 1, NULL);
INSERT INTO `stock_bak` VALUES (278, '300115', '长盈精密', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 12.64, 11.41, 1, NULL);
INSERT INTO `stock_bak` VALUES (279, '300139', '晓程科技', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 12.07, 11.63, 1, NULL);
INSERT INTO `stock_bak` VALUES (280, '300312', '邦讯技术', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 7.25, 6.53, 1, NULL);
INSERT INTO `stock_bak` VALUES (281, '300345', '红宇新材', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 8.73, 8.08, 1, NULL);
INSERT INTO `stock_bak` VALUES (282, '300411', '金盾股份', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 17.72, 16.46, 1, NULL);
INSERT INTO `stock_bak` VALUES (283, '300423', ' 鲁亿通 ', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 21.2, 18.95, 1, NULL);
INSERT INTO `stock_bak` VALUES (284, '300449', '汉邦高科', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 17.73, 16.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (285, '300469', '信息发展', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 37.3, 35, 1, NULL);
INSERT INTO `stock_bak` VALUES (286, '300484', '蓝海华腾', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 13.39, 12.15, 1, NULL);
INSERT INTO `stock_bak` VALUES (287, '300693', '盛弘股份', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 31.3, 31.3, 1, NULL);
INSERT INTO `stock_bak` VALUES (288, '300703', '创源文化', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 21.73, 20.08, 1, NULL);
INSERT INTO `stock_bak` VALUES (289, '300739', '明阳电路', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 28.41, 25.8, 1, NULL);
INSERT INTO `stock_bak` VALUES (290, '300745', '欣锐科技', NULL, '2018-06-28', NULL, NULL, 0, '创业板', NULL, 74.62, 74.48, 1, NULL);
INSERT INTO `stock_bak` VALUES (291, '600069', '银鸽投资', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 3.96, 3.65, 1, NULL);
INSERT INTO `stock_bak` VALUES (292, '600139', '西部资源', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 4.33, 3.94, 1, NULL);
INSERT INTO `stock_bak` VALUES (293, '600536', '中国软件', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 21.63, 19.88, 1, NULL);
INSERT INTO `stock_bak` VALUES (294, '600633', '浙数文化', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 8.34, 8.21, 1, NULL);
INSERT INTO `stock_bak` VALUES (295, '600677', '航天通信', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 8.07, 7.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (296, '600695', '绿庭投资', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 3.83, 3.57, 1, NULL);
INSERT INTO `stock_bak` VALUES (297, '600715', '文投控股', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 7.59, 6.88, 1, NULL);
INSERT INTO `stock_bak` VALUES (298, '603127', '昭衍新药', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 52.9, 48.56, 1, NULL);
INSERT INTO `stock_bak` VALUES (299, '603188', '亚邦股份', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 10.2, 9.57, 1, NULL);
INSERT INTO `stock_bak` VALUES (300, '603259', '药明康德', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 94.95, 86.68, 1, NULL);
INSERT INTO `stock_bak` VALUES (301, '603486', ' 科沃斯 ', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 64.27, 57.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (302, '603506', 'DR南都物', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 33.59, 30.69, 1, NULL);
INSERT INTO `stock_bak` VALUES (303, '603605', ' 珀莱雅 ', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 42.56, 38.4, 1, NULL);
INSERT INTO `stock_bak` VALUES (304, '603666', ' 亿嘉和 ', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 112.24, 102.2, 1, NULL);
INSERT INTO `stock_bak` VALUES (305, '603901', '永创智能', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 10.29, 9.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (306, '603918', '金桥信息', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 15.4, 14, 1, NULL);
INSERT INTO `stock_bak` VALUES (307, '603986', '兆易创新', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 108.52, 100, 1, NULL);
INSERT INTO `stock_bak` VALUES (308, '603988', '中电电机', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 13.7, 12.45, 1, NULL);
INSERT INTO `stock_bak` VALUES (309, '000410', '沈阳机床', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 8, 7.35, 1, NULL);
INSERT INTO `stock_bak` VALUES (310, '000503', '国新健康', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 31.78, 30.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (311, '000555', '神州信息', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 13.28, 11.95, 1, NULL);
INSERT INTO `stock_bak` VALUES (312, '000567', '海德股份', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 16.49, 15, 1, NULL);
INSERT INTO `stock_bak` VALUES (313, '000636', '风华高科', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 15.88, 14.59, 1, NULL);
INSERT INTO `stock_bak` VALUES (314, '000661', '长春高新', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 227.7, 207, 1, NULL);
INSERT INTO `stock_bak` VALUES (315, '000670', ' 盈方微 ', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 5.43, 4.92, 1, NULL);
INSERT INTO `stock_bak` VALUES (316, '000678', '襄阳轴承', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 5.7, 5.51, 1, NULL);
INSERT INTO `stock_bak` VALUES (317, '000752', '西藏发展', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 7.81, 7.15, 1, NULL);
INSERT INTO `stock_bak` VALUES (318, '000790', '泰合健康', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 7.57, 6.87, 1, NULL);
INSERT INTO `stock_bak` VALUES (319, '000812', '陕西金叶', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 3.7, 3.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (320, '000868', '安凯客车', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 5.79, 5.2, 1, NULL);
INSERT INTO `stock_bak` VALUES (321, '000957', '中通客车', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 6.84, 6.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (322, '000971', '高升控股', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 4.33, 3.94, 1, NULL);
INSERT INTO `stock_bak` VALUES (323, '000973', '佛塑科技', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 3.88, 3.54, 1, NULL);
INSERT INTO `stock_bak` VALUES (324, '002049', '紫光国微', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 44.12, 40.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (325, '002096', '南岭民爆', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 6.68, 6.04, 1, NULL);
INSERT INTO `stock_bak` VALUES (326, '002108', '沧州明珠', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 5.87, 5.2, 1, NULL);
INSERT INTO `stock_bak` VALUES (327, '002134', '天津普林', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 7.7, 6.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (328, '002148', '北纬科技', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 5.8, 5.51, 1, NULL);
INSERT INTO `stock_bak` VALUES (329, '002199', '东晶电子', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 9.47, 8.6, 1, NULL);
INSERT INTO `stock_bak` VALUES (330, '002279', '久其软件', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 9.91, 9.03, 1, NULL);
INSERT INTO `stock_bak` VALUES (331, '002289', '宇顺电子', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 9.91, 9.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (332, '002357', '富临运业', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 9.47, 8.7, 1, NULL);
INSERT INTO `stock_bak` VALUES (333, '002371', '北方华创', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 49.67, 45.41, 1, NULL);
INSERT INTO `stock_bak` VALUES (334, '002488', '金固股份', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 10.79, 8.83, 1, NULL);
INSERT INTO `stock_bak` VALUES (335, '002562', '兄弟科技', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 6.71, 6.07, 1, NULL);
INSERT INTO `stock_bak` VALUES (336, '002583', ' 海能达 ', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 8.35, 7.8, 1, NULL);
INSERT INTO `stock_bak` VALUES (337, '002640', ' 跨境通 ', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 15.02, 13.97, 1, NULL);
INSERT INTO `stock_bak` VALUES (338, '002694', '顾地科技', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 5.08, 4.72, 1, NULL);
INSERT INTO `stock_bak` VALUES (339, '002703', '浙江世宝', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 4.95, 4.49, 1, NULL);
INSERT INTO `stock_bak` VALUES (340, '002738', '中矿资源', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 21.73, 21.73, 1, NULL);
INSERT INTO `stock_bak` VALUES (341, '002746', '仙坛股份', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 11.34, 10.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (342, '002769', ' 普路通 ', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 12.54, 11.31, 1, NULL);
INSERT INTO `stock_bak` VALUES (343, '002771', ' 真视通 ', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 15.28, 13.94, 1, NULL);
INSERT INTO `stock_bak` VALUES (344, '002772', '众兴菌业', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 8.37, 7.68, 1, NULL);
INSERT INTO `stock_bak` VALUES (345, '002826', '易明医药', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 16.19, 14.82, 1, NULL);
INSERT INTO `stock_bak` VALUES (346, '002830', '名雕股份', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 21.59, 19.15, 1, NULL);
INSERT INTO `stock_bak` VALUES (347, '300012', '华测检测', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 5.74, 5.32, 1, NULL);
INSERT INTO `stock_bak` VALUES (348, '300048', '合康新能', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 3.07, 2.76, 1, NULL);
INSERT INTO `stock_bak` VALUES (349, '300071', '华谊嘉信', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 3.95, 3.6, 1, NULL);
INSERT INTO `stock_bak` VALUES (350, '300078', '思创医惠', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 9.48, 8.63, 1, NULL);
INSERT INTO `stock_bak` VALUES (351, '300097', '智云股份', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 17.72, 16.11, 1, NULL);
INSERT INTO `stock_bak` VALUES (352, '300107', '建新股份', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 14.36, 13, 1, NULL);
INSERT INTO `stock_bak` VALUES (353, '300113', '顺网科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 17.41, 15.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (354, '300134', '大富科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 8.94, 8.53, 1, NULL);
INSERT INTO `stock_bak` VALUES (355, '300139', '晓程科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 13.28, 13.19, 1, NULL);
INSERT INTO `stock_bak` VALUES (356, '300167', ' 迪威迅 ', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 5.67, 5.21, 1, NULL);
INSERT INTO `stock_bak` VALUES (357, '300173', '智慧松德', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 6.73, 6.12, 1, NULL);
INSERT INTO `stock_bak` VALUES (358, '300225', ' 金力泰 ', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 7.29, 6.87, 1, NULL);
INSERT INTO `stock_bak` VALUES (359, '300242', '佳云科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 7.04, 6.35, 1, NULL);
INSERT INTO `stock_bak` VALUES (360, '300253', '卫宁健康', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 12.39, 11.28, 1, NULL);
INSERT INTO `stock_bak` VALUES (361, '300312', '邦讯技术', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 7.98, 7.3, 1, NULL);
INSERT INTO `stock_bak` VALUES (362, '300333', '兆日科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 9.9, 9.07, 1, NULL);
INSERT INTO `stock_bak` VALUES (363, '300356', '光一科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 6.05, 5.4, 1, NULL);
INSERT INTO `stock_bak` VALUES (364, '300366', '创意信息', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 8.98, 8.23, 1, NULL);
INSERT INTO `stock_bak` VALUES (365, '300383', '光环新网', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 13.41, 12.3, 1, NULL);
INSERT INTO `stock_bak` VALUES (366, '300384', '三联虹普', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 40.27, 39.4, 1, NULL);
INSERT INTO `stock_bak` VALUES (367, '300425', '环能科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 4.6, 4.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (368, '300431', '暴风集团', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 15.18, 13.93, 1, NULL);
INSERT INTO `stock_bak` VALUES (369, '300454', ' 深信服 ', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 109.96, 101.45, 1, NULL);
INSERT INTO `stock_bak` VALUES (370, '300461', '田中精机', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 26.39, 23.46, 1, NULL);
INSERT INTO `stock_bak` VALUES (371, '300484', '蓝海华腾', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 14.73, 13.74, 1, NULL);
INSERT INTO `stock_bak` VALUES (372, '300499', '高澜股份', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 14.61, 13.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (373, '300522', '世名科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 29.23, 27.47, 1, NULL);
INSERT INTO `stock_bak` VALUES (374, '300578', '会畅通讯', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 26.62, 24.1, 1, NULL);
INSERT INTO `stock_bak` VALUES (375, '300581', '晨曦航空', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 14.82, 13.58, 1, NULL);
INSERT INTO `stock_bak` VALUES (376, '300618', '寒锐钴业', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 128.34, 117.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (377, '300672', ' 国科微 ', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 54.11, 49.5, 1, NULL);
INSERT INTO `stock_bak` VALUES (378, '300677', '英科医疗', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 22.99, 21.99, 1, NULL);
INSERT INTO `stock_bak` VALUES (379, '300688', '创业黑马', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 63.71, 58.51, 1, NULL);
INSERT INTO `stock_bak` VALUES (380, '300745', '欣锐科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 82.08, 77.01, 1, NULL);
INSERT INTO `stock_bak` VALUES (381, '600069', '银鸽投资', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 3.96, 3.65, 1, NULL);
INSERT INTO `stock_bak` VALUES (382, '600139', '西部资源', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 4.33, 3.94, 1, NULL);
INSERT INTO `stock_bak` VALUES (383, '600536', '中国软件', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 21.63, 19.88, 1, NULL);
INSERT INTO `stock_bak` VALUES (384, '600633', '浙数文化', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 8.34, 8.21, 1, NULL);
INSERT INTO `stock_bak` VALUES (385, '600677', '航天通信', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 8.07, 7.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (386, '600695', '绿庭投资', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 3.83, 3.57, 1, NULL);
INSERT INTO `stock_bak` VALUES (387, '600715', '文投控股', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 7.59, 6.88, 1, NULL);
INSERT INTO `stock_bak` VALUES (388, '603127', '昭衍新药', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 52.9, 48.56, 1, NULL);
INSERT INTO `stock_bak` VALUES (389, '603188', '亚邦股份', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 10.2, 9.57, 1, NULL);
INSERT INTO `stock_bak` VALUES (390, '603259', '药明康德', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 94.95, 86.68, 1, NULL);
INSERT INTO `stock_bak` VALUES (391, '603486', ' 科沃斯 ', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 64.27, 57.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (392, '603506', 'DR南都物', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 33.59, 30.69, 1, NULL);
INSERT INTO `stock_bak` VALUES (393, '603605', ' 珀莱雅 ', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 42.56, 38.4, 1, NULL);
INSERT INTO `stock_bak` VALUES (394, '603666', ' 亿嘉和 ', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 112.24, 102.2, 1, NULL);
INSERT INTO `stock_bak` VALUES (395, '603901', '永创智能', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 10.29, 9.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (396, '603918', '金桥信息', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 15.4, 14, 1, NULL);
INSERT INTO `stock_bak` VALUES (397, '603986', '兆易创新', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 108.52, 100, 1, NULL);
INSERT INTO `stock_bak` VALUES (398, '603988', '中电电机', NULL, '2023-02-09', NULL, NULL, 0, '沪市主板', NULL, 13.7, 12.45, 1, NULL);
INSERT INTO `stock_bak` VALUES (399, '000410', '沈阳机床', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 8, 7.35, 1, NULL);
INSERT INTO `stock_bak` VALUES (400, '000503', '国新健康', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 31.78, 30.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (401, '000555', '神州信息', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 13.28, 11.95, 1, NULL);
INSERT INTO `stock_bak` VALUES (402, '000567', '海德股份', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 16.49, 15, 1, NULL);
INSERT INTO `stock_bak` VALUES (403, '000636', '风华高科', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 15.88, 14.59, 1, NULL);
INSERT INTO `stock_bak` VALUES (404, '000661', '长春高新', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 227.7, 207, 1, NULL);
INSERT INTO `stock_bak` VALUES (405, '000670', ' 盈方微 ', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 5.43, 4.92, 1, NULL);
INSERT INTO `stock_bak` VALUES (406, '000678', '襄阳轴承', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 5.7, 5.51, 1, NULL);
INSERT INTO `stock_bak` VALUES (407, '000752', '西藏发展', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 7.81, 7.15, 1, NULL);
INSERT INTO `stock_bak` VALUES (408, '000790', '泰合健康', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 7.57, 6.87, 1, NULL);
INSERT INTO `stock_bak` VALUES (409, '000812', '陕西金叶', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 3.7, 3.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (410, '000868', '安凯客车', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 5.79, 5.2, 1, NULL);
INSERT INTO `stock_bak` VALUES (411, '000957', '中通客车', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 6.84, 6.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (412, '000971', '高升控股', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 4.33, 3.94, 1, NULL);
INSERT INTO `stock_bak` VALUES (413, '000973', '佛塑科技', NULL, '2023-02-09', NULL, NULL, 0, '深市主板', NULL, 3.88, 3.54, 1, NULL);
INSERT INTO `stock_bak` VALUES (414, '002049', '紫光国微', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 44.12, 40.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (415, '002096', '南岭民爆', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 6.68, 6.04, 1, NULL);
INSERT INTO `stock_bak` VALUES (416, '002108', '沧州明珠', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 5.87, 5.2, 1, NULL);
INSERT INTO `stock_bak` VALUES (417, '002134', '天津普林', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 7.7, 6.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (418, '002148', '北纬科技', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 5.8, 5.51, 1, NULL);
INSERT INTO `stock_bak` VALUES (419, '002199', '东晶电子', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 9.47, 8.6, 1, NULL);
INSERT INTO `stock_bak` VALUES (420, '002279', '久其软件', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 9.91, 9.03, 1, NULL);
INSERT INTO `stock_bak` VALUES (421, '002289', '宇顺电子', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 9.91, 9.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (422, '002357', '富临运业', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 9.47, 8.7, 1, NULL);
INSERT INTO `stock_bak` VALUES (423, '002371', '北方华创', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 49.67, 45.41, 1, NULL);
INSERT INTO `stock_bak` VALUES (424, '002488', '金固股份', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 10.79, 8.83, 1, NULL);
INSERT INTO `stock_bak` VALUES (425, '002562', '兄弟科技', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 6.71, 6.07, 1, NULL);
INSERT INTO `stock_bak` VALUES (426, '002583', ' 海能达 ', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 8.35, 7.8, 1, NULL);
INSERT INTO `stock_bak` VALUES (427, '002640', ' 跨境通 ', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 15.02, 13.97, 1, NULL);
INSERT INTO `stock_bak` VALUES (428, '002694', '顾地科技', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 5.08, 4.72, 1, NULL);
INSERT INTO `stock_bak` VALUES (429, '002703', '浙江世宝', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 4.95, 4.49, 1, NULL);
INSERT INTO `stock_bak` VALUES (430, '002738', '中矿资源', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 21.73, 21.73, 1, NULL);
INSERT INTO `stock_bak` VALUES (431, '002746', '仙坛股份', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 11.34, 10.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (432, '002769', ' 普路通 ', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 12.54, 11.31, 1, NULL);
INSERT INTO `stock_bak` VALUES (433, '002771', ' 真视通 ', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 15.28, 13.94, 1, NULL);
INSERT INTO `stock_bak` VALUES (434, '002772', '众兴菌业', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 8.37, 7.68, 1, NULL);
INSERT INTO `stock_bak` VALUES (435, '002826', '易明医药', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 16.19, 14.82, 1, NULL);
INSERT INTO `stock_bak` VALUES (436, '002830', '名雕股份', NULL, '2023-02-09', NULL, NULL, 0, '中小板', NULL, 21.59, 19.15, 1, NULL);
INSERT INTO `stock_bak` VALUES (437, '300012', '华测检测', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 5.74, 5.32, 1, NULL);
INSERT INTO `stock_bak` VALUES (438, '300048', '合康新能', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 3.07, 2.76, 1, NULL);
INSERT INTO `stock_bak` VALUES (439, '300071', '华谊嘉信', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 3.95, 3.6, 1, NULL);
INSERT INTO `stock_bak` VALUES (440, '300078', '思创医惠', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 9.48, 8.63, 1, NULL);
INSERT INTO `stock_bak` VALUES (441, '300097', '智云股份', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 17.72, 16.11, 1, NULL);
INSERT INTO `stock_bak` VALUES (442, '300107', '建新股份', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 14.36, 13, 1, NULL);
INSERT INTO `stock_bak` VALUES (443, '300113', '顺网科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 17.41, 15.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (444, '300134', '大富科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 8.94, 8.53, 1, NULL);
INSERT INTO `stock_bak` VALUES (445, '300139', '晓程科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 13.28, 13.19, 1, NULL);
INSERT INTO `stock_bak` VALUES (446, '300167', ' 迪威迅 ', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 5.67, 5.21, 1, NULL);
INSERT INTO `stock_bak` VALUES (447, '300173', '智慧松德', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 6.73, 6.12, 1, NULL);
INSERT INTO `stock_bak` VALUES (448, '300225', ' 金力泰 ', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 7.29, 6.87, 1, NULL);
INSERT INTO `stock_bak` VALUES (449, '300242', '佳云科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 7.04, 6.35, 1, NULL);
INSERT INTO `stock_bak` VALUES (450, '300253', '卫宁健康', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 12.39, 11.28, 1, NULL);
INSERT INTO `stock_bak` VALUES (451, '300312', '邦讯技术', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 7.98, 7.3, 1, NULL);
INSERT INTO `stock_bak` VALUES (452, '300333', '兆日科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 9.9, 9.07, 1, NULL);
INSERT INTO `stock_bak` VALUES (453, '300356', '光一科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 6.05, 5.4, 1, NULL);
INSERT INTO `stock_bak` VALUES (454, '300366', '创意信息', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 8.98, 8.23, 1, NULL);
INSERT INTO `stock_bak` VALUES (455, '300383', '光环新网', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 13.41, 12.3, 1, NULL);
INSERT INTO `stock_bak` VALUES (456, '300384', '三联虹普', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 40.27, 39.4, 1, NULL);
INSERT INTO `stock_bak` VALUES (457, '300425', '环能科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 4.6, 4.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (458, '300431', '暴风集团', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 15.18, 13.93, 1, NULL);
INSERT INTO `stock_bak` VALUES (459, '300454', ' 深信服 ', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 109.96, 101.45, 1, NULL);
INSERT INTO `stock_bak` VALUES (460, '300461', '田中精机', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 26.39, 23.46, 1, NULL);
INSERT INTO `stock_bak` VALUES (461, '300484', '蓝海华腾', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 14.73, 13.74, 1, NULL);
INSERT INTO `stock_bak` VALUES (462, '300499', '高澜股份', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 14.61, 13.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (463, '300522', '世名科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 29.23, 27.47, 1, NULL);
INSERT INTO `stock_bak` VALUES (464, '300578', '会畅通讯', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 26.62, 24.1, 1, NULL);
INSERT INTO `stock_bak` VALUES (465, '300581', '晨曦航空', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 14.82, 13.58, 1, NULL);
INSERT INTO `stock_bak` VALUES (466, '300618', '寒锐钴业', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 128.34, 117.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (467, '300672', ' 国科微 ', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 54.11, 49.5, 1, NULL);
INSERT INTO `stock_bak` VALUES (468, '300677', '英科医疗', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 22.99, 21.99, 1, NULL);
INSERT INTO `stock_bak` VALUES (469, '300688', '创业黑马', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 63.71, 58.51, 1, NULL);
INSERT INTO `stock_bak` VALUES (470, '300745', '欣锐科技', NULL, '2023-02-09', NULL, NULL, 0, '创业板', NULL, 82.08, 77.01, 1, NULL);
INSERT INTO `stock_bak` VALUES (552, '600241', '时代万恒', NULL, '2018-07-02', NULL, NULL, 0, '沪市主板', NULL, 8, 7.46, 1, NULL);
INSERT INTO `stock_bak` VALUES (553, '600555', '海航创新', NULL, '2018-07-02', NULL, NULL, 0, '沪市主板', NULL, 4.26, 3.92, 1, NULL);
INSERT INTO `stock_bak` VALUES (554, '600722', '金牛化工', NULL, '2018-07-02', NULL, NULL, 0, '沪市主板', NULL, 4.76, 4.3, 1, NULL);
INSERT INTO `stock_bak` VALUES (555, '603011', '合锻智能', NULL, '2018-07-02', NULL, NULL, 0, '沪市主板', NULL, 5.89, 5.41, 1, NULL);
INSERT INTO `stock_bak` VALUES (556, '603398', '邦宝益智', NULL, '2018-07-02', NULL, NULL, 0, '沪市主板', NULL, 18.93, 16.86, 1, NULL);
INSERT INTO `stock_bak` VALUES (557, '603421', '鼎信通讯', NULL, '2018-07-02', NULL, NULL, 0, '沪市主板', NULL, 19.82, 19.75, 1, NULL);
INSERT INTO `stock_bak` VALUES (558, '603486', ' 科沃斯 ', NULL, '2018-07-02', NULL, NULL, 0, '沪市主板', NULL, 70.7, 70.7, 1, NULL);
INSERT INTO `stock_bak` VALUES (559, '603901', '永创智能', NULL, '2018-07-02', NULL, NULL, 0, '沪市主板', NULL, 11.32, 11.32, 1, NULL);
INSERT INTO `stock_bak` VALUES (560, '603996', '中新科技', NULL, '2018-07-02', NULL, NULL, 0, '沪市主板', NULL, 10.68, 9.57, 1, NULL);
INSERT INTO `stock_bak` VALUES (561, '000590', '启迪古汉', NULL, '2018-07-02', NULL, NULL, 0, '深市主板', NULL, 10.44, 9.79, 1, NULL);
INSERT INTO `stock_bak` VALUES (562, '000595', '宝塔实业', NULL, '2018-07-02', NULL, NULL, 0, '深市主板', NULL, 3.86, 3.5, 1, NULL);
INSERT INTO `stock_bak` VALUES (563, '000892', '欢瑞世纪', NULL, '2018-07-02', NULL, NULL, 0, '深市主板', NULL, 5.18, 4.73, 1, NULL);
INSERT INTO `stock_bak` VALUES (564, '002125', '湘潭电化', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 8.03, 7.38, 1, NULL);
INSERT INTO `stock_bak` VALUES (565, '002148', '北纬科技', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 6.38, 6, 1, NULL);
INSERT INTO `stock_bak` VALUES (566, '002300', '太阳电缆', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 6.01, 5.54, 1, NULL);
INSERT INTO `stock_bak` VALUES (567, '002356', '赫美集团', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 13.3, 12.32, 1, NULL);
INSERT INTO `stock_bak` VALUES (568, '002388', '新亚制程', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 6.31, 5.75, 1, NULL);
INSERT INTO `stock_bak` VALUES (569, '002451', '摩恩电气', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 10.96, 9.69, 1, NULL);
INSERT INTO `stock_bak` VALUES (570, '002488', '金固股份', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 11.87, 10.13, 1, NULL);
INSERT INTO `stock_bak` VALUES (571, '002547', '春兴精工', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 4.79, 4.31, 1, NULL);
INSERT INTO `stock_bak` VALUES (572, '002584', '西陇科学', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 8.18, 7.31, 1, NULL);
INSERT INTO `stock_bak` VALUES (573, '002782', ' 可立克 ', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 17.36, 15.8, 1, NULL);
INSERT INTO `stock_bak` VALUES (574, '002870', '香山股份', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 21.7, 19.93, 1, NULL);
INSERT INTO `stock_bak` VALUES (575, '002906', '华阳集团', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 20.57, 18.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (576, '002907', '华森制药', NULL, '2018-07-02', NULL, NULL, 0, '中小板', NULL, 30.88, 28.49, 1, NULL);
INSERT INTO `stock_bak` VALUES (577, '300056', ' 三维丝 ', NULL, '2018-07-02', NULL, NULL, 0, '创业板', NULL, 6.72, 5.87, 1, NULL);
INSERT INTO `stock_bak` VALUES (578, '300074', '华平股份', NULL, '2018-07-02', NULL, NULL, 0, '创业板', NULL, 4.24, 3.82, 1, NULL);
INSERT INTO `stock_bak` VALUES (579, '300141', '和顺电气', NULL, '2018-07-02', NULL, NULL, 0, '创业板', NULL, 8.83, 7.89, 1, NULL);
INSERT INTO `stock_bak` VALUES (580, '300546', '雄帝科技', NULL, '2018-07-02', NULL, NULL, 0, '创业板', NULL, 23.69, 21.41, 1, NULL);
INSERT INTO `stock_bak` VALUES (581, '300578', '会畅通讯', NULL, '2018-07-02', NULL, NULL, 0, '创业板', NULL, 29.28, 28, 1, NULL);
INSERT INTO `stock_bak` VALUES (582, '300647', ' 超频三 ', NULL, '2018-07-02', NULL, NULL, 0, '创业板', NULL, 28.86, 26, 1, NULL);
INSERT INTO `stock_bak` VALUES (583, '300677', '英科医疗', NULL, '2018-07-02', NULL, NULL, 0, '创业板', NULL, 25.29, 25, 1, NULL);
INSERT INTO `stock_bak` VALUES (584, '300746', '汉嘉设计', NULL, '2018-07-02', NULL, NULL, 0, '创业板', NULL, 37.68, 35.5, 1, NULL);
INSERT INTO `stock_bak` VALUES (585, '600071', '凤凰光学', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 12.06, 10.95, 1, NULL);
INSERT INTO `stock_bak` VALUES (586, '600360', '华微电子', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 6.83, 6.18, 1, NULL);
INSERT INTO `stock_bak` VALUES (587, '600391', '航发科技', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 16.02, 14.57, 1, NULL);
INSERT INTO `stock_bak` VALUES (588, '600476', '湘邮科技', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 16.9, 15.03, 1, NULL);
INSERT INTO `stock_bak` VALUES (589, '600520', '文一科技', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 17.5, 15.99, 1, NULL);
INSERT INTO `stock_bak` VALUES (590, '600862', '中航高科', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 6.73, 6.1, 1, NULL);
INSERT INTO `stock_bak` VALUES (591, '603189', '网达软件', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 15.5, 14.03, 1, NULL);
INSERT INTO `stock_bak` VALUES (592, '603301', '振德医疗', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 54.54, 52.49, 1, NULL);
INSERT INTO `stock_bak` VALUES (593, '603383', '顶点软件', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 34.07, 31.03, 1, NULL);
INSERT INTO `stock_bak` VALUES (594, '603421', '鼎信通讯', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 21.8, 19.69, 1, NULL);
INSERT INTO `stock_bak` VALUES (595, '603429', '集友股份', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 25.27, 22.65, 1, NULL);
INSERT INTO `stock_bak` VALUES (596, '603499', '翔港科技', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 32.99, 30, 1, NULL);
INSERT INTO `stock_bak` VALUES (597, '603508', '思维列控', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 36.45, 32.99, 1, NULL);
INSERT INTO `stock_bak` VALUES (598, '603693', ' N新能  ', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 12.96, 10.8, 1, NULL);
INSERT INTO `stock_bak` VALUES (599, '603800', '道森股份', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 16.36, 15.07, 1, NULL);
INSERT INTO `stock_bak` VALUES (600, '603890', '春秋电子', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 17.9, 16.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (601, '603996', '中新科技', NULL, '2018-07-03', NULL, NULL, 0, '沪市主板', NULL, 11.75, 11.05, 1, NULL);
INSERT INTO `stock_bak` VALUES (602, '00063', '中兴通讯', NULL, '2018-07-03', NULL, NULL, 0, '深市主板', NULL, 13.45, 12.15, 1, NULL);
INSERT INTO `stock_bak` VALUES (603, '000510', '金路集团', NULL, '2018-07-03', NULL, NULL, 0, '深市主板', NULL, 4.81, 4.58, 1, NULL);
INSERT INTO `stock_bak` VALUES (604, '000738', '航发控制', NULL, '2018-07-03', NULL, NULL, 0, '深市主板', NULL, 14.81, 13.63, 1, NULL);
INSERT INTO `stock_bak` VALUES (605, '000802', '北京文化', NULL, '2018-07-03', NULL, NULL, 0, '深市主板', NULL, 12.12, 11.05, 1, NULL);
INSERT INTO `stock_bak` VALUES (606, '000856', '冀东装备', NULL, '2018-07-03', NULL, NULL, 0, '深市主板', NULL, 13.94, 13.12, 1, NULL);
INSERT INTO `stock_bak` VALUES (607, '000901', '航天科技', NULL, '2018-07-03', NULL, NULL, 0, '深市主板', NULL, 11.01, 10.02, 1, NULL);
INSERT INTO `stock_bak` VALUES (608, '000928', '中钢国际', NULL, '2018-07-03', NULL, NULL, 0, '深市主板', NULL, 5.49, 4.95, 1, NULL);
INSERT INTO `stock_bak` VALUES (609, '000979', '中弘股份', NULL, '2018-07-03', NULL, NULL, 0, '深市主板', NULL, 1.22, 1.16, 1, NULL);
INSERT INTO `stock_bak` VALUES (610, '002052', '同洲电子', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 4.53, 4.14, 1, NULL);
INSERT INTO `stock_bak` VALUES (611, '002227', '奥 特 迅', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 13.88, 13.87, 1, NULL);
INSERT INTO `stock_bak` VALUES (612, '002300', '太阳电缆', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 6.61, 6.15, 1, NULL);
INSERT INTO `stock_bak` VALUES (613, '002313', '日海智能', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 23.96, 21.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (614, '002356', '赫美集团', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 14.63, 14, 1, NULL);
INSERT INTO `stock_bak` VALUES (615, '002409', '雅克科技', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 20.8, 18.71, 1, NULL);
INSERT INTO `stock_bak` VALUES (616, '002423', '中原特钢', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 11.79, 10.84, 1, NULL);
INSERT INTO `stock_bak` VALUES (617, '002795', '永和智控', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 22.44, 20.3, 1, NULL);
INSERT INTO `stock_bak` VALUES (618, '002878', '元隆雅图', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 23.6, 21.95, 1, NULL);
INSERT INTO `stock_bak` VALUES (619, '002899', ' 英派斯 ', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 22.4, 20.43, 1, NULL);
INSERT INTO `stock_bak` VALUES (620, '002905', '金逸影视', NULL, '2018-07-03', NULL, NULL, 0, '中小板', NULL, 21.56, 19.63, 1, NULL);
INSERT INTO `stock_bak` VALUES (621, '300100', '双林股份', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 11.37, 10.34, 1, NULL);
INSERT INTO `stock_bak` VALUES (622, '300134', '大富科技', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 10.81, 10.75, 1, NULL);
INSERT INTO `stock_bak` VALUES (623, '300172', '中电环保', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 6.26, 5.66, 1, NULL);
INSERT INTO `stock_bak` VALUES (624, '300247', '乐金健康', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 5.57, 5.57, 1, NULL);
INSERT INTO `stock_bak` VALUES (625, '300290', '荣科科技', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 7.47, 6.89, 1, NULL);
INSERT INTO `stock_bak` VALUES (626, '300339', '润和软件', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 11.86, 11.16, 1, NULL);
INSERT INTO `stock_bak` VALUES (627, '300346', '南大光电', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 14.4, 13.1, 1, NULL);
INSERT INTO `stock_bak` VALUES (628, '300451', '创业软件', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 17.08, 15.41, 1, NULL);
INSERT INTO `stock_bak` VALUES (629, '300540', '深冷股份', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 15.61, 14.27, 1, NULL);
INSERT INTO `stock_bak` VALUES (630, '300560', ' 中富通 ', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 22.87, 20.79, 1, NULL);
INSERT INTO `stock_bak` VALUES (631, '300570', ' 太辰光 ', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 17.11, 15.68, 1, NULL);
INSERT INTO `stock_bak` VALUES (632, '300578', '会畅通讯', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 32.21, 28.03, 1, NULL);
INSERT INTO `stock_bak` VALUES (633, '300589', '江龙船艇', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 14.62, 13.44, 1, NULL);
INSERT INTO `stock_bak` VALUES (634, '300615', '欣天科技', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 21.09, 19.65, 1, NULL);
INSERT INTO `stock_bak` VALUES (635, '300623', '捷捷微电', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 34.62, 32.1, 1, NULL);
INSERT INTO `stock_bak` VALUES (636, '300640', '德艺文创', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 14.12, 12.99, 1, NULL);
INSERT INTO `stock_bak` VALUES (637, '300650', '太龙照明', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 18.08, 16.44, 1, NULL);
INSERT INTO `stock_bak` VALUES (638, '300656', '民德电子', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 27.93, 25.52, 1, NULL);
INSERT INTO `stock_bak` VALUES (639, '300658', '延江股份', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 17.05, 15.95, 1, NULL);
INSERT INTO `stock_bak` VALUES (640, '300672', ' 国科微 ', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 61.59, 56.2, 1, NULL);
INSERT INTO `stock_bak` VALUES (641, '300676', '华大基因', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 106.01, 97.69, 1, NULL);
INSERT INTO `stock_bak` VALUES (642, '300706', ' 阿石创 ', NULL, '2018-07-03', NULL, NULL, 0, '创业板', NULL, 53.93, 48.94, 1, NULL);
INSERT INTO `stock_bak` VALUES (643, '600569', '安阳钢铁', NULL, '2018-07-04', NULL, NULL, 0, '沪市主板', NULL, 4.07, 4, 1, NULL);
INSERT INTO `stock_bak` VALUES (644, '600679', '上海凤凰', NULL, '2018-07-04', NULL, NULL, 0, '沪市主板', NULL, 12.4, 11.02, 1, NULL);
INSERT INTO `stock_bak` VALUES (645, '600686', '金龙汽车', NULL, '2018-07-04', NULL, NULL, 0, '沪市主板', NULL, 13.2, 12.62, 1, NULL);
INSERT INTO `stock_bak` VALUES (646, '600988', '赤峰黄金', NULL, '2018-07-04', NULL, NULL, 0, '沪市主板', NULL, 5.31, 4.93, 1, NULL);
INSERT INTO `stock_bak` VALUES (647, '601069', '西部黄金', NULL, '2018-07-04', NULL, NULL, 0, '沪市主板', NULL, 18.5, 17.33, 1, NULL);
INSERT INTO `stock_bak` VALUES (648, '603045', '福达合金', NULL, '2018-07-04', NULL, NULL, 0, '沪市主板', NULL, 55.2, 49.52, 1, NULL);
INSERT INTO `stock_bak` VALUES (649, '603177', '德创环保', NULL, '2018-07-04', NULL, NULL, 0, '沪市主板', NULL, 14.92, 13.71, 1, NULL);
INSERT INTO `stock_bak` VALUES (650, '603336', '宏辉果蔬', NULL, '2018-07-04', NULL, NULL, 0, '沪市主板', NULL, 28.78, 26.25, 1, NULL);
INSERT INTO `stock_bak` VALUES (651, '603970', '中农立华', NULL, '2018-07-04', NULL, NULL, 0, '沪市主板', NULL, 20.42, 18.6, 1, NULL);
INSERT INTO `stock_bak` VALUES (652, '00019', '深深宝Ａ', NULL, '2018-07-04', NULL, NULL, 0, '深市主板', NULL, 10.79, 9.68, 1, NULL);
INSERT INTO `stock_bak` VALUES (653, '000510', '金路集团', NULL, '2018-07-04', NULL, NULL, 0, '深市主板', NULL, 5.29, 5, 1, NULL);
INSERT INTO `stock_bak` VALUES (654, '000591', ' 太阳能 ', NULL, '2018-07-04', NULL, NULL, 0, '深市主板', NULL, 3.73, 3.4, 1, NULL);
INSERT INTO `stock_bak` VALUES (655, '000777', '中核科技', NULL, '2018-07-04', NULL, NULL, 0, '深市主板', NULL, 10.44, 9.49, 1, NULL);
INSERT INTO `stock_bak` VALUES (656, '002231', '奥维通信', NULL, '2018-07-04', NULL, NULL, 0, '中小板', NULL, 6.47, 5.86, 1, NULL);
INSERT INTO `stock_bak` VALUES (657, '002346', '柘中股份', NULL, '2018-07-04', NULL, NULL, 0, '中小板', NULL, 14.44, 13.26, 1, NULL);
INSERT INTO `stock_bak` VALUES (658, '002499', '科林环保', NULL, '2018-07-04', NULL, NULL, 0, '中小板', NULL, 12.23, 11.15, 1, NULL);
INSERT INTO `stock_bak` VALUES (659, '002606', '大连电瓷', NULL, '2018-07-04', NULL, NULL, 0, '中小板', NULL, 5.62, 4.88, 1, NULL);
INSERT INTO `stock_bak` VALUES (660, '002691', '冀凯股份', NULL, '2018-07-04', NULL, NULL, 0, '中小板', NULL, 12.54, 11.36, 1, NULL);
INSERT INTO `stock_bak` VALUES (661, '002795', '永和智控', NULL, '2018-07-04', NULL, NULL, 0, '中小板', NULL, 24.68, 23.22, 1, NULL);
INSERT INTO `stock_bak` VALUES (662, '002824', '和胜股份', NULL, '2018-07-04', NULL, NULL, 0, '中小板', NULL, 12.91, 11.75, 1, NULL);
INSERT INTO `stock_bak` VALUES (663, '002855', '捷荣技术', NULL, '2018-07-04', NULL, NULL, 0, '中小板', NULL, 10.67, 10.18, 1, NULL);
INSERT INTO `stock_bak` VALUES (664, '300100', '双林股份', NULL, '2018-07-04', NULL, NULL, 0, '创业板', NULL, 12.51, 12.4, 1, NULL);
INSERT INTO `stock_bak` VALUES (665, '300147', '香雪制药', NULL, '2018-07-04', NULL, NULL, 0, '创业板', NULL, 8.37, 7.53, 1, NULL);
INSERT INTO `stock_bak` VALUES (666, '300426', '唐德影视', NULL, '2018-07-04', NULL, NULL, 0, '创业板', NULL, 13.79, 12.95, 1, NULL);
INSERT INTO `stock_bak` VALUES (667, '300444', '双杰电气', NULL, '2018-07-04', NULL, NULL, 0, '创业板', NULL, 9.37, 8.8, 1, NULL);
INSERT INTO `stock_bak` VALUES (668, '300530', '达志科技', NULL, '2018-07-04', NULL, NULL, 0, '创业板', NULL, 32.33, 31.09, 1, NULL);
INSERT INTO `stock_bak` VALUES (669, '300706', ' 阿石创 ', NULL, '2018-07-04', NULL, NULL, 0, '创业板', NULL, 59.32, 59, 1, NULL);
INSERT INTO `stock_bak` VALUES (670, '600099', '林海股份', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 6.56, 5.96, 1, NULL);
INSERT INTO `stock_bak` VALUES (671, '600360', '华微电子', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 6.97, 6.41, 1, NULL);
INSERT INTO `stock_bak` VALUES (672, '600614', '鹏起科技', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 5.41, 5, 1, NULL);
INSERT INTO `stock_bak` VALUES (673, '600645', '中源协和', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 20.63, 18.84, 1, NULL);
INSERT INTO `stock_bak` VALUES (674, '601038', '一拖股份', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 5.69, 5.68, 1, NULL);
INSERT INTO `stock_bak` VALUES (675, '603335', ' 迪生力 ', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 7.85, 7.23, 1, NULL);
INSERT INTO `stock_bak` VALUES (676, '603398', '邦宝益智', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 18.24, 16.5, 1, NULL);
INSERT INTO `stock_bak` VALUES (677, '603895', '天永智能', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 36.3, 36.3, 1, NULL);
INSERT INTO `stock_bak` VALUES (678, '603897', '长城科技', NULL, '2018-07-06', NULL, NULL, 0, '沪市主板', NULL, 34.71, 31.59, 1, NULL);
INSERT INTO `stock_bak` VALUES (679, '000633', '合金投资', NULL, '2018-07-06', NULL, NULL, 0, '深市主板', NULL, 4.77, 4.37, 1, NULL);
INSERT INTO `stock_bak` VALUES (680, '000713', '丰乐种业', NULL, '2018-07-06', NULL, NULL, 0, '深市主板', NULL, 7.14, 6.54, 1, NULL);
INSERT INTO `stock_bak` VALUES (681, '000757', '浩物股份', NULL, '2018-07-06', NULL, NULL, 0, '深市主板', NULL, 5.63, 5.32, 1, NULL);
INSERT INTO `stock_bak` VALUES (682, '000892', '欢瑞世纪', NULL, '2018-07-06', NULL, NULL, 0, '深市主板', NULL, 5.39, 4.9, 1, NULL);
INSERT INTO `stock_bak` VALUES (683, '002112', '三变科技', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 6.53, 6.05, 1, NULL);
INSERT INTO `stock_bak` VALUES (684, '002175', '东方网络', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 3.82, 3.5, 1, NULL);
INSERT INTO `stock_bak` VALUES (685, '002584', '西陇科学', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 8.51, 7.6, 1, NULL);
INSERT INTO `stock_bak` VALUES (686, '002606', '大连电瓷', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 5.96, 5.32, 1, NULL);
INSERT INTO `stock_bak` VALUES (687, '002642', ' 荣之联 ', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 9.46, 8.7, 1, NULL);
INSERT INTO `stock_bak` VALUES (688, '002760', '凤形股份', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 16.53, 15.06, 1, NULL);
INSERT INTO `stock_bak` VALUES (689, '002772', '众兴菌业', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 8.36, 7.68, 1, NULL);
INSERT INTO `stock_bak` VALUES (690, '002866', '传艺科技', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 31.28, 30, 1, NULL);
INSERT INTO `stock_bak` VALUES (691, '002927', '泰永长征', NULL, '2018-07-06', NULL, NULL, 0, '中小板', NULL, 39.18, 39, 1, NULL);
INSERT INTO `stock_bak` VALUES (692, '300038', ' 梅泰诺 ', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 10.86, 10.55, 1, NULL);
INSERT INTO `stock_bak` VALUES (693, '300134', '大富科技', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 11.48, 10.38, 1, NULL);
INSERT INTO `stock_bak` VALUES (694, '300283', '温州宏丰', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 4.77, 4.44, 1, NULL);
INSERT INTO `stock_bak` VALUES (695, '300452', '山河药辅', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 14.75, 13.5, 1, NULL);
INSERT INTO `stock_bak` VALUES (696, '300540', '深冷股份', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 16.57, 14.87, 1, NULL);
INSERT INTO `stock_bak` VALUES (697, '300598', '诚迈科技', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 31.7, 28.34, 1, NULL);
INSERT INTO `stock_bak` VALUES (698, '300686', ' 智动力 ', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 19.91, 18.5, 1, NULL);
INSERT INTO `stock_bak` VALUES (699, '300743', '天地数码', NULL, '2018-07-06', NULL, NULL, 0, '创业板', NULL, 72.71, 67.8, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for stock_info
-- ----------------------------
DROP TABLE IF EXISTS `stock_info`;
CREATE TABLE `stock_info` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `stockCode` varchar(20) DEFAULT NULL,
  `stockName` varchar(20) DEFAULT NULL,
  `stockType` varchar(20) DEFAULT NULL,
  `plate` varchar(20) DEFAULT NULL,
  `listedTime` datetime DEFAULT NULL,
  `issueTime` datetime DEFAULT NULL,
  `issuePERate` varchar(100) DEFAULT NULL,
  `issueType` varchar(100) DEFAULT NULL,
  `stockPrice` varchar(100) DEFAULT NULL,
  `issuePrice` varchar(100) DEFAULT NULL,
  `issueNumber` varchar(100) DEFAULT NULL,
  `totalIssuePrice` varchar(100) DEFAULT NULL,
  `placementPrice` varchar(100) DEFAULT NULL,
  `openPrice` varchar(100) DEFAULT NULL,
  `closePrice` varchar(100) DEFAULT NULL,
  `turnoverRate` varchar(100) DEFAULT NULL,
  `topPrice` varchar(100) DEFAULT NULL,
  `placeWinningRate` varchar(100) DEFAULT NULL,
  `priceWinningRate` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
