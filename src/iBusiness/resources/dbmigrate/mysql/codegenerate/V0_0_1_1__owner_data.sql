/* ==========================================================================================  */
/* =============================  IB_CONF_COMPONENT 业务模块组件管理表    =============================  */
/* ==========================================================================================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('ownermanage0000','ownermanage','业主管理','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('ownermanage0001','ownermanage','表存储设计器','ownermanage0000','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('ownermanage0002','ownermanage','表单设计器','ownermanage0000','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('ownermanage0003','ownermanage','流程表设计器','ownermanage0000','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('ownermanage0004','ownermanage','流程表单设计器','ownermanage0000','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('ownermanage0005','ownermanage','流程设计器','ownermanage0000','Bpm');
/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('ownermanageOne','业主管理','1','#','URL','5','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('ownermanageTwo1','业主管理','2','#','URL','1','ownermanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('ownermanageThree1','楼栋信息表','3','/house_info/house_info-list.do','URL','1','ownermanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('ownermanageThree2','房间信息','3','/room_info/room_info-list.do','URL','2','ownermanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME, MENUORDER,PARENTID) VALUES('ownermanageThree3','业主信息','3','/owner_info/owner_info-list.do','URL','3','ownermanageTwo1');
/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('ownermanageOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('ownermanageTwo1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('ownermanageThree1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('ownermanageThree2','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('ownermanageThree3','2');

/* ================================================================================   */
/* ================================  业主信息表      =================================   */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('ownermanage-ownerInfo0001','ownermanage','ownerInfo','业主信息','/owner_info/owner_info-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('ownermanage','ownerInfo','IB_OWNER_FAMILY','sub');
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('ownermanage','ownerInfo','IB_OWNER_INFO','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_FAMILY.OWNERID','业主编号','OWNERID','IB_OWNER_FAMILY',1,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_FAMILY.OWNERFAMILYID','业主成员编号','OWNERFAMILYID','IB_OWNER_FAMILY',2,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_FAMILY.OWNERFAMILYNAME','业主成员姓名','OWNERFAMILYNAME','IB_OWNER_FAMILY',3,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_FAMILY.OWNERFAMILYSEX','业主的性别','OWNERFAMILYSEX','IB_OWNER_FAMILY',4,'6','','','1','1','2','1','','[{"key":"1","value":"男"},{"key":"2","value":"女"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_FAMILY.OWNERFAMILYAGE','业主的年龄','OWNERFAMILYAGE','IB_OWNER_FAMILY',5,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_FAMILY.OWNERFAMILYTEL','业主联系电话','OWNERFAMILYTEL','IB_OWNER_FAMILY',6,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_FAMILY.OWNERFAMILYWORKPLACE','业主工作地','OWNERFAMILYWORKPLACE','IB_OWNER_FAMILY',7,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.OWNERID','业主编号','OWNERID','IB_OWNER_INFO',1,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.OWNERNAME','业主姓名','OWNERNAME','IB_OWNER_INFO',2,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.OWNERLOGINNAME','业主登录名','OWNERLOGINNAME','IB_OWNER_INFO',3,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.OWNERPASSWORD','业主登录密码','OWNERPASSWORD','IB_OWNER_INFO',4,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.OWNERSEX','业主的性别','OWNERSEX','IB_OWNER_INFO',5,'6','','','1','1','2','1','','[{"key":"1","value":"男"},{"key":"2","value":"女"}]');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.OWNERAGE','业主的年龄','OWNERAGE','IB_OWNER_INFO',6,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.HOUSEID','业主所属楼栋','HOUSEID','IB_OWNER_INFO',7,'7','','','1','1','2','1','','{"sql":"select houseName vKey, houseName vValue from IB_house_INFO "}');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.ROOMID','业主房间号','ROOMID','IB_OWNER_INFO',8,'7','','','1','1','2','1','','{"sql":"select roomName vKey, roomName vValue from IB_room_INFO "}');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.OWNERIDCARD','业主身份证号','OWNERIDCARD','IB_OWNER_INFO',9,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.OWNERTEL','业主联系电话','OWNERTEL','IB_OWNER_INFO',10,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.OWNERHOMEPLACE','业主籍贯','OWNERHOMEPLACE','IB_OWNER_INFO',11,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','ownerInfo','IB_OWNER_INFO.OWNERWORKPLACE','业主工作地','OWNERWORKPLACE','IB_OWNER_INFO',12,'2','','','1','1','2','1','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('ib_owner_family0001','ownermanage','IB_OWNER_FAMILY','业主成员信息表','2','null',2);
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('ib_owner_info0001','ownermanage','IB_OWNER_INFO','业主表','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_FAMILY','OWNERID','业主编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_FAMILY','OWNERFAMILYID','业主成员编号','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_FAMILY','OWNERFAMILYNAME','业主成员姓名','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_FAMILY','OWNERFAMILYSEX','业主的性别','VARCHAR','8','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_FAMILY','OWNERFAMILYAGE','业主的年龄','NUMBER','8','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_FAMILY','OWNERFAMILYTEL','业主联系电话','VARCHAR','32','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_FAMILY','OWNERFAMILYWORKPLACE','业主工作地','VARCHAR','128','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_FAMILY','ID','UUID主键','VARCHAR','64','否','',91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_FAMILY','PARENTID','主表UUID','VARCHAR','64','否','',92);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','OWNERID','业主编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','OWNERNAME','业主姓名','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','OWNERLOGINNAME','业主登录名','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','OWNERPASSWORD','业主登录密码','VARCHAR','32','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','OWNERSEX','业主的性别','VARCHAR','8','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','OWNERAGE','业主的年龄','NUMBER','8','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','HOUSEID','业主所属楼栋','VARCHAR','8','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','ROOMID','业主房间号','VARCHAR','8','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','OWNERIDCARD','业主身份证号','VARCHAR','32','是','',9);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','OWNERTEL','业主联系电话','VARCHAR','32','是','',10);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','OWNERHOMEPLACE','业主籍贯','VARCHAR','64','是','',11);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','OWNERWORKPLACE','业主工作地','VARCHAR','64','是','',12);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_OWNER_INFO','ID','UUID主键','VARCHAR','64','否','',91);
/*======= 插入数据 ==========*/
insert into ib_owner_info(OWNERID,OWNERNAME,OWNERLOGINNAME,OWNERPASSWORD,OWNERSEX,OWNERAGE,HOUSEID,ROOMID,OWNERIDCARD,OWNERTEL,OWNERHOMEPLACE,OWNERWORKPLACE,ID) values ('021902001','张三','021902001','123','1',34,'2#楼','2#楼19层2室','230102198888888888','13313333333','哈尔滨','哈尔滨的 啊啊啊','0e144a98-44e2-44ae-b127-757d3f150400');

