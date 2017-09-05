/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : tutoronline

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2017-09-05 17:44:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `gradeId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `gradeId` (`gradeId`),
  CONSTRAINT `t_course_ibfk_1` FOREIGN KEY (`gradeId`) REFERENCES `t_grade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '语文', '1');
INSERT INTO `t_course` VALUES ('2', '数学', '1');
INSERT INTO `t_course` VALUES ('3', '英语', '1');
INSERT INTO `t_course` VALUES ('4', '语文', '2');
INSERT INTO `t_course` VALUES ('5', '数学', '2');
INSERT INTO `t_course` VALUES ('6', '英语', '2');
INSERT INTO `t_course` VALUES ('7', '物理', '2');
INSERT INTO `t_course` VALUES ('8', '化学', '2');
INSERT INTO `t_course` VALUES ('9', '生物', '2');
INSERT INTO `t_course` VALUES ('10', '语文', '3');
INSERT INTO `t_course` VALUES ('11', '数学', '3');
INSERT INTO `t_course` VALUES ('12', '英语', '3');
INSERT INTO `t_course` VALUES ('13', '物理', '3');
INSERT INTO `t_course` VALUES ('14', '化学', '3');
INSERT INTO `t_course` VALUES ('15', '生物', '3');

-- ----------------------------
-- Table structure for `t_grade`
-- ----------------------------
DROP TABLE IF EXISTS `t_grade`;
CREATE TABLE `t_grade` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_grade
-- ----------------------------
INSERT INTO `t_grade` VALUES ('1', '小学');
INSERT INTO `t_grade` VALUES ('2', '初中');
INSERT INTO `t_grade` VALUES ('3', '高中');

-- ----------------------------
-- Table structure for `t_studydoc`
-- ----------------------------
DROP TABLE IF EXISTS `t_studydoc`;
CREATE TABLE `t_studydoc` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` varchar(255) default NULL,
  `insertTime` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_studydoc
-- ----------------------------
INSERT INTO `t_studydoc` VALUES ('1', '测试1', '测试1', '2017-04-28');
INSERT INTO `t_studydoc` VALUES ('2', 'test2', 'test2', '2017-04-28');
INSERT INTO `t_studydoc` VALUES ('3', 'test3', 'test3', '2017-04-28');
INSERT INTO `t_studydoc` VALUES ('4', 'test4', 'test4', '2017-05-15');

-- ----------------------------
-- Table structure for `t_subject`
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `beginTime` date default NULL,
  `endTime` date default NULL,
  `address` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `money` double default NULL,
  `picUrl` varchar(255) default NULL,
  `courseId` int(11) default NULL,
  `teaId` int(11) default NULL,
  `userId` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `t_subject_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES ('1', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', '1');
INSERT INTO `t_subject` VALUES ('2', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', '1');
INSERT INTO `t_subject` VALUES ('4', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('5', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('6', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('7', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('8', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('9', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('10', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('11', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('12', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('13', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('14', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('17', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('18', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('19', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);
INSERT INTO `t_subject` VALUES ('20', 'test13', '2017-05-26', '2017-05-29', 'test13', 'test13', '201', null, '7', '2', null);

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `age` int(11) default NULL,
  `sex` varchar(255) default NULL,
  `telphone` varchar(11) default NULL,
  `isTea` int(11) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'Aa', 'Aa', 'Aa', '19', '1', '13811111111', '0', 'Aa');
INSERT INTO `t_user` VALUES ('2', 'Bb', 'Bb', 'Bb', '20', '0', '13822222222', '1', 'Bb');
INSERT INTO `t_user` VALUES ('3', 'Bc', 'Bc', 'Bc', '19', '0', '13800000000', '0', 'Bc');
INSERT INTO `t_user` VALUES ('4', 'Cc', 'Cc', 'Cc', '21', '1', '13833333333', '1', 'Cc');
INSERT INTO `t_user` VALUES ('5', 'Dd', 'Dd', 'Dd', '22', '1', '13855555555', '1', 'Dd');
INSERT INTO `t_user` VALUES ('6', 'ee', 'ee', 'Ee', '21', '1', '13866666666', '1', 'Ee');
