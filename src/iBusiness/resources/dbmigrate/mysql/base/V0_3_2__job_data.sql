/*===============  IB_COMPANY 公司表  =============================*/
INSERT INTO IB_COMPANY(ID,NAME,STATUS,SCOPE_ID) VALUES(1,'天翔软件有限公司',1,'1');
/*===============  IB_DEPARTMENT 部门表  =============================*/
INSERT INTO IB_DEPARTMENT(ID,NAME,COMPANYID,STATUS,SCOPE_ID) VALUES(1,'市场部',1,1,'1');
INSERT INTO IB_DEPARTMENT(ID,NAME,COMPANYID,STATUS,SCOPE_ID) VALUES(2,'财务部',1,1,'1');
INSERT INTO IB_DEPARTMENT(ID,NAME,COMPANYID,STATUS,SCOPE_ID) VALUES(3,'人事部',1,1,'1');
INSERT INTO IB_DEPARTMENT(ID,NAME,COMPANYID,STATUS,SCOPE_ID) VALUES(4,'研发部',1,1,'1');
/*===============  IB_GROUP 小组表  =============================*/
INSERT INTO IB_GROUP(ID,NAME,COMPANYID,DEPTID,STATUS,SCOPE_ID) VALUES(1,'平台组',1,1,1,'1');
INSERT INTO IB_GROUP(ID,NAME,COMPANYID,DEPTID,STATUS,SCOPE_ID) VALUES(2,'OA组',1,2,1,'1');
/*===============  IB_JOB_TYPE 职务类型表  =============================*/
INSERT INTO IB_JOB_TYPE(ID,NAME,SCOPE_ID) VALUES(1,'决策管理类','1');
INSERT INTO IB_JOB_TYPE(ID,NAME,SCOPE_ID) VALUES(2,'技术类','2');
/*===============  IB_JOB_TITLE 职位名称管理表  =============================*/
INSERT INTO IB_JOB_TITLE(ID,NAME,SCOPE_ID) VALUES(1,'总经理','1');
INSERT INTO IB_JOB_TITLE(ID,NAME,SCOPE_ID) VALUES(2,'部门经理','1');
INSERT INTO IB_JOB_TITLE(ID,NAME,SCOPE_ID) VALUES(3,'普通员工','1');
/*===============  IB_JOB_INFO  职务管理表  =============================*/
INSERT INTO IB_JOB_INFO(ID,TYPE_ID,TITLE_ID,SCOPE_ID) VALUES(1,1,1,'1');
INSERT INTO IB_JOB_INFO(ID,TYPE_ID,TITLE_ID,SCOPE_ID) VALUES(2,2,2,'1');
INSERT INTO IB_JOB_INFO(ID,TYPE_ID,TITLE_ID,SCOPE_ID) VALUES(3,2,3,'1');
