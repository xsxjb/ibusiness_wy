/* ==========================================================================================  */
/* =============================  IB_CONF_COMPONENT 业务模块组件管理表    =============================  */
/* ==========================================================================================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('chargemanage0000','chargemanage','收费管理','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('chargemanage0001','chargemanage','表存储设计器','chargemanage0000','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('chargemanage0002','chargemanage','表单设计器','chargemanage0000','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('chargemanage0003','chargemanage','流程表设计器','chargemanage0000','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('chargemanage0004','chargemanage','流程表单设计器','chargemanage0000','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('chargemanage0005','chargemanage','流程设计器','chargemanage0000','Bpm');
/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('chargemanageOne','收费管理','1','#','URL','4','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('chargemanageTwo1','收费管理','2','#','URL','1','chargemanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('chargemanageThree1','收费项目表','3','/charge_info/charge_info-list.do','URL','1','chargemanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('chargemanageThree2','业主缴费表','3','/charge_pay/charge_pay-list.do','URL','2','chargemanageTwo1');
/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('chargemanageOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('chargemanageTwo1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('chargemanageThree1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('chargemanageThree2','2');

/* ================================================================================   */
/* ================================  业主缴费表      =================================   */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('chargemanage-chargePay0001','chargemanage','chargePay','业主缴费表','/charge_pay/charge_pay-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('chargemanage','chargePay','IB_CHARGE_PAY','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargePay','IB_CHARGE_PAY.PAYID','缴费编号ID','PAYID','IB_CHARGE_PAY',1,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargePay','IB_CHARGE_PAY.CHARGENAME','收费项目名','CHARGENAME','IB_CHARGE_PAY',2,'7','','','1','1','2','1','','{"sql":"select chargeName vKey, chargeName vValue from IB_charge_INFO "}');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargePay','IB_CHARGE_PAY.CHARGESTANDARD','应收金额','CHARGESTANDARD','IB_CHARGE_PAY',3,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargePay','IB_CHARGE_PAY.PAYREAL','实收金额','PAYREAL','IB_CHARGE_PAY',4,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargePay','IB_CHARGE_PAY.PAYBALANCE','欠费金额','PAYBALANCE','IB_CHARGE_PAY',5,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargePay','IB_CHARGE_PAY.CHARGETIME','收费时间','CHARGETIME','IB_CHARGE_PAY',6,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargePay','IB_CHARGE_PAY.OWERNAME','业主名','OWERNAME','IB_CHARGE_PAY',7,'7','','','1','1','2','1','','{"sql":"select ownerName vKey, ownerName vValue from IB_owner_INFO "}');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargePay','IB_CHARGE_PAY.PAYSTATE','缴费状态','PAYSTATE','IB_CHARGE_PAY',8,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargePay','IB_CHARGE_PAY.PAYMONTH','缴费月份','PAYMONTH','IB_CHARGE_PAY',9,'1','','','1','1','2','','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('ib_charge_pay0001','chargemanage','IB_CHARGE_PAY','业主缴费表','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_PAY','PAYID','缴费编号ID','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_PAY','CHARGENAME','收费项目名','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_PAY','CHARGESTANDARD','应收金额','NUMBER','12,2','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_PAY','PAYREAL','实收金额','NUMBER','12,2','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_PAY','PAYBALANCE','欠费金额','NUMBER','12,2','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_PAY','CHARGETIME','收费时间','DATE','0','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_PAY','OWERNAME','业主名','VARCHAR','64','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_PAY','PAYSTATE','缴费状态','VARCHAR','8','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_PAY','PAYMONTH','缴费月份','VARCHAR','8','是','',9);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_PAY','ID','UUID主键','VARCHAR','64','否','',91);

/* ================================================================================   */
/* ================================  收费项目表      =================================   */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('chargemanage-chargeInfo0001','chargemanage','chargeInfo','收费项目表','/charge_info/charge_info-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('chargemanage','chargeInfo','IB_CHARGE_INFO','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargeInfo','IB_CHARGE_INFO.CHARGEID','收费项目编号','CHARGEID','IB_CHARGE_INFO',1,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargeInfo','IB_CHARGE_INFO.CHARGENAME','收费项目名','CHARGENAME','IB_CHARGE_INFO',2,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('chargemanage','chargeInfo','IB_CHARGE_INFO.CHARGESTANDARD','收费标准','CHARGESTANDARD','IB_CHARGE_INFO',3,'5','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('ib_charge_info0001','chargemanage','IB_CHARGE_INFO','收费项目表','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_INFO','CHARGEID','收费项目ID','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_INFO','CHARGENAME','收费项目名','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_INFO','CHARGESTANDARD','收费标准','NUMBER','12,2','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_CHARGE_INFO','ID','UUID主键','VARCHAR','64','否','',91);
/*======= 插入数据 ==========*/
insert into ib_charge_info(CHARGEID,CHARGENAME,CHARGESTANDARD,ID) values ('100001','电梯费',35.00,'100001');
insert into ib_charge_info(CHARGEID,CHARGENAME,CHARGESTANDARD,ID) values ('100002','物业费',100.00,'100002');
