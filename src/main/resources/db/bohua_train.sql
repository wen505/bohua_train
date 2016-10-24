/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : bohua_train

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-10-23 23:01:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bh_college_dsc
-- ----------------------------
DROP TABLE IF EXISTS `bh_college_dsc`;
CREATE TABLE `bh_college_dsc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext COMMENT '学院介绍内容',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学院介绍';

-- ----------------------------
-- Records of bh_college_dsc
-- ----------------------------

-- ----------------------------
-- Table structure for bh_course_info
-- ----------------------------
DROP TABLE IF EXISTS `bh_course_info`;
CREATE TABLE `bh_course_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_type` int(11) NOT NULL COMMENT '课程类型',
  `class_name` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `class_hour` int(11) DEFAULT NULL COMMENT '课时',
  `charging_standard` int(11) DEFAULT NULL COMMENT '收费标准',
  `student_age` varchar(32) DEFAULT NULL COMMENT '学员年龄',
  `people_num` int(11) DEFAULT NULL COMMENT '人数',
  `is_start` varchar(1) DEFAULT NULL COMMENT '是否开课(N未开课，Y已开课)',
  `description` longtext COMMENT '课程说明',
  `off_line` varchar(1) DEFAULT NULL COMMENT '下架(Y ;已下架，N未下架)',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '帐号是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程信息';

-- ----------------------------
-- Records of bh_course_info
-- ----------------------------

-- ----------------------------
-- Table structure for bh_course_type
-- ----------------------------
DROP TABLE IF EXISTS `bh_course_type`;
CREATE TABLE `bh_course_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL COMMENT '课程类型名',
  `memo` varchar(50) DEFAULT NULL COMMENT '课程说明',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '帐号是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程分类';

-- ----------------------------
-- Records of bh_course_type
-- ----------------------------

