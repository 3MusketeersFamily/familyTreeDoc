/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/11/20 19:23:31                          */
/*==============================================================*/


drop table if exists family_news;

drop table if exists person_img;

drop table if exists tbl_Family_book;

drop table if exists tbl_area;

drop table if exists tbl_bank_card_info;

drop table if exists tbl_city;

drop table if exists tbl_classes;

drop table if exists tbl_familyTree;

drop table if exists tbl_family_Breaking_News;

drop table if exists tbl_family_photo;

drop table if exists tbl_message;

drop table if exists tbl_person_album;

drop table if exists tbl_person_baseInfo;

drop table if exists tbl_person_journal;

drop table if exists tbl_person_lifeInfo;

drop table if exists tbl_person_photo;

drop table if exists tbl_person_privateInfo;

drop table if exists tbl_person_say;

drop table if exists tbl_proposal;

drop table if exists tbl_province;

drop table if exists tbl_tree_node;

drop table if exists tbl_user;

/*==============================================================*/
/* Table: family_news                                           */
/*==============================================================*/
create table family_news
(
   id                   char(10) not null comment 'id',
   user_id              numeric(10,0) comment '推送人id',
   family_id            numeric(10,0) comment '家谱id',
   data_id              numeric(10,0) comment '推送数据id',
   data_type            char(1) comment '数据类型(1大事件,2照片,3说说,4日志)',
   table_name           varchar(64) comment '数据所在表',
   News_Section         char(10) comment '乐家板块',
   status               char(1) comment '审核状态',
   Audit_date           date comment '审核时间',
   Audit_staff_id       numeric(10,0) comment '审核人(后台工作人员)',
   primary key (id)
);

alter table family_news comment '乐家信息';

/*==============================================================*/
/* Table: person_img                                            */
/*==============================================================*/
create table person_img
(
   user_id              numeric(10,0) comment '用户id',
   image                varchar(128) comment '头像',
   upload_date          date comment '上传时间'
);

alter table person_img comment '头像信息';

/*==============================================================*/
/* Table: tbl_Family_book                                       */
/*==============================================================*/
create table tbl_Family_book
(
   id                   numeric(10,0) comment 'id',
   code                 varchar(30) comment '编码',
   name                 varchar(30) comment '姓',
   orderNum             numeric(10,0) comment '排序'
);

alter table tbl_Family_book comment '百家姓';

/*==============================================================*/
/* Table: tbl_area                                              */
/*==============================================================*/
create table tbl_area
(
   id                   numeric(10,0) not null comment 'id',
   areaID               numeric(10,0) comment 'areaID',
   area                 numeric(10,0) comment 'area',
   fatherID             numeric(10,0) comment 'fatherID',
   primary key (id)
);

alter table tbl_area comment '县区';

/*==============================================================*/
/* Table: tbl_bank_card_info                                    */
/*==============================================================*/
create table tbl_bank_card_info
(
   user_id              numeric(10,0) comment '用户id',
   card_no              varchar(19) comment '银行卡号',
   card_type            varchar(1) comment '银行卡类型',
   bank_code            varchar(30) comment '所属银行'
);

alter table tbl_bank_card_info comment '银行卡信息';

/*==============================================================*/
/* Table: tbl_city                                              */
/*==============================================================*/
create table tbl_city
(
   id                   numeric(10,0) not null comment 'id',
   cityID               numeric(10,0) comment '城市id',
   city                 varchar(50) comment '城市名称',
   fatherID             numeric(10,0) comment 'fatherID',
   primary key (id)
);

alter table tbl_city comment '城市';

/*==============================================================*/
/* Table: tbl_classes                                           */
/*==============================================================*/
create table tbl_classes
(
   id                   numeric(10,0) comment 'id',
   code                 varchar(30) comment '代码',
   parent_id            numeric(8,0) comment '父级id',
   name                 varchar(30) comment '名称',
   orderNum             numeric(8,0) comment '排序'
);

alter table tbl_classes comment '大小类';

/*==============================================================*/
/* Table: tbl_familyTree                                        */
/*==============================================================*/
create table tbl_familyTree
(
   id                   numeric(10,0) not null comment '家谱id',
   user_id              numeric(10,0) comment '创建人id',
   name                 varchar(30) comment '家谱名称',
   family_No            numeric(10,0) comment '家谱编号',
   surname              varchar(10) comment '姓氏',
   birth_province       varchar(5) comment '家谱地区省',
   birth_municipality   varchar(15) comment '家谱地区市',
   birth_county         varchar(20) comment '家谱地区县',
   birth_region         varchar(25) comment '家谱地区区',
   power                char(1) comment '权限(0私有,1公开)',
   family_password      varchar(30) comment '家谱密码',
   primary key (id)
);

alter table tbl_familyTree comment '家谱树表';

