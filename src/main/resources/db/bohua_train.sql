/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : bohua_train

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2016-11-22 21:53:58
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
  `dictionary_type` varchar(10) DEFAULT NULL COMMENT '系统：SYS;\n            用户字典项：USE;\n            如果是系统维护的头表字段在使用中是不能够维护的',
  `memo` varchar(100) DEFAULT NULL COMMENT '备注',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`header_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bh_dictionary_header
-- ----------------------------
INSERT INTO `bh_dictionary_header` VALUES ('232', 'dsadsasdadsa', 'user', 'dfssdfsdfsdfds', '2016-11-04 10:17:04', '2016-11-04 10:28:11', 'N');
INSERT INTO `bh_dictionary_header` VALUES ('COURSE', '课程', 'user', '课程分类', null, null, 'Y');
INSERT INTO `bh_dictionary_header` VALUES ('DICTIONARYTYPE', '配置类型', 'system', '系统配置类型', null, null, 'Y');
INSERT INTO `bh_dictionary_header` VALUES ('dsadasdas', 'dasdas', 'system', 'xzCzXCZcZcZzcz11111111cZXcdsadasd!!!!!', '2016-10-26 15:47:55', '2016-11-04 10:28:11', 'N');
INSERT INTO `bh_dictionary_header` VALUES ('userType', '员工类型', 'user', '', '2016-11-22 21:53:22', '2016-11-22 21:53:22', 'Y');

-- ----------------------------
-- Table structure for bh_dictionary_line
-- ----------------------------
DROP TABLE IF EXISTS `bh_dictionary_line`;
CREATE TABLE `bh_dictionary_line` (
  `line_id` int(11) NOT NULL AUTO_INCREMENT,
  `header_code` varchar(50) DEFAULT NULL COMMENT '大类代码',
  `line_code` varchar(50) DEFAULT NULL COMMENT '值',
  `sn` int(11) DEFAULT NULL COMMENT '小类序列',
  `line_name` varchar(120) DEFAULT NULL COMMENT '小类名称',
  `is_default` varchar(1) DEFAULT 'Y' COMMENT 'Y：默认值，N：非默认值',
  `memo` varchar(200) DEFAULT NULL COMMENT '备注',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`line_id`),
  UNIQUE KEY `bh_dictionary_line_index` (`header_code`,`line_code`,`enabled_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典行表';

-- ----------------------------
-- Records of bh_dictionary_line
-- ----------------------------
INSERT INTO `bh_dictionary_line` VALUES ('1', 'COURSE', '1', '1', '语文', 'N', '撒的撒打算', 'Y');
INSERT INTO `bh_dictionary_line` VALUES ('2', 'COURSE', '2', '2', '数学', 'Y', 'ADASASSA', 'Y');
INSERT INTO `bh_dictionary_line` VALUES ('3', 'COURSE', 'yy', '3', '英语', 'N', '', 'N');
INSERT INTO `bh_dictionary_line` VALUES ('4', 'COURSE', 'yyd', '3', '英语', 'N', '', 'N');
INSERT INTO `bh_dictionary_line` VALUES ('5', 'COURSE', '12', '1', '语文', 'N', '撒的撒打算', 'Y');
INSERT INTO `bh_dictionary_line` VALUES ('6', 'DICTIONARYTYPE', 'system', '1', '系统', 'Y', null, 'Y');
INSERT INTO `bh_dictionary_line` VALUES ('7', 'DICTIONARYTYPE', 'user', '2', '自定义', 'Y', null, 'Y');
INSERT INTO `bh_dictionary_line` VALUES ('8', 'COURSE', '3', '3', '外语', 'Y', '打算打算', 'Y');
INSERT INTO `bh_dictionary_line` VALUES ('9', 'userType', '1', '1', '教师', 'Y', '1', 'Y');

