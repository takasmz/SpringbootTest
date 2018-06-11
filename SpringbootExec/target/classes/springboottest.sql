/*
Navicat MySQL Data Transfer

Source Server         : taka
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : springboottest

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-06-03 23:08:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `sn` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `teacher_account` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'Matrix Computations', 'Matrix Computations', 'admin');
INSERT INTO `course` VALUES ('2', 'DATA Analysis', 'DATA Analysis', 'admin');
INSERT INTO `course` VALUES ('3', 'Linear algebra', 'Linear algebra', 'admin');
INSERT INTO `course` VALUES ('5', 'Numerical PDE', 'Numerical PDE', 'admin');
INSERT INTO `course` VALUES ('6', 'Probability Theory', 'Probability Theory', 'admin');

-- ----------------------------
-- Table structure for course_resource
-- ----------------------------
DROP TABLE IF EXISTS `course_resource`;
CREATE TABLE `course_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_caption` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `plan_filename` varchar(255) DEFAULT NULL,
  `ppt_filename` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `video_filename` varchar(255) DEFAULT NULL,
  `xh` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_resource
-- ----------------------------
INSERT INTO `course_resource` VALUES ('3', 'Matrix Computations', 'Chapter_03', '', 'Chapter_03.pptx', '第3章', '', '3');
INSERT INTO `course_resource` VALUES ('4', 'Matrix Computations', 'Chapter_04', '', 'Chapter_04.pptx', '第4章', '', '4');
INSERT INTO `course_resource` VALUES ('5', 'Matrix Computations', 'Chapter_05', '', 'Chapter_05.pptx', '第5章', '', '5');
INSERT INTO `course_resource` VALUES ('6', 'Matrix Computations', 'Chapter_06', '', 'Chapter_06.pptx', '第6章', '', '6');
INSERT INTO `course_resource` VALUES ('7', 'Matrix Computations', 'Chapter_07', '', 'Chapter_07.pptx', '第7章', '', '7');
INSERT INTO `course_resource` VALUES ('8', 'Matrix Computations', 'Chapter_08', '', 'Chapter_08.pptx', '第8章', '', '8');
INSERT INTO `course_resource` VALUES ('9', 'Matrix Computations', 'Chapter_09', '', 'Chapter_09.pptx', '第9章', '', '9');
INSERT INTO `course_resource` VALUES ('10', 'Matrix Computations', 'Chapter_10', '', 'Chapter_10.pptx', '第10章', '', '10');
INSERT INTO `course_resource` VALUES ('11', 'Matrix Computations', 'Chapter_11', '', 'Chapter_11.pptx', '第11章', '', '11');
INSERT INTO `course_resource` VALUES ('12', 'Matrix Computations', 'Chapter_12', '', 'Chapter_12.pptx', '第12章', '', '12');
INSERT INTO `course_resource` VALUES ('13', 'Matrix Computations', 'Chapter_13', '', 'Chapter_13.pptx', '第13章', '', '13');
INSERT INTO `course_resource` VALUES ('14', 'Matrix Computations', 'Chapter_14', '', 'Chapter_14.pptx', '第14章', '', '14');
INSERT INTO `course_resource` VALUES ('15', 'Matrix Computations', 'Chapter_15', '', 'Chapter_15.pptx', '第15章', '', '15');
INSERT INTO `course_resource` VALUES ('16', 'Matrix Computations', 'Chapter_16', '', 'Chapter_16.pptx', '第16章', '', '16');
INSERT INTO `course_resource` VALUES ('17', 'Matrix Computations', 'Chapter_17', '', 'Chapter_17.pptx', '第17章', '', '17');
INSERT INTO `course_resource` VALUES ('18', 'Matrix Computations', 'Chapter_18', '', 'Chapter_18.pptx', '第18章', '', '18');
INSERT INTO `course_resource` VALUES ('19', 'Matrix Computations', 'Chapter_19', '', 'Chapter_19.pptx', '第19章', '', '19');
INSERT INTO `course_resource` VALUES ('20', 'Matrix Computations', 'Chapter_20', '', 'Chapter_20.pptx', '第20章', '', '20');
INSERT INTO `course_resource` VALUES ('21', 'Matrix Computations', 'Chapter_21', '', 'Chapter_21.pptx', '第21章', '', '21');
INSERT INTO `course_resource` VALUES ('22', 'Matrix Computations', 'Chapter_22', '', 'Chapter_22.pptx', '第22章', '', '22');
INSERT INTO `course_resource` VALUES ('23', 'Matrix Computations', 'Chapter_23', '', 'Chapter_23.pptx', '第23章', '', '23');
INSERT INTO `course_resource` VALUES ('24', 'Matrix Computations', 'AppendixA', '', 'AppendixA.pptx', '附录A', '', '24');
INSERT INTO `course_resource` VALUES ('25', 'Matrix Computations', 'AppendixB', '', 'AppendixB.pptx', '附录B', '', '25');
INSERT INTO `course_resource` VALUES ('26', 'Matrix Computations', 'AppendixC', '', 'AppendixC.pptx', '附录C', '', '26');
INSERT INTO `course_resource` VALUES ('27', 'DATA Analysis', 'Chapter_01', '', '1.doc', '第1章', '', '1');
INSERT INTO `course_resource` VALUES ('28', 'DATA Analysis', 'Chapter_02', '', '2.pdf', '第2章', '', '2');
INSERT INTO `course_resource` VALUES ('29', 'DATA Analysis', 'Chapter_03', '', '3.pdf', '第3章', '', '3');
INSERT INTO `course_resource` VALUES ('30', 'DATA Analysis', 'Chapter_04', '', '4.pdf', '第4章', '', '4');
INSERT INTO `course_resource` VALUES ('31', 'DATA Analysis', 'Chapter_05', '', '5.pdf', '第5章', '', '5');
INSERT INTO `course_resource` VALUES ('32', 'DATA Analysis', 'Chapter_06', '', '6.pdf', '第6章', '', '6');
INSERT INTO `course_resource` VALUES ('33', 'DATA Analysis', 'Chapter_07', '', '7.pdf', '第7章', '', '7');
INSERT INTO `course_resource` VALUES ('34', 'DATA Analysis', 'Chapter_08', '', '8.pdf', '第8章', '', '8');
INSERT INTO `course_resource` VALUES ('35', 'DATA Analysis', 'Chapter_09', '', '9.pdf', '第9章', '', '9');
INSERT INTO `course_resource` VALUES ('36', 'DATA Analysis', 'Chapter_10', '', '10.pdf', '第10章', '', '10');
INSERT INTO `course_resource` VALUES ('37', 'Linear algebra', 'Matrices and Systems of Equations', '', 'LinearA1.pdf', '第1章', '', '1');
INSERT INTO `course_resource` VALUES ('38', 'Linear algebra', 'Determinants', '', 'LinearA2.pdf', '第2章', '', '2');
INSERT INTO `course_resource` VALUES ('39', 'Linear algebra', 'Vector Spaces', '', 'LinearA3.pdf', '第3章', '', '3');
INSERT INTO `course_resource` VALUES ('40', 'Linear algebra', 'Linear Transformations', '', 'LinearA4.pdf', '第4章', '', '4');
INSERT INTO `course_resource` VALUES ('41', 'Numerical PDE', 'Overview of PDEs', '', '1.pdf', '第1章', '', '1');
INSERT INTO `course_resource` VALUES ('42', 'Numerical PDE', 'Explicit methods for 1-D heat', '', '2.pdf', '第2章', '', '2');
INSERT INTO `course_resource` VALUES ('43', 'Numerical PDE', 'Implicit methods for 1-D heat', '', '3.pdf', '第3章', '', '3');
INSERT INTO `course_resource` VALUES ('44', 'Numerical PDE', 'Jacobi method', '', '4.pdf', '第4章', '', '4');
INSERT INTO `course_resource` VALUES ('45', 'Numerical PDE', '2-D Finite Difference', '', '5.pdf', '第5章', '', '5');
INSERT INTO `course_resource` VALUES ('46', 'Numerical PDE', 'Analytical solutions to 1-DWave equation', '', '6.pdf', '第6章', '', '6');
INSERT INTO `course_resource` VALUES ('47', 'Numerical PDE', 'Flux conservative problems', '', '7.pdf', '第7章', '', '7');
INSERT INTO `course_resource` VALUES ('48', 'Numerical PDE', 'Numerical Solution of 1-D and 2-D Wave Equation', '', '8.pdf', '第8章', '', '8');
INSERT INTO `course_resource` VALUES ('49', 'Numerical PDE', 'Finite element method', '', '9.pdf', '第9章', '', '9');
INSERT INTO `course_resource` VALUES ('50', 'Numerical PDE', 'Example', '', '10.pdf', '第10章', '', '10');
INSERT INTO `course_resource` VALUES ('51', 'Numerical PDE', 'Example', '', '11.pdf', '第11章', '', '11');
INSERT INTO `course_resource` VALUES ('52', 'Numerical PDE', 'Example', '', '12.pdf', '第12章', '', '12');
INSERT INTO `course_resource` VALUES ('53', 'Probability Theory', 'Chapter 02', '', 'ch2_12.pdf', '第2章(1-2)', '', '1');
INSERT INTO `course_resource` VALUES ('54', 'Probability Theory', 'Chapter 02', '', 'ch2_34.pdf', '第2章(3-4)', '', '2');
INSERT INTO `course_resource` VALUES ('55', 'Probability Theory', 'Chapter 02', '', 'ch2_5678.pdf', '第2章(5-8)', '', '3');
INSERT INTO `course_resource` VALUES ('56', 'Probability Theory', 'Chapter 03', '', 'ch3_123.pdf', '第3章(1-3)', '', '4');
INSERT INTO `course_resource` VALUES ('57', 'Probability Theory', 'Chapter 03', '', 'ch3_4.pdf', '第3章(4)', '', '5');
INSERT INTO `course_resource` VALUES ('58', 'Probability Theory', 'Chapter 04', '', 'ch4_1.pdf', '第4章(1)', '', '6');
INSERT INTO `course_resource` VALUES ('59', 'Probability Theory', 'Chapter 04', '', 'ch4_23.pdf', '第4章(2-3)', '', '7');
INSERT INTO `course_resource` VALUES ('60', 'Probability Theory', 'Chapter 04', '', 'ch4_4.pdf', '第4章(4)', '', '8');
INSERT INTO `course_resource` VALUES ('61', 'Probability Theory', 'Chapter 05', '', 'ch5.pdf', '第5章', '', '9');
INSERT INTO `course_resource` VALUES ('62', 'Probability Theory', 'Chapter 06', '', 'ch6_12.pdf', '第6章(1-2)', '', '10');
INSERT INTO `course_resource` VALUES ('63', 'Probability Theory', 'Chapter 06', '', 'ch6_3.pdf', '第6章(3)', '', '11');
INSERT INTO `course_resource` VALUES ('64', 'Probability Theory', 'Chapter 06', '', 'ch6_4.pdf', '第6章(4)', '', '12');
INSERT INTO `course_resource` VALUES ('65', 'Probability Theory', 'Chapter 06', '', 'ch6_567.pdf', '第6章(567)', '', '13');
INSERT INTO `course_resource` VALUES ('66', 'Probability Theory', 'Chapter 07', '', 'ch7.pdf', '第7章', '', '14');
INSERT INTO `course_resource` VALUES ('69', 'DATA Analysis', '213', null, '123.docx', 'dasd', null, '123');

-- ----------------------------
-- Table structure for homework
-- ----------------------------
DROP TABLE IF EXISTS `homework`;
CREATE TABLE `homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commit_time` datetime DEFAULT NULL,
  `coursename` varchar(255) DEFAULT NULL,
  `studentname` varchar(255) DEFAULT NULL,
  `video_filename` varchar(255) DEFAULT NULL,
  `xh` int(11) DEFAULT NULL,
  `studentno` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of homework
-- ----------------------------
INSERT INTO `homework` VALUES ('1', '2017-12-21 00:00:00', 'Matrix Computations', '李', '', '2', '12124');
INSERT INTO `homework` VALUES ('2', '2017-12-12 00:00:00', 'Matrix Computations', '李', null, '5', '12124');
INSERT INTO `homework` VALUES ('3', '2017-12-15 00:00:00', 'Matrix Computations', '邵', null, '7', '3');
INSERT INTO `homework` VALUES ('4', '2018-03-14 00:00:00', 'Matrix Computations', 'a', null, '1', '1');
INSERT INTO `homework` VALUES ('5', '2017-12-14 00:00:00', 'Matrix Computations', '张', null, '3', '212');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'Admin', 'admin', '0');
INSERT INTO `user` VALUES ('2', 'qq970877579', 'taka', 'qwas74186', '1');
