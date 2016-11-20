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
   user_id              numeric(10,0) comment '������id',
   family_id            numeric(10,0) comment '����id',
   data_id              numeric(10,0) comment '��������id',
   data_type            char(1) comment '��������(1���¼�,2��Ƭ,3˵˵,4��־)',
   table_name           varchar(64) comment '�������ڱ�',
   News_Section         char(10) comment '�ּҰ��',
   status               char(1) comment '���״̬',
   Audit_date           date comment '���ʱ��',
   Audit_staff_id       numeric(10,0) comment '�����(��̨������Ա)',
   primary key (id)
);

alter table family_news comment '�ּ���Ϣ';

/*==============================================================*/
/* Table: person_img                                            */
/*==============================================================*/
create table person_img
(
   user_id              numeric(10,0) comment '�û�id',
   image                varchar(128) comment 'ͷ��',
   upload_date          date comment '�ϴ�ʱ��'
);

alter table person_img comment 'ͷ����Ϣ';

/*==============================================================*/
/* Table: tbl_Family_book                                       */
/*==============================================================*/
create table tbl_Family_book
(
   id                   numeric(10,0) comment 'id',
   code                 varchar(30) comment '����',
   name                 varchar(30) comment '��',
   orderNum             numeric(10,0) comment '����'
);

alter table tbl_Family_book comment '�ټ���';

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

alter table tbl_area comment '����';

/*==============================================================*/
/* Table: tbl_bank_card_info                                    */
/*==============================================================*/
create table tbl_bank_card_info
(
   user_id              numeric(10,0) comment '�û�id',
   card_no              varchar(19) comment '���п���',
   card_type            varchar(1) comment '���п�����',
   bank_code            varchar(30) comment '��������'
);

alter table tbl_bank_card_info comment '���п���Ϣ';

/*==============================================================*/
/* Table: tbl_city                                              */
/*==============================================================*/
create table tbl_city
(
   id                   numeric(10,0) not null comment 'id',
   cityID               numeric(10,0) comment '����id',
   city                 varchar(50) comment '��������',
   fatherID             numeric(10,0) comment 'fatherID',
   primary key (id)
);

alter table tbl_city comment '����';

/*==============================================================*/
/* Table: tbl_classes                                           */
/*==============================================================*/
create table tbl_classes
(
   id                   numeric(10,0) comment 'id',
   code                 varchar(30) comment '����',
   parent_id            numeric(8,0) comment '����id',
   name                 varchar(30) comment '����',
   orderNum             numeric(8,0) comment '����'
);

alter table tbl_classes comment '��С��';

/*==============================================================*/
/* Table: tbl_familyTree                                        */
/*==============================================================*/
create table tbl_familyTree
(
   id                   numeric(10,0) not null comment '����id',
   user_id              numeric(10,0) comment '������id',
   name                 varchar(30) comment '��������',
   family_No            numeric(10,0) comment '���ױ��',
   surname              varchar(10) comment '����',
   birth_province       varchar(5) comment '���׵���ʡ',
   birth_municipality   varchar(15) comment '���׵�����',
   birth_county         varchar(20) comment '���׵�����',
   birth_region         varchar(25) comment '���׵�����',
   power                char(1) comment 'Ȩ��(0˽��,1����)',
   family_password      varchar(30) comment '��������',
   primary key (id)
);

alter table tbl_familyTree comment '��������';

/*==============================================================*/
/* Table: tbl_family_Breaking_News                              */
/*==============================================================*/
create table tbl_family_Breaking_News
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '�û�id',
   family_id            numeric(10,0) comment '����id',
   title                varchar(100) comment '���¼�����',
   content              longtext comment '���¼�����',
   commit_date          date comment '�ύʱ��',
   Audit_date           date comment '���ʱ��',
   Audit_user_id        numeric(10,0) comment '�����',
   status               varchar(1) comment '״̬',
   img                  longtext comment 'ͼƬ��'',''�ָ���ͼƬ',
   primary key (id)
);

alter table tbl_family_Breaking_News comment '������¼�';

