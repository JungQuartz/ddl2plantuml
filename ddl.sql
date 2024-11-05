/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = activity_point_secret   */
/******************************************/
CREATE TABLE `activity_point_secret` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(64) NOT NULL COMMENT '服务代码',
  `service_name` varchar(255) NOT NULL COMMENT '服务名',
  `service_secret_key` varchar(255) NOT NULL COMMENT '服务的密钥',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '物理删除位',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='积分活动发放积分-服务密钥'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = activ_allow_list_branch   */
/******************************************/
CREATE TABLE `activ_allow_list_branch` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `branch_code` varchar(32) NOT NULL COMMENT '分支编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='全局开发分支配置表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = activ_allow_list_cust   */
/******************************************/
CREATE TABLE `activ_allow_list_cust` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `activ_scene_id` bigint(19) NOT NULL COMMENT '活动场景ID',
  `branch_code` varchar(32) NOT NULL COMMENT '分支编号',
  `cust_id` varchar(32) NOT NULL COMMENT '客户编号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL DEFAULT 'admin',
  `update_by` varchar(32) NOT NULL DEFAULT 'admin',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `IDX_SCENE_ID` (`activ_scene_id`)
) ENGINE=InnoDB AUTO_INCREMENT=705 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='活动场景可见人员名单(推荐类)'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = activ_business_action_def   */
/******************************************/
CREATE TABLE `activ_business_action_def` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `bu_id` bigint(19) unsigned NOT NULL COMMENT '业务线ID',
  `action_name` varchar(64) NOT NULL COMMENT '行为名称',
  `action_desc` varchar(256) DEFAULT NULL COMMENT '行为描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80013 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='业务行为定义'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = activ_business_def   */
/******************************************/
CREATE TABLE `activ_business_def` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '业务线ID',
  `bu_name` varchar(64) NOT NULL COMMENT '业务线名称',
  `bu_desc` varchar(256) DEFAULT NULL COMMENT '业务线说明',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90007 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='业务线定义'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = activ_popup_def   */
/******************************************/
CREATE TABLE `activ_popup_def` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `task_id` bigint(20) NOT NULL COMMENT '积分任务id',
  `title` varchar(64) DEFAULT NULL COMMENT '弹窗标题',
  `button_text` varchar(64) DEFAULT NULL COMMENT '弹窗按钮文字',
  `image_url` text NOT NULL COMMENT '弹窗图片url',
  `content` varchar(256) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`),
  UNIQUE KEY `activ_popup_def_id_uindex` (`id`),
  KEY `idx_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='积分活动弹窗定义表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = activ_task_action_relation   */
/******************************************/
CREATE TABLE `activ_task_action_relation` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `task_id` bigint(19) unsigned NOT NULL COMMENT '任务定义ID',
  `action_id` bigint(19) unsigned NOT NULL COMMENT '业务行为ID',
  `task_code` varchar(32) NOT NULL COMMENT '场景编号：SIGN-日常签到 READ-金融学习 REPAY-还款 BIND-绑定公众号 INVITE_REGIST-邀请注册 INVITE_CREDIT-邀请授信 INVITE_LOAN-邀请支用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `idx_action_id` (`action_id`),
  KEY `idx_task_id` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30002 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='积分任务定义表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = activ_task_def   */
/******************************************/
CREATE TABLE `activ_task_def` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `task_code` varchar(32) NOT NULL COMMENT '场景编号：SIGN-日常签到 READ-金融学习 REPAY-还款 BIND-绑定公众号 INVITE_REGIST-邀请注册 INVITE_CREDIT-邀请授信 INVITE_LOAN-邀请支用',
  `task_name` varchar(64) NOT NULL COMMENT '活动名称',
  `task_desc` varchar(256) DEFAULT NULL COMMENT '活动描述',
  `task_status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '活动状态: 0-未开始 1-进行中 2-已停止',
  `task_priority` tinyint(3) NOT NULL DEFAULT '1' COMMENT '活动优先级(决定弹窗顺序)',
  `task_begin_date` datetime NOT NULL COMMENT '活动开始日期',
  `task_end_date` datetime NOT NULL COMMENT '活动结束日期',
  `task_type` varchar(32) NOT NULL COMMENT '积分活动类型 REC-推荐类 SELF-主动类',
  `obtain_mode` varchar(32) NOT NULL COMMENT '发放方式 AUTO-自动 MANUAL-手动',
  `is_branch_allow_list` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用分支限制: 0-否 1-是',
  `is_cust_allow_list` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用人员限制: 0-否 1-是',
  `point_expire_days` int(10) NOT NULL DEFAULT '-1' COMMENT '积分过期天数(单位天, -1永不过期)',
  `rec_expire_days` int(10) NOT NULL DEFAULT '-1' COMMENT '推荐过期时间(单位天, -1永不过期)',
  `rec_max` int(10) NOT NULL DEFAULT '-1' COMMENT '邀请用户上限(单位月, -1无限制)',
  `rec_regis_protec_days` int(10) NOT NULL DEFAULT '-1' COMMENT '注册推荐人保护期(单位天, -1永不过期)',
  `rec_point_award_person` tinyint(3) NOT NULL DEFAULT '0' COMMENT '积分推荐人类型 0-非推荐活动 1-注册推荐人 2-活动推荐人',
  `is_view_on_complete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '完成后是否显示: 0-否 1-是',
  `version` bigint(19) unsigned NOT NULL COMMENT '记录版本号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70032 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='积分任务定义表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = black_user   */
