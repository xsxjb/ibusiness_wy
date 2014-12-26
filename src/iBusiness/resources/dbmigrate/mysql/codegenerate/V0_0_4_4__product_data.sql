/* ==========================================================================================  */
/* =============================  IB_CONF_COMPONENT 业务模块组件管理表    =============================  */
/* ==========================================================================================  */
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0000','productmanage','产品管理','0','sModule');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0001','productmanage','表存储设计器','productmanage0000','Table');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0002','productmanage','表单设计器','productmanage0000','Form');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0003','productmanage','流程表设计器','productmanage0000','BpmTable');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0004','productmanage','流程表单设计器','productmanage0000','BpmForm');
INSERT INTO IB_CONF_COMPONENT(ID,PACKAGENAME,MODULENAME,PARENTID,TYPEID) VALUES('productmanage0005','productmanage','流程设计器','productmanage0000','Bpm');
/* ================= 菜单管理表  ==================   */
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageOne','采购库存管理','1','#','URL','6','0');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageTwo1','物料信息','2','#','URL','1','productmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageTwo2','物料管理','2','#','URL','1','productmanageOne');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree31','仓库信息','3','/warehouse/warehouse-list.do','URL','1','productmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree101','物料分类(树)','3','/materialsTypeTree/tree-list.do','URL','1','productmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree12','物料管理','3','/materials/materials-list.do','URL','2','productmanageTwo1');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree21','物料入库流程','3','/material_in/material_in-list.do?flowType=0&flowId=materialin001','URL','1','productmanageTwo2');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree22','(领料)物料出库','3','/material_out/material_out-list.do?flowType=0&flowId=materialOut001','URL','2','productmanageTwo2');
INSERT INTO IB_MENU(ID,MENUNAME,MENULEVEL,MENUURL,MENUIFRAME,MENUORDER,PARENTID) VALUES('productmanageThree23','物料库存管理','3','/warehouse_materials/warehouse_materials-list.do','URL','3','productmanageTwo2');
/*===============   菜单和角色模板关联表  =============================*/
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageOne','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageTwo1','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageTwo2','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree101','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree12','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree21','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree22','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree23','2');
INSERT INTO IB_MENU_ROLE_DEF(MENU_ID,ROLE_DEF_ID) VALUES('productmanageThree31','2');

/* ================================================================================   */
/* ===================================    仓库信息表          =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_warehouse001','productmanage','IB_WAREHOUSE','仓库信息','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE','WAREHOUSENO','仓库编号','VARCHAR','64','是','',1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE','WAREHOUSENAME','仓库名称','VARCHAR','128','是','',2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE','WAREHOUSELOCATION','仓库位置','VARCHAR','128','是','',3);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-warehouse001','productmanage','warehouse','仓库管理','/warehouse/warehouse-list.do',1,1,1,1,2,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','warehouse','IB_WAREHOUSE','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouse','IB_WAREHOUSE.WAREHOUSENO','仓库编号','WAREHOUSENO','IB_WAREHOUSE',1,'1','','','1','1','2','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouse','IB_WAREHOUSE.WAREHOUSENAME','仓库名称','WAREHOUSENAME','IB_WAREHOUSE',2,'1','','','1','1','1','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouse','IB_WAREHOUSE.WAREHOUSELOCATION','仓库位置','WAREHOUSELOCATION','IB_WAREHOUSE',3,'2','','','1','1','2','1','','');
/* ================= 仓库数据 ==================   */
INSERT INTO ib_warehouse(ID,WAREHOUSENO,WAREHOUSENAME,WAREHOUSELOCATION) VALUES ('100001','100001','黄河路仓库','哈尔滨市南岗区黄河路100号');
INSERT INTO ib_warehouse(ID,WAREHOUSENO,WAREHOUSENAME,WAREHOUSELOCATION) VALUES ('100002','100002','长江路仓库','哈尔滨市南岗区长江路200号');

