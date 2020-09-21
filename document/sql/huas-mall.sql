/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/9/20 12:54:32                           */
/*==============================================================*/


drop table if exists admin;

drop table if exists order_details;

drop table if exists orders;

drop table if exists product;

drop table if exists shopping_cart;

drop table if exists sort;

drop table if exists user;

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   adminId              varchar(20) not null comment '����Ա���',
   adminName            varchar(20) not null comment '������',
   password             varchar(10) not null comment '����',
   permissions          int not null comment 'Ȩ��',
   primary key (adminId)
);

/*==============================================================*/
/* Table: order_details                                         */
/*==============================================================*/
create table order_details
(
   detailsId            varchar(20) not null comment '����������',
   orderId              varchar(20) not null comment '�������',
   prold                varchar(20) comment '��Ʒ���',
   price                double not null comment '��Ӧ�۸�',
   count                int not null comment '��������',
   primary key (detailsId)
);

/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   orderId              varchar(20) not null comment '�������',
   orderNo              varchar(20) not null comment '���ɶ����ı��',
   userId               varchar(20) not null comment '��Ա���',
   sendName             varchar(20) not null comment '�ջ�����',
   sendAddress          varchar(20) not null comment '�ջ���ַ',
   sendZip              varchar(8) comment '�ջ��ʱ�',
   sendTel              varchar(11) not null comment '�ջ��˵绰',
   payment              varchar(20) not null comment '���ʽ',
   meno                 varchar(200) comment '��ע˵��',
   time                 datetime not null comment '��������ʱ��',
   tag                  int not null comment '����������',
   primary key (orderId)
);

/*==============================================================*/
/* Table: product                                               */
/*==============================================================*/
create  table product
(
   prold                varchar(20) not null comment '��Ʒ���',
   sorld                varchar(20) not null comment '��Ʒ������',
   proName              varchar(20) not null comment '��Ʒ��',
   saleCount            varchar(20) not null comment '��������',
   image                varchar(100) comment 'ͼƬ·��',
   price                double not null comment '�ɱ��۸�',
   salePrice            double not null comment '���ۼ۸�',
   decript              varchar(200) comment '��Ʒ����',
   saleDate             datetime comment '����ʱ��',
   primary key (prold)
);

/*==============================================================*/
/* Table: shopping_cart                                         */
/*==============================================================*/
create table shopping_cart
(
   id                   varchar(20) not null comment 'id',
   userId               varchar(20) not null comment '��Ա���',
   prold                varchar(20) not null comment '��Ʒ���',
   count                int not null comment '��Ʒ����',
   primary key (id)
);

/*==============================================================*/
/* Table: sort                                                  */
/*==============================================================*/
create table sort
(
   sorld                varchar(20) not null comment '��Ʒ������',
   sorName              varchar(20) not null comment '������',
   primary key (sorld)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   userId               varchar(20) not null comment '��Ա���',
   username             varchar(20) not null comment '��Ա��',
   password             varchar(10) not null comment '����',
   realName             varchar(10) comment '��ʵ����',
   tel                  int not null comment '�绰',
   address              varchar(20) not null comment '��ַ',
   zip                  varchar(8) comment '��������',
   email                varbinary(50) comment '�����ʼ�',
   primary key (userId)
);

alter table order_details add constraint FK_Reference_4 foreign key (orderId)
      references orders (orderId) on delete restrict on update restrict;

alter table order_details add constraint FK_Reference_6 foreign key (prold)
      references product (prold) on delete restrict on update restrict;

alter table orders add constraint FK_Reference_5 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table product add constraint FK_Reference_3 foreign key (sorld)
      references sort (sorld) on delete restrict on update restrict;

alter table shopping_cart add constraint FK_Reference_1 foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table shopping_cart add constraint FK_Reference_2 foreign key (prold)
      references product (prold) on delete restrict on update restrict;

