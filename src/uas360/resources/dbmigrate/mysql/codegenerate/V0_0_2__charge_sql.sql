/* ======================== 收费管理 ====================  */
/* ====== 业主缴费表 =====  */
DROP TABLE IF EXISTS IB_CHARGE_PAY;
CREATE TABLE IB_CHARGE_PAY (PAYID VARCHAR(64), CHARGENAME VARCHAR(64), CHARGESTANDARD DOUBLE(12,2), PAYREAL DOUBLE(12,2), PAYBALANCE DOUBLE(12,2), CHARGETIME DATETIME, OWERNAME VARCHAR(64), PAYSTATE VARCHAR(8), PAYMONTH VARCHAR(8), ID VARCHAR(64),  PRIMARY KEY (ID)) ENGINE=INNODB;
/* ====== 收费项目表 =====  */
DROP TABLE IF EXISTS IB_CHARGE_INFO;
CREATE TABLE IB_CHARGE_INFO (CHARGEID VARCHAR(64), CHARGENAME VARCHAR(64), CHARGESTANDARD DOUBLE(12,2), ID VARCHAR(64),  PRIMARY KEY (ID)) ENGINE=INNODB;