/* ================================================================================   */
/* ================================  房间信息表      =================================   */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('ownermanage-roomInfo','ownermanage','roomInfo','房间信息','/room_info/room_info-list.do',1,2,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('ownermanage','roomInfo','IB_ROOM_INFO','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','roomInfo','IB_ROOM_INFO.ROOMID','房间编号','ROOMID','IB_ROOM_INFO',1,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','roomInfo','IB_ROOM_INFO.ROOMNAME','房间名','ROOMNAME','IB_ROOM_INFO',2,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','roomInfo','IB_ROOM_INFO.HOUSEID','所属楼栋编号','HOUSEID','IB_ROOM_INFO',3,'7','','','1','1','2','1','','{"sql":"select houseName vKey, houseName vValue from IB_house_INFO "}');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','roomInfo','IB_ROOM_INFO.OWNERID','业主编号','OWNERID','IB_ROOM_INFO',4,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','roomInfo','IB_ROOM_INFO.ENTERTIME','入住时间','ENTERTIME','IB_ROOM_INFO',5,'3','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','roomInfo','IB_ROOM_INFO.ROOMTYPE','房型','ROOMTYPE','IB_ROOM_INFO',6,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','roomInfo','IB_ROOM_INFO.ROOMAREA','建筑面积','ROOMAREA','IB_ROOM_INFO',7,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','roomInfo','IB_ROOM_INFO.ROOMPURPOSE','房间用途','ROOMPURPOSE','IB_ROOM_INFO',8,'1','','','1','1','2','','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('ib_room_info0001','ownermanage','IB_ROOM_INFO','房间信息表','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ROOM_INFO','ROOMID','房间编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ROOM_INFO','ROOMNAME','房间名','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ROOM_INFO','HOUSEID','所属楼栋编号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ROOM_INFO','OWNERID','业主编号','VARCHAR','64','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ROOM_INFO','ENTERTIME','入住时间','DATE','0','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ROOM_INFO','ROOMTYPE','房型','VARCHAR','64','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ROOM_INFO','ROOMAREA','建筑面积','NUMBER','12,2','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ROOM_INFO','ROOMPURPOSE','房间用途','VARCHAR','64','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_ROOM_INFO','ID','UUID主键','VARCHAR','64','否','',91);
/*======= 插入数据 ==========*/
insert into ib_room_info(ROOMID,ROOMNAME,HOUSEID,OWNERID,ENTERTIME,ROOMTYPE,ROOMAREA,ROOMPURPOSE,ID) values ('011201','1#楼12层1室','1#楼','011201001','2014-12-11 00:00:00','南北通透',120.00,'住宅','86ccd4d0-f66d-4126-bc54-e146a321c923');
insert into ib_room_info(ROOMID,ROOMNAME,HOUSEID,OWNERID,ENTERTIME,ROOMTYPE,ROOMAREA,ROOMPURPOSE,ID) values ('021902','2#楼19层2室','2#楼','021902','2014-12-10 00:00:00','2室一厅',80.00,'住宅','e7a5704e-0f6c-465b-b0a7-cbfb9dfca016');

/* ================================================================================   */
/* ================================  楼栋信息表      =================================   */
/* ================================================================================   */
/*======= 表单 ==========*/
 insert into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL, ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('ownermanage-houseInfo0001','ownermanage','houseInfo','楼栋信息表','/house_info/house_info-list.do',1,1,1,1,1,2,2);
/*======= 表单对应表 ==========*/
insert into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('ownermanage','houseInfo','IB_HOUSE_INFO','main');
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','houseInfo','IB_HOUSE_INFO.HOUSEID','楼栋信息表.楼栋编号','HOUSEID','IB_HOUSE_INFO',1,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','houseInfo','IB_HOUSE_INFO.HOUSENAME','楼栋名','HOUSENAME','IB_HOUSE_INFO',2,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','houseInfo','IB_HOUSE_INFO.BUILDSTARTTIME','开工时间','BUILDSTARTTIME','IB_HOUSE_INFO',3,'3','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','houseInfo','IB_HOUSE_INFO.BUILDENDTIME','竣工时间','BUILDENDTIME','IB_HOUSE_INFO',4,'3','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','houseInfo','IB_HOUSE_INFO.HOUSEBUG','楼栋信息表.漏洞信息','HOUSEBUG','IB_HOUSE_INFO',5,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('ownermanage','houseInfo','IB_HOUSE_INFO.HOUSEAREA','楼栋信息表.建筑面积','HOUSEAREA','IB_HOUSE_INFO',6,'1','','','1','1','2','','','');
/*======= 表 ==========*/
insert into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE, PARENTTABLEID,ISBPMTABLE) values ('ib_house_info0001','ownermanage','IB_HOUSE_INFO','楼栋信息表','1','null',2);
/*======= 表字段 ==========*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_HOUSE_INFO','HOUSEID','楼栋编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_HOUSE_INFO','HOUSENAME','楼栋名','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_HOUSE_INFO','BUILDSTARTTIME','开工时间','DATE','0','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_HOUSE_INFO','BUILDENDTIME','竣工时间','DATE','0','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_HOUSE_INFO','HOUSEBUG','漏洞信息','VARCHAR','512','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_HOUSE_INFO','HOUSEAREA','建筑面积','NUMBER','12,2','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize, isNull,defaultValue,columnNo) values ('IB_HOUSE_INFO','ID','UUID主键','VARCHAR','64','否','',91);
/*======= 插入数据 ==========*/
insert into ib_house_info(HOUSEID,HOUSENAME,BUILDSTARTTIME,BUILDENDTIME,HOUSEBUG,HOUSEAREA,ID) values ('10001','1#楼','2010-01-01 00:00:00','2014-05-01 00:00:00','啊啊啊',10000.00,'841a50cd-35d6-4bcb-9e2f-774495df06ed');
insert into ib_house_info(HOUSEID,HOUSENAME,BUILDSTARTTIME,BUILDENDTIME,HOUSEBUG,HOUSEAREA,ID) values ('10002','2#楼','2011-02-01 00:00:00','2014-12-02 00:00:00','WWW',200000.00,'d222afa3-3c68-425a-a1bb-9ec2e8fb0351');