-- ----------------------------
-- Table structure for bh_log
-- ----------------------------
DROP TABLE IF EXISTS `bh_log`;
CREATE TABLE `bh_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `action_type` varchar(50) DEFAULT NULL COMMENT '操作类型',
  `action_content` varchar(100) DEFAULT NULL COMMENT '操作内容',
  `user_id` varchar(32) DEFAULT NULL COMMENT '操作人ID',
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
  `release_user` varchar(32) DEFAULT NULL COMMENT '发布人',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '帐号是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='公告';

-- ----------------------------
-- Records of bh_notice
-- ----------------------------
INSERT INTO `bh_notice` VALUES ('1', '公告1', '98cbe7dfcd4346c4991dfda849379072.jpg', '<h1 style=\"margin: 50px auto 50px 0px; padding: 0px; list-style-type: none; font-size: 32px; font-weight: 100; color: rgb(89, 89, 89); font-family: 微软雅黑; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\">照片墙</h1><p><a href=\"file:///F:/%E5%AE%9C%E6%98%8C%E5%8D%9A%E5%8D%8E%E8%89%BA%E6%9C%AF%EF%BC%88%E9%97%AB%E8%81%AA%EF%BC%89/weier/images/IMG_0466.JPG\" title=\"Why“唯尔”？--- 拉丁语Veritas 真理的音译。长久以来，出国考试培训都被烙上了技巧的印记。\" style=\"margin: 0px auto; padding: 0px; list-style-type: none; text-decoration: none;\"><img src=\"http://localhost:9090/static/plugin/ueditor1_4_3_3/themes/default/images/spacer.gif\" width=\"161\" height=\"123\" id=\"img-mwsf-2\" class=\"photo\"/></a>&nbsp;<a href=\"file:///F:/%E5%AE%9C%E6%98%8C%E5%8D%9A%E5%8D%8E%E8%89%BA%E6%9C%AF%EF%BC%88%E9%97%AB%E8%81%AA%EF%BC%89/weier/images/IMG_0464.JPG\" title=\"我们疯狂的刷题，我们死记机经，我们寄希望于模板和老师们经验之谈的猜题技巧。\" style=\"margin: 0px auto; padding: 0px; list-style-type: none; text-decoration: none;\"><img src=\"http://localhost:9090/static/plugin/ueditor1_4_3_3/themes/default/images/spacer.gif\" width=\"161\" height=\"123\" id=\"img-mwsf-14\" class=\"photo\"/></a>&nbsp;<a href=\"file:///F:/%E5%AE%9C%E6%98%8C%E5%8D%9A%E5%8D%8E%E8%89%BA%E6%9C%AF%EF%BC%88%E9%97%AB%E8%81%AA%EF%BC%89/weier/images/IMG_0485.JPG\" title=\"我们却发现：种种疯狂之后就是瓶颈，雅思总是冲不过6.5， 托福100+是那样遥不可及。\" style=\"margin: 0px auto; padding: 0px; list-style-type: none; text-decoration: none;\"><img src=\"http://localhost:9090/static/plugin/ueditor1_4_3_3/themes/default/images/spacer.gif\" width=\"161\" height=\"123\" id=\"img-mwsf-5\" class=\"photo\"/></a>&nbsp;<a href=\"file:///F:/%E5%AE%9C%E6%98%8C%E5%8D%9A%E5%8D%8E%E8%89%BA%E6%9C%AF%EF%BC%88%E9%97%AB%E8%81%AA%EF%BC%89/weier/images/IMG_0475.JPG\" title=\"因为我们忽略了一切学习的本质:追求真理。\" style=\"margin: 0px auto; padding: 0px; list-style-type: none; text-decoration: none;\"><img src=\"http://localhost:9090/static/plugin/ueditor1_4_3_3/themes/default/images/spacer.gif\" width=\"161\" height=\"123\" id=\"img-mwsf-6\" class=\"photo\"/></a>&nbsp;<a href=\"file:///F:/%E5%AE%9C%E6%98%8C%E5%8D%9A%E5%8D%8E%E8%89%BA%E6%9C%AF%EF%BC%88%E9%97%AB%E8%81%AA%EF%BC%89/weier/images/IMG_0474.JPG\" title=\"当我们总是浮于表面，只追逐分数本身的时候，我们辛苦而又麻木的学习，我们不求甚解，不去探寻知识背后的关联。\" style=\"margin: 0px auto; padding: 0px; list-style-type: none; text-decoration: none;\"><img src=\"http://localhost:9090/static/plugin/ueditor1_4_3_3/themes/default/images/spacer.gif\" width=\"161\" height=\"123\" id=\"img-mwsf-16\" class=\"photo\"/></a><a href=\"file:///F:/%E5%AE%9C%E6%98%8C%E5%8D%9A%E5%8D%8E%E8%89%BA%E6%9C%AF%EF%BC%88%E9%97%AB%E8%81%AA%EF%BC%89/weier/images/IMG_0458.JPG\" title=\"我们忘记了语言是文化与思维的载体，机械的记忆与翻译永远不会让我们达到master的境界。\" style=\"margin: 0px auto; padding: 0px; list-style-type: none; text-decoration: none;\"><img src=\"http://localhost:9090/static/plugin/ueditor1_4_3_3/themes/default/images/spacer.gif\" width=\"161\" height=\"123\" id=\"img-mwsf-20\" class=\"photo\"/></a>&nbsp;<a href=\"file:///F:/%E5%AE%9C%E6%98%8C%E5%8D%9A%E5%8D%8E%E8%89%BA%E6%9C%AF%EF%BC%88%E9%97%AB%E8%81%AA%EF%BC%89/weier/images/IMG_0460.JPG\" title=\"唯尔的尔--- 学生。一切教育的主体，也是我们服务的主体。\" style=\"margin: 0px auto; padding: 0px; list-style-type: none; text-decoration: none;\"><img src=\"http://localhost:9090/static/plugin/ueditor1_4_3_3/themes/default/images/spacer.gif\" width=\"161\" height=\"123\" id=\"img-mwsf-21\" class=\"photo\"/></a>&nbsp;<a href=\"file:///F:/%E5%AE%9C%E6%98%8C%E5%8D%9A%E5%8D%8E%E8%89%BA%E6%9C%AF%EF%BC%88%E9%97%AB%E8%81%AA%EF%BC%89/weier/images/IMG_0483.JPG\" style=\"margin: 0px auto; padding: 0px; list-style-type: none; text-decoration: none;\"><img src=\"http://localhost:9090/static/plugin/ueditor1_4_3_3/themes/default/images/spacer.gif\" width=\"161\" height=\"123\" id=\"img-mwsf-25\" class=\"photo\"/></a>&nbsp;<a href=\"file:///F:/%E5%AE%9C%E6%98%8C%E5%8D%9A%E5%8D%8E%E8%89%BA%E6%9C%AF%EF%BC%88%E9%97%AB%E8%81%AA%EF%BC%89/weier/images/IMG_0476.JPG\" title=\"我们不做高高在上的说教者，我们不是知识的复读机，我们希望陪伴你们，引领你们经历人生中第一次的全力付出。\" style=\"margin: 0px auto; padding: 0px; list-style-type: none; text-decoration: none;\"><img src=\"http://localhost:9090/static/plugin/ueditor1_4_3_3/themes/default/images/spacer.gif\" width=\"161\" height=\"123\" id=\"img-mwsf-27\" class=\"photo\"/></a></p><h1 style=\"margin: 50px auto 0px -880px; padding: 0px; list-style-type: none; font-size: 20px; font-weight: 100; color: rgb(89, 89, 89); font-family: 微软雅黑; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\">唯尔教育简介：</h1><p style=\"margin: 20px auto 0px; padding: 0px; list-style-type: none; white-space: normal; background-color: rgb(255, 255, 255); font-size: 15px; font-family: 微软雅黑; text-indent: 2em; line-height: 20px;\">Why“唯尔”？--- 拉丁语Veritas 真理的音译。长久以来，出国考试培训都被烙上了技巧的印记。我们疯狂的刷题，我们死记机经，我们寄希望于模板和老师们经验之谈的猜题技巧。 我们却发现：种种疯狂之后就是瓶颈，雅思总是冲不过6.5， 托福100+是那样遥不可及。 因为我们忽略了一切学习的本质：追求真理。当我们总是浮于表面，只追逐分数本身的时候，我们辛苦而又麻木的学习，我们不求甚解，不去探寻知识背后的关联。我们忘记了语言是文化与思维的载体，机械的记忆与翻译永远不会让我们达到master的境界。</p><h1 style=\"margin: 50px auto 0px -880px; padding: 0px; list-style-type: none; font-size: 20px; font-weight: 100; color: rgb(89, 89, 89); font-family: 微软雅黑; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\">唯尔的特色：</h1><p style=\"margin: 10px auto 0px; padding: 0px; list-style-type: none; white-space: normal; background-color: rgb(255, 255, 255); font-size: 15px; text-indent: 2em; font-family: 微软雅黑;\">真正注重学术和学生的最优秀的老师, 新疆雅思，托福培训史上首个满分组合， 留美，访英学者鼎力分享,关注留学备考，申请，求学生活的全过程 上海海移移民教育集团专业顾问文书团 哈佛，普林斯顿，UBC，招生官，面试官定期空降讲座</p><h1 style=\"margin: 50px auto 0px -880px; padding: 0px; list-style-type: none; font-size: 20px; font-weight: 100; color: rgb(89, 89, 89); font-family: 微软雅黑; text-align: -webkit-center; white-space: normal; background-color: rgb(255, 255, 255);\">唯尔的优势：</h1><p style=\"margin: 20px auto 0px; padding: 0px; list-style-type: none; white-space: normal; background-color: rgb(255, 255, 255); font-size: 15px; font-family: 微软雅黑; text-indent: 2em; line-height: 20px;\">控制预习，上课，复习，考场准备的每一个细节。每天十小时，精确到每小时的任务安排高分，留学助教团队陪伴全程,雅思7分，托福100+ 留学生助教团与你亲密分享备考及留学生活经验</p><p><br/></p>', 'admin', '2016-11-22 21:44:57', null, 'Y');
INSERT INTO `bh_notice` VALUES ('2', '公告2', 'dc0c57c29ebd40febf50c1fdfd058097.jpg', '<h1 style=\"margin: 50px auto 0px 105px; padding: 0px; list-style-type: none; font-size: 20px; font-weight: 100; color: rgb(89, 89, 89); font-family: 微软雅黑; white-space: normal;\">加入我们</h1><hr/><hr/><h4 style=\"margin: 20px auto 0px 103px; padding: 0px; list-style-type: none; font-family: 微软雅黑; font-size: 18px;\">市场</h4><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>1、负责市场调研和需求分析；</p></li><li><p>2、负责年度销售的预测，目标的制定及分解；</p></li><li><p>3、确定销售部门目标体系和销售配额；</p></li><li><p>4、制定销售计划和销售预算；</p></li><li><p>5、负责销售渠道和客户的管理；</p></li><li><p>6、组建销售队伍，培训销售人员；</p></li><li><p>7、评估销售业绩，建设销售团队。</p></li></ul><h4 style=\"margin: 20px auto 0px 103px; padding: 0px; list-style-type: none; font-family: 微软雅黑; font-size: 18px; font-weight: 100;\">任职资格</h4><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>1、专科及以上学历，市场营销等相关专业；</p></li><li><p>2、有培训学校市场咨询经验者优先；</p></li><li><p>3、2年以上销售行业工作经验，有销售管理工作经历者优先；</p></li><li><p>4、具备较强的市场分析、营销、推广能力和良好的人际沟通、协调能力，分析和解决问题的能力；</p></li><li><p>5、有较强的事业心，具备一定的领导能力。</p></li></ul><h4 style=\"margin: 20px auto 0px 103px; padding: 0px; list-style-type: none; font-family: 微软雅黑; font-size: 18px;\">教师</h4><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>1、承担雅思或者托福课程的讲授任务；</p></li><li><p>2、承担课程辅导和答疑，作业和考卷批改等工作；</p></li><li><p>3、参与完成教研任务，为教学研究新思路、新方法提供建议；</p></li></ul><h4 style=\"margin: 20px auto 0px 103px; padding: 0px; list-style-type: none; font-family: 微软雅黑; font-size: 18px; font-weight: 100;\">任职资格</h4><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>1、本科及以上学历，英语专业四级以上水平，考过托福和雅思考试，有留学经历者优先；</p></li><li><p>2、具有很强的中文表达能力，普通话标准，口齿伶俐；</p></li><li><p>3、具有较强的亲和力，讲课生动活泼，知识面宽广；</p></li><li><p>4、工作积极主动、责任心强。</p></li></ul><h4 style=\"margin: 20px auto 0px 103px; padding: 0px; list-style-type: none; font-family: 微软雅黑; font-size: 18px;\">出纳前台</h4><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>1、负责日常收支的管理和核对；</p></li><li><p>2、办公室基本账务的核对；</p></li><li><p>3、负责收集和审核原始凭证，保证报销手续及原始单据的合法性、准确性；</p></li><li><p>4、负责登记现金、银行存款日记账并准确录入系统，按时编制银行存款余额调节表；</p></li><li><p>5、负责记账凭证的编号、装订；保存、归档财务相关资料；</p></li><li><p>6、负责开具各项票据；</p></li><li><p>7、配合总会负责办公室财务管理统计汇总。</p></li></ul><h4 style=\"margin: 20px auto 0px 103px; padding: 0px; list-style-type: none; font-family: 微软雅黑; font-size: 18px; font-weight: 100;\">任职资格</h4><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>1、大学专科以上学历，会计学或财务管理专业毕业；</p></li><li><p>2、具有1年以上出纳工作经验；</p></li><li><p>3、熟悉操作财务软件、Excel、Word等办公软件；</p></li><li><p>4、记账要求字迹清晰、准确、及时，账目日清月结，报表编制准确、及时；</p></li><li><p>5、工作认真，态度端正；</p></li><li><p>6、负责开具各项票据；</p></li><li><p>7、了解国家财经政策和会计、税务法规，熟悉银行结算业务。</p></li></ul><h4 style=\"margin: 20px auto 0px 503px; padding: 0px; list-style-type: none; font-family: 微软雅黑; font-size: 18px; font-weight: 100;\">地址：XXX</h4><h4 style=\"margin: 10px auto 0px 583px; padding: 0px; list-style-type: none; font-family: 微软雅黑; font-size: 18px; font-weight: 100;\">联系电话：15026085265 张欢老师(固定电话定下来再报)</h4>', 'admin', '2016-11-22 21:45:36', '2016-11-22 21:51:40', 'Y');
INSERT INTO `bh_notice` VALUES ('3', '公告3', '6e62e2ed6071484e9182429072edc18c.jpg', '<h1 style=\"margin: 50px auto 0px 105px; padding: 0px; list-style-type: none; font-size: 20px; font-weight: 100; color: rgb(89, 89, 89); font-family: 微软雅黑; white-space: normal;\">5月周末班级设置：</h1><hr/><hr/><table class=\"gridtable\" width=\"1000px\"><tbody style=\"margin: 0px auto; padding: 0px; list-style-type: none;\"><tr style=\"margin: 0px auto; padding: 0px; list-style-type: none; font-size: 20px;\" class=\"firstRow\"><th style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); color: rgb(255, 255, 255); background-color: rgb(70, 71, 76);\">开设班级</th><th style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); color: rgb(255, 255, 255); background-color: rgb(70, 71, 76);\">课程内容</th><th style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); color: rgb(255, 255, 255); background-color: rgb(70, 71, 76);\">上课时间</th><th style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); color: rgb(255, 255, 255); background-color: rgb(70, 71, 76);\">课时数</th><th style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); color: rgb(255, 255, 255); background-color: rgb(70, 71, 76);\">课程费用</th></tr><tr style=\"margin: 0px auto; padding: 0px; list-style-type: none;\"><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">雅思基础班<br/>6-8人<br/>周末班</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">雅思基础<br/>听说读写</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">5.23-8.9<br/>每周六/日<br/>9:30-14:00或<br/>15:00-19:30</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">听说读写各9次<br/>共72课时</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">7200元</td></tr><tr style=\"margin: 0px auto; padding: 0px; list-style-type: none;\"><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">雅思强化班<br/>6-8人<br/>周末班</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">雅思强化<br/>听说读写</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">5.23-8.9<br/>每周六/日<br/>9:30-14:00或<br/>15:00-19:30</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">听说读写各10次<br/>共80课时</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">8800元</td></tr><tr style=\"margin: 0px auto; padding: 0px; list-style-type: none;\"><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">雅思冲刺班<br/>6-8人<br/>周末班</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">听说读写考前<br/>强化及真题模考讲解</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">5.23-8.9<br/>每周六/日<br/>9:30-14:00或<br/>15:00-19:30</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">听说读写各10次<br/>共80课时</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">9600元</td></tr><tr style=\"margin: 0px auto; padding: 0px; list-style-type: none;\"><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">托福基础<br/>6-8人<br/>周末班</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">托福基础<br/>听说读写</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">5.23-8.9<br/>每周六/日<br/>9:30-14:00或<br/>15:00-19:30</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">听说读写各9次<br/>共72课时</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">7920元</td></tr><tr style=\"margin: 0px auto; padding: 0px; list-style-type: none;\"><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">托福基础<br/>6-8人<br/>周末班</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">托福基础<br/>听说读写</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">5.23-8.9<br/>每周六/日<br/>9:30-14:00或<br/>15:00-19:30</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">听说读写各9次<br/>共72课时</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">7920元</td></tr><tr style=\"margin: 0px auto; padding: 0px; list-style-type: none;\"><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">托福强化班<br/>6-8人<br/>周末班</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">托福强化<br/>听说读写</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">5.23-8.9<br/>每周六/日<br/>9:30-14:00或<br/>15:00-19:30</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">听读各8次<br/>写作口语各10次</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">9000元</td></tr><tr style=\"margin: 0px auto; padding: 0px; list-style-type: none;\"><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">托福冲刺班<br/>6-8人<br/>周末班</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">听说读写考前强化<br/>及真题模考讲解</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">5.23-8.9<br/>每周六/日<br/>9:30-14:00或<br/>15:00-19:30</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">听读各8次<br/>写作口语各10次</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">10800元</td></tr><tr style=\"margin: 0px auto; padding: 0px; list-style-type: none;\"><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">预备班<br/>8-12人<br/>周末班</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">听说读写综合教程</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">5.23-8.9<br/>每周六/日<br/>9:30-14:00或<br/>15:00-19:30</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">48小时</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">4800元</td></tr><tr style=\"margin: 0px auto; padding: 0px; list-style-type: none;\"><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">SAT基础班<br/>6-8人<br/>周末班</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">基础词汇，语法及写作<br/>阅读</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">5.23-8.9<br/>每周六/日<br/>9:30-14:00或<br/>15:00-19:30</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">词汇6次<br/>语法6次<br/>写作8次<br/>阅读10次</td><td style=\"margin: 0px auto; padding: 8px; list-style-type: none; border-color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">9000元</td></tr></tbody></table><p><br/></p>', 'admin', '2016-11-22 21:46:01', null, 'Y');
INSERT INTO `bh_notice` VALUES ('4', '公告4', 'b316af2f7e234f24b82256b93d8529d5.jpg', '<h1 style=\"border: 0px; margin: 0px; padding: 10px 0px 13px; font-size: 26px; line-height: 38px; text-align: center; color: rgb(51, 51, 51); font-family: 宋体, simsun, sans-serif, Arial; white-space: normal; background-color: rgb(255, 255, 255);\">媒体：服装之都“倒卖童工”是法治社会之耻</h1><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><span style=\"border: 0px; margin: 0px; padding: 0px;\">正文</span></p></li><li><p><span style=\"border: 0px; margin: 0px; padding: 0px;\"><a href=\"http://pinglun.sohu.com/s473782153.html\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(0, 85, 153); text-decoration: none;\">我来说两句<span class=\"f12\" style=\"border: 0px; margin: 0px; padding: 0px; font-size: 12px; font-weight: normal;\">(<span class=\"red\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(204, 0, 0);\">2314</span>人参与)</span></a></span></p></li></ul><p><a class=\"scan-icon\" style=\"border: 0px; margin: 6px auto 0px 0px; padding: 0px 0px 0px 18px; color: rgb(0, 85, 153); background: url(&quot;images20130805/scan_icon.gif&quot;) 0px 0px no-repeat; display: block; line-height: 14px;\">扫描到手机</a></p><p>2016-11-22 05:55:53</p><p><span class=\"sc\" style=\"border: 0px; margin: 0px; padding: 0px;\">来源：<span style=\"border: 0px; margin: 0px; padding: 0px;\"><a href=\"http://epaper.bjnews.com.cn/html/2016-11/22/content_661119.htm?div=-1\" target=\"_blank\" style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(0, 85, 153); text-decoration: none;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">新京报</span></a></span></span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><br/></p></li><ul style=\"list-style-type: circle;\" class=\" list-paddingleft-2\"><li><p><a title=\"分享到新浪微博\" style=\"border: 0px; margin: 0px; color: rgb(0, 85, 153); background: url(&quot;http://i3.itc.cn/20160325/3649_a4efbd35_27d1_0290_fe74_2c9efe4cf22e_1.png&quot;) 0px 0px no-repeat; float: left; height: 16px; width: 16px; display: block; padding: 0px !important;\"></a><span style=\"border: 0px; margin: 0px; padding: 0px;\"></span></p></li><li><p><a style=\"border: 0px; margin: 0px; color: rgb(0, 85, 153); background: url(&quot;http://i3.itc.cn/20160325/3649_a4efbd35_27d1_0290_fe74_2c9efe4cf22e_1.png&quot;) -20px 0px no-repeat; float: left; height: 16px; width: 16px; display: block; padding: 0px !important;\"></a><span style=\"border: 0px; margin: 0px; padding: 0px;\"></span></p></li><li><p><a title=\"分享给QQ好友\" style=\"border: 0px; margin: 0px; color: rgb(0, 85, 153); background: url(&quot;http://i3.itc.cn/20160325/3649_a4efbd35_27d1_0290_fe74_2c9efe4cf22e_1.png&quot;) -41px 0px no-repeat; float: left; height: 16px; width: 16px; display: block; padding: 0px !important;\"></a><span style=\"border: 0px; margin: 0px; padding: 0px;\"></span></p></li><li><p><a title=\"分享到人人网\" style=\"border: 0px; margin: 0px; color: rgb(0, 85, 153); background: url(&quot;http://i3.itc.cn/20160325/3649_a4efbd35_27d1_0290_fe74_2c9efe4cf22e_1.png&quot;) -62px 0px no-repeat; float: left; height: 16px; width: 16px; display: block; padding: 0px !important;\"></a></p></li></ul><li><p><a href=\"http://k.sohu.com/\" target=\"_blank\" style=\"border: 0px; margin: 0px; padding: 0px 0px 0px 16px; color: rgb(0, 85, 153); text-decoration: none; background: url(&quot;http://news.sohu.com/upload/article/2012/images20140613/down.gif&quot;) 0px 1px no-repeat; display: block;\">手机看新闻</a></p></li><li><p><a style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(0, 85, 153); background: url(&quot;images20130805/bg_function.gif&quot;) -82px -18px no-repeat; display: block; width: 19px; height: 18px;\"></a></p></li><li><p><a style=\"border: 0px; margin: 0px; padding: 0px; color: rgb(0, 85, 153); background: url(&quot;images20130805/bg_function.gif&quot;) -83px 2px no-repeat; display: block; width: 18px; height: 18px;\"></a></p></li></ul><p>原标题：服装之都“倒卖童工”是法治社会之耻</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 26px 0px 0px; color: rgb(0, 0, 0);\">　　此次媒体掀开了常熟服装厂非法使用童工的一幕，不由让人感叹今夕何夕，这似乎更应该是万恶的旧社会才有的场景。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 26px 0px 0px; color: rgb(0, 0, 0);\">　　据报道，号称“中国服装之都”的江苏常熟，有着一条童工链条。中介从云南等地把劳动力运来卖给服装厂，其中也包括相当一部分只有十几岁的童工。这些孩子没日没夜地干活，几乎没有休息日。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 26px 0px 0px; color: rgb(0, 0, 0);\">　　这些孩子们被中介“贱卖”到服装厂，成了案板上的鱼肉——任人宰割。据报道，这些服装厂对待童工极为粗暴，为了让童工多干活，甚至使用暴力对待这些孩子。老板还会扣押身份证、银行卡、手机，让想离开的工人离开不了，而且不到年底，还领不到工资。服装厂本就漠视员工权益，更何况童工还没有达到法定的劳动年龄，更不会与其签订劳动合同，童工的劳动权益更是遭到了粗暴的践踏。此次媒体掀开了常熟服装厂非法使用童工的一幕，不由让人感叹今夕何夕。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 26px 0px 0px; color: rgb(0, 0, 0);\">　　早在1991年4月，国务院就已颁布了《禁止使用童工规定》，用人单位被禁止招用不满16周岁的未成年人，但企业非法使用童工的现象仍然屡禁不止。媒体与舆论的关注，法律的约束，也不能阻止企业使用童工。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 26px 0px 0px; color: rgb(0, 0, 0);\">　　常熟的一些服装厂招收童工、虐待童工，在当地已经成了较为普遍的现象，那么为何执法监督部门没有采取有效的行动进行遏制？这已经不只是一种简单的违法行为。服装厂通过扣押身份证，通过暴力相逼来强迫童工卖苦力。如果确认存在非法拘禁等情形，服装厂老板甚至涉嫌刑事犯罪。这些需要公安等相关部门介入调查，依法厘清并追究服装厂老板的相关责任。当然，对于非法倒卖童工的中介，也要依法予以追责。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 26px 0px 0px; color: rgb(0, 0, 0);\">　　企业非法使用童工，甚至粗暴践踏员工权益；孩子们如同成了被奴役的奴隶，被肆意盘剥，这些都不应发生在法治社会。目前此类现象在全国范围内还普遍地存在，这是法治社会之耻，更是职能部门之耻。这需要相关部门加强对企业用工的监管，完善责任制，对于失职渎职的相关部门，也要依法追究相关责任。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 26px 0px 0px; color: rgb(0, 0, 0);\">　　只有法治利剑才能割断黑色的“童工链条”，才能保护好孩子们的权益，保护法治社会，保护我们的未来。</p><p style=\"border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 26px 0px 0px; color: rgb(0, 0, 0);\">　　戴先任（职员）</p><p><span class=\"editer\" style=\"border: 0px; margin: 0px; padding: 0px; float: right;\">(责任编辑：肖武岗 UN845)</span></p><p><br/></p>', 'admin', '2016-11-22 21:46:37', null, 'Y');

-- ----------------------------
-- Table structure for bh_permission
-- ----------------------------
DROP TABLE IF EXISTS `bh_permission`;
CREATE TABLE `bh_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `AK_Key_2` (`permission_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of bh_permission
-- ----------------------------
INSERT INTO `bh_permission` VALUES ('1', '用户管理', 'userManager', '', '0', '1', '无', 'menu', '', '2016-11-22 21:40:38', null, 'Y');

-- ----------------------------
-- Table structure for bh_recruit
-- ----------------------------
DROP TABLE IF EXISTS `bh_recruit`;
CREATE TABLE `bh_recruit` (
  `recruit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '招聘ID',
  `recruit_job` varchar(50) NOT NULL COMMENT '招聘职位',
  `sn` int(11) DEFAULT NULL COMMENT '顶置',
  `job_duty` longtext COMMENT '职位责任',
  `job_request` longtext COMMENT '任职资格',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '帐号是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`recruit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='招聘管理';

-- ----------------------------
-- Records of bh_recruit
-- ----------------------------
INSERT INTO `bh_recruit` VALUES ('1', '市场', '1', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>1、负责市场调研和需求分析；</p></li><li><p>2、负责年度销售的预测，目标的制定及分解；</p></li><li><p>3、确定销售部门目标体系和销售配额；</p></li><li><p>4、制定销售计划和销售预算；</p></li><li><p>5、负责销售渠道和客户的管理；</p></li><li><p>6、组建销售队伍，培训销售人员；</p></li><li><p>7、评估销售业绩，建设销售团队。</p></li></ul><p><br/></p>', '<ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>1、专科及以上学历，市场营销等相关专业；</p></li><li><p>2、有培训学校市场咨询经验者优先；</p></li><li><p>3、2年以上销售行业工作经验，有销售管理工作经历者优先；</p></li><li><p>4、具备较强的市场分析、营销、推广能力和良好的人际沟通、协调能力，分析和解决问题的能力；</p></li><li><p>5、有较强的事业心，具备一定的领导能力.</p></li></ul>', '2016-11-22 21:49:17', null, 'Y');

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
INSERT INTO `bh_role` VALUES ('1', '管理员', '', 'Y', '2016-11-22 21:40:09', null);

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
-- Table structure for bh_teacher
-- ----------------------------
DROP TABLE IF EXISTS `bh_teacher`;
CREATE TABLE `bh_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `sn` int(11) DEFAULT NULL COMMENT '排序',
  `description` longtext NOT NULL COMMENT '员工介绍',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '帐号是否可用，Y：可用，N：禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师展示信息表';

-- ----------------------------
-- Records of bh_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for bh_user
-- ----------------------------
DROP TABLE IF EXISTS `bh_user`;
CREATE TABLE `bh_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_name` varchar(32) NOT NULL COMMENT '登录名',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `password` varchar(20) NOT NULL COMMENT '用户密码',
  `sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `indentity` varchar(20) DEFAULT NULL COMMENT '身份证号',
  `user_type` varchar(20) DEFAULT NULL COMMENT '员工类型（字典配置）',
  `educational_status` varchar(20) DEFAULT NULL COMMENT '学历',
  `email` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(100) DEFAULT NULL COMMENT '家庭住址',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) DEFAULT 'Y' COMMENT '帐号是否可用，Y：可用，N：禁用',
  `sn` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `AK_Key_3` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户登录表';

-- ----------------------------
-- Records of bh_user
-- ----------------------------
INSERT INTO `bh_user` VALUES ('1', 'admin', 'admin', 'admin', '1', '13312341234', '', '', '', '', '', '2016-11-22 21:38:57', null, 'Y', null);

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