-- ----------------------------
-- Table structure for bh_dictionary_header
-- ----------------------------
DROP TABLE IF EXISTS `bh_dictionary_header`;
CREATE TABLE `bh_dictionary_header` (
  `header_code` varchar(50) NOT NULL COMMENT '大类代码',
  `header_name` varchar(50) DEFAULT NULL COMMENT '大类名称',
  `dictionary_type` varchar(10) DEFAULT NULL COMMENT '系统：SYS;\r\n            用户字典项：USE;\r\n            如果是系统维护的头表字段在使用中是不能够维护的',
  `memo` varchar(100) DEFAULT NULL COMMENT '备注',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`header_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典头表';

-- ----------------------------
-- Records of bh_dictionary_header
-- ----------------------------

-- ----------------------------
-- Table structure for bh_dictionary_line
-- ----------------------------
DROP TABLE IF EXISTS `bh_dictionary_line`;
CREATE TABLE `bh_dictionary_line` (
  `line_id` int(11) NOT NULL AUTO_INCREMENT,
  `header_code` varchar(50) DEFAULT NULL COMMENT '大类代码',
  `value` varchar(500) DEFAULT NULL COMMENT '值',
  `sn` int(11) DEFAULT NULL COMMENT '小类序列',
  `line_name` varchar(120) DEFAULT NULL COMMENT '小类名称',
  `is_default` varchar(1) DEFAULT 'Y' COMMENT 'Y：默认值，N：非默认值',
  `memo` varchar(200) DEFAULT NULL COMMENT '备注',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典行表';

-- ----------------------------
-- Records of bh_dictionary_line
-- ----------------------------

-- ----------------------------
-- Table structure for bh_log
-- ----------------------------
DROP TABLE IF EXISTS `bh_log`;
CREATE TABLE `bh_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `action_type` varchar(50) DEFAULT NULL COMMENT '操作类型',
  `action_content` varchar(100) DEFAULT NULL COMMENT '操作内容',
  `user_id` varchar(32) DEFAULT NULL COMMENT '操作人登录名',
  `user_name` varchar(50) NOT NULL COMMENT '操作人名称',
  `action_date` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of bh_log
-- ----------------------------

-- ----------------------------
-- Table structure for bh_notice
-- ----------------------------
DROP TABLE IF EXISTS `bh_notice`;
CREATE TABLE `bh_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_name` varchar(50) NOT NULL COMMENT '公告称',
  `image_url` varchar(200) DEFAULT NULL COMMENT '公告图片地址',
  `notice_content` longtext COMMENT '公告类容',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '帐号是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告';

-- ----------------------------
-- Records of bh_notice
-- ----------------------------

-- ----------------------------
-- Table structure for bh_permission
-- ----------------------------
DROP TABLE IF EXISTS `bh_permission`;
CREATE TABLE `bh_permission` (
  `prmission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(50) NOT NULL,
  `permission_code` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `permission_sn` int(11) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `permission_type` varchar(10) NOT NULL COMMENT '菜单：MENU；标签页：TABPAGE；按钮或者其他界面原色：BUTTON',
  `memo` varchar(500) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`prmission_id`),
  UNIQUE KEY `AK_Key_2` (`permission_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of bh_permission
-- ----------------------------

-- ----------------------------
-- Table structure for bh_recruit
-- ----------------------------
DROP TABLE IF EXISTS `bh_recruit`;
CREATE TABLE `bh_recruit` (
  `recruit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '招聘ID',
  `recruit_job` varchar(50) NOT NULL COMMENT '招聘职位',
  `sn` int(11) DEFAULT NULL COMMENT '顶置',
  `job_duty` text COMMENT '职位责任',
  `job_request` text COMMENT '任职资格',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '帐号是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`recruit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招聘管理';

-- ----------------------------
-- Records of bh_recruit
-- ----------------------------

-- ----------------------------
-- Table structure for bh_role
-- ----------------------------
DROP TABLE IF EXISTS `bh_role`;
CREATE TABLE `bh_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `memo` varchar(500) DEFAULT NULL COMMENT '备注',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '是否可用，Y：可用，N：禁用',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of bh_role
-- ----------------------------
INSERT INTO `bh_role` VALUES ('1', '管理员', '管理员', 'Y', '2016-10-23 15:07:50', '2016-10-23 15:07:53');

-- ----------------------------
-- Table structure for bh_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `bh_role_permission`;
CREATE TABLE `bh_role_permission` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限对应表';

-- ----------------------------
-- Records of bh_role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for bh_school_life
-- ----------------------------
DROP TABLE IF EXISTS `bh_school_life`;
CREATE TABLE `bh_school_life` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_url` varchar(50) NOT NULL COMMENT '文件地址',
  `file_type` int(11) DEFAULT NULL COMMENT '文件类型（1.照片，2，视频）',
  `description` varchar(200) DEFAULT NULL COMMENT '文件说明',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_tme` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '帐号是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学习生活';

-- ----------------------------
-- Records of bh_school_life
-- ----------------------------

-- ----------------------------
-- Table structure for bh_user
-- ----------------------------
DROP TABLE IF EXISTS `bh_user`;
CREATE TABLE `bh_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(32) NOT NULL COMMENT '登录名',
  `user_name` varchar(50) NOT NULL COMMENT '用户姓名',
  `password` varchar(20) NOT NULL COMMENT '用户密码',
  `sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `sn` int(11) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `indentity` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `user_type` varchar(20) DEFAULT NULL COMMENT '员工类型（字典配置）',
  `educational_status` varchar(20) DEFAULT NULL COMMENT '学历',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(100) DEFAULT NULL COMMENT '家庭住址',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '帐号是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `AK_Key_3` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户登录表';

-- ----------------------------
-- Records of bh_user
-- ----------------------------
INSERT INTO `bh_user` VALUES ('1', 'admin', 'admin', 'admin', null, null, null, null, null, null, null, null, null, null, 'Y');
INSERT INTO `bh_user` VALUES ('2', 'user', 'user', 'user', '1', null, '13312341234', '阿萨斯', '阿达', '我', '的飒飒', '2111321', null, '2016-10-23 21:44:02', 'Y');

-- ----------------------------
-- Table structure for bh_user_role
-- ----------------------------
DROP TABLE IF EXISTS `bh_user_role`;
CREATE TABLE `bh_user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应关系表';

-- ----------------------------
-- Records of bh_user_role
-- ----------------------------
