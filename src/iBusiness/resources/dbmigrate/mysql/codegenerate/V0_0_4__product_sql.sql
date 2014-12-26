/*==============================================================*/
/* 仓库信息表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_WAREHOUSE;
CREATE TABLE IB_WAREHOUSE (
  ID                                   varchar(64) NOT NULL,
  WAREHOUSENO           varchar(64) DEFAULT NULL,
  WAREHOUSENAME      varchar(128) DEFAULT NULL,
  WAREHOUSELOCATION varchar(128) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/* 物料分类信息表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIALS_TYPE;
CREATE TABLE IB_MATERIALS_TYPE (
  ID                      varchar(64) NOT NULL,
  TYPENO            varchar(64) ,
  TYPENAME      varchar(128) ,
  PARENTID     varchar(64) ,
  ISLEAF             varchar(8) ,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/* 物料表   */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIALS;
CREATE TABLE IB_MATERIALS (
  ID                            varchar(64) NOT NULL,
  materialTypeNo    varchar(64) ,
  materialNo             varchar(64) ,
  materialName        varchar(128) ,
  model                     varchar(64) ,
  materialPrice        double(12,2) ,
  materialUnit          varchar(8) ,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  原料入库表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIAL_IN;
CREATE TABLE IB_MATERIAL_IN (
  ID varchar(64) NOT NULL,
  EXECUTIONID varchar(64) DEFAULT NULL,
  ASSIGNEEUSER varchar(128) DEFAULT NULL,
  DONEFLAG int(11) DEFAULT '0',
  USERNAME varchar(128) DEFAULT NULL,
  TASKTITLE varchar(256) DEFAULT NULL,
  NODENAME varchar(128) DEFAULT NULL,
  CREATEDATEBPM datetime DEFAULT NULL,
  EVENTDATE datetime DEFAULT NULL,
  SUPPLIERSNAME varchar(64) DEFAULT NULL,
  WAREHOUSENO varchar(64) DEFAULT NULL,
  WAREHOUSENAME varchar(64) DEFAULT NULL,
  TOTALNUM int(10) DEFAULT NULL,
  AMOUNT double(12,2) DEFAULT NULL,
  AMOUNTBIG varchar(64) DEFAULT NULL,
  REMARK varchar(512) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  原料入库信息子表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIAL_IN_S;
CREATE TABLE IB_MATERIAL_IN_S (
  ID varchar(64) NOT NULL,
  PARENTID varchar(64) DEFAULT NULL,
  MATERIALNO varchar(64) DEFAULT NULL,
  MATERIALNAME varchar(128) DEFAULT NULL,
  MATERIALMODEL varchar(64) DEFAULT NULL,
  MATERIALUNIT varchar(16) DEFAULT NULL,
  MATERIALNUM int(10) DEFAULT NULL,
  AMOUNT double(12,2) DEFAULT NULL,
  MANUFACTURENAME varchar(64) DEFAULT NULL,
  REMARK varchar(512) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  原料库存管理表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_WAREHOUSE_MATERIALS;
CREATE TABLE IB_WAREHOUSE_MATERIALS (
  ID                                 varchar(64) NOT NULL,
  MATERIALTYPENO     varchar(64) DEFAULT NULL,
  MATERIALNO             varchar(64) DEFAULT NULL,
  MATERIALNAME       varchar(64) DEFAULT NULL,
  MATERIALMODEL    varchar(64) DEFAULT NULL,
  MATERIALPRICE       double(12,2) DEFAULT NULL,
  MATERIALUNIT        varchar(8) DEFAULT NULL,
  MATERIALNUM        int(10) DEFAULT NULL,
  WAREHOUSENO       varchar(64) DEFAULT NULL,
  WAREHOUSENAME varchar(128) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  (领料)原料出库表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIAL_OUT;
CREATE TABLE IB_MATERIAL_OUT (
  EXECUTIONID varchar(64) DEFAULT NULL,
  ASSIGNEEUSER varchar(128) DEFAULT NULL,
  DONEFLAG int(11) DEFAULT '0',
  ID varchar(64) NOT NULL,
  USERNAME varchar(128) DEFAULT NULL,
  TASKTITLE varchar(256) DEFAULT NULL,
  NODENAME varchar(128) DEFAULT NULL,
  CREATEDATEBPM datetime DEFAULT NULL,
  EVENTDATE datetime DEFAULT NULL,
  BATCHNO varchar(8) DEFAULT NULL,
  WAREHOUSENO varchar(64) DEFAULT NULL,
  PRODUCTNO varchar(64) DEFAULT NULL,
  PRODUCTNAME varchar(256) DEFAULT NULL,
  MATERIALNUM int(10) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
/*==============================================================*/
/*  原料出库信息子表  */
/*==============================================================*/
DROP TABLE IF EXISTS IB_MATERIAL_OUT_S;
CREATE TABLE IB_MATERIAL_OUT_S (
  ID varchar(64) NOT NULL,
  PARENTID varchar(64) DEFAULT NULL,
  MATERIALNO varchar(64) DEFAULT NULL,
  MATERIALNAME varchar(128) DEFAULT NULL,
  MATERIALMODEL varchar(64) DEFAULT NULL,
  MATERIALUNIT varchar(16) DEFAULT NULL,
  MATERIALNUM int(10) DEFAULT NULL,
  MANUFACTURENAME varchar(64) DEFAULT NULL,
  REMARK varchar(512) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=INNODB;
