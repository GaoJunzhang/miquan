/*
Navicat MySQL Data Transfer

Source Server         : 112.74.201.45
Source Server Version : 50550
Source Host           : 112.74.201.45:3306
Source Database       : restrain

Target Server Type    : MYSQL
Target Server Version : 50550
File Encoding         : 65001

Date: 2018-05-24 10:37:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '活动名称',
  `creater_wx_id` varchar(32) DEFAULT NULL COMMENT '发起人id',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发起时间',
  `content` text,
  `is_time` tinyint(4) DEFAULT NULL COMMENT '是否时间限制(0-是，1-否)',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_sign` tinyint(4) DEFAULT NULL COMMENT '是否每天打开',
  `is_limit` tinyint(4) DEFAULT NULL COMMENT '是否仅圈内可用（0-是，1-否）',
  `limits` text COMMENT '活动人员',
  `img` varchar(100) DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `music` varchar(100) DEFAULT NULL,
  `like_count` int(255) DEFAULT NULL COMMENT '点赞数',
  `bg_img` varchar(255) DEFAULT NULL,
  `bg_color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for activity_users
-- ----------------------------
DROP TABLE IF EXISTS `activity_users`;
CREATE TABLE `activity_users` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) DEFAULT NULL,
  `wxno` varchar(34) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_login` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `owner_user_id` varchar(32) DEFAULT NULL,
  `target_user_id` varchar(32) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `creater_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_type` tinyint(4) DEFAULT NULL,
  `sign_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for great
-- ----------------------------
DROP TABLE IF EXISTS `great`;
CREATE TABLE `great` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sign_id` bigint(20) DEFAULT NULL,
  `wx_user_id` bigint(20) DEFAULT NULL,
  `wx_no` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `img_name` varchar(64) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL,
  `enable` int(10) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sign
-- ----------------------------
DROP TABLE IF EXISTS `sign`;
CREATE TABLE `sign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '打卡时间',
  `img` bigint(20) DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `music` varchar(100) DEFAULT NULL,
  `content` text,
  `position` varchar(255) DEFAULT NULL,
  `is_hide` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `wxno` varchar(32) DEFAULT NULL,
  `like_count` int(20) DEFAULT '0',
  `inviters` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sign_img
-- ----------------------------
DROP TABLE IF EXISTS `sign_img`;
CREATE TABLE `sign_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sign_id` bigint(20) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wx_users
-- ----------------------------
DROP TABLE IF EXISTS `wx_users`;
CREATE TABLE `wx_users` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `wx_name` varchar(50) DEFAULT NULL,
  `nick_name` varchar(50) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `img` varchar(500) DEFAULT NULL,
  `tel` varchar(32) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `wxno` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