/*==============================================================*/
/* Table: tbl_family_Breaking_News                              */
/*==============================================================*/
create table tbl_family_Breaking_News
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '用户id',
   family_id            numeric(10,0) comment '家谱id',
   title                varchar(100) comment '大事件名称',
   content              longtext comment '大事件内容',
   commit_date          date comment '提交时间',
   Audit_date           date comment '审核时间',
   Audit_user_id        numeric(10,0) comment '审核人',
   status               varchar(1) comment '状态',
   img                  longtext comment '图片用'',''分割多个图片',
   primary key (id)
);

alter table tbl_family_Breaking_News comment '家族大事件';

/*==============================================================*/
/* Table: tbl_family_photo                                      */
/*==============================================================*/
create table tbl_family_photo
(
   id                   numeric(10,0) not null comment 'id',
   family_id            numeric(10,0) comment '家谱id',
   id_card              char(18) comment '成员身份证',
   photo_type           char(1) comment '照片类型(1全家福，2成员照)',
   img                  varchar(128) comment '照片路径',
   order_num            numeric(10,0) comment '照片顺序',
   upload_date          date comment '上传时间',
   upload_user_id       numeric(10,0) comment '上传人',
   primary key (id)
);

alter table tbl_family_photo comment '家谱照片';

/*==============================================================*/
/* Table: tbl_message                                           */
/*==============================================================*/
create table tbl_message
(
   id                   numeric(10,0) not null comment 'id',
   id_card              char(18) comment '身份证',
   family_id            numeric(10,0) comment '家谱id',
   content              varchar(100) comment '内容',
   type                 varchar(1) comment '提示类型（1加入邀请，2乐家信息抓取申请，3拒绝提醒，4同意提醒）',
   is_look              varchar(1) comment '是否查看信息',
   create_time          date comment '创建时间',
   update_time          date comment '修改时间',
   primary key (id)
);

alter table tbl_message comment '消息';

/*==============================================================*/
/* Table: tbl_person_album                                      */
/*==============================================================*/
create table tbl_person_album
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '用户id',
   highlight_id         numeric(10,0) comment '封面图片id',
   name                 varchar(30) comment '相册名称',
   order_num            numeric(10,0) comment '排序',
   create_time          date comment '创建时间',
   update_time          date comment '修改时间',
   primary key (id)
);

alter table tbl_person_album comment '个人空间相册';

/*==============================================================*/
/* Table: tbl_person_baseInfo                                   */
/*==============================================================*/
create table tbl_person_baseInfo
(
   user_id              numeric(10,0) not null comment '用户id',
   id_card              char(18) not null comment '身份证',
   name                 varchar(30) comment '姓名',
   sex                  varchar(1) comment '性别(0女,1男)',
   birthday             date comment '出生日期',
   proper_order         varchar(1) comment '排行',
   birth_province       varchar(5) comment '出生地省',
   birth_municipality   varchar(15) comment '出生地市',
   birth_county         varchar(20) comment '出生地县',
   birth_region         varchar(25) comment '出生地区'
);

alter table tbl_person_baseInfo comment '个人基本信息表';

/*==============================================================*/
/* Table: tbl_person_journal                                    */
/*==============================================================*/
create table tbl_person_journal
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '用户id',
   title                varchar(50) comment '标题',
   content              longtext comment '内容',
   img                  longtext comment '图片(多个图片用'',''分割)',
   create_time          date comment '创建时间',
   update_time          date comment '修改时间',
   primary key (id)
);

alter table tbl_person_journal comment '日志';

/*==============================================================*/
/* Table: tbl_person_lifeInfo                                   */
/*==============================================================*/
create table tbl_person_lifeInfo
(
   user_id              numeric(10,0) not null comment '用户id',
   before_name          varchar(30) comment '曾用名',
   eg_name              varchar(30) comment '英文名',
   twelve_animals       varchar(2) comment '属相',
   constellation        varchar(2) comment '星座',
   birth_weight         float comment '出生重量',
   height               float comment '身高',
   weight               float comment '体重',
   blood_type           varchar(2) comment '血型',
   party_groupings      varchar(10) comment '党派',
   faith                varchar(10) comment '信仰',
   language             varchar(10) comment '语言',
   hobbies              varchar(30) comment '兴趣爱好',
   living               varchar(1) comment '健在/已故',
   death_date           date comment '已故日期'
);

alter table tbl_person_lifeInfo comment '其他个人信息-生活信息';

/*==============================================================*/
/* Table: tbl_person_photo                                      */
/*==============================================================*/
create table tbl_person_photo
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '用户id',
   person_album_id      numeric(10,0) comment '相册id',
   name                 varchar(30) comment '名称',
   "describe"           varchar(200) comment '描述',
   img                  varchar(128) comment '图片路劲',
   upload_date          date comment '上传时间',
   update_time          date comment '修改时间',
   primary key (id)
);

alter table tbl_person_photo comment '相册图片';