/******************************************/
CREATE TABLE `black_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` varchar(32) DEFAULT NULL COMMENT '黑名单用户编号',
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_user_no` (`user_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14844 DEFAULT CHARSET=utf8mb4
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = common_config   */
/******************************************/
CREATE TABLE `common_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) NOT NULL COMMENT '编码',
  `param` varchar(4000) NOT NULL COMMENT '参数',
  `enable_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '有效标志',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 ',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_by` varchar(32) NOT NULL DEFAULT '0' COMMENT '修改人',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `idx_code_version` (`code`,`version`),
  KEY `version` (`version`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='参数配置表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = common_file   */
/******************************************/
CREATE TABLE `common_file` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `biz_id` bigint(19) DEFAULT NULL COMMENT '对应业务主键ID, 入商品ID',
  `file_type` tinyint(4) DEFAULT NULL COMMENT '文件类型 1-首页banner 2-还款弹窗图片 3-支用弹窗图片 4-金融学习支用图片',
  `link_forward` varchar(128) DEFAULT NULL COMMENT '跳转链接',
  `file_id` varchar(128) DEFAULT NULL COMMENT 'OSS文件ID',
  `file_extension` varchar(16) DEFAULT NULL COMMENT '文件扩展名',
  `file_name` varchar(128) DEFAULT NULL COMMENT '文件名称',
  `file_size` varchar(16) DEFAULT NULL COMMENT '文件大小',
  `file_sort` tinyint(3) NOT NULL DEFAULT '1' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `index_biz_id` (`biz_id`),
  KEY `index_file_type` (`file_type`),
  KEY `idx_file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='通用附件表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = common_seq   */
/******************************************/
CREATE TABLE `common_seq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL COMMENT '序列号名字',
  `value` int(11) DEFAULT NULL COMMENT '序列号当前值',
  `min_value` int(11) DEFAULT NULL COMMENT '序列号最小值',
  `max_value` int(11) DEFAULT NULL COMMENT '序列号最大值',
  `step` int(11) DEFAULT NULL COMMENT '步长，每次取步步长个数字放到内存里，不要太大，建议200',
  `retry_times` int(11) DEFAULT NULL COMMENT '取序列号重试次数，建议3',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  `enabled_flag` varchar(1) NOT NULL COMMENT '是否删除，0表示删除，1表示使用中',
  PRIMARY KEY (`id`),
  UNIQUE KEY `namme_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='流水号生成规则表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = credit_award_deal_log   */
/******************************************/
CREATE TABLE `credit_award_deal_log` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT,
  `user_no` varchar(50) NOT NULL COMMENT '用户编号',
  `id_no` varchar(30) DEFAULT NULL COMMENT '客户身份证号',
  `mobile` varchar(20) DEFAULT NULL COMMENT '客户手机号',
  `credit_push_content` json DEFAULT NULL COMMENT '授信完成推送内容',
  `query_award_recommended_content` json DEFAULT NULL COMMENT '查询获奖推荐人信息',
  `notify_sync_recommended_content` json DEFAULT NULL COMMENT '通知同步推荐人返回信息',
  `send_award_order_content` json DEFAULT NULL COMMENT '发送奖励订单信息',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `enabled_flag` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_no` (`user_no`),
  KEY `idx_id_no` (`id_no`),
  KEY `idx_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=1851911289268768771 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='极速贷村代推广奖励发放日志记录'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_point_balance   */
/******************************************/
CREATE TABLE `cust_point_balance` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_no` varchar(32) DEFAULT NULL COMMENT '用户编号',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户编号',
  `cust_name` varchar(32) DEFAULT NULL COMMENT '客户姓名',
  `cust_balance` bigint(19) unsigned NOT NULL DEFAULT '0' COMMENT '客户积分余额',
  `cust_used` bigint(19) unsigned NOT NULL DEFAULT '0' COMMENT '客户已使用积分',
  `cur_year` varchar(4) DEFAULT NULL COMMENT '当前年份(e.g. 2021)',
  `this_year_points` bigint(19) DEFAULT '0' COMMENT '今年可用积分(e.g. 1000)',
  `last_year_points` bigint(19) DEFAULT '0' COMMENT '去年可用积分(e.g. 100)',
  `version` bigint(19) unsigned NOT NULL DEFAULT '1' COMMENT '版本号:乐观锁控制',
  `sign_notice_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '签到提醒开关标记 1-开启 0-关闭',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  `balance_bak` bigint(20) NOT NULL DEFAULT '0' COMMENT '积分余额备份，积分项目下线使用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unq_cust_id` (`cust_id`),
  UNIQUE KEY `UNI_USER_NO` (`user_no`),
  KEY `idx_updatetime` (`update_time`),
  KEY `idx_cust_balance` (`cust_balance`),
  KEY `idx_sign_notice_flag` (`sign_notice_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=4686645 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户积分余额表'
;


/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_point_change_record   */
/******************************************/
CREATE TABLE `cust_point_change_record` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户编号',
  `scene_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `source_id` bigint(19) unsigned NOT NULL COMMENT '来源id',
  `change_type` tinyint(3) unsigned NOT NULL COMMENT '变更类型 1-收入 2-消费',
  `biz_id` varchar(48) NOT NULL COMMENT '交易编号：任务明细ID或外部单号',
  `points` bigint(19) unsigned NOT NULL COMMENT '变更积分值',
  `change_desc` varchar(128) DEFAULT NULL COMMENT '变更描述',
  `expire_time` datetime DEFAULT NULL COMMENT '积分过期时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  `user_no` varchar(32) DEFAULT NULL COMMENT '用户编码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_biz_source` (`biz_id`,`source_id`,`scene_id`),
  KEY `IDX_CUST_ID` (`cust_id`),
  KEY `idx_updatetime` (`update_time`),
  KEY `idx_scene_id` (`scene_id`),
  KEY `idx_source_id` (`source_id`),
  KEY `IDX_USER_NO_CHANGE_TYPE_CREATE_TIME` (`user_no`,`change_type`,`create_time`),
  KEY `idx_changetype_createtime_userno_points` (`change_type`,`create_time`,`user_no`,`points`)
) ENGINE=InnoDB AUTO_INCREMENT=882111315338388 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户积分变更表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_point_task_record   */
/******************************************/
CREATE TABLE `cust_point_task_record` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `relation_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `task_status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '任务状态：1-待领取 2-已领取 3-已过期 4-冻结中 5-已作废',
  `obtain_points` bigint(19) unsigned NOT NULL DEFAULT '0' COMMENT '获取积分数额',
  `finish_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `obtain_channel` varchar(16) DEFAULT NULL COMMENT '领取渠道',
  `obtain_time` datetime DEFAULT NULL COMMENT '领取时间',
  `expire_time` datetime NOT NULL COMMENT '领取截止时间',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_mobile` varchar(32) DEFAULT NULL COMMENT '任务创建手机号',
  `create_channel` varchar(16) NOT NULL COMMENT '创建渠道',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `update_by` varchar(32) NOT NULL DEFAULT 'system' COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  `user_no` varchar(32) DEFAULT NULL COMMENT '用户编码',
  PRIMARY KEY (`id`),
  KEY `IDX_CUST_ID` (`cust_id`),
  KEY `INX_TASK_STATUS` (`task_status`),
  KEY `idx_updatetime` (`update_time`),
  KEY `IDX_USER_NO` (`user_no`),
  KEY `idx_relation_id` (`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16717816 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户任务记录总表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_recomend_complete_info   */
/******************************************/
CREATE TABLE `cust_recomend_complete_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_id` bigint(19) unsigned NOT NULL COMMENT '活动ID',
  `cust_id` varchar(32) NOT NULL COMMENT '推荐人客户ID',
  `year` int(4) NOT NULL COMMENT '年份',
  `month` tinyint(2) NOT NULL COMMENT '月份',
  `day` tinyint(2) DEFAULT NULL COMMENT '日',
  `week_of_year` tinyint(2) DEFAULT NULL COMMENT '当年第几周',
  `task_threshold` int(9) NOT NULL COMMENT '任务的阈值',
  `counter` int(9) NOT NULL COMMENT '周期内有效次数',
  `detail_id_list` varchar(512) DEFAULT NULL COMMENT '完成详细情况(推荐记录id列表,逗号隔开)',
  `version` bigint(19) unsigned NOT NULL COMMENT '版本号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SCENE_REC_CUST` (`task_id`,`cust_id`,`year`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=1238 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='推荐任务完成情况记录表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_recomend_cust_info   */
/******************************************/
CREATE TABLE `cust_recomend_cust_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `verify_code` varchar(32) DEFAULT NULL COMMENT '邀请人存储码',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `cust_name` varchar(32) DEFAULT NULL COMMENT '客户姓名',
  `popup_count` int(11) NOT NULL DEFAULT '0' COMMENT '弹窗次数',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_TASK_USER` (`verify_code`),
  KEY `idx_cust_id` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=543356 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='邀请人信息存储表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_recomend_relation   */
/******************************************/
CREATE TABLE `cust_recomend_relation` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_id` bigint(19) unsigned NOT NULL COMMENT '活动任务ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `cust_mobile` varchar(32) DEFAULT NULL COMMENT '客户手机号(手机号与客户ID只是一个有值)',
  `cust_name` varchar(32) DEFAULT NULL COMMENT '客户姓名',
  `cust_idno` varchar(32) DEFAULT NULL COMMENT '客户身份证',
  `cust_valid_status` char(1) DEFAULT NULL COMMENT '实名规则验证状态 Y-成功 N-失败',
  `rec_cust_id` varchar(32) NOT NULL COMMENT '推荐人客户ID',
  `rec_cust_name` varchar(32) NOT NULL COMMENT '推荐人客户姓名',
  `rec_cust_source` tinyint(1) DEFAULT NULL COMMENT '推荐人来源 1-积分白名单 2-数仓白名单',
  `real_rec_cust_id` varchar(32) NOT NULL COMMENT '实际获益推荐人客户ID',
  `real_rec_cust_name` varchar(32) NOT NULL COMMENT '实际获益推荐人客户姓名',
  `event_channel` varchar(16) NOT NULL COMMENT '来源渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_TASK_USER` (`task_id`,`user_id`),
  KEY `idx_rec_cust_source` (`rec_cust_source`)
) ENGINE=InnoDB AUTO_INCREMENT=2207 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户推荐关系记录'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_recomend_relation_promotion   */
/******************************************/
CREATE TABLE `cust_recomend_relation_promotion` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `cust_mobile` varchar(32) DEFAULT NULL COMMENT '客户手机号',
  `cust_name` varchar(32) DEFAULT NULL COMMENT '客户姓名',
  `cust_idno` varchar(32) DEFAULT NULL COMMENT '客户身份证',
  `cust_valid_status` char(1) DEFAULT 'N' COMMENT '实名状态 Y-已实名 N-未实名或老客户',
  `valid_start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end_time` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `valid_status` int(11) DEFAULT '1' COMMENT '推荐关系有效标志 1为有效 其他为失效',
  `brand_new_flag` tinyint(1) DEFAULT '0' COMMENT '纯新客标记 1-纯新客 0-普通新客',
  `event_channel` varchar(16) NOT NULL COMMENT '来源渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  `rec_cust_id` varchar(32) NOT NULL COMMENT '推荐人客户ID',
  `rec_cust_name` varchar(32) NOT NULL COMMENT '推荐人客户姓名',
  `rec_cust_source` tinyint(1) DEFAULT NULL COMMENT '推荐人来源 1-积分白名单 2-数仓白名单',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_user_valid_status` (`user_id`,`valid_status`) USING BTREE,
  KEY `idx_rec_cust_source` (`rec_cust_source`),
  KEY `idx_cust_id` (`cust_id`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_rec_cust_id` (`rec_cust_id`) USING BTREE,
  KEY `idx_cust_valid_status` (`cust_valid_status`,`valid_status`),
  KEY `idx_valid_end_time` (`valid_end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4864475 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='乡助推广佣金任务-客户推荐关系记录'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_reward_record   */
/******************************************/
CREATE TABLE `cust_reward_record` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_no` varchar(64) NOT NULL DEFAULT '' COMMENT '订单号',
  `user_no` varchar(64) NOT NULL COMMENT '用户编号',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '信贷客户ID',
  `reward_points` bigint(19) unsigned NOT NULL DEFAULT '0' COMMENT '获取积分数额',
  `record_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `reward_channel` varchar(64) DEFAULT NULL COMMENT '获取渠道',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_order_no` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1301648 DEFAULT CHARSET=utf8mb4 COMMENT='奖励客户积分记录表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_ask_export   */
/******************************************/
CREATE TABLE `cust_task_record_ask_export` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `point_task_id` bigint(19) unsigned NOT NULL COMMENT '积分任务ID',
  `user_no` varchar(32) NOT NULL COMMENT '用户编码',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `relation_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `theme_id` bigint(19) NOT NULL COMMENT '提问问题-主题ID',
  `record_day` varchar(16) NOT NULL COMMENT '提问时间yyyyMMdd',
  `event_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_theme_id_index` (`theme_id`),
  UNIQUE KEY `uni_user_no_record_day` (`user_no`,`record_day`)
) ENGINE=InnoDB AUTO_INCREMENT=6743 DEFAULT CHARSET=utf8mb4
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_binding   */
/******************************************/
CREATE TABLE `cust_task_record_binding` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `point_task_id` bigint(19) unsigned NOT NULL COMMENT '积分任务ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `relation_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `event_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  `user_no` varchar(32) DEFAULT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_user_no` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=77642 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户绑定任务记录分表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_chunk   */
/******************************************/
CREATE TABLE `cust_task_record_chunk` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `point_task_id` bigint(19) unsigned NOT NULL COMMENT '积分任务ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '信贷客户ID',
  `user_no` varchar(64) NOT NULL COMMENT '用户编号',
  `relation_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `event_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `chunk_id` varchar(64) NOT NULL DEFAULT '' COMMENT '农场地块id',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_chunk_id` (`chunk_id`) USING BTREE,
  UNIQUE KEY `uniq_user_no` (`user_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4438 DEFAULT CHARSET=utf8mb4 COMMENT='我的农场新建地块任务记录分表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_issue   */
/******************************************/
CREATE TABLE `cust_task_record_issue` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `point_task_id` bigint(19) unsigned NOT NULL COMMENT '积分任务ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户编号',
  `relation_id` bigint(20) unsigned NOT NULL COMMENT '场景ID',
  `year` int(4) NOT NULL DEFAULT '2020' COMMENT '年分(e.g.2020)',
  `month` tinyint(2) NOT NULL COMMENT '月份(e.g.12)',
  `day` tinyint(2) NOT NULL COMMENT '日(e.g 1)',
  `issue_type` varchar(64) NOT NULL COMMENT '发布类型',
  `issue_id` bigint(20) NOT NULL COMMENT '发布文章id',
  `event_channel` varchar(16) DEFAULT NULL COMMENT '来源渠道',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  `user_no` varchar(32) DEFAULT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_sign_event` (`user_no`,`relation_id`,`year`,`month`,`day`)
) ENGINE=InnoDB AUTO_INCREMENT=12099 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户发布任务记录分表'
;


/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_more   */
/******************************************/
CREATE TABLE `cust_task_record_more` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `point_task_id` bigint(19) unsigned NOT NULL COMMENT '积分任务ID',
  `user_no` varchar(32) NOT NULL COMMENT '用户编码',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `relation_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `business_id` varchar(32) DEFAULT NULL COMMENT '业务id',
  `event_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1760172902780633091 DEFAULT CHARSET=utf8mb4 COMMENT='重复类型任务记录表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_promotion   */
/******************************************/
CREATE TABLE `cust_task_record_promotion` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` bigint(19) NOT NULL COMMENT '分销订单id',
  `action_id` bigint(19) NOT NULL COMMENT '行为id',
  `task_id` bigint(19) unsigned NOT NULL COMMENT '任务ID',
  `rec_id` bigint(19) DEFAULT NULL COMMENT '邀请记录ID',
  `rec_type` tinyint(3) DEFAULT NULL COMMENT '参与类型:1-被邀请 2-邀请',
  `cust_id` varchar(32) NOT NULL COMMENT '被邀请客户ID',
  `finish_time` datetime NOT NULL COMMENT '完成时间',
  `finish_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `rec_cust_id` varchar(32) NOT NULL COMMENT '邀请客户id',
  `decision_no` varchar(128) DEFAULT NULL COMMENT '决策号',
  `loan_no` varchar(64) DEFAULT NULL COMMENT '借据号',
  `apply_id` varchar(64) DEFAULT NULL COMMENT '申请单号',
  `amount` decimal(12,2) DEFAULT NULL COMMENT '支用金额',
  `loan_type` varchar(32) DEFAULT NULL COMMENT '贷款产品',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_order_id` (`order_id`),
  UNIQUE KEY `uniq_task_cust` (`task_id`,`rec_cust_id`,`cust_id`),
  UNIQUE KEY `uniq_action_cust` (`action_id`,`cust_id`),
  KEY `idx_cust_id` (`cust_id`),
  KEY `idx_task_id_create_time` (`task_id`,`create_time`),
  KEY `idx_rec_cust_id` (`rec_cust_id`),
  KEY `idx_createtime` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1040444 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户推广任务完成情况表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_promotion_balance   */
/******************************************/
CREATE TABLE `cust_task_record_promotion_balance` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_id` bigint(20) NOT NULL COMMENT '分销订单id',
  `action_id` bigint(20) NOT NULL COMMENT '行为id',
  `task_id` bigint(20) unsigned NOT NULL COMMENT '任务ID',
  `rec_id` bigint(20) NOT NULL COMMENT '邀请记录ID',
  `rec_type` tinyint(4) NOT NULL COMMENT '参与类型:1-被邀请 2-邀请',
  `cust_id` varchar(32) NOT NULL COMMENT '被邀请客户ID',
  `finish_time` datetime NOT NULL COMMENT '完成时间',
  `rec_cust_id` varchar(32) NOT NULL COMMENT '邀请客户id',
  `rec_dbc_level` tinyint(2) DEFAULT '0' COMMENT '邀请用户分销等级',
  `first_credit_loan_date` datetime NOT NULL COMMENT '首次极速贷支用时间',
  `start_date` datetime NOT NULL COMMENT '开始日期',
  `end_date` datetime NOT NULL COMMENT '结束日期',
  `daily_average_loan_balance` decimal(12,2) NOT NULL COMMENT '日均贷款余额',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `reward_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '奖励发放状态',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_order_id` (`order_id`) USING BTREE,
  UNIQUE KEY `uniq_date_cust` (`cust_id`,`start_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户乡助推广-支用任务(日均贷款余额)完成情况表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_read   */
/******************************************/
CREATE TABLE `cust_task_record_read` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `point_task_id` bigint(19) unsigned NOT NULL COMMENT '积分任务ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户编号',
  `relation_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `year` int(4) NOT NULL DEFAULT '2020' COMMENT '年分(e.g.2020)',
  `week_of_year` tinyint(2) NOT NULL COMMENT '当年第几周(e.g.28)',
  `counter` tinyint(1) DEFAULT NULL COMMENT '本周阅读次数计数器(1-4)',
  `file_id` varchar(32) NOT NULL COMMENT '文章ID',
  `read_duration` bigint(19) unsigned NOT NULL COMMENT '阅读市场(单位秒 e.g.50)',
  `event_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  `user_no` varchar(32) DEFAULT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_file_counter` (`user_no`,`year`,`week_of_year`,`counter`)
) ENGINE=InnoDB AUTO_INCREMENT=117359 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户阅读任务记录分表'
;


/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_recomend   */
/******************************************/
CREATE TABLE `cust_task_record_recomend` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `relation_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `rec_id` bigint(19) NOT NULL COMMENT '邀请记录ID',
  `rec_type` tinyint(3) NOT NULL COMMENT '参与类型:1-被邀请 2-邀请',
  `point_task_id` bigint(19) unsigned DEFAULT NULL COMMENT '积分任务ID(完成时才会有)',
  `cust_id` varchar(32) NOT NULL COMMENT '客户ID',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `finish_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `loan_no` varchar(64) DEFAULT NULL COMMENT '借据号',
  `apply_id` varchar(64) DEFAULT NULL COMMENT '申请单号',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SCENE_REC_CUST` (`relation_id`,`rec_id`,`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2730 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户推荐任务记录分表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_repay   */
/******************************************/
CREATE TABLE `cust_task_record_repay` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `point_task_id` bigint(19) NOT NULL COMMENT '积分任务ID',
  `cust_id` varchar(32) NOT NULL COMMENT '客户ID',
  `relation_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `year_and_month` varchar(7) NOT NULL DEFAULT '2020-01' COMMENT '还款年月(e.g.2020-08)',
  `loan_id` varchar(32) NOT NULL COMMENT '借据ID',
  `real_repay_id` varchar(32) NOT NULL COMMENT '实还记录ID',
  `repay_type` varchar(32) NOT NULL COMMENT '还款行为:1-正常还款 2-提前还款',
  `event_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_CUST_MONTH` (`cust_id`,`year_and_month`)
) ENGINE=InnoDB AUTO_INCREMENT=10471471 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户还款任务记录分表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_sign   */
/******************************************/
CREATE TABLE `cust_task_record_sign` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `point_task_id` bigint(19) unsigned NOT NULL COMMENT '积分任务ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户编号',
  `relation_id` bigint(20) unsigned NOT NULL COMMENT '场景ID',
  `year` int(4) NOT NULL DEFAULT '2020' COMMENT '年分(e.g.2020)',
  `month` tinyint(2) NOT NULL COMMENT '月份(e.g.12)',
  `day` tinyint(2) NOT NULL COMMENT '日(e.g 1)',
  `counter` bigint(19) unsigned NOT NULL DEFAULT '1' COMMENT '点赞计数器(e.g. 1|2|3)',
  `event_channel` varchar(16) DEFAULT NULL COMMENT '来源渠道',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  `user_no` varchar(32) DEFAULT NULL COMMENT '用户编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_sign_event` (`user_no`,`relation_id`,`year`,`month`,`day`)
) ENGINE=InnoDB AUTO_INCREMENT=4333547 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='客户签到任务记录分表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_single   */
/******************************************/
CREATE TABLE `cust_task_record_single` (
  `id` bigint(19) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `point_task_id` bigint(19) unsigned NOT NULL COMMENT '积分任务ID',
  `user_no` varchar(32) NOT NULL COMMENT '用户编码',
  `user_mobile` varchar(32) NOT NULL COMMENT '用户号码',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `relation_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `business_id` varchar(32) DEFAULT NULL COMMENT '业务id',
  `event_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_user_no_relation_id` (`user_no`,`relation_id`),
  UNIQUE KEY `uni_user_mobile_relation_id` (`user_mobile`,`relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1677204 DEFAULT CHARSET=utf8mb4 COMMENT='唯一类型任务记录表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = cust_task_record_todo   */
/******************************************/
CREATE TABLE `cust_task_record_todo` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `relation_id` bigint(19) unsigned NOT NULL COMMENT '场景ID',
  `rec_id` bigint(19) NOT NULL COMMENT '邀请记录ID',
  `cust_id` varchar(32) NOT NULL COMMENT '客户ID',
  `loan_no` varchar(64) DEFAULT NULL COMMENT '借据号',
  `apply_id` varchar(64) DEFAULT NULL COMMENT '申请单号',
  `bank_dt` datetime DEFAULT NULL COMMENT '起息日(放款日)',
  `confirm_status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态 1-待确认 2-已确认 3-失效',
  `finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `idle_time` datetime DEFAULT NULL COMMENT '待激活时间',
  `finish_channel` varchar(16) DEFAULT NULL COMMENT '完成渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_SCENE_REC_CUST` (`relation_id`,`rec_id`,`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='待处理任务记录表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = effective_browse_record   */
/******************************************/
CREATE TABLE `effective_browse_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rpt_date` varchar(10) NOT NULL DEFAULT '' COMMENT 'yyyy-MM-dd',
  `browse_open_id` varchar(64) NOT NULL DEFAULT '' COMMENT '浏览人用户id',
  `forward_user_id` varchar(64) NOT NULL DEFAULT '' COMMENT '转发人用户id',
  `page_code` varchar(64) NOT NULL DEFAULT '' COMMENT '页面id',
  `page_module` varchar(255) NOT NULL DEFAULT '' COMMENT '页面模块',
  `browse_time` datetime NOT NULL COMMENT '浏览时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_user_date` (`rpt_date`,`browse_open_id`,`forward_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11229 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='有效浏览记录表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = forward_page_module   */
/******************************************/
CREATE TABLE `forward_page_module` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `page_module_code` varchar(255) NOT NULL DEFAULT '' COMMENT '页面模块编码',
  `page_module_title` varchar(255) NOT NULL DEFAULT '' COMMENT '页面模块标题',
  `page_module_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '页面模版描述',
  `desc_key_word` varchar(32) DEFAULT '' COMMENT '页面描述标红字段',
  `is_hot_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否展示火热标记',
  `order_no` tinyint(4) NOT NULL DEFAULT '99' COMMENT '页面展示排序',
  `param` varchar(4000) NOT NULL DEFAULT '{}' COMMENT '跳转参数',
  `icon_oss_key` varchar(255) NOT NULL DEFAULT '' COMMENT 'icon在oss的文件',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `update_by` varchar(32) NOT NULL DEFAULT 'system' COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='转发页面模块配置'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = forward_reward_task_log   */
/******************************************/
CREATE TABLE `forward_reward_task_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_type` varchar(64) NOT NULL COMMENT '任务类型',
  `task_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '任务描述',
  `task_date` varchar(10) NOT NULL DEFAULT '' COMMENT '任务日期 yyyy-MM-dd',
  `task_sts` varchar(8) NOT NULL DEFAULT '' COMMENT '任务状态',
  `task_remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '任务备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `update_by` varchar(32) NOT NULL DEFAULT 'system' COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_task_date` (`task_type`,`task_date`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COMMENT='转发赚钱任务记录表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = global_allow_list_branch   */
/******************************************/
CREATE TABLE `global_allow_list_branch` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `area_code` varchar(32) NOT NULL COMMENT '区域编号',
  `area_name` varchar(128) NOT NULL COMMENT '区域名称',
  `branch_code` varchar(32) NOT NULL COMMENT '分支编号',
  `branch_name` varchar(128) NOT NULL COMMENT '分支名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_BRANCH_CODE` (`branch_code`)
) ENGINE=InnoDB AUTO_INCREMENT=333 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='全局开发分支配置表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = global_block_cust_list   */
/******************************************/
CREATE TABLE `global_block_cust_list` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cust_id` varchar(32) NOT NULL COMMENT '客户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='全局黑名单客户'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = insert_log   */
/******************************************/
CREATE TABLE `insert_log` (
  `table_name` varchar(32) DEFAULT NULL,
  `id_max` bigint(32) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = invalid_cust_recomend_relation   */
/******************************************/
CREATE TABLE `invalid_cust_recomend_relation` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_id` bigint(19) unsigned NOT NULL COMMENT '活动任务ID',
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `cust_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `cust_mobile` varchar(32) DEFAULT NULL COMMENT '客户手机号(手机号与客户ID只是一个有值)',
  `cust_name` varchar(32) DEFAULT NULL COMMENT '客户姓名',
  `cust_idno` varchar(32) DEFAULT NULL COMMENT '客户身份证',
  `cust_valid_status` char(1) DEFAULT NULL COMMENT '实名规则验证状态 Y-成功 N-失败',
  `rec_cust_id` varchar(32) NOT NULL COMMENT '推荐人客户ID',
  `rec_cust_name` varchar(32) NOT NULL COMMENT '推荐人客户姓名',
  `real_rec_cust_id` varchar(32) NOT NULL COMMENT '实际获益推荐人客户ID',
  `real_rec_cust_name` varchar(32) NOT NULL COMMENT '实际获益推荐人客户姓名',
  `event_channel` varchar(16) NOT NULL COMMENT '来源渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_TASK_USER` (`task_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='无效客户推荐关系记录'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = promotion_action_def   */
/******************************************/
CREATE TABLE `promotion_action_def` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `bu_id` bigint(19) unsigned NOT NULL COMMENT '业务线ID',
  `action_name` varchar(64) NOT NULL COMMENT '行为名称',
  `action_desc` varchar(256) DEFAULT NULL COMMENT '行为描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80004 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='业务行为定义'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = promotion_task_action_relation   */
/******************************************/
CREATE TABLE `promotion_task_action_relation` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `task_id` bigint(19) unsigned NOT NULL COMMENT '任务定义ID',
  `action_id` bigint(19) unsigned NOT NULL COMMENT '业务行为ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10005 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='支用任务和定义表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = promotion_task_def   */
/******************************************/
CREATE TABLE `promotion_task_def` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) NOT NULL COMMENT '任务名',
  `task_desc` varchar(32) DEFAULT NULL COMMENT '描述',
  `param` varchar(2000) NOT NULL COMMENT '参数 json格式',
  `finish_day_limit` int(8) NOT NULL COMMENT '从注册日开始，任务可完成的截止天数',
  `task_status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '活动状态: 0-未开始 1-进行中 2-已停止',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=200062 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='推广任务定义'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = reward_record_forward_browse   */
/******************************************/
CREATE TABLE `reward_record_forward_browse` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` varchar(64) NOT NULL DEFAULT '' COMMENT '用户id',
  `user_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `loan_cust_id` varchar(32) NOT NULL DEFAULT '' COMMENT '信贷客户编号',
  `branch_code` varchar(32) NOT NULL DEFAULT '' COMMENT '用户分支编号',
  `branch_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户分支名',
  `area_code` varchar(32) NOT NULL DEFAULT '' COMMENT '用户区域编号',
  `area_name` varchar(32) NOT NULL DEFAULT '' COMMENT '用户区域名称',
  `user_mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `manager_code` varchar(32) NOT NULL DEFAULT '' COMMENT '客户经理主职工号',
  `manager_name` varchar(64) NOT NULL DEFAULT '' COMMENT '客户经理姓名',
  `manager_mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '客户经理手机号',
  `leader_code` varchar(32) NOT NULL DEFAULT '' COMMENT '所属督导工号',
  `leader_name` varchar(64) NOT NULL DEFAULT '' COMMENT '所属督导姓名',
  `leader_mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '督导手机号',
  `distribution_level` varchar(32) NOT NULL DEFAULT '' COMMENT '分销级别',
  `forward_num` int(11) DEFAULT '0' COMMENT '转发次数',
  `browse_num` int(11) DEFAULT '0' COMMENT '有效浏览次数',
  `reward_date` varchar(32) NOT NULL DEFAULT '' COMMENT '下发奖励日期',
  `reward_amount` decimal(12,2) DEFAULT '0.00' COMMENT '奖励金额',
  `reward_status` varchar(32) NOT NULL DEFAULT '0' COMMENT '下发奖励状态',
  `status` varchar(255) NOT NULL DEFAULT 'init' COMMENT '状态',
  `order_no` varchar(64) DEFAULT '' COMMENT '分销订单号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `update_by` varchar(32) NOT NULL DEFAULT 'system' COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_user_date` (`user_id`,`reward_date`)
) ENGINE=InnoDB AUTO_INCREMENT=12650 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='奖励记录表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = reward_record_forward_browse_team   */
/******************************************/
CREATE TABLE `reward_record_forward_browse_team` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `leader_user_id` varchar(32) NOT NULL DEFAULT '' COMMENT '督导用户id',
  `leader_code` varchar(255) NOT NULL DEFAULT '' COMMENT '督导工号',
  `leader_name` varchar(64) NOT NULL DEFAULT '' COMMENT '督导姓名',
  `leader_mobile` varchar(32) NOT NULL DEFAULT '' COMMENT '督导手机号',
  `branch_code` varchar(32) NOT NULL DEFAULT '' COMMENT '分支编号',
  `branch_name` varchar(32) NOT NULL DEFAULT '' COMMENT '分支名称',
  `team_member` varchar(4000) NOT NULL DEFAULT '' COMMENT '团队成员',
  `team_size` int(11) NOT NULL DEFAULT '0' COMMENT '团队人数',
  `per_capita_forward_num` int(11) NOT NULL DEFAULT '0' COMMENT '人均分享次数',
  `per_capita_browse_num` int(11) NOT NULL DEFAULT '0' COMMENT '人均浏览次数',
  `total_browse_num` int(11) NOT NULL DEFAULT '0' COMMENT '团队总浏览人数',
  `total_forward_num` int(11) DEFAULT '0' COMMENT '团队总转发数',
  `reward_date` varchar(32) NOT NULL DEFAULT '' COMMENT '下发奖励日期',
  `reward_amount` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `reward_status` varchar(32) NOT NULL DEFAULT '0' COMMENT '下发奖励状态',
  `status` varchar(255) NOT NULL DEFAULT 'init' COMMENT '状态',
  `order_no` varchar(64) DEFAULT '' COMMENT '分销订单号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL DEFAULT 'system' COMMENT '创建人',
  `update_by` varchar(32) NOT NULL DEFAULT 'system' COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uniq_user_date` (`leader_user_id`,`reward_date`)
) ENGINE=InnoDB AUTO_INCREMENT=24633 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='团队奖励记录表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = user_point_monitor   */
/******************************************/
CREATE TABLE `user_point_monitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_time` datetime DEFAULT NULL COMMENT '用户领取积分时间',
  `user_no` varchar(32) DEFAULT NULL,
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `log_count` bigint(255) DEFAULT '0' COMMENT '埋点记录数',
  `point_change_record` varchar(255) DEFAULT NULL COMMENT '积分流水汇总',
  `is_black_user` tinyint(4) DEFAULT '0' COMMENT '是否为黑名单用户',
  `his_record_count` int(255) DEFAULT '0' COMMENT '历史监控记录数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_user_no` (`user_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46364 DEFAULT CHARSET=utf8mb4
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = user_recomend_info   */
/******************************************/
CREATE TABLE `user_recomend_info` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `verify_code` varchar(32) NOT NULL COMMENT '邀请人存储码',
  `user_no` varchar(32) NOT NULL COMMENT '用户编码',
  `user_name` varchar(32) DEFAULT NULL COMMENT '用户昵称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_TASK_USER` (`verify_code`),
  UNIQUE KEY `idx_user_no` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1763062577308188674 DEFAULT CHARSET=utf8mb4 COMMENT='邀请人信息存储表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = user_recomend_relation   */
/******************************************/
CREATE TABLE `user_recomend_relation` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_id` bigint(19) unsigned DEFAULT NULL COMMENT '活动任务ID',
  `user_no` varchar(32) DEFAULT NULL COMMENT '用户编码',
  `user_mobile` varchar(32) DEFAULT NULL COMMENT '用户手机号',
  `points` bigint(19) unsigned NOT NULL DEFAULT '0' COMMENT '获取积分数额',
  `rec_user_no` varchar(32) NOT NULL COMMENT '推荐人用户编码',
  `event_channel` varchar(16) NOT NULL COMMENT '来源渠道',
  `task_desc` varchar(128) DEFAULT NULL COMMENT '描述',
  `recomend_valid` varchar(2) NOT NULL DEFAULT 'Y' COMMENT '是否有效:Y-是 N-否 超过奖励上限的视为无效或者完成任务动作执行失败的',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_USER_MOBILE` (`user_mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=1760172902629638147 DEFAULT CHARSET=utf8mb4 COMMENT='客户推荐关系记录'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = user_vote_monitor   */
/******************************************/
CREATE TABLE `user_vote_monitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` varchar(32) DEFAULT NULL,
  `activity_id` varchar(32) DEFAULT NULL,
  `create_date` date DEFAULT NULL COMMENT '创建日期',
  `vote_record` varchar(255) DEFAULT NULL COMMENT '当日投票记录',
  `vote_his_record` varchar(255) DEFAULT NULL COMMENT '历史投票记录',
  `is_black_user` tinyint(4) DEFAULT '0' COMMENT '历史投票记录',
  `log_count` bigint(255) DEFAULT '0' COMMENT '埋点记录数',
  `his_record_count` int(255) DEFAULT '0' COMMENT '历史监控记录数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_user_no` (`user_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_common_file   */
/******************************************/
CREATE TABLE `zpm_common_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `biz_id` bigint(20) NOT NULL COMMENT '对应业务主键ID',
  `file_type` tinyint(4) DEFAULT NULL COMMENT '文件类型 1-商品列表图片',
  `file_id` varchar(128) DEFAULT NULL COMMENT 'OSS文件ID',
  `file_extension` varchar(16) DEFAULT NULL COMMENT '文件扩展名',
  `file_name` varchar(128) DEFAULT NULL COMMENT '文件名称',
  `file_size` varchar(16) DEFAULT NULL COMMENT '文件大小',
  `file_sort` tinyint(3) NOT NULL DEFAULT '1' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `index_biz_id` (`biz_id`),
  KEY `index_file_type` (`file_type`)
) ENGINE=InnoDB AUTO_INCREMENT=9113 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商家附属文件表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_eco_express_address   */
/******************************************/
CREATE TABLE `zpm_eco_express_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '收货信息记录ID',
  `ono` bigint(20) NOT NULL COMMENT '订单编号',
  `address_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '地址类型 1-客户地址 2-分支地址',
  `receiver` varchar(64) NOT NULL COMMENT '收货人',
  `mobile` varchar(64) NOT NULL COMMENT '手机号码',
  `telephone` varchar(64) NOT NULL COMMENT '固定电话',
  `province` varchar(64) NOT NULL COMMENT '收货省份',
  `city` varchar(64) NOT NULL COMMENT '收货市',
  `county` varchar(64) NOT NULL COMMENT '收货区',
  `province_desc` varchar(64) NOT NULL COMMENT '收货省',
  `city_desc` varchar(64) NOT NULL COMMENT '收货市',
  `county_desc` varchar(128) NOT NULL COMMENT '收货区',
  `detail_address` varchar(128) NOT NULL COMMENT '详细地址',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `idx_ono` (`ono`)
) ENGINE=InnoDB AUTO_INCREMENT=1785293310305968131 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订单收货地址表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_eco_order   */
/******************************************/
CREATE TABLE `zpm_eco_order` (
  `ono` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '订单编号',
  `trade_no` bigint(20) NOT NULL COMMENT '交易号',
  `pno` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付记录ID',
  `pay_way` varchar(16) DEFAULT NULL COMMENT '支付方式: enjoypay-用呗 balance-余额支付 alipay-支付宝',
  `customer_id` varchar(32) NOT NULL COMMENT '客户编号',
  `customer_name` varchar(64) DEFAULT NULL COMMENT '客户姓名',
  `merchant_id` bigint(20) NOT NULL COMMENT '商家ID',
  `store_id` bigint(20) DEFAULT NULL COMMENT '店铺ID',
  `promotion_id` bigint(20) DEFAULT NULL COMMENT '活动ID',
  `order_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '订单类型 1-积分订单',
  `order_status` tinyint(3) NOT NULL COMMENT '订单状态 1-待付款 2-处理中 3-待备货 4-待发货 5-待签收 6-签收中 7-交易成功 8-交易关闭',
  `express_price` bigint(19) NOT NULL DEFAULT '0' COMMENT '运费(积分)',
  `price_subtotal` bigint(19) NOT NULL DEFAULT '0' COMMENT '商品总价(积分)',
  `real_pay` bigint(19) NOT NULL DEFAULT '0' COMMENT '订单实付总价(积分)',
  `delivery_type` varchar(32) NOT NULL DEFAULT 'DIRECT' COMMENT '发货类型 DIRECT-直邮客户 COLLECTION-员工派送',
  `pay_time` datetime DEFAULT NULL COMMENT '付款时间',
  `confirm_time` datetime DEFAULT NULL COMMENT '确认时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receipt_time` datetime DEFAULT NULL COMMENT '收货时间',
  `close_time` datetime DEFAULT NULL COMMENT '关闭时间',
  `receipt_desc` varchar(256) DEFAULT NULL COMMENT '收货备注',
  `return_time` datetime DEFAULT NULL COMMENT '取消时间',
  `return_reason` varchar(512) DEFAULT NULL COMMENT '取消原因',
  `manager` varchar(32) DEFAULT NULL COMMENT '所属客户经理',
  `manager_name` varchar(64) DEFAULT NULL COMMENT '所属客户经理名称',
  `branch` varchar(16) DEFAULT NULL COMMENT '所属分支',
  `branch_name` varchar(32) DEFAULT NULL COMMENT '所属分支名称',
  `supervisor` varchar(32) DEFAULT NULL COMMENT '督导',
  `supervisor_name` varchar(64) DEFAULT NULL COMMENT '督导名称',
  `customer_remark` varchar(128) DEFAULT NULL COMMENT '订单备注',
  `channel` varchar(16) DEFAULT NULL COMMENT '下单渠道',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`ono`),
  KEY `INDEX_PNO` (`pno`),
  KEY `INDEX_PAY_WAY` (`pay_way`),
  KEY `INDEX_ORDER_STATUS` (`order_status`),
  KEY `INDEX_CUSTOMER_ID` (`customer_id`),
  KEY `INDEX_PROMOTION_ID` (`promotion_id`),
  KEY `INDEX_BRANCH` (`branch`),
  KEY `idx_merchant_id` (`merchant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订单主档信息表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_eco_order_change_log   */
/******************************************/
CREATE TABLE `zpm_eco_order_change_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ono` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `operate_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作名称：1-新建 2-决策处理 3-客户确认 4-发货 5-交易成功 6-取消 7-签收',
  `operate_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `operate_result` varchar(255) NOT NULL COMMENT '处理结果',
  `operate_remark` varchar(255) DEFAULT NULL COMMENT '处理备注',
  `operator` varchar(40) DEFAULT NULL COMMENT '处理人工号-姓名',
  `channel` varchar(64) DEFAULT NULL COMMENT '渠道',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用：1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101037 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_eco_order_item   */
/******************************************/
CREATE TABLE `zpm_eco_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ono` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `sku_id` bigint(20) NOT NULL COMMENT 'sku ID',
  `product_id` bigint(20) NOT NULL COMMENT '商品ID',
  `product_name` varchar(128) NOT NULL COMMENT '商品名称',
  `product_sub_name` varchar(128) DEFAULT NULL COMMENT '商品副标题',
  `product_no` varchar(64) NOT NULL COMMENT '货号',
  `main_image` varchar(128) DEFAULT NULL COMMENT '商品主图',
  `qty` int(10) NOT NULL COMMENT '购买数量',
  `valid_qty` int(10) NOT NULL COMMENT '有效数量(未退数量)',
  `original_price` decimal(10,2) NOT NULL COMMENT '商品原价',
  `selling_price` bigint(19) NOT NULL COMMENT '实际售价(积分)',
  `price_subtotal` bigint(19) NOT NULL COMMENT '金额小计(积分)',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  `receive_state` tinyint(2) NOT NULL DEFAULT '1' COMMENT '签收状态：1-待签收 2-已签收',
  `receive_id` bigint(20) DEFAULT NULL COMMENT '订单签收id',
  `cno` bigint(20) DEFAULT NULL COMMENT '拼车单号',
  PRIMARY KEY (`id`),
  KEY `IDX_ONO` (`ono`),
  KEY `idx_receive_id` (`receive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32485 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订单商品明细表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_eco_order_logistics   */
/******************************************/
CREATE TABLE `zpm_eco_order_logistics` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ono` bigint(20) NOT NULL COMMENT '订单编号',
  `logistician` varchar(32) DEFAULT NULL COMMENT '物流员姓名',
  `logistician_phone` varchar(16) DEFAULT NULL COMMENT '物流员号码',
  `track_number` varchar(64) NOT NULL COMMENT '物流单号',
  `logistics_id` varchar(32) NOT NULL COMMENT '物流商编码',
  `logistics_cost` decimal(10,2) NOT NULL COMMENT '物流费',
  `shipping_time` datetime DEFAULT NULL COMMENT '发送时间',
  `manager` varchar(32) DEFAULT NULL COMMENT '责任人姓名',
  `manager_phone` varchar(16) DEFAULT NULL COMMENT '责任人号码',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  `logistics_name` varchar(32) NOT NULL DEFAULT '' COMMENT '物流商名称',
  PRIMARY KEY (`id`),
  KEY `idx_ono` (`ono`)
) ENGINE=InnoDB AUTO_INCREMENT=12127 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订单物流信息'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_eco_order_pay_info   */
/******************************************/
CREATE TABLE `zpm_eco_order_pay_info` (
  `id` bigint(20) unsigned NOT NULL COMMENT '主键ID',
  `pay_way` varchar(16) NOT NULL COMMENT '支付方式: enjoypay-用呗 balance-余额支付 alipay-支付宝',
  `pay_status` tinyint(4) NOT NULL COMMENT '支付状态: 1-未支付 2-支付成功 3-支付失败 4-余额到账',
  `pay_order_no` varchar(64) DEFAULT NULL COMMENT '支付流水号',
  `pay_request_id` varchar(64) DEFAULT NULL COMMENT '核算调账请求ID',
  `total_pay` bigint(19) NOT NULL DEFAULT '0' COMMENT '实付总金额(积分)',
  `rate_channel` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '渠道手续费',
  `rate_company` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '公司手续费',
  `loan_code` varchar(64) DEFAULT NULL COMMENT '贷款产品编码',
  `loan_product` varchar(32) DEFAULT NULL COMMENT '贷款产品',
  `loan_period` tinyint(3) DEFAULT NULL COMMENT '还款期数（月）',
  `repayment_mode` varchar(32) DEFAULT NULL COMMENT '贷款方式',
  `repayment_day` varchar(4) DEFAULT NULL COMMENT '还款日',
  `loan_purpose` varchar(16) DEFAULT NULL COMMENT '贷款用途',
  `start_pay_time` datetime DEFAULT NULL COMMENT '支付宝发起支付时间',
  `alipay_success_time` datetime DEFAULT NULL COMMENT '支付宝余额到账时间',
  `lending_success_time` datetime DEFAULT NULL COMMENT '推送放款成功时间',
  `pay_success_time` datetime DEFAULT NULL COMMENT '实付成功时间',
  `pay_fail_time` datetime DEFAULT NULL COMMENT '实付失败时间',
  `device_info` varchar(1000) DEFAULT NULL COMMENT '设备信息',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订单支付信息表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_eco_order_receive   */
/******************************************/
CREATE TABLE `zpm_eco_order_receive` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ono` bigint(20) NOT NULL COMMENT '订单编号',
  `receive_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '签收时间',
  `receive_by` varchar(32) NOT NULL COMMENT '签收人',
  `remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(32) DEFAULT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用：1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12239 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_eco_order_return   */
/******************************************/
CREATE TABLE `zpm_eco_order_return` (
  `rno` bigint(20) NOT NULL COMMENT '退订单号',
  `ono` bigint(20) NOT NULL COMMENT '订单编号',
  `return_type` varchar(32) NOT NULL COMMENT '退款类型: DECISION_REFUSE-风控拒绝 PAYMENT_FAILED-支付失败 CUSTOMER_REFUSE-客户拒绝 CUSTOMER_CANCEL-客户取消 MANAGER_CLOSE-客户经理关闭 CONFIRM_TIMEOUT-未确认系统取消 PAY_TIMEOUT-未支付系统取消 GOODS_RETURN-退货退款',
  `return_status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '退订状态: 1-待审核 2-待退货 3-待复核 4-待退款 5-退款中 6-退款失败 7-退货关闭 8-退款成功',
  `return_reason_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '取消原因: 1-拍错 2-商品描述不符 3-商品少件漏发 4-商品破损 5-商品质量问题 6-无法提供发票 7-商品错发',
  `refund_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '退款类型: 0-其他 1-代还退款 2-调账退款 3-额度恢复 4-提现退款',
  `refund_subtotal` bigint(19) NOT NULL DEFAULT '0' COMMENT '申请退款金额(积分)',
  `all_refund_flag` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否整单退：1-是 0-否',
  `apply_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  `refund_time` datetime DEFAULT NULL COMMENT '退款时间',
  `close_time` datetime DEFAULT NULL COMMENT '关闭时间',
  `return_reason` varchar(512) NOT NULL COMMENT '取消原因描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL DEFAULT '-' COMMENT '创建人',
  `update_by` varchar(32) NOT NULL DEFAULT '-' COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`rno`),
  KEY `INDEX_ONO` (`ono`),
  KEY `INDEX_RETURN_TYPE` (`return_type`),
  KEY `INDEX_RETURN_STATUS` (`return_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订单退款申请记录表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_eco_order_return_item   */
/******************************************/
CREATE TABLE `zpm_eco_order_return_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '退货明细ID',
  `rno` bigint(20) unsigned NOT NULL COMMENT '退订单ID',
  `item_id` bigint(20) unsigned NOT NULL COMMENT '退款订单明细ID',
  `return_qty` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '申请退款数量',
  `return_price_subtotal` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '申请金额小计',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `INDEX_RNO` (`rno`),
  KEY `INDEX_ITEM_ID` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6856 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订单退款商品明细表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_eco_product_convert_log   */
/******************************************/
CREATE TABLE `zpm_eco_product_convert_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL COMMENT '商品id',
  `user_no` varchar(32) NOT NULL COMMENT '用户id',
  `ono` bigint(20) NOT NULL COMMENT '订单id',
  `channel` varchar(16) DEFAULT NULL COMMENT '渠道',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31754 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_ecp_product   */
/******************************************/
CREATE TABLE `zpm_ecp_product` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `merchant_id` bigint(20) unsigned NOT NULL COMMENT '所属供应商ID',
  `product_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '商品类型 1-实物 2-虚拟 3-优惠券',
  `category_code` varchar(32) NOT NULL COMMENT '所属分类编码',
  `brand_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属品牌ID',
  `sales_start_time` datetime DEFAULT NULL COMMENT '兑换开始时间',
  `sales_end_time` datetime DEFAULT NULL COMMENT '兑换结束时间',
  `product_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '商品状态 1-待处理 2-待审核 3-已上架 4-已下架',
  `product_no` varchar(64) NOT NULL DEFAULT '' COMMENT '货号',
  `product_name` varchar(128) NOT NULL COMMENT '商品名称',
  `product_sub_name` varchar(128) NOT NULL COMMENT '副标题',
  `product_description` varchar(512) NOT NULL COMMENT '商品介绍',
  `product_show_title` varchar(256) NOT NULL DEFAULT '' COMMENT '商品详情标题',
  `product_show_detail` varchar(5120) NOT NULL DEFAULT '' COMMENT '商品分享描述',
  `share_desc` varchar(256) NOT NULL DEFAULT '' COMMENT '移动端详情',
  `product_sort` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品排序',
  `main_image` varchar(128) NOT NULL DEFAULT '' COMMENT '商品主图URL',
  `convert_frequency` tinyint(4) DEFAULT NULL COMMENT '兑换频率 1-每人每天 2-每人每周 3-每人每月 4-每人兑换上限 5-不限制',
  `convert_number` int(11) DEFAULT NULL COMMENT '兑换次数',
  `convert_item_frequency` tinyint(4) DEFAULT '5' COMMENT '兑换个数限制频率 4-每人兑换上限 5-不限制',
  `convert_item_number` int(11) DEFAULT '0' COMMENT '兑换个数限制',
  `jump_link_url` varchar(1024) DEFAULT NULL COMMENT '兑换跳转链接',
  `coupon_batch_no` varchar(32) DEFAULT NULL COMMENT '优惠券批次号',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `INDEX_PNO_MERCHANT_ID` (`merchant_id`),
  KEY `INDEX_PNO_PRODUCT_STAUTS` (`product_status`),
  KEY `INDEX_PNO_CATEGORY_CODE` (`category_code`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品主档信息表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_ecp_product_change_log   */
/******************************************/
CREATE TABLE `zpm_ecp_product_change_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `operate_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '操作名称：1-新建 2-修改信息 3-范围价格 4-审核 5-上架 6-下架',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  `operate_result` varchar(255) NOT NULL COMMENT '处理结果',
  `operate_remark` varchar(256) DEFAULT NULL COMMENT '处理备注',
  `operator` varchar(40) DEFAULT NULL COMMENT '处理人工号-姓名',
  `channel` varchar(10) DEFAULT NULL COMMENT '渠道',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1792 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品变更记录'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_ecp_product_sales_limit   */
/******************************************/
CREATE TABLE `zpm_ecp_product_sales_limit` (
  `id` bigint(19) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `product_id` bigint(19) unsigned NOT NULL COMMENT '商品ID',
  `cust_limit_unit` char(16) NOT NULL DEFAULT 'DAY' COMMENT '客户限制周期 DAY-天 WEEK-周 ALL-全周期 UNLIMITED-不限购',
  `cust_limit` bigint(19) NOT NULL DEFAULT '1' COMMENT '客户限购数量',
  `product_daily_limit` bigint(19) NOT NULL DEFAULT '1' COMMENT '商品每日限购数量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_PRODUCT_UNQ_PRODUCT_ID` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品限购信息配置表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_ecp_sku   */
/******************************************/
CREATE TABLE `zpm_ecp_sku` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `product_id` bigint(20) unsigned NOT NULL COMMENT '商品ID',
  `stock_qty` int(10) NOT NULL DEFAULT '0' COMMENT '库存',
  `sold_qty` int(10) NOT NULL DEFAULT '0' COMMENT '已售库存',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `selling_price` bigint(19) NOT NULL DEFAULT '0' COMMENT '销售积分',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '采购成本',
  `express_price` bigint(19) NOT NULL DEFAULT '0' COMMENT '统一运费积分',
  `sku_image_url` varchar(128) NOT NULL DEFAULT '-' COMMENT 'sku 图片',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `idx_product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku信息表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_ecp_sku_stock_log   */
/******************************************/
CREATE TABLE `zpm_ecp_sku_stock_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sku_id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'skuID',
  `change_type` varchar(32) NOT NULL COMMENT '出入库类型:ADD-入库 SUBTRACT-出库',
  `qty` int(9) NOT NULL COMMENT '变更数量',
  `before_qty` int(9) NOT NULL COMMENT '操作前库存',
  `after_qty` int(9) NOT NULL COMMENT '操作后库存',
  `remark` varchar(1024) NOT NULL DEFAULT '-' COMMENT '操作备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '修改人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=648 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='sku 库存变更日志表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_ec_category   */
/******************************************/
CREATE TABLE `zpm_ec_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `category_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分类级别-1 - 2 -3',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父级分类ID',
  `category_name` varchar(128) NOT NULL COMMENT '分类名称',
  `category_code` varchar(32) NOT NULL COMMENT '分类编码',
  `category_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用 1-启用 0-停用',
  `category_sort` tinyint(3) NOT NULL DEFAULT '0' COMMENT '排列顺序',
  `category_unit` varchar(16) DEFAULT NULL COMMENT '计量单位',
  `code_tree` varchar(128) NOT NULL DEFAULT '0' COMMENT '分类树形',
  `category_desc` varchar(256) DEFAULT NULL COMMENT '分类描述',
  `file_id` varchar(128) DEFAULT NULL COMMENT 'OSS文件ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `INDEX_PNO_CATEGORY_CODE` (`category_code`)
) ENGINE=InnoDB AUTO_INCREMENT=108110 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品分类表'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_ec_logistics   */
/******************************************/
CREATE TABLE `zpm_ec_logistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logistics_name` varchar(128) DEFAULT NULL COMMENT '公司名称',
  `logistics_sort` tinyint(3) NOT NULL DEFAULT '1' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8649 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='物流商信息'
;

/******************************************/
/*   DatabaseName = cd_point   */
/*   TableName = zpm_ec_merchant   */
/******************************************/
CREATE TABLE `zpm_ec_merchant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `merchant_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型: 1-商家 2-供应商',
  `merchant_code` varchar(20) DEFAULT NULL COMMENT '客户中心分配编号',
  `merchant_no` varchar(64) DEFAULT NULL COMMENT '商家工号',
  `cust_id` varchar(64) DEFAULT NULL COMMENT '信贷系统 custId',
  `virtual_acct_no` varchar(64) DEFAULT NULL COMMENT '虚拟账户ID',
  `seller_id` varchar(64) DEFAULT NULL COMMENT '支付宝商户号',
  `hr_mobile` varchar(16) DEFAULT NULL COMMENT 'HR系统手机号',
  `merchant_name` varchar(128) DEFAULT NULL COMMENT '商家名称',
  `merchant_mobile` varchar(16) DEFAULT NULL COMMENT '商家联系方式',
  `merchant_status` tinyint(2) DEFAULT NULL COMMENT '商家状态 1-运营 0-关停',
  `audit_status` tinyint(2) DEFAULT NULL COMMENT '审核状态 0-待审核 1-审核通过 2-审核不通过',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `county` varchar(20) DEFAULT NULL COMMENT '区',
  `address` varchar(256) DEFAULT NULL COMMENT '详细地址',
  `join_date` datetime DEFAULT NULL COMMENT '入驻时间',
  `end_date` date DEFAULT NULL COMMENT '合作结束日期',
  `merchant_sort` tinyint(4) DEFAULT NULL COMMENT '排序',
  `merchant_desc` varchar(500) DEFAULT NULL COMMENT '商家简介',
  `corporate_name` varchar(32) DEFAULT NULL COMMENT '法人名称',
  `license_no` varchar(64) DEFAULT NULL COMMENT '纳税人识别号',
  `settle_rate` decimal(16,8) DEFAULT NULL COMMENT '结算费率',
  `settle_cycle` tinyint(4) DEFAULT NULL COMMENT '结算周期 码值SETTLE_CYCLE 1-单笔 2-周结 3-月结 4-季结',
  `draw_card_id` varchar(64) DEFAULT NULL COMMENT '放款卡ID',
  `draw_card_no` varchar(64) DEFAULT NULL COMMENT '放款卡号',
  `draw_bank_code` varchar(32) DEFAULT NULL COMMENT '放款银行编号',
  `draw_bank_name` varchar(64) DEFAULT NULL COMMENT '放款银行名称',
  `draw_bank_account` varchar(64) DEFAULT NULL COMMENT '放款户名',
  `bank_province` varchar(64) DEFAULT NULL COMMENT '开户省',
  `bank_province_code` varchar(64) DEFAULT NULL COMMENT '开户省编号',
  `bank_city` varchar(64) DEFAULT NULL COMMENT '开户市',
  `bank_city_code` varchar(64) DEFAULT NULL COMMENT '开户市编号',
  `opening_bank` varchar(128) DEFAULT NULL COMMENT '开户支行',
  `general_taxpayer` tinyint(4) DEFAULT NULL COMMENT '是否一般纳税人: 1-是 0-否',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_by` varchar(32) NOT NULL COMMENT '创建人',
  `update_by` varchar(32) NOT NULL COMMENT '更新人',
  `enabled_flag` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用:1-是 0-否',
  PRIMARY KEY (`id`),
  KEY `index_merchant_code` (`merchant_code`),
  KEY `index_merchant_no` (`merchant_no`),
  KEY `index_hr_mobile` (`hr_mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商家信息主表'
;
