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