/*==============================================================*/
/* Table: tbl_person_privateInfo                                */
/*==============================================================*/
create table tbl_person_privateInfo
(
   user_id              numeric(10,0) not null comment '用户id',
   marriages            varchar(1) comment '婚史',
   Alipay               varchar(30) comment '支付宝',
   WeChat               varchar(30) comment '微信',
   QQ                   varchar(30) comment 'QQ',
   before_phone         numeric(11,0) comment '曾用电话',
   before_WeChat        varchar(30) comment '曾用微信',
   before_QQ            varchar(30) comment '曾用QQ',
   email                varchar(128) comment '邮箱',
   Graduate_school      varchar(32) comment '毕业学校',
   work_experience      longtext comment '工作经历'
);

alter table tbl_person_privateInfo comment '其他个人信息-私人信息';

/*==============================================================*/
/* Table: tbl_person_say                                        */
/*==============================================================*/
create table tbl_person_say
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '用户id',
   content              varchar(200) comment '内容',
   img                  longtext comment '图片(多个图片用'',''分割)',
   create_time          date comment '创建时间',
   update_time          date comment '修改时间',
   primary key (id)
);

alter table tbl_person_say comment '说说';

/*==============================================================*/
/* Table: tbl_proposal                                          */
/*==============================================================*/
create table tbl_proposal
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '用户id',
   proposal             longtext comment '建议',
   create_time          date comment '创建时间',
   primary key (id)
);

alter table tbl_proposal comment '用户建议表';

/*==============================================================*/
/* Table: tbl_province                                          */
/*==============================================================*/
create table tbl_province
(
   id                   numeric(10,0) not null comment 'id',
   provinceID           numeric(10,0) comment '省份id',
   province             varchar(50) comment '省份名称',
   primary key (id)
);

alter table tbl_province comment '省份';

/*==============================================================*/
/* Table: tbl_tree_node                                         */
/*==============================================================*/
create table tbl_tree_node
(
   family_id            numeric(10,0) not null comment '家谱id',
   id_card              char(18) not null comment '成员身份证',
   name                 varchar(30) comment '姓名',
   sex                  char(1) comment '性别',
   proper_order         char(1) comment '排行',
   phone                numeric(11,0) comment '手机',
   email                varchar(128) comment '邮箱',
   living               char(1) comment '健在/已故',
   spouse_id_car        char(18) comment '配偶身份证',
   spouse_name          varchar(30) comment '配偶姓名',
   spouse_phone         numeric(11,0) comment '配偶手机',
   parent_id_card       char(18) comment '父节点身份证',
   next_id_card         char(18) comment '下个兄弟节点身份证',
   isfirst              char(1) comment '在兄弟节点中是否在第一',
   spouse_email         varchar(128) comment '配偶邮箱',
   spouse_living        char(1) comment '配偶健在/已故',
   primary key (id_card, family_id)
);

alter table tbl_tree_node comment '家谱成员表';

/*==============================================================*/
/* Table: tbl_user                                              */
/*==============================================================*/
create table tbl_user
(
   user_id              numeric(10,0) not null comment '用户id',
   phone                numeric(11,0) not null comment '手机',
   email                varchar(128) not null comment '邮箱',
   password             varchar(30) comment '密码',
   is_baseinfo_complete varchar(1) comment '基本信息是否填写完整',
   primary key (user_id)
);

alter table tbl_user comment '用户登录表';

alter table family_news add constraint FK_Reference_11 foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table family_news add constraint FK_Reference_12 foreign key (family_id)
      references tbl_familyTree (id) on delete restrict on update restrict;

alter table person_img add constraint FK_Reference_6 foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_bank_card_info add constraint FK_Reference_15 foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_familyTree add constraint FK_Reference_8 foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_family_Breaking_News add constraint FK_Reference_10 foreign key (family_id)
      references tbl_familyTree (id) on delete restrict on update restrict;

alter table tbl_family_Breaking_News add constraint FK_Reference_9 foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_family_photo add constraint FK_Reference_13 foreign key (family_id)
      references tbl_familyTree (id) on delete restrict on update restrict;

alter table tbl_family_photo add constraint FK_Reference_14 foreign key (upload_user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_message add constraint FK_Reference_21 foreign key (family_id)
      references tbl_familyTree (id) on delete restrict on update restrict;

alter table tbl_person_album add constraint FK_Reference_18 foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_person_baseInfo add constraint FK_tbl_person_baseInfo_tbl_user_user_id_FK foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_person_journal add constraint FK_Reference_20 foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_person_lifeInfo add constraint FK_tbl_person_lifeInfo_tbl_user_user_id_FK foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_person_photo add constraint FK_Reference_16 foreign key (person_album_id)
      references tbl_person_album (id) on delete restrict on update restrict;

alter table tbl_person_photo add constraint FK_Reference_17 foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_person_privateInfo add constraint FK_tbl_person_privateInfo_tbl_user_user_id_FK foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_person_say add constraint FK_Reference_19 foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_proposal add constraint FK_tbl_proposal_tbl_user_user_id_FK foreign key (user_id)
      references tbl_user (user_id) on delete restrict on update restrict;

alter table tbl_tree_node add constraint FK_Reference_7 foreign key (family_id)
      references tbl_familyTree (id) on delete restrict on update restrict;