/*==============================================================*/
/* Table: tbl_family_photo                                      */
/*==============================================================*/
create table tbl_family_photo
(
   id                   numeric(10,0) not null comment 'id',
   family_id            numeric(10,0) comment '����id',
   id_card              char(18) comment '��Ա���֤',
   photo_type           char(1) comment '��Ƭ����(1ȫ�Ҹ���2��Ա��)',
   img                  varchar(128) comment '��Ƭ·��',
   order_num            numeric(10,0) comment '��Ƭ˳��',
   upload_date          date comment '�ϴ�ʱ��',
   upload_user_id       numeric(10,0) comment '�ϴ���',
   primary key (id)
);

alter table tbl_family_photo comment '������Ƭ';

/*==============================================================*/
/* Table: tbl_message                                           */
/*==============================================================*/
create table tbl_message
(
   id                   numeric(10,0) not null comment 'id',
   id_card              char(18) comment '���֤',
   family_id            numeric(10,0) comment '����id',
   content              varchar(100) comment '����',
   type                 varchar(1) comment '��ʾ���ͣ�1�������룬2�ּ���Ϣץȡ���룬3�ܾ����ѣ�4ͬ�����ѣ�',
   is_look              varchar(1) comment '�Ƿ�鿴��Ϣ',
   create_time          date comment '����ʱ��',
   update_time          date comment '�޸�ʱ��',
   primary key (id)
);

alter table tbl_message comment '��Ϣ';

/*==============================================================*/
/* Table: tbl_person_album                                      */
/*==============================================================*/
create table tbl_person_album
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '�û�id',
   highlight_id         numeric(10,0) comment '����ͼƬid',
   name                 varchar(30) comment '�������',
   order_num            numeric(10,0) comment '����',
   create_time          date comment '����ʱ��',
   update_time          date comment '�޸�ʱ��',
   primary key (id)
);

alter table tbl_person_album comment '���˿ռ����';

/*==============================================================*/
/* Table: tbl_person_baseInfo                                   */
/*==============================================================*/
create table tbl_person_baseInfo
(
   user_id              numeric(10,0) not null comment '�û�id',
   id_card              char(18) not null comment '���֤',
   name                 varchar(30) comment '����',
   sex                  varchar(1) comment '�Ա�(0Ů,1��)',
   birthday             date comment '��������',
   proper_order         varchar(1) comment '����',
   birth_province       varchar(5) comment '������ʡ',
   birth_municipality   varchar(15) comment '��������',
   birth_county         varchar(20) comment '��������',
   birth_region         varchar(25) comment '��������'
);

alter table tbl_person_baseInfo comment '���˻�����Ϣ��';

/*==============================================================*/
/* Table: tbl_person_journal                                    */
/*==============================================================*/
create table tbl_person_journal
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '�û�id',
   title                varchar(50) comment '����',
   content              longtext comment '����',
   img                  longtext comment 'ͼƬ(���ͼƬ��'',''�ָ�)',
   create_time          date comment '����ʱ��',
   update_time          date comment '�޸�ʱ��',
   primary key (id)
);

alter table tbl_person_journal comment '��־';

/*==============================================================*/
/* Table: tbl_person_lifeInfo                                   */
/*==============================================================*/
create table tbl_person_lifeInfo
(
   user_id              numeric(10,0) not null comment '�û�id',
   before_name          varchar(30) comment '������',
   eg_name              varchar(30) comment 'Ӣ����',
   twelve_animals       varchar(2) comment '����',
   constellation        varchar(2) comment '����',
   birth_weight         float comment '��������',
   height               float comment '���',
   weight               float comment '����',
   blood_type           varchar(2) comment 'Ѫ��',
   party_groupings      varchar(10) comment '����',
   faith                varchar(10) comment '����',
   language             varchar(10) comment '����',
   hobbies              varchar(30) comment '��Ȥ����',
   living               varchar(1) comment '����/�ѹ�',
   death_date           date comment '�ѹ�����'
);

alter table tbl_person_lifeInfo comment '����������Ϣ-������Ϣ';

