/* =============================  IB_CONF_COMPONENT 业务模块组件管理表 ---  =============================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('maintaintask0000','maintaintask','工程设备','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('maintaintask00002','maintaintask','表存储设计器','maintaintask0000','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('maintaintask00003','maintaintask','表单设计器','maintaintask0000','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('maintaintask00004','maintaintask','流程表设计器','maintaintask0000','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('maintaintask00005','maintaintask','流程表单设计器','maintaintask0000','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('maintaintask00006','maintaintask','流程设计器','maintaintask0000','Bpm');

/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('maintaintaskOne','工程设备','1','#','URL','4','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('maintaintaskTwo1','工程设备','2','#','URL','1','maintaintaskOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('maintaintaskThree1','检修任务单','3','/maintaintask/maintaintask-list.do','URL','1','maintaintaskTwo1');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('maintaintaskOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('maintaintaskTwo1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('maintaintaskThree1','2');

/* ====================================================================   */
/* ============================= 检修任务单 =============================   */
/* ====================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('maintaintask-maintaintask0001','maintaintask','maintainTask','检修任务单','/maintaintask/maintaintask-list.do',1,1,1,2,2,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('maintaintask','maintainTask','IB_MAINTAINTASK','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('maintaintask','maintainTask','IB_MAINTAINTASK.TASKNO','检修任务单表.任务单号','TASKNO','IB_MAINTAINTASK',1,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('maintaintask','maintainTask','IB_MAINTAINTASK.TASKUSER','检修任务单表.制单人','TASKUSER','IB_MAINTAINTASK',2,'1','','','1','2','2','1','@userName','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('maintaintask','maintainTask','IB_MAINTAINTASK.OVERHAULMETHOD','检修任务单表.检修方式','OVERHAULMETHOD','IB_MAINTAINTASK',3,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('maintaintask','maintainTask','IB_MAINTAINTASK.OVERHAULUSER','检修任务单表.检修人','OVERHAULUSER','IB_MAINTAINTASK',4,'7','','','1','1','2','1','','{"sql":"select DISPLAY_NAME vKey, DISPLAY_NAME vValue from IB_USER_BASE "}');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('maintaintask','maintainTask','IB_MAINTAINTASK.EVENTTIME','检修任务单表.开始日期','EVENTTIME','IB_MAINTAINTASK',5,'4','','','1','1','2','1','@currentDateToStr','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('maintaintask','maintainTask','IB_MAINTAINTASK.OVERHAULPLANDAYS','检修任务单表.计划检修天数','OVERHAULPLANDAYS','IB_MAINTAINTASK',6,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('maintaintask','maintainTask','IB_MAINTAINTASK.PLANCOST','检修任务单表.计划资金','PLANCOST','IB_MAINTAINTASK',7,'1','','','1','1','2','','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('ib_maintaintask0001','maintaintask','IB_MAINTAINTASK','检修任务单表','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_MAINTAINTASK','TASKNO','任务单号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_MAINTAINTASK','TASKUSER','制单人','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_MAINTAINTASK','OVERHAULMETHOD','检修方式','VARCHAR','16','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_MAINTAINTASK','OVERHAULUSER','检修人','VARCHAR','64','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_MAINTAINTASK','EVENTTIME','开始日期','DATE','0','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_MAINTAINTASK','OVERHAULPLANDAYS','计划检修天数','NUMBER','8','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_MAINTAINTASK','PLANCOST','计划资金','NUMBER','12,2','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_MAINTAINTASK','ID','UUID主键','VARCHAR','64','否','',91);
