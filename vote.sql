# Host: localhost  (Version 5.7.19)
# Date: 2024-03-29 20:56:23
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "kiroku"
#

DROP TABLE IF EXISTS `kiroku`;
CREATE TABLE `kiroku` (
  `vid` int(11) DEFAULT NULL COMMENT '投票id',
  `uid` int(11) DEFAULT NULL COMMENT '投票人id',
  `ptime` datetime DEFAULT NULL COMMENT '投票时间',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

#
# Data for table "kiroku"
#

INSERT INTO `kiroku` VALUES (1,2,'2024-03-04 08:41:44',75),(1,2,'2024-03-04 08:41:46',76),(1,2,'2024-03-04 08:41:48',77),(1,2,'2024-03-04 08:41:50',78),(1,2,'2024-03-04 08:41:52',79),(1,2,'2024-03-04 08:41:53',80),(1,2,'2024-03-04 08:41:54',81);

#
# Structure for table "naiyou"
#

DROP TABLE IF EXISTS `naiyou`;
CREATE TABLE `naiyou` (
  `vid` int(11) NOT NULL AUTO_INCREMENT COMMENT '投票id',
  `context` varchar(225) DEFAULT NULL COMMENT '内容',
  `title` varchar(225) DEFAULT NULL COMMENT '标题',
  `state` int(11) DEFAULT NULL COMMENT '状态',
  `ntime` datetime DEFAULT NULL,
  `lim` int(11) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "naiyou"
#

INSERT INTO `naiyou` VALUES (1,' 我们正在制定未来城市规划，以提升居民生活质量。请选择以下方向中认为最为紧要的一个，你的投票将直接影响城市的未来。','未来城市规划',1,'2023-12-31 08:33:52',7),(2,'我们希望推动绿色能源的发展，为此需要您的投票。从下列选项中选择您认为最重要的方向。您的意见对于我们制定可持续能源政策至关重要。','绿色能源推广',1,'2023-12-31 10:53:07',3),(3,'为了改善社区生活，我们需要您的建议。请选择以下方案中您认为最有意义的一个。您的投票和意见将决定未来社区活动的方向。','社区活动策划',1,'2023-12-31 16:34:10',5),(4,'鄂说的就是房价还会干啥的局阿共获得多个 ','大家萨汗国的婚纱',1,'2024-01-04 09:06:56',4),(5,'撒打发时光那边的法国海军','撒大大萨达萨达萨达萨达萨达撒旦萨达',1,'2024-01-09 13:26:51',6);

#
# Structure for table "smbms_provider"
#

DROP TABLE IF EXISTS `smbms_provider`;
CREATE TABLE `smbms_provider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `proCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商编码',
  `proName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商名称',
  `proDesc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商详细描述',
  `proContact` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商联系人',
  `proPhone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `proAddress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `proFax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '传真',
  `createdBy` bigint(20) DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  `modifyBy` bigint(20) DEFAULT NULL COMMENT '更新者（userId）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

#
# Data for table "smbms_provider"
#

INSERT INTO `smbms_provider` VALUES (1,'BJ_GYS001','北京三木堂商贸有限公司','长期合作伙伴，主营产品:茅台、五粮液、郎酒、酒鬼酒、泸州老窖、赖茅酒、法国红酒等','张国强','13566667777','北京市丰台区育芳园北路','010-58858787',1,'2013-03-21 16:52:07',NULL,NULL),(2,'HB_GYS001','石家庄帅益食品贸易有限公司','长期合作伙伴，主营产品:饮料、水饮料、植物蛋白饮料、休闲食品、果汁饮料、功能饮料等','王军','13309094212','河北省石家庄新华区','0311-67738876',1,'2016-04-13 04:20:40',NULL,NULL),(3,'GZ_GYS001','深圳市泰香米业有限公司','初次合作伙伴，主营产品：良记金轮米,龙轮香米等','郑程瀚','13402013312','广东省深圳市福田区深南大道6006华丰大厦','0755-67776212',1,'2014-03-21 16:56:07',NULL,NULL),(4,'GZ_GYS002','深圳市喜来客商贸有限公司','长期合作伙伴，主营产品：坚果炒货.果脯蜜饯.天然花茶.营养豆豆.特色美食.进口食品.海味零食.肉脯肉','林妮','18599897645','广东省深圳市福龙工业区B2栋3楼西','0755-67772341',1,'2013-03-22 16:52:07',NULL,NULL),(5,'JS_GYS001','兴化佳美调味品厂','长期合作伙伴，主营产品：天然香辛料、鸡精、复合调味料','徐国洋','13754444221','江苏省兴化市林湖工业区','0523-21299098',1,'2015-11-22 16:52:07',NULL,NULL),(6,'BJ_GYS002','北京纳福尔食用油有限公司','长期合作伙伴，主营产品：山茶油、大豆油、花生油、橄榄油等','马莺','13422235678','北京市朝阳区珠江帝景1号楼','010-588634233',1,'2012-03-21 17:52:07',NULL,NULL),(7,'BJ_GYS003','北京国粮食用油有限公司','初次合作伙伴，主营产品：花生油、大豆油、小磨油等','王驰','13344441135','北京大兴青云店开发区','010-588134111',1,'2016-04-13 00:00:00',NULL,NULL),(8,'ZJ_GYS001','慈溪市广和绿色食品厂','长期合作伙伴，主营产品：豆瓣酱、黄豆酱、甜面酱，辣椒，大蒜等农产品','薛圣丹','18099953223','浙江省宁波市慈溪周巷小安村','0574-34449090',1,'2013-11-21 06:02:07',NULL,NULL),(9,'GX_GYS001','优百商贸有限公司','长期合作伙伴，主营产品：日化产品','李立国','13323566543','广西南宁市秀厢大道42-1号','0771-98861134',1,'2013-03-21 19:52:07',NULL,NULL),(10,'JS_GYS002','南京火头军信息技术有限公司','长期合作伙伴，主营产品：不锈钢厨具等','陈女士','13098992113','江苏省南京市浦口区浦口大道1号新城总部大厦A座903室','025-86223345',1,'2013-03-25 16:52:07',NULL,NULL),(11,'GZ_GYS003','广州市白云区美星五金制品厂','长期合作伙伴，主营产品：海绵床垫、坐垫、靠垫、海绵枕头、头枕等','梁天','13562276775','广州市白云区钟落潭镇福龙路20号','020-85542231',1,'2016-12-21 06:12:17',NULL,NULL),(12,'BJ_GYS004','北京隆盛日化科技','长期合作伙伴，主营产品：日化环保清洗剂，家居洗涤专卖、洗涤用品网、墙体除霉剂、墙面霉菌清除剂等','孙欣','13689865678','北京市大兴区旧宫','010-35576786',1,'2014-11-21 12:51:11',NULL,NULL),(13,'SD_GYS001','山东豪克华光联合发展有限公司','长期合作伙伴，主营产品：洗衣皂、洗衣粉、洗衣液、洗洁精、消杀类、香皂等','吴洪转','13245468787','山东济阳济北工业区仁和街21号','0531-53362445',1,'2015-01-28 10:52:07',NULL,NULL),(14,'JS_GYS003','无锡喜源坤商行','长期合作伙伴，主营产品：日化品批销','周一清','18567674532','江苏无锡盛岸西路','0510-32274422',1,'2016-04-23 11:11:11',NULL,NULL),(15,'ZJ_GYS002','乐摆日用品厂','长期合作伙伴，主营产品：各种中、高档塑料杯，塑料乐扣水杯（密封杯）、保鲜杯（保鲜盒）、广告杯、礼品杯','王世杰','13212331567','浙江省金华市义乌市义东路','0579-34452321',1,'2016-08-22 10:01:30',NULL,NULL),(16,'asd','sadas','dsad','dasd','asdas','dsad','sadas',1,'2024-01-13 10:17:37',NULL,NULL),(17,'sadsad','sadsad','sadsad','sadsad','sadsad','sadsad','sadsad',1,'2024-01-13 10:20:28',NULL,NULL);

#
# Structure for table "ticket"
#

DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `vid` int(11) NOT NULL AUTO_INCREMENT COMMENT '投票id',
  `agree` int(11) DEFAULT '0' COMMENT '赞成',
  `disagree` int(11) DEFAULT '0' COMMENT '反对',
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "ticket"
#

INSERT INTO `ticket` VALUES (1,17,11),(2,5,1),(3,9,2),(4,14,5),(5,10,7);

#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `power` int(11) DEFAULT NULL COMMENT '0管理员 1一般用户',
  `state` int(11) DEFAULT NULL COMMENT '1可用 0不可用',
  `gender` int(4) DEFAULT NULL,
  `birthdate` varchar(50) DEFAULT NULL,
  `phonenum` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES (1,'masdaju','e10adc3949ba59abbe56e057f20f883e',1,1,NULL,NULL,NULL),(2,'admin','e10adc3949ba59abbe56e057f20f883e',0,1,NULL,NULL,NULL),(3,'sakuraikeiwa','e10adc3949ba59abbe56e057f20f883e',1,1,NULL,NULL,NULL),(4,'kitasirakawa','e10adc3949ba59abbe56e057f20f883e',0,1,NULL,NULL,NULL),(6,'laoda','e10adc3949ba59abbe56e057f20f883e',0,1,NULL,NULL,NULL),(7,'maraka','e10adc3949ba59abbe56e057f20f883e',1,1,1,'2013-01-01','13638246957'),(8,'kami','e10adc3949ba59abbe56e057f20f883e',0,1,1,'2018-01-02','13638246957'),(10,'nikarami','e10adc3949ba59abbe56e057f20f883e',0,1,1,'2020-01-06','13638246957'),(14,'yukari','e10adc3949ba59abbe56e057f20f883e',1,1,0,'','13638246957');