/*==============================================================*/
/* Table: tbl_person_photo                                      */
/*==============================================================*/
create table tbl_person_photo
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '�û�id',
   person_album_id      numeric(10,0) comment '���id',
   name                 varchar(30) comment '����',
   "describe"           varchar(200) comment '����',
   img                  varchar(128) comment 'ͼƬ·��',
   upload_date          date comment '�ϴ�ʱ��',
   update_time          date comment '�޸�ʱ��',
   primary key (id)
);

alter table tbl_person_photo comment '���ͼƬ';

/*==============================================================*/
/* Table: tbl_person_privateInfo                                */
/*==============================================================*/
create table tbl_person_privateInfo
(
   user_id              numeric(10,0) not null comment '�û�id',
   marriages            varchar(1) comment '��ʷ',
   Alipay               varchar(30) comment '֧����',
   WeChat               varchar(30) comment '΢��',
   QQ                   varchar(30) comment 'QQ',
   before_phone         numeric(11,0) comment '���õ绰',
   before_WeChat        varchar(30) comment '����΢��',
   before_QQ            varchar(30) comment '����QQ',
   email                varchar(128) comment '����',
   Graduate_school      varchar(32) comment '��ҵѧУ',
   work_experience      longtext comment '��������'
);

alter table tbl_person_privateInfo comment '����������Ϣ-˽����Ϣ';

/*==============================================================*/
/* Table: tbl_person_say                                        */
/*==============================================================*/
create table tbl_person_say
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '�û�id',
   content              varchar(200) comment '����',
   img                  longtext comment 'ͼƬ(���ͼƬ��'',''�ָ�)',
   create_time          date comment '����ʱ��',
   update_time          date comment '�޸�ʱ��',
   primary key (id)
);

alter table tbl_person_say comment '˵˵';

/*==============================================================*/
/* Table: tbl_proposal                                          */
/*==============================================================*/
create table tbl_proposal
(
   id                   numeric(10,0) not null comment 'id',
   user_id              numeric(10,0) comment '�û�id',
   proposal             longtext comment '����',
   create_time          date comment '����ʱ��',
   primary key (id)
);

alter table tbl_proposal comment '�û������';

/*==============================================================*/
/* Table: tbl_province                                          */
/*==============================================================*/
create table tbl_province
(
   id                   numeric(10,0) not null comment 'id',
   provinceID           numeric(10,0) comment 'ʡ��id',
   province             varchar(50) comment 'ʡ������',
   primary key (id)
);

alter table tbl_province comment 'ʡ��';

/*==============================================================*/
/* Table: tbl_tree_node                                         */
/*==============================================================*/
create table tbl_tree_node
(
   family_id            numeric(10,0) not null comment '����id',
   id_card              char(18) not null comment '��Ա���֤',
   name                 varchar(30) comment '����',
   sex                  char(1) comment '�Ա�',
   proper_order         char(1) comment '����',
   phone                numeric(11,0) comment '�ֻ�',
   email                varchar(128) comment '����',
   living               char(1) comment '����/�ѹ�',
   spouse_id_car        char(18) comment '��ż���֤',
   spouse_name          varchar(30) comment '��ż����',
   spouse_phone         numeric(11,0) comment '��ż�ֻ�',
   parent_id_card       char(18) comment '���ڵ����֤',
   next_id_card         char(18) comment '�¸��ֵܽڵ����֤',
   isfirst              char(1) comment '���ֵܽڵ����Ƿ��ڵ�һ',
   spouse_email         varchar(128) comment '��ż����',
   spouse_living        char(1) comment '��ż����/�ѹ�',
   primary key (id_card, family_id)
);

alter table tbl_tree_node comment '���׳�Ա��';

/*==============================================================*/
/* Table: tbl_user                                              */
/*==============================================================*/
create table tbl_user
(
   user_id              numeric(10,0) not null comment '�û�id',
   phone                numeric(11,0) not null comment '�ֻ�',
   email                varchar(128) not null comment '����',
   password             varchar(30) comment '����',
   is_baseinfo_complete varchar(1) comment '������Ϣ�Ƿ���д����',
   primary key (user_id)
);

alter table tbl_user comment '�û���¼��';

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