/* ================================================================================   */
/* ===================================    物料分类信息表  =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('IB_MATERIALS_TYPE001','productmanage','IB_MATERIALS_TYPE','物料分类表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','TYPENO','分类编号','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','TYPENAME','分类名称','DATETIME','128','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','PARENTID','父节点ID','VARCHAR','64','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS_TYPE','ISLEAF','是否叶子节点','DATETIME','8','是',NULL,4);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-materialsType001','productmanage','materialsType','物料分类管理',NULL,1,1,1,1,2,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materialsType','IB_MATERIALS_TYPE','main');
/* ================= 表单对应字段管理表 ==================   */
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.ISLEAF','是否叶子节点','ISLEAF','IB_MATERIALS_TYPE',4,'8','','','1','1','1','2','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.PARENTID','父节点','PARENTID','IB_MATERIALS_TYPE',3,'7','','','1','1','1','2','','{\"sql\":\"select id vKey, typeName vValue from IB_MATERIALS_TYPE where isleaf =\'true\' \"}');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.TYPENAME','物料分类名称','TYPENAME','IB_MATERIALS_TYPE',2,'1','','','1','1','1','1','','');
insert  into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialsType','IB_MATERIALS_TYPE.TYPENO','物料分类编号','TYPENO','IB_MATERIALS_TYPE',1,'1','','','1','1','1','2','','');
/* ================= 数据插入 ==================   */
insert into ib_materials_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('10001101',NULL,'有机合成','10001','false');
insert into ib_materials_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('1000010101',NULL,'抗生素','1000010','false');
insert into ib_materials_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('1000011',NULL,'植物化学类','10000','true');
insert into ib_materials_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('10000',NULL,'天然化学','0','true');
insert into ib_materials_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('1000010',NULL,'生物化学类','10000','true');
insert into ib_materials_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('10001102',NULL,'无机合成','10001','false');
insert into ib_materials_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('1000011101',NULL,'植物类','1000011','false');
insert into ib_materials_type(ID,TYPENO,TYPENAME,PARENTID,ISLEAF) values ('10001',NULL,'化学合成类','0','true');

/* ================================================================================   */
/* ====================================   物料表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_materials001','productmanage','IB_MATERIALS','物料表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALNO','物料编号','VARCHAR','64','是',NULL,1);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALNAME','物料名称','DATETIME','128','是',NULL,2);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALPRICE','价格','NUMBER','12,2','是',NULL,3);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALTYPENO','分类编号','DATETIME','64','是',NULL,4);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MATERIALUNIT','单位','VARCHAR','8','是',NULL,5);
insert  into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIALS','MODEL','规格型号','VARCHAR','64','是',NULL,6);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-materials001','productmanage','materials','物料管理','/materials/materials-list.do',1,1,1,1,2,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materials','IB_MATERIALS','main');
/* ================= 表单对应字段管理表 ==================   */
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALNAME','物料名称','MATERIALNAME','IB_MATERIALS',3,'1','','','1','1','1','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALNO','物料编号','MATERIALNO','IB_MATERIALS',2,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALPRICE','价格','MATERIALPRICE','IB_MATERIALS',3,'5','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALTYPENO','物料分类','MATERIALTYPENO','IB_MATERIALS',1,'7','','','1','1','1','1','','{\"sql\":\"select id vKey, typeName vValue from IB_MATERIALS_TYPE where isleaf =\'false\'  \"} ');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MATERIALUNIT','单位','MATERIALUNIT','IB_MATERIALS',5,'1','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materials','IB_MATERIALS.MODEL','规格型号','MODEL','IB_MATERIALS',6,'1','','','1','1','2','2','','');
/* ================= 插入数据 ==================   */
insert into ib_materials(ID,materialTypeNo,materialNo,materialName,model,materialPrice,materialUnit) values ('9000010001','1000010101','10001','脂肪酸','Xp-21',100.00,'公斤');
insert into ib_materials(ID,materialTypeNo,materialNo,materialName,model,materialPrice,materialUnit) values ('9000010002','1000011101','10002','三羧酸','Sjs-121',25.00,'吨');
/* ================================================================================   */
/* ==================================    物料库存管理表      =================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_warehouse_materials001','productmanage','IB_WAREHOUSE_MATERIALS','物料库存管理表','1',NULL,2);
/* ================= 业务表字段结构管理表 ==================   */
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_MATERIALS','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_MATERIALS','MATERIALTYPENO','物料分类编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_MATERIALS','MATERIALNO','物料编号','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_MATERIALS','MATERIALNAME','物料名称','VARCHAR','128','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_MATERIALS','MATERIALMODEL','规格型号','VARCHAR','64','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_MATERIALS','MATERIALPRICE','价格','NUMBER','12,2','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_MATERIALS','MATERIALUNIT','单位','VARCHAR','8','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_MATERIALS','MATERIALNUM','数量','NUMBER','10','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_MATERIALS','WAREHOUSENO','仓库编号','VARCHAR','64','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_WAREHOUSE_MATERIALS','WAREHOUSENAME','仓库名称','VARCHAR','128','是','',9);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-warehouseMaterials001','productmanage','warehouseMaterials','物料库存管理','/warehouse_materials/warehouse_materials-list.do',1,1,1,1,1,2,2);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','warehouseMaterials','IB_WAREHOUSE_MATERIALS','main');
/* ================= 表单对应字段管理表 ==================   */
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouseMaterials','IB_WAREHOUSE_MATERIALS.MATERIALTYPENO','物料分类编号','MATERIALTYPENO','IB_WAREHOUSE_MATERIALS',1,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouseMaterials','IB_WAREHOUSE_MATERIALS.MATERIALNO','物料编号','MATERIALNO','IB_WAREHOUSE_MATERIALS',2,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouseMaterials','IB_WAREHOUSE_MATERIALS.MATERIALNAME','物料名称','MATERIALNAME','IB_WAREHOUSE_MATERIALS',3,'1',NULL,NULL,'1','1','1',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouseMaterials','IB_WAREHOUSE_MATERIALS.MATERIALMODEL','规格型号','MATERIALMODEL','IB_WAREHOUSE_MATERIALS',4,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouseMaterials','IB_WAREHOUSE_MATERIALS.MATERIALPRICE','价格','MATERIALPRICE','IB_WAREHOUSE_MATERIALS',5,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouseMaterials','IB_WAREHOUSE_MATERIALS.MATERIALUNIT','单位','MATERIALUNIT','IB_WAREHOUSE_MATERIALS',6,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouseMaterials','IB_WAREHOUSE_MATERIALS.MATERIALNUM','数量','MATERIALNUM','IB_WAREHOUSE_MATERIALS',7,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouseMaterials','IB_WAREHOUSE_MATERIALS.WAREHOUSENO','仓库编号','WAREHOUSENO','IB_WAREHOUSE_MATERIALS',8,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','warehouseMaterials','IB_WAREHOUSE_MATERIALS.WAREHOUSENAME','仓库名称','WAREHOUSENAME','IB_WAREHOUSE_MATERIALS',9,'1',NULL,NULL,'1','1','2',NULL,NULL,NULL);

