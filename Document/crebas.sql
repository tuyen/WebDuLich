/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     9/30/2015 11:27:37 AM                        */
/*==============================================================*/


drop table if exists CATEGORY;

drop table if exists COMMENT;

drop table if exists LOCATION;

drop table if exists POST;

drop table if exists TOURISTPLACE;

drop table if exists USER;

/*==============================================================*/
/* Table: CATEGORY                                              */
/*==============================================================*/
create table CATEGORY
(
   CATEGORYID           int not null,
   CATEGORYNAME         text,
   primary key (CATEGORYID)
);

/*==============================================================*/
/* Table: COMMENT                                               */
/*==============================================================*/
create table COMMENT
(
   USERID               int not null,
   POSTID               int not null,
   COMMENTCONTENT       text,
   DATECOMMENT          datetime,
   primary key (USERID, POSTID)
);

/*==============================================================*/
/* Table: LOCATION                                              */
/*==============================================================*/
create table LOCATION
(
   LOCATIONID           int not null,
   NAME                 text,
   DESCRIPTION          text,
   primary key (LOCATIONID)
);

/*==============================================================*/
/* Table: POST                                                  */
/*==============================================================*/
create table POST
(
   POSTID               int not null,
   CATEGORYID           int not null,
   USERID               int not null,
   TITLE                text,
   CONTENT              text,
   DATE                 datetime,
   PRICE                text,
   VIEWS                int,
   primary key (POSTID)
);

/*==============================================================*/
/* Table: TOURISTPLACE                                          */
/*==============================================================*/
create table TOURISTPLACE
(
   POSTID               int not null,
   LOCATIONID           int not null,
   primary key (POSTID, LOCATIONID)
);

/*==============================================================*/
/* Table: USER                                                  */
/*==============================================================*/
create table USER
(
   USERID               int not null,
   FULLNAME             text,
   BIRTHDAY             date,
   EMAIL                char(100),
   PASSWORD             char(100),
   LOGINTOKEN           char(100),
   ACCOUNTTYPE          varchar(10),
   PHONE                char(15),
   ADDRESS              text,
   COMPANYNAME          text,
   COMPANYDESCRIPTION   text,
   STATUS               varchar(5),
   COMFIRRMCODE         varchar(50),
   AVATAR               varchar(50),
   primary key (USERID)
);

alter table COMMENT add constraint FK_COMMENT foreign key (USERID)
      references USER (USERID) on delete restrict on update restrict;

alter table COMMENT add constraint FK_COMMENT2 foreign key (POSTID)
      references POST (POSTID) on delete restrict on update restrict;

alter table POST add constraint FK_RELATIONSHIP_1 foreign key (USERID)
      references USER (USERID) on delete restrict on update restrict;

alter table POST add constraint FK_RELATIONSHIP_2 foreign key (CATEGORYID)
      references CATEGORY (CATEGORYID) on delete restrict on update restrict;

alter table TOURISTPLACE add constraint FK_TOURISTPLACE foreign key (POSTID)
      references POST (POSTID) on delete restrict on update restrict;

alter table TOURISTPLACE add constraint FK_TOURISTPLACE2 foreign key (LOCATIONID)
      references LOCATION (LOCATIONID) on delete restrict on update restrict;