/* ================================================================================   */
/* ====================================   物料入库表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_material_in001','productmanage','IB_MATERIAL_IN','物料入库表','1',NULL,1);
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_material_in_s001','productmanage','IB_MATERIAL_IN_S','物料入库信息子表','2',NULL,1);
/* ================= 业务表字段结构管理表 ==================   */
/*============== 物料入库表 ===============*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','EXECUTIONID','流程执行实例ID','VARCHAR','64','是',NULL,92);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','CREATEDATEBPM','流程创建时间','DATETIME','','是',NULL,93);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','NODENAME','流程节点名','VARCHAR','128','是',NULL,94);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','ASSIGNEEUSER','负责人','VARCHAR','64','是',NULL,95);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','DONEFLAG','流程结束标记','INTEGER','4','是',NULL,96);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','TASKTITLE','流程实例标题','VARCHAR','256','是',NULL,97);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','EVENTDATE','入库日期','DATE','0','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','SUPPLIERSNAME','供应商名称','VARCHAR','64','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','WAREHOUSENO','仓库编号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','WAREHOUSENAME','仓库名称','VARCHAR','128','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','TOTALNUM','总数量','NUMBER','10','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','AMOUNT','合计金额','NUMBER','12,2','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','AMOUNTBIG','合计金额大写','VARCHAR','64','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','REMARK','备注','VARCHAR','512','是','',8);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN','@USERNAME','负责人名','VARCHAR','128','是',NULL,9);
/*============== 物料入库信息子表 ===============*/
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','PARENTID','主表UUID','VARCHAR','64','否',NULL,92);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MATERIALNO','物料编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MATERIALNAME','物料名称','VARCHAR','128','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MATERIALMODEL','物料规格型号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MATERIALUNIT','单位','VARCHAR','16','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MATERIALNUM','数量','NUMBER','10','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','AMOUNT','金额','NUMBER','12,2','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','MANUFACTURENAME','制造商','VARCHAR','64','是','',7);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_IN_S','REMARK','备注','VARCHAR','512','是','',8);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-materialin001','productmanage','materialin','物料入库流程','/material_in/material_in-list.do',1,1,1,2,2,2,1);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materialin','IB_MATERIAL_IN','main');
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materialin','IB_MATERIAL_IN_S','sub');
/* ================= 表单对应字段管理表 ==================   */
/*======= 表单字段 ==========*/
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.EVENTDATE','入库日期','EVENTDATE','IB_MATERIAL_IN',1,'3','','','1','2','2','1','@currentDate','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.SUPPLIERSNAME','供应商名称','SUPPLIERSNAME','IB_MATERIAL_IN',2,'7','','','1','1','2','2','','{"sql":"select id vKey, UNITNAME vValue from IB_SUPPLIER "} ');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.WAREHOUSENO','仓库编号','WAREHOUSENO','IB_MATERIAL_IN',3,'7','','','1','1','2','1','','{"sql":"select id vKey, WAREHOUSENAME vValue from IB_WAREHOUSE "} ');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.WAREHOUSENAME','仓库名称','WAREHOUSENAME','IB_MATERIAL_IN',4,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.TOTALNUM','总数量','TOTALNUM','IB_MATERIAL_IN',5,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.AMOUNT','合计金额','AMOUNT','IB_MATERIAL_IN',6,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.AMOUNTBIG','合计金额大写','AMOUNTBIG','IB_MATERIAL_IN',7,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN.REMARK','备注','REMARK','IB_MATERIAL_IN',8,'2','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MATERIALNO','物料编号','MATERIALNO','IB_MATERIAL_IN_S',1,'10','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MATERIALNAME','物料名称','MATERIALNAME','IB_MATERIAL_IN_S',2,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MATERIALMODEL','物料规格型号','MATERIALMODEL','IB_MATERIAL_IN_S',3,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MATERIALUNIT','单位','MATERIALUNIT','IB_MATERIAL_IN_S',4,'1','','','1','1','2','','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MATERIALNUM','数量','MATERIALNUM','IB_MATERIAL_IN_S',5,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.AMOUNT','金额','AMOUNT','IB_MATERIAL_IN_S',6,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.MANUFACTURENAME','制造商','MANUFACTURENAME','IB_MATERIAL_IN_S',7,'1','','','1','1','2','2','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN, TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT, CONFSELECTINFO) values ('productmanage','materialin','IB_MATERIAL_IN_S.REMARK','备注','REMARK','IB_MATERIAL_IN_S',8,'2','','','1','1','2','1','','');
/* ============================= 流程管理表 =============================   */
INSERT INTO IB_BPM_PROCESS(ID,PACKAGENAME,FLOWNAME,FLOWTITLE,VERSIONID,FORMID,FLOWURL) VALUES('materialin001','productmanage','materialin','物料入库流程','bcb868a5-db45-454f-8a72-68093367010c','productmanage-materialin001','/material_in/material_in-list.do?flowType=0&flowId=materialin001');
/* ============================= 流程图管理表 =============================   */
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('06ab634d-b9f8-4316-8531-1813530ecbe5','materialin001','3a916bdd-f8e0-4021-b586-e7415be2d966',NULL,'{\"id\":\"3a916bdd-f8e0-4021-b586-e7415be2d966\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"realPoints\":\"120,90,200,90\",\"startElmId\":\"9c3f1ba1-c5bd-42d8-be62-c041793d6bb1\",\"endElmId\":\"4e21a11c-db68-45cf-aa2f-2428487fb8a2\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('06f3697c-4a1d-41e5-b076-556047af244a','materialin001','4e21a11c-db68-45cf-aa2f-2428487fb8a2',NULL,'{\"id\":\"4e21a11c-db68-45cf-aa2f-2428487fb8a2\",\"name\":\"发起\",\"type\":\"TaskNode\",\"title\":\"发起\",\"x\":\"200\",\"y\":\"65\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"3a916bdd-f8e0-4021-b586-e7415be2d966\",\"afterLineIds\":\"68acb9ed-b620-47ad-9ea4-7179105a4aa6\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('18b0b532-b79e-4c2e-a65d-f57091d64232','materialin001','68acb9ed-b620-47ad-9ea4-7179105a4aa6',NULL,'{\"id\":\"68acb9ed-b620-47ad-9ea4-7179105a4aa6\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"realPoints\":\"250,115,250,200,400,200\",\"startElmId\":\"4e21a11c-db68-45cf-aa2f-2428487fb8a2\",\"endElmId\":\"f4224f84-0df8-425f-af69-34620fb53377\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('1f5d84ef-6d6a-4144-afd0-5b21569a8588','materialin001','fa4237d4-93eb-4534-b94d-21d60eec970f',NULL,'{\"id\":\"fa4237d4-93eb-4534-b94d-21d60eec970f\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"入库质检\",\"x\":\"0\",\"y\":\"260\",\"realPoints\":\"700,310,750,310,750,310\",\"startElmId\":\"4973687e-9ad3-4415-a6ba-ae21589fb599\",\"endElmId\":\"756b2f73-2539-4a0c-8ff9-eb21f626a2b1\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('21594b6e-5db2-49a6-a107-67de01a1c902','materialin001','76388b75-b3ff-4be1-9b02-ba0d04fa5482',NULL,'{\"id\":\"76388b75-b3ff-4be1-9b02-ba0d04fa5482\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('22e00fcb-adfc-4b3f-8cab-d18bb6ee7a30','materialin001','935e844a-4377-498a-98bf-f3d6f2d22c52',NULL,'{\"id\":\"935e844a-4377-498a-98bf-f3d6f2d22c52\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"入库质检\",\"x\":\"0\",\"y\":\"260\",\"realPoints\":\"450,225,450,310,600,310\",\"startElmId\":\"f4224f84-0df8-425f-af69-34620fb53377\",\"endElmId\":\"4973687e-9ad3-4415-a6ba-ae21589fb599\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('25ead779-2010-42dc-a5d0-59c2f8bed31b','materialin001','f4224f84-0df8-425f-af69-34620fb53377',NULL,'{\"id\":\"f4224f84-0df8-425f-af69-34620fb53377\",\"name\":\"审批\",\"type\":\"TaskNode\",\"title\":\"审批\",\"x\":\"400\",\"y\":\"175\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"68acb9ed-b620-47ad-9ea4-7179105a4aa6\",\"afterLineIds\":\"935e844a-4377-498a-98bf-f3d6f2d22c52\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('2d042d87-380f-441f-a18e-af75bf615d30','materialin001','9c3f1ba1-c5bd-42d8-be62-c041793d6bb1',NULL,'{\"id\":\"9c3f1ba1-c5bd-42d8-be62-c041793d6bb1\",\"name\":\"开始节点\",\"type\":\"StartNode\",\"title\":\"开始节点\",\"x\":\"70\",\"y\":\"65\",\"width\":\"50\",\"height\":\"50\",\"afterLineIds\":\"3a916bdd-f8e0-4021-b586-e7415be2d966\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('595c0b02-88ca-4b79-97ca-558e9539f37f','materialin001','4973687e-9ad3-4415-a6ba-ae21589fb599',NULL,'{\"id\":\"4973687e-9ad3-4415-a6ba-ae21589fb599\",\"name\":\"入库质检\",\"type\":\"TaskNode\",\"title\":\"入库质检\",\"x\":\"600\",\"y\":\"285\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"935e844a-4377-498a-98bf-f3d6f2d22c52\",\"afterLineIds\":\"fa4237d4-93eb-4534-b94d-21d60eec970f\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('91d88246-4949-422d-bebe-a6af02236a26','materialin001','2e47a7e0-51d4-412c-a189-2e739ea7229c',NULL,'{\"id\":\"2e47a7e0-51d4-412c-a189-2e739ea7229c\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"入库质检\",\"x\":\"0\",\"y\":\"260\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('936ed6d4-e0a9-4a13-b036-57e009ee15fe','materialin001','756b2f73-2539-4a0c-8ff9-eb21f626a2b1',NULL,'{\"id\":\"756b2f73-2539-4a0c-8ff9-eb21f626a2b1\",\"name\":\"结束节点\",\"type\":\"EndNode\",\"title\":\"结束\",\"x\":\"750\",\"y\":\"285\",\"width\":\"50\",\"height\":\"50\",\"headLineIds\":\"fa4237d4-93eb-4534-b94d-21d60eec970f\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('a1ea70ee-2f97-4923-a141-d8851f27d7f9','materialin001','bd5e352b-212c-4489-a700-b363d7acda0b',NULL,'{\"id\":\"bd5e352b-212c-4489-a700-b363d7acda0b\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"width\":\"35\",\"height\":\"110\"}');

/* ================================================================================   */
/* ==============================   (领料)物料出库表   ====================================   */
/* ================================================================================   */
/* ================= 业务表结构管理表 ==================   */
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_material_out001','productmanage','IB_MATERIAL_OUT','(领料)物料出库表','1',NULL,1);
insert  into ib_conf_table(ID,PACKAGENAME,TABLENAME,TABLENAMECOMMENT,TABLETYPE,PARENTTABLEID,ISBPMTABLE) values ('ib_material_out_s001','productmanage','IB_MATERIAL_OUT_S','物料出库信息子表','2',NULL,1);
/* ================= 业务表字段结构管理表 ==================   */
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','EXECUTIONID','流程执行实例ID','VARCHAR','64','是',NULL,92);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','CREATEDATEBPM','流程创建时间','DATETIME','','是',NULL,93);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','NODENAME','流程节点名','VARCHAR','128','是',NULL,94);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','@USERNAME','负责人名','VARCHAR','128','是',NULL,95);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','ASSIGNEEUSER','负责人','VARCHAR','64','是',NULL,95);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','DONEFLAG','流程结束标记','INTEGER','4','是',NULL,96);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','TASKTITLE','流程实例标题','VARCHAR','256','是',NULL,97);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','EVENTDATE','出库日期','DATE','0','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','BATCHNO','批次号','VARCHAR','8','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','WAREHOUSENO','仓库编号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','PRODUCTNO','产品编号','VARCHAR','64','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','PRODUCTNAME','产品名称','VARCHAR','256','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT','MATERIALNUM','数量','NUMBER','10','是','',6);

insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT_S','ID','UUID主键','VARCHAR','64','否',NULL,91);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT_S','PARENTID','主表UUID','VARCHAR','64','否',NULL,92);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT_S','MATERIALNO','物料编号','VARCHAR','64','是','',1);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT_S','MATERIALNAME','物料名称','VARCHAR','128','是','',2);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT_S','MATERIALMODEL','物料规格型号','VARCHAR','64','是','',3);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT_S','MATERIALUNIT','单位','VARCHAR','16','是','',4);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT_S','MATERIALNUM','数量','NUMBER','10','是','',5);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT_S','MANUFACTURENAME','制造商','VARCHAR','64','是','',6);
insert into ib_conf_table_columns(tableName,columnValue,columnName,columnType,columnSize,isNull,defaultValue,columnNo) values ('IB_MATERIAL_OUT_S','REMARK','备注','VARCHAR','512','是','',7);
/* ================= 表单管理表 ==================   */
insert  into ib_conf_form(ID,PACKAGENAME,FORMNAME,FORMTITLE,FORMURL,ISEDIT,ISADD,ISDELETE,ISQUERY,ISEXCELEXPORT,ISIMPORTEXPORT,ISBPMFORM) values ('productmanage-materialOut001','productmanage','materialOut','(领料)物料出库信息','/material_out/material_out-list.do',1,1,1,2,2,2,1);
/* ================= 表单对应数据表管理表 ==================   */
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materialOut','IB_MATERIAL_OUT','main');
insert  into ib_conf_form_table(PACKAGENAME,FORMNAME,TABLENAME,TABLETYPE) values ('productmanage','materialOut','IB_MATERIAL_OUT_S','sub');
/* ================= 表单对应字段管理表 ==================   */
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT.BATCHNO','批次号','BATCHNO','IB_MATERIAL_OUT',2,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT.EVENTDATE','出库日期','EVENTDATE','IB_MATERIAL_OUT',1,'4','','','1','2','2','1','@currentDate','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT.MATERIALNUM','数量','MATERIALNUM','IB_MATERIAL_OUT',6,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT.PRODUCTNAME','(领料)物料出库表.产品名称','PRODUCTNAME','IB_MATERIAL_OUT',5,'1','','','2','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT.PRODUCTNO','产品名','PRODUCTNO','IB_MATERIAL_OUT',4,'7','','','1','1','2','1','','{\"sql\":\"select id vKey, PRODUCTNAME vValue from IB_PRODUCT \"} ');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT.WAREHOUSENO','仓库名','WAREHOUSENO','IB_MATERIAL_OUT',3,'7','','','1','1','2','1','','{\"sql\":\"select id vKey, WAREHOUSENAME vValue from IB_WAREHOUSE \"}');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT_S.MANUFACTURENAME','制造商','MANUFACTURENAME','IB_MATERIAL_OUT_S',6,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT_S.MATERIALMODEL','物料规格型号','MATERIALMODEL','IB_MATERIAL_OUT_S',3,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT_S.MATERIALNAME','物料名称','MATERIALNAME','IB_MATERIAL_OUT_S',2,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT_S.MATERIALNO','物料编号','MATERIALNO','IB_MATERIAL_OUT_S',1,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT_S.MATERIALNUM','数量','MATERIALNUM','IB_MATERIAL_OUT_S',5,'5','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT_S.MATERIALUNIT','单位','MATERIALUNIT','IB_MATERIAL_OUT_S',4,'1','','','1','1','2','1','','');
insert into ib_conf_form_table_colums(PACKAGENAME,FORMNAME,FORMCOLUMN,FORMCOLUMNTITLE,TABLECOLUMN,TABLENAME,COLUMNNO,FCTYPE,FCWIDTH,FCHEIGHT,FCDISPLAY,FCEDIT,FCQUERY,FCMUST,FCDEFAULT,CONFSELECTINFO) values ('productmanage','materialOut','IB_MATERIAL_OUT_S.REMARK','备注','REMARK','IB_MATERIAL_OUT_S',7,'2','','','1','1','2','2','','');
/* ============================= 流程管理表 =============================   */
INSERT INTO IB_BPM_PROCESS(ID,PACKAGENAME,FLOWNAME,FLOWTITLE,VERSIONID,FORMID,FLOWURL) VALUES('materialOut001','productmanage','materialOut','(领料)物料出库','45caccae-ede2-4fba-86b0-1217201c32b2','productmanage-materialOut001','/material_out/material_out-list.do?flowType=0&flowId=materialOut001');
/* ============================= 流程图管理表 =============================   */
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('541c9173-7ca0-427c-91e6-049892e33f12','materialOut001','5b3fd827-5900-4d2f-9cfa-6390a36a1378',NULL,'{\"id\":\"5b3fd827-5900-4d2f-9cfa-6390a36a1378\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('5c746681-005e-4e25-8718-bb3d3ef0585d','materialOut001','09e20832-cd75-4bcd-9e58-1155449e52f5',NULL,'{\"id\":\"09e20832-cd75-4bcd-9e58-1155449e52f5\",\"name\":\"开始节点\",\"type\":\"StartNode\",\"title\":\"开始节点\",\"x\":\"70\",\"y\":\"65\",\"width\":\"50\",\"height\":\"50\",\"afterLineIds\":\"9ea0ef66-273d-4e26-8a90-cb79d7e58f4f\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('6795a8fa-cdaa-4e31-862d-534e006f0769','materialOut001','35956630-42f6-4614-915f-33e13dcf0408',NULL,'{\"id\":\"35956630-42f6-4614-915f-33e13dcf0408\",\"name\":\"审批\",\"type\":\"TaskNode\",\"title\":\"审批\",\"x\":\"400\",\"y\":\"175\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"b411d834-75d1-4afd-8657-07eed45b0838\",\"afterLineIds\":\"c4def968-4683-41d4-9d9c-45a2b09d57c7\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('77a225bf-25ac-42c4-b6a8-0d5b75ca8705','materialOut001','f3eb7cc8-d108-4ca7-a0f8-a6de2078a01a',NULL,'{\"id\":\"f3eb7cc8-d108-4ca7-a0f8-a6de2078a01a\",\"name\":\"结束节点\",\"type\":\"EndNode\",\"title\":\"结束\",\"x\":\"550\",\"y\":\"175\",\"width\":\"50\",\"height\":\"50\",\"headLineIds\":\"c4def968-4683-41d4-9d9c-45a2b09d57c7\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('83e4b6ce-2d91-4685-bb6b-37b61563518d','materialOut001','96d0afdb-8ab1-42bf-b422-9147a60e1479',NULL,'{\"id\":\"96d0afdb-8ab1-42bf-b422-9147a60e1479\",\"name\":\"泳道\",\"type\":\"Lane\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"width\":\"35\",\"height\":\"110\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('9b92168a-c788-44d1-9400-ff71d3a6a12b','materialOut001','c722e60a-83e9-4d61-a44e-cebb9662c60c',NULL,'{\"id\":\"c722e60a-83e9-4d61-a44e-cebb9662c60c\",\"name\":\"发起\",\"type\":\"TaskNode\",\"title\":\"发起\",\"x\":\"200\",\"y\":\"65\",\"width\":\"100\",\"height\":\"50\",\"headLineIds\":\"9ea0ef66-273d-4e26-8a90-cb79d7e58f4f\",\"afterLineIds\":\"b411d834-75d1-4afd-8657-07eed45b0838\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('a92c9c0e-aa6a-4964-8227-d6e843c84e9b','materialOut001','b411d834-75d1-4afd-8657-07eed45b0838',NULL,'{\"id\":\"b411d834-75d1-4afd-8657-07eed45b0838\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"realPoints\":\"250,115,250,200,400,200\",\"startElmId\":\"c722e60a-83e9-4d61-a44e-cebb9662c60c\",\"endElmId\":\"35956630-42f6-4614-915f-33e13dcf0408\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('b392fb95-697a-402c-b0fc-4d9c1874822c','materialOut001','9ea0ef66-273d-4e26-8a90-cb79d7e58f4f',NULL,'{\"id\":\"9ea0ef66-273d-4e26-8a90-cb79d7e58f4f\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"发起\",\"x\":\"0\",\"y\":\"40\",\"realPoints\":\"120,90,200,90\",\"startElmId\":\"09e20832-cd75-4bcd-9e58-1155449e52f5\",\"endElmId\":\"c722e60a-83e9-4d61-a44e-cebb9662c60c\"}');
insert into ib_conf_flow_chart(ID,FLOWID,ITEMID,NODEID,CONTEXT) values ('b8b05d81-6d70-447f-a76a-b8f4c46c5f36','materialOut001','c4def968-4683-41d4-9d9c-45a2b09d57c7',NULL,'{\"id\":\"c4def968-4683-41d4-9d9c-45a2b09d57c7\",\"name\":\"线\",\"type\":\"Line\",\"title\":\"审批\",\"x\":\"0\",\"y\":\"150\",\"realPoints\":\"500,200,550,200,550,200\",\"startElmId\":\"35956630-42f6-4614-915f-33e13dcf0408\",\"endElmId\":\"f3eb7cc8-d108-4ca7-a0f8-a6de2078a01a\"}');

