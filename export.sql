--------------------------------------------------------
--  File created - Monday-May-18-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ORDERS_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "ORDERS_NUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  CYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Sequence PS_TXN_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PS_TXN_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 50 START WITH 31501 CACHE 20 NOORDER  NOCYCLE  NOPARTITION ;
--------------------------------------------------------
--  DDL for Table ASTER_SETTINGS
--------------------------------------------------------

  CREATE TABLE "ASTER_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"SERVER" VARCHAR2(100 CHAR), 
	"LOGIN_AM" VARCHAR2(20 CHAR), 
	"PASS_AM" VARCHAR2(20 CHAR), 
	"CHANNEL" VARCHAR2(20 CHAR), 
	"CONTEXT" VARCHAR2(20 CHAR), 
	"PRIORITY" VARCHAR2(20 CHAR), 
	"PORT" VARCHAR2(20 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table CALL_LISTS
--------------------------------------------------------

  CREATE TABLE "CALL_LISTS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"USERS_ID" VARCHAR2(50 CHAR), 
	"KONTRAGENTS_ID" VARCHAR2(50 CHAR), 
	"LIST_NAME" VARCHAR2(50 BYTE), 
	"VERSION" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table CALL_LOG
--------------------------------------------------------

  CREATE TABLE "CALL_LOG" 
   (	"ID" VARCHAR2(50 CHAR), 
	"CALL_STATUS" VARCHAR2(50 CHAR), 
	"CONTACT_ID" VARCHAR2(50 CHAR), 
	"COMP_DET_ID" VARCHAR2(50 CHAR), 
	"MEMO" VARCHAR2(2000 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"DAT" DATE DEFAULT current_timestamp, 
	"CALL_RESULTS" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table CALL_MEMO
--------------------------------------------------------

  CREATE TABLE "CALL_MEMO" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6), 
	"DAT" DATE, 
	"CALL_LOG" VARCHAR2(20 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table CALL_RESULTS
--------------------------------------------------------

  CREATE TABLE "CALL_RESULTS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(20 CHAR), 
	"FULLNAME" VARCHAR2(25 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table CALL_STATUS
--------------------------------------------------------

  CREATE TABLE "CALL_STATUS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table CDR
--------------------------------------------------------

  CREATE TABLE "CDR" 
   (	"ID" VARCHAR2(50 CHAR), 
	"KONTRAGENT_ID" VARCHAR2(50 BYTE), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"CALL_START_TIME" DATE, 
	"CALL_ANSWER_TIME" DATE, 
	"CALL_END_TIME" DATE, 
	"ALL_CALL_TIME" NUMBER(10,0), 
	"CALL_STATUS" VARCHAR2(20 BYTE), 
	"PHONE" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table CDR_3CX
--------------------------------------------------------

  CREATE TABLE "CDR_3CX" 
   (	"ID" VARCHAR2(50 CHAR), 
	"KONTRAGENT_ID" VARCHAR2(50 BYTE), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"CALL_START_TIME" DATE, 
	"DURATION" NUMBER(10,0), 
	"CALL_STATUS" VARCHAR2(20 BYTE), 
	"PHONE" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table COMPAIGNS
--------------------------------------------------------

  CREATE TABLE "COMPAIGNS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NAME" VARCHAR2(100 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"ENABLED" NUMBER(1,0) DEFAULT 1, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"DELETED" NUMBER(1,0) DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table COMPAIGNS_DETAILS
--------------------------------------------------------

  CREATE TABLE "COMPAIGNS_DETAILS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"COMPAIGN_ID" VARCHAR2(50 CHAR), 
	"KONTRAG_ID" VARCHAR2(50 CHAR), 
	"CONTACT_ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
--------------------------------------------------------
--  DDL for Table CONTACT_DETAILS
--------------------------------------------------------

  CREATE TABLE "CONTACT_DETAILS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"KONTRAG_ID" VARCHAR2(50 CHAR), 
	"ADRESS" VARCHAR2(1000 CHAR), 
	"PHONE" VARCHAR2(15 CHAR), 
	"EMAIL" VARCHAR2(100 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table CURRENCY
--------------------------------------------------------

  CREATE TABLE "CURRENCY" 
   (	"ID" VARCHAR2(50 CHAR), 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"FULLNAME" VARCHAR2(5 CHAR), 
	"CODE" VARCHAR2(3 CHAR), 
	"NAMEFULL" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"ID_XML" VARCHAR2(3 CHAR) DEFAULT '0'
   ) ;
--------------------------------------------------------
--  DDL for Table DIR_FILE_UPLOAD
--------------------------------------------------------

  CREATE TABLE "DIR_FILE_UPLOAD" 
   (	"ID" VARCHAR2(20 BYTE), 
	"DIRECTORY" VARCHAR2(50 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table DIVISIONS
--------------------------------------------------------

  CREATE TABLE "DIVISIONS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(150 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table DIVISION_SOTR
--------------------------------------------------------

  CREATE TABLE "DIVISION_SOTR" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DIV_ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"DESCRIPTION" VARCHAR2(1000 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table ENTRY_SETTINGS
--------------------------------------------------------

  CREATE TABLE "ENTRY_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"TYPEDEF_ID" VARCHAR2(50 CHAR), 
	"PLAN_ACC_DEB_ID" VARCHAR2(50 CHAR), 
	"PLAN_ACC_KRED_ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;

   COMMENT ON TABLE "ENTRY_SETTINGS"  IS 'Настройки проводок';
--------------------------------------------------------
--  DDL for Table ENUM_ACCOUNT_TYPE
--------------------------------------------------------

  CREATE TABLE "ENUM_ACCOUNT_TYPE" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(20 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
--------------------------------------------------------
--  DDL for Table EX_RATES_SETTINGS
--------------------------------------------------------

  CREATE TABLE "EX_RATES_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
--------------------------------------------------------
--  DDL for Table FIRMS
--------------------------------------------------------

  CREATE TABLE "FIRMS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(150 CHAR), 
	"PRINTNAME" VARCHAR2(200 CHAR), 
	"UR_FIZ" NUMBER(1,0) DEFAULT 0, 
	"INN" VARCHAR2(50 CHAR), 
	"OKPO" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table GROUPMEMBERS
--------------------------------------------------------

  CREATE TABLE "GROUPMEMBERS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"G_NAME" VARCHAR2(50 CHAR), 
	"G_MEMBER" VARCHAR2(30 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table GROUPS
--------------------------------------------------------

  CREATE TABLE "GROUPS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(50 CHAR), 
	"G_DESCRIPTION" VARCHAR2(1000 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table IMPORTED_PRICE
--------------------------------------------------------

  CREATE TABLE "IMPORTED_PRICE" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT sysdate, 
	"ARTIKUL" VARCHAR2(50 CHAR), 
	"GROUPS" VARCHAR2(50 CHAR), 
	"NOM_NAME" VARCHAR2(1000 CHAR), 
	"ED_IZM" VARCHAR2(20 CHAR), 
	"PRICE_USL" NUMBER(10,2), 
	"PRICE_GOODS" NUMBER(10,2), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
--------------------------------------------------------
--  DDL for Table KASSA
--------------------------------------------------------

  CREATE TABLE "KASSA" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(100 CHAR), 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"FIRMA_ID" VARCHAR2(50 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table KONTRAGENTS
--------------------------------------------------------

  CREATE TABLE "KONTRAGENTS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(150 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"INN" VARCHAR2(50 CHAR), 
	"OKPO" VARCHAR2(50 CHAR), 
	"KPP" VARCHAR2(50 CHAR), 
	"NAMEFULL" VARCHAR2(150 CHAR), 
	"UR_FIZ" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"IS_BUYER" NUMBER(1,0) DEFAULT 0, 
	"IS_MEASURER" NUMBER(1,0) DEFAULT 0, 
	"IS_SUPPLIER" NUMBER(1,0) DEFAULT 0, 
	"USER_ID" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table MEASURE_UNIT
--------------------------------------------------------

  CREATE TABLE "MEASURE_UNIT" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(20 CHAR), 
	"CODE" VARCHAR2(3 CHAR) DEFAULT '000', 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
--------------------------------------------------------
--  DDL for Table MOVES
--------------------------------------------------------

  CREATE TABLE "MOVES" 
   (	"ID" VARCHAR2(50 CHAR), 
	"PERIOD" TIMESTAMP (6), 
	"REGISTRATOR_TYPE" VARCHAR2(50 CHAR), 
	"REGISTRATOR_ID" VARCHAR2(50 CHAR), 
	"PLAN_ACC_DEB_ID" VARCHAR2(50 CHAR), 
	"SUBCONTO1_DEB" VARCHAR2(50 CHAR), 
	"SUBCONTO2_DEB" VARCHAR2(50 CHAR), 
	"SUBCONTO3_DEB" VARCHAR2(50 CHAR), 
	"QUANTITY_DEB" NUMBER(10,4), 
	"CURR_DEB" VARCHAR2(50 CHAR), 
	"SUMM_VAL_DEB" NUMBER(10,2), 
	"PLAN_ACC_KRED_ID" VARCHAR2(50 CHAR), 
	"SUBCONTO1_KRED" VARCHAR2(50 CHAR), 
	"SUBCONTO2_KRED" VARCHAR2(50 CHAR), 
	"SUBCONTO3_KRED" VARCHAR2(50 CHAR), 
	"QUANTITY_KRED" NUMBER(10,4), 
	"CURR_KRED" VARCHAR2(50 CHAR), 
	"SUMM_VAL_KREDIT" NUMBER(10,2), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"SUMM_UPR_DEB" NUMBER(10,2), 
	"SUMM_UPR_KRED" NUMBER(10,2), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table NOMENKLATURA
--------------------------------------------------------

  CREATE TABLE "NOMENKLATURA" 
   (	"ID" VARCHAR2(50 BYTE), 
	"FULLNAME" VARCHAR2(150 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"USLUGA" NUMBER(1,0) DEFAULT 1, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"ARTIKUL" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table NOTIFICATION
--------------------------------------------------------

  CREATE TABLE "NOTIFICATION" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6), 
	"DAT" DATE, 
	"DESCRIPTION" VARCHAR2(200 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"CONTACT" VARCHAR2(50 BYTE), 
	"SERVER" NUMBER(1,0), 
	"CLIENT" NUMBER(1,0), 
	"TRG_NAME" VARCHAR2(50 CHAR), 
	"USER_LOGIN" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table NUMERATOR
--------------------------------------------------------

  CREATE TABLE "NUMERATOR" 
   (	"ID" VARCHAR2(50 CHAR), 
	"TYPEDEF_ID" VARCHAR2(50 CHAR), 
	"PREFIX" VARCHAR2(20 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
--------------------------------------------------------
--  DDL for Table OPERATORES_PHONES
--------------------------------------------------------

  CREATE TABLE "OPERATORES_PHONES" 
   (	"ID" VARCHAR2(20 BYTE), 
	"OPERATOR" VARCHAR2(20 BYTE), 
	"PHONE" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "ORDERS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT current_timestamp, 
	"NUM" VARCHAR2(50 CHAR), 
	"KONTRAG_ID" VARCHAR2(50 CHAR), 
	"CURR_ID" VARCHAR2(50 CHAR), 
	"KASSA_ID" VARCHAR2(50 CHAR), 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"KURS" NUMBER(10,6) DEFAULT 1, 
	"KRATNOST" NUMBER(10,0) DEFAULT 1, 
	"DISCRIPTION" VARCHAR2(2000 CHAR), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"POSTED" NUMBER(1,0) DEFAULT 0, 
	"FIRM_ID" VARCHAR2(50 CHAR), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR), 
	"STATUS_ID" VARCHAR2(50 CHAR), 
	"ZAMER_ID" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table ORDERS_TP_OPLATY
--------------------------------------------------------

  CREATE TABLE "ORDERS_TP_OPLATY" 
   (	"ID" VARCHAR2(50 CHAR), 
	"ORDER_ID" VARCHAR2(50 CHAR), 
	"DAT" DATE DEFAULT sysdate, 
	"SUM" NUMBER(10,2), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"COMMENTS" VARCHAR2(1000 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table ORDERS_TP_USLUGI
--------------------------------------------------------

  CREATE TABLE "ORDERS_TP_USLUGI" 
   (	"ID" VARCHAR2(50 CHAR), 
	"ORDER_ID" VARCHAR2(50 CHAR), 
	"NOM_ID" VARCHAR2(50 CHAR), 
	"PRICE" NUMBER(10,3), 
	"SUMM" NUMBER(10,2), 
	"DAT_COMPLETE" DATE DEFAULT sysdate, 
	"SOTR_ID" VARCHAR2(50 CHAR), 
	"DAT_TO_PAY" DATE, 
	"GROUP_ID" VARCHAR2(50 CHAR), 
	"MEASURE_ID" VARCHAR2(50 CHAR), 
	"QUANTITY" NUMBER(10,3)
   ) ;
--------------------------------------------------------
--  DDL for Table ORDER_STATUS
--------------------------------------------------------

  CREATE TABLE "ORDER_STATUS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"NAME" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table PLAN_ACC
--------------------------------------------------------

  CREATE TABLE "PLAN_ACC" 
   (	"ID" VARCHAR2(50 CHAR), 
	"ACC_TYPE" VARCHAR2(50 CHAR), 
	"PARENT_ID" VARCHAR2(50 CHAR), 
	"FULLNAME" VARCHAR2(3000 CHAR), 
	"ZABALANSOV" NUMBER(1,0) DEFAULT 0, 
	"VALUTN" NUMBER(1,0) DEFAULT 0, 
	"KOLISHESTV" NUMBER(1,0) DEFAULT 0, 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"CODE" VARCHAR2(6 CHAR) DEFAULT NULL
   ) ;
--------------------------------------------------------
--  DDL for Table PLAN_ACC_SUBCONTO
--------------------------------------------------------

  CREATE TABLE "PLAN_ACC_SUBCONTO" 
   (	"ID" VARCHAR2(50 CHAR), 
	"PLAN_ACC_ID" VARCHAR2(50 CHAR), 
	"PLAN_TYPE_SUBC" VARCHAR2(50 CHAR), 
	"OBOROT_ONLY" NUMBER(1,0) DEFAULT 0, 
	"SUMMOVOY" NUMBER(1,0) DEFAULT 1, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
--------------------------------------------------------
--  DDL for Table PLAN_TYPE_SUBCONTO
--------------------------------------------------------

  CREATE TABLE "PLAN_TYPE_SUBCONTO" 
   (	"ID" VARCHAR2(50 CHAR), 
	"TYPE_OF_OBJ" VARCHAR2(50 BYTE), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"FULLNAME" VARCHAR2(100 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table PS_TXN
--------------------------------------------------------

  CREATE TABLE "PS_TXN" 
   (	"ID" NUMBER(20,0), 
	"PARENTID" NUMBER(20,0), 
	"COLLID" NUMBER(10,0), 
	"CONTENT" BLOB, 
	"CREATION_DATE" DATE DEFAULT sysdate
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_BLOB_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_BLOB_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"BLOB_DATA" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_CALENDARS
--------------------------------------------------------

  CREATE TABLE "QRTZ_CALENDARS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"CALENDAR_NAME" VARCHAR2(200 BYTE), 
	"CALENDAR" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_CRON_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_CRON_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"CRON_EXPRESSION" VARCHAR2(120 BYTE), 
	"TIME_ZONE_ID" VARCHAR2(80 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_FIRED_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_FIRED_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"ENTRY_ID" VARCHAR2(95 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"INSTANCE_NAME" VARCHAR2(200 BYTE), 
	"FIRED_TIME" NUMBER(13,0), 
	"SCHED_TIME" NUMBER(13,0), 
	"PRIORITY" NUMBER(13,0), 
	"STATE" VARCHAR2(16 BYTE), 
	"JOB_NAME" VARCHAR2(200 BYTE), 
	"JOB_GROUP" VARCHAR2(200 BYTE), 
	"IS_NONCONCURRENT" VARCHAR2(1 BYTE), 
	"REQUESTS_RECOVERY" VARCHAR2(1 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_JOB_DETAILS
--------------------------------------------------------

  CREATE TABLE "QRTZ_JOB_DETAILS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"JOB_NAME" VARCHAR2(200 BYTE), 
	"JOB_GROUP" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(250 BYTE), 
	"JOB_CLASS_NAME" VARCHAR2(250 BYTE), 
	"IS_DURABLE" VARCHAR2(1 BYTE), 
	"IS_NONCONCURRENT" VARCHAR2(1 BYTE), 
	"IS_UPDATE_DATA" VARCHAR2(1 BYTE), 
	"REQUESTS_RECOVERY" VARCHAR2(1 BYTE), 
	"JOB_DATA" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_LOCKS
--------------------------------------------------------

  CREATE TABLE "QRTZ_LOCKS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"LOCK_NAME" VARCHAR2(40 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_PAUSED_TRIGGER_GRPS
--------------------------------------------------------

  CREATE TABLE "QRTZ_PAUSED_TRIGGER_GRPS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_SCHEDULER_STATE
--------------------------------------------------------

  CREATE TABLE "QRTZ_SCHEDULER_STATE" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"INSTANCE_NAME" VARCHAR2(200 BYTE), 
	"LAST_CHECKIN_TIME" NUMBER(13,0), 
	"CHECKIN_INTERVAL" NUMBER(13,0)
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_SIMPLE_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_SIMPLE_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"REPEAT_COUNT" NUMBER(7,0), 
	"REPEAT_INTERVAL" NUMBER(12,0), 
	"TIMES_TRIGGERED" NUMBER(10,0)
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_SIMPROP_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_SIMPROP_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"STR_PROP_1" VARCHAR2(512 BYTE), 
	"STR_PROP_2" VARCHAR2(512 BYTE), 
	"STR_PROP_3" VARCHAR2(512 BYTE), 
	"INT_PROP_1" NUMBER(10,0), 
	"INT_PROP_2" NUMBER(10,0), 
	"LONG_PROP_1" NUMBER(13,0), 
	"LONG_PROP_2" NUMBER(13,0), 
	"DEC_PROP_1" NUMBER(13,4), 
	"DEC_PROP_2" NUMBER(13,4), 
	"BOOL_PROP_1" VARCHAR2(1 BYTE), 
	"BOOL_PROP_2" VARCHAR2(1 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table QRTZ_TRIGGERS
--------------------------------------------------------

  CREATE TABLE "QRTZ_TRIGGERS" 
   (	"SCHED_NAME" VARCHAR2(120 BYTE), 
	"TRIGGER_NAME" VARCHAR2(200 BYTE), 
	"TRIGGER_GROUP" VARCHAR2(200 BYTE), 
	"JOB_NAME" VARCHAR2(200 BYTE), 
	"JOB_GROUP" VARCHAR2(200 BYTE), 
	"DESCRIPTION" VARCHAR2(250 BYTE), 
	"NEXT_FIRE_TIME" NUMBER(13,0), 
	"PREV_FIRE_TIME" NUMBER(13,0), 
	"PRIORITY" NUMBER(13,0), 
	"TRIGGER_STATE" VARCHAR2(16 BYTE), 
	"TRIGGER_TYPE" VARCHAR2(8 BYTE), 
	"START_TIME" NUMBER(13,0), 
	"END_TIME" NUMBER(13,0), 
	"CALENDAR_NAME" VARCHAR2(200 BYTE), 
	"MISFIRE_INSTR" NUMBER(2,0), 
	"JOB_DATA" BLOB
   ) ;
--------------------------------------------------------
--  DDL for Table QUARTZ_PROPERTY
--------------------------------------------------------

  CREATE TABLE "QUARTZ_PROPERTY" 
   (	"ID" VARCHAR2(50 BYTE), 
	"INSTANCE_NAME" VARCHAR2(60 CHAR), 
	"THREADPOOL_CLASS" VARCHAR2(50 CHAR), 
	"THREAD_COUNT" VARCHAR2(60 CHAR), 
	"THREADS_CONTEXT" VARCHAR2(60 CHAR), 
	"JOBSTORE_CLASS" VARCHAR2(60 CHAR), 
	"DRIVER_DELEGATE" VARCHAR2(60 CHAR), 
	"TABLE_PREFIX" VARCHAR2(60 CHAR), 
	"DATA_SOURCE" VARCHAR2(60 CHAR), 
	"DRIVER" VARCHAR2(60 CHAR), 
	"URL" VARCHAR2(60 CHAR), 
	"USR" VARCHAR2(50 CHAR), 
	"PASSWORD" VARCHAR2(50 CHAR), 
	"MAX_CONNECTIONS" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table REG_PRICES
--------------------------------------------------------

  CREATE TABLE "REG_PRICES" 
   (	"ID" VARCHAR2(50 CHAR), 
	"NOM_ID" VARCHAR2(50 CHAR), 
	"PERIOD" DATE, 
	"ED_IZM" VARCHAR2(50 CHAR), 
	"PRICE_USL" NUMBER(10,2), 
	"PRICE_GOODS" NUMBER(10,2)
   ) ;
--------------------------------------------------------
--  DDL for Table REG_RATES
--------------------------------------------------------

  CREATE TABLE "REG_RATES" 
   (	"CURR_ID" VARCHAR2(50 CHAR), 
	"PERIOD" DATE DEFAULT to_date('01-01-1980 00:00:00','DD-MM-YYYY HH24:MI:SS'), 
	"ID" VARCHAR2(50 CHAR), 
	"KURS" NUMBER(10,6) DEFAULT 1, 
	"KRATNOST" NUMBER(10,0) DEFAULT 1, 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
--------------------------------------------------------
--  DDL for Table TYPE_DEF
--------------------------------------------------------

  CREATE TABLE "TYPE_DEF" 
   (	"ID" VARCHAR2(50 CHAR), 
	"TABLE_NAME" VARCHAR2(100 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
--------------------------------------------------------
--  DDL for Table TYPE_OF_ACTIVITIES
--------------------------------------------------------

  CREATE TABLE "TYPE_OF_ACTIVITIES" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"FULLNAME" VARCHAR2(150 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "USERS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"FIRST_NAME" VARCHAR2(50 CHAR) DEFAULT 'NoFirstName', 
	"LAST_NAME" VARCHAR2(50 CHAR) DEFAULT 'NoLastName', 
	"EMAIL" VARCHAR2(100 CHAR) DEFAULT 'no@email.com', 
	"IS_ADMIN" NUMBER(1,0) DEFAULT 0, 
	"PASS_WD" VARCHAR2(100 CHAR), 
	"LOGIN" VARCHAR2(30 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0, 
	"U_DESCRIPTION" VARCHAR2(1000 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table USERS_GROUPS
--------------------------------------------------------

  CREATE TABLE "USERS_GROUPS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"GROUPS_ID" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table USER_SETTINGS
--------------------------------------------------------

  CREATE TABLE "USER_SETTINGS" 
   (	"ID" VARCHAR2(50 CHAR), 
	"USER_ID" VARCHAR2(50 CHAR), 
	"DIVISION_ID" VARCHAR2(50 CHAR), 
	"FIRMA_ID" VARCHAR2(50 CHAR), 
	"CURRENCY_ID" VARCHAR2(50 CHAR), 
	"KASSA_ID" VARCHAR2(50 CHAR), 
	"MAIN_USLUGA" VARCHAR2(50 CHAR), 
	"ACTIVITIES_ID" VARCHAR2(50 CHAR)
   ) ;
--------------------------------------------------------
--  DDL for Table VOUCHER
--------------------------------------------------------

  CREATE TABLE "VOUCHER" 
   (	"ID" VARCHAR2(50 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"EXPIRED_BY" TIMESTAMP (6), 
	"CODE" RAW(64)
   ) ;
--------------------------------------------------------
--  DDL for Table XML_T
--------------------------------------------------------

  CREATE TABLE "XML_T" 
   (	"ID" VARCHAR2(50 CHAR), 
	"ONE" "XMLTYPE" , 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp
   ) ;
--------------------------------------------------------
--  DDL for Table ZATRATY
--------------------------------------------------------

  CREATE TABLE "ZATRATY" 
   (	"ID" VARCHAR2(50 CHAR), 
	"IS_GROUP" NUMBER(1,0) DEFAULT 0, 
	"PARENT_ID" VARCHAR2(50 BYTE), 
	"DELETED" NUMBER(1,0) DEFAULT 0, 
	"FULLNAME" VARCHAR2(150 CHAR), 
	"VERSION" TIMESTAMP (6) DEFAULT systimestamp, 
	"PREDEFINED" NUMBER(1,0) DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for View LAST_PRICES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "LAST_PRICES" ("ID", "NOM_ID", "PERIOD", "ED_IZM", "PRICE_USL", "PRICE_GOODS") AS 
  select "ID","NOM_ID","PERIOD","ED_IZM","PRICE_USL","PRICE_GOODS" from reg_prices where period = (select max(period) from reg_prices where period<=(sysdate));
--------------------------------------------------------
--  DDL for Index ASTER_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ASTER_SETTINGS_PK" ON "ASTER_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALL_LISTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALL_LISTS_PK" ON "CALL_LISTS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALL_LOG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALL_LOG_PK" ON "CALL_LOG" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALL_MEMO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALL_MEMO_PK" ON "CALL_MEMO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALL_RESULTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALL_RESULTS_PK" ON "CALL_RESULTS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CALL_STATUS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CALL_STATUS_PK" ON "CALL_STATUS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CDR_3CX_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CDR_3CX_PK" ON "CDR_3CX" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CDR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CDR_PK" ON "CDR" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index COMPAIGNS_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMPAIGNS_DETAILS_PK" ON "COMPAIGNS_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index COMPAIGNS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMPAIGNS_PK" ON "COMPAIGNS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CONTACT_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CONTACT_DETAILS_PK" ON "CONTACT_DETAILS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index CURRENCY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CURRENCY_PK" ON "CURRENCY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index DIR_FILE_UPLOAD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DIR_FILE_UPLOAD_PK" ON "DIR_FILE_UPLOAD" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index DIVISIONS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DIVISIONS_PK" ON "DIVISIONS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index DIVISION_SOTR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DIVISION_SOTR_PK" ON "DIVISION_SOTR" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ENTRY_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENTRY_SETTINGS_PK" ON "ENTRY_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ENUM_ACCOUNT_TYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENUM_ACCOUNT_TYPE_PK" ON "ENUM_ACCOUNT_TYPE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ENUM_ACCOUNT_TYPE_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "ENUM_ACCOUNT_TYPE_UK1" ON "ENUM_ACCOUNT_TYPE" ("FULLNAME") 
  ;
--------------------------------------------------------
--  DDL for Index EX_RATES_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EX_RATES_SETTINGS_PK" ON "EX_RATES_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index EX_RATES_SETTINGS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "EX_RATES_SETTINGS_UK1" ON "EX_RATES_SETTINGS" ("CURR_ID") 
  ;
--------------------------------------------------------
--  DDL for Index FIRMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FIRMS_PK" ON "FIRMS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index GROUPMEMBERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GROUPMEMBERS_PK" ON "GROUPMEMBERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "GROUPS_PK" ON "GROUPS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index GROUPS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "GROUPS_UK1" ON "GROUPS" ("FULLNAME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_INST_JOB_REQ_RCVRY
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_INST_JOB_REQ_RCVRY" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "INSTANCE_NAME", "REQUESTS_RECOVERY") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_JG
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_JG" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_J_G
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_J_G" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_TG
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_TG" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_TRIG_INST_NAME
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_TRIG_INST_NAME" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "INSTANCE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_FT_T_G
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_FT_T_G" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_J_GRP
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_J_GRP" ON "QRTZ_JOB_DETAILS" ("SCHED_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_J_REQ_RECOVERY
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_J_REQ_RECOVERY" ON "QRTZ_JOB_DETAILS" ("SCHED_NAME", "REQUESTS_RECOVERY") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_C
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_C" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "CALENDAR_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_G
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_G" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_J
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_J" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_JG
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_JG" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_NEXT_FIRE_TIME
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_NEXT_FIRE_TIME" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "NEXT_FIRE_TIME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_NFT_MISFIRE
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_NFT_MISFIRE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_NFT_ST
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_NFT_ST" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_STATE", "NEXT_FIRE_TIME") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_NFT_ST_MISFIRE
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_NFT_ST_MISFIRE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME", "TRIGGER_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_NFT_ST_MISFIRE_GRP
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_NFT_ST_MISFIRE_GRP" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME", "TRIGGER_GROUP", "TRIGGER_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_N_G_STATE
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_N_G_STATE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_GROUP", "TRIGGER_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_N_STATE
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_N_STATE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP", "TRIGGER_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index IDX_QRTZ_T_STATE
--------------------------------------------------------

  CREATE INDEX "IDX_QRTZ_T_STATE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_STATE") 
  ;
--------------------------------------------------------
--  DDL for Index IMPORTED_PRICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "IMPORTED_PRICE_PK" ON "IMPORTED_PRICE" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index KASSA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KASSA_PK" ON "KASSA" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index KONTRAGENTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "KONTRAGENTS_PK" ON "KONTRAGENTS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MEASURE_UNIT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEASURE_UNIT_PK" ON "MEASURE_UNIT" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index MOVES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MOVES_PK" ON "MOVES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOMENKLATURA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NOMENKLATURA_PK" ON "NOMENKLATURA" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOTIFICATION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NOTIFICATION_PK" ON "NOTIFICATION" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index NUMERATOR_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "NUMERATOR_PK" ON "NUMERATOR" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index OPERATORES_PHONES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OPERATORES_PHONES_PK" ON "OPERATORES_PHONES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDERS_PK" ON "ORDERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_TP_OPLATY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDERS_TP_OPLATY_PK" ON "ORDERS_TP_OPLATY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDERS_TP_USLUGI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDERS_TP_USLUGI_PK" ON "ORDERS_TP_USLUGI" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ORDER_STATUS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ORDER_STATUS_PK" ON "ORDER_STATUS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_ACC_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAN_ACC_PK" ON "PLAN_ACC" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_ACC_SUBCONTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAN_ACC_SUBCONTO_PK" ON "PLAN_ACC_SUBCONTO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_ACC_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAN_ACC_UK1" ON "PLAN_ACC" ("FULLNAME", "CODE") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_TYPE_SUBCONTO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAN_TYPE_SUBCONTO_PK" ON "PLAN_TYPE_SUBCONTO" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index PLAN_TYPE_SUBCONTO_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PLAN_TYPE_SUBCONTO_UK1" ON "PLAN_TYPE_SUBCONTO" ("TYPE_OF_OBJ") 
  ;
--------------------------------------------------------
--  DDL for Index PS_TXN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PS_TXN_PK" ON "PS_TXN" ("COLLID", "ID") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_BLOB_TRIG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_BLOB_TRIG_PK" ON "QRTZ_BLOB_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_CALENDARS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_CALENDARS_PK" ON "QRTZ_CALENDARS" ("SCHED_NAME", "CALENDAR_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_CRON_TRIG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_CRON_TRIG_PK" ON "QRTZ_CRON_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_FIRED_TRIGGER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_FIRED_TRIGGER_PK" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "ENTRY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_JOB_DETAILS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_JOB_DETAILS_PK" ON "QRTZ_JOB_DETAILS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_LOCKS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_LOCKS_PK" ON "QRTZ_LOCKS" ("SCHED_NAME", "LOCK_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_PAUSED_TRIG_GRPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_PAUSED_TRIG_GRPS_PK" ON "QRTZ_PAUSED_TRIGGER_GRPS" ("SCHED_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_SCHEDULER_STATE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_SCHEDULER_STATE_PK" ON "QRTZ_SCHEDULER_STATE" ("SCHED_NAME", "INSTANCE_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_SIMPLE_TRIG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_SIMPLE_TRIG_PK" ON "QRTZ_SIMPLE_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_SIMPROP_TRIG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_SIMPROP_TRIG_PK" ON "QRTZ_SIMPROP_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QRTZ_TRIGGERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QRTZ_TRIGGERS_PK" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") 
  ;
--------------------------------------------------------
--  DDL for Index QUARTZ_PROPERTY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "QUARTZ_PROPERTY_PK" ON "QUARTZ_PROPERTY" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index REG_PRICES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REG_PRICES_PK" ON "REG_PRICES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index REG_RATES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REG_RATES_PK" ON "REG_RATES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000093189C00004$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000093189C00004$$" ON "PS_TXN" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000093200C00003$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000093200C00003$$" ON "XML_T" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000094214C00010$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000094214C00010$$" ON "QRTZ_JOB_DETAILS" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000094218C00016$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000094218C00016$$" ON "QRTZ_TRIGGERS" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000094228C00004$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000094228C00004$$" ON "QRTZ_BLOB_TRIGGERS" (
  ;
--------------------------------------------------------
--  DDL for Index SYS_IL0000094232C00003$$
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_IL0000094232C00003$$" ON "QRTZ_CALENDARS" (
  ;
--------------------------------------------------------
--  DDL for Index TYPE_DEF_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TYPE_DEF_PK" ON "TYPE_DEF" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index TYPE_OF_ACTIVITIES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TYPE_OF_ACTIVITIES_PK" ON "TYPE_OF_ACTIVITIES" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_GROUPS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERS_GROUPS_PK" ON "USERS_GROUPS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERS_PK" ON "USERS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index USERS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "USERS_UK1" ON "USERS" ("LOGIN") 
  ;
--------------------------------------------------------
--  DDL for Index USER_SETTINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USER_SETTINGS_PK" ON "USER_SETTINGS" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index USER_SETTINGS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "USER_SETTINGS_UK1" ON "USER_SETTINGS" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index VOUCHER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "VOUCHER_PK" ON "VOUCHER" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index XML_T_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "XML_T_PK" ON "XML_T" ("ID") 
  ;
--------------------------------------------------------
--  DDL for Index ZATRATY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ZATRATY_PK" ON "ZATRATY" ("ID") 
  ;
--------------------------------------------------------
--  Constraints for Table ASTER_SETTINGS
--------------------------------------------------------

  ALTER TABLE "ASTER_SETTINGS" MODIFY ("PASS_AM" NOT NULL ENABLE);
  ALTER TABLE "ASTER_SETTINGS" MODIFY ("PORT" NOT NULL ENABLE);
  ALTER TABLE "ASTER_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ASTER_SETTINGS" MODIFY ("LOGIN_AM" NOT NULL ENABLE);
  ALTER TABLE "ASTER_SETTINGS" MODIFY ("SERVER" NOT NULL ENABLE);
  ALTER TABLE "ASTER_SETTINGS" ADD CONSTRAINT "ASTER_SETTINGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CALL_LISTS
--------------------------------------------------------

  ALTER TABLE "CALL_LISTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CALL_LISTS" MODIFY ("USERS_ID" NOT NULL ENABLE);
  ALTER TABLE "CALL_LISTS" MODIFY ("KONTRAGENTS_ID" NOT NULL ENABLE);
  ALTER TABLE "CALL_LISTS" MODIFY ("LIST_NAME" NOT NULL ENABLE);
  ALTER TABLE "CALL_LISTS" ADD CONSTRAINT "CALL_LISTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "CALL_LISTS" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALL_LOG
--------------------------------------------------------

  ALTER TABLE "CALL_LOG" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CALL_MEMO
--------------------------------------------------------

  ALTER TABLE "CALL_MEMO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CALL_MEMO" MODIFY ("CALL_LOG" NOT NULL ENABLE);
  ALTER TABLE "CALL_MEMO" ADD CONSTRAINT "CALL_MEMO_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "CALL_MEMO" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "CALL_MEMO" MODIFY ("DAT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CALL_RESULTS
--------------------------------------------------------

  ALTER TABLE "CALL_RESULTS" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "CALL_RESULTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CALL_RESULTS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CALL_RESULTS" ADD CONSTRAINT "CALL_RESULTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CALL_STATUS
--------------------------------------------------------

  ALTER TABLE "CALL_STATUS" ADD CONSTRAINT "CALL_STATUS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "CALL_STATUS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CALL_STATUS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CALL_STATUS" MODIFY ("FULLNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CDR
--------------------------------------------------------

  ALTER TABLE "CDR" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CDR" ADD CONSTRAINT "CDR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "CDR" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "CDR" MODIFY ("USER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CDR_3CX
--------------------------------------------------------

  ALTER TABLE "CDR_3CX" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CDR_3CX" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "CDR_3CX" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "CDR_3CX" ADD CONSTRAINT "CDR_3CX_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMPAIGNS
--------------------------------------------------------

  ALTER TABLE "COMPAIGNS" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS" MODIFY ("ENABLED" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS" MODIFY ("PREDEFINED" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS" ADD CONSTRAINT "COMPAIGNS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "COMPAIGNS" ADD CONSTRAINT "COMPAIGNS_DELETED_CHK" CHECK (deleted in (0,1)) ENABLE;
  ALTER TABLE "COMPAIGNS" ADD CONSTRAINT "COMPAIGNS_ENABLED_CHK" CHECK (enabled in (0,1)) ENABLE;
  ALTER TABLE "COMPAIGNS" ADD CONSTRAINT "COMPAIGNS_PREDEFINED_CHK" CHECK (predefined in (0,1)) ENABLE;
--------------------------------------------------------
--  Constraints for Table COMPAIGNS_DETAILS
--------------------------------------------------------

  ALTER TABLE "COMPAIGNS_DETAILS" MODIFY ("COMPAIGN_ID" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS_DETAILS" MODIFY ("CONTACT_ID" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS_DETAILS" MODIFY ("KONTRAG_ID" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS_DETAILS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "COMPAIGNS_DETAILS" ADD CONSTRAINT "COMPAIGNS_DETAILS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CONTACT_DETAILS
--------------------------------------------------------

  ALTER TABLE "CONTACT_DETAILS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CONTACT_DETAILS" MODIFY ("KONTRAG_ID" NOT NULL ENABLE);
  ALTER TABLE "CONTACT_DETAILS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "CONTACT_DETAILS" ADD CONSTRAINT "CONTACT_DETAILS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CURRENCY
--------------------------------------------------------

  ALTER TABLE "CURRENCY" ADD CONSTRAINT "CURRENCY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "CURRENCY" ADD CONSTRAINT "CURRENCY_CHK1" CHECK (deleted in (0,1)) ENABLE;
  ALTER TABLE "CURRENCY" ADD CONSTRAINT "CURRENCY_CHK2" CHECK (PREDEFINED in (0,1)) ENABLE;
  ALTER TABLE "CURRENCY" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "CURRENCY" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "CURRENCY" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "CURRENCY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "CURRENCY" MODIFY ("ID_XML" NOT NULL ENABLE);
  ALTER TABLE "CURRENCY" MODIFY ("IS_GROUP" NOT NULL ENABLE);
  ALTER TABLE "CURRENCY" MODIFY ("PREDEFINED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DIR_FILE_UPLOAD
--------------------------------------------------------

  ALTER TABLE "DIR_FILE_UPLOAD" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "DIR_FILE_UPLOAD" MODIFY ("DIRECTORY" NOT NULL ENABLE);
  ALTER TABLE "DIR_FILE_UPLOAD" ADD CONSTRAINT "DIR_FILE_UPLOAD_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table DIVISIONS
--------------------------------------------------------

  ALTER TABLE "DIVISIONS" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "DIVISIONS" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "DIVISIONS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "DIVISIONS" MODIFY ("IS_GROUP" NOT NULL ENABLE);
  ALTER TABLE "DIVISIONS" MODIFY ("PREDEFINED" NOT NULL ENABLE);
  ALTER TABLE "DIVISIONS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "DIVISIONS" ADD CONSTRAINT "DIVISIONS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table DIVISION_SOTR
--------------------------------------------------------

  ALTER TABLE "DIVISION_SOTR" MODIFY ("DIV_ID" NOT NULL ENABLE);
  ALTER TABLE "DIVISION_SOTR" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "DIVISION_SOTR" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "DIVISION_SOTR" ADD CONSTRAINT "DIVISION_SOTR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ENTRY_SETTINGS
--------------------------------------------------------

  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("PLAN_ACC_DEB_ID" NOT NULL ENABLE);
  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("PLAN_ACC_KRED_ID" NOT NULL ENABLE);
  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("TYPEDEF_ID" NOT NULL ENABLE);
  ALTER TABLE "ENTRY_SETTINGS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "ENTRY_SETTINGS" ADD CONSTRAINT "ENTRY_SETTINGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ENUM_ACCOUNT_TYPE
--------------------------------------------------------

  ALTER TABLE "ENUM_ACCOUNT_TYPE" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "ENUM_ACCOUNT_TYPE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ENUM_ACCOUNT_TYPE" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "ENUM_ACCOUNT_TYPE" ADD CONSTRAINT "ENUM_ACCOUNT_TYPE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ENUM_ACCOUNT_TYPE" ADD CONSTRAINT "ENUM_ACCOUNT_TYPE_UK1" UNIQUE ("FULLNAME")
  USING INDEX  ENABLE;
  ALTER TABLE "ENUM_ACCOUNT_TYPE" ADD CONSTRAINT "ENUM_ACCOUNT_TYPE_CHK1" CHECK (FULLNAME IN ('Активный', 'Пассивный', 'Активный/Пассивный')) ENABLE;
--------------------------------------------------------
--  Constraints for Table EX_RATES_SETTINGS
--------------------------------------------------------

  ALTER TABLE "EX_RATES_SETTINGS" MODIFY ("CURR_ID" NOT NULL ENABLE);
  ALTER TABLE "EX_RATES_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "EX_RATES_SETTINGS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "EX_RATES_SETTINGS" ADD CONSTRAINT "EX_RATES_SETTINGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "EX_RATES_SETTINGS" ADD CONSTRAINT "EX_RATES_SETTINGS_UK1" UNIQUE ("CURR_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table FIRMS
--------------------------------------------------------

  ALTER TABLE "FIRMS" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "FIRMS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "FIRMS" MODIFY ("PREDEFINED" NOT NULL ENABLE);
  ALTER TABLE "FIRMS" MODIFY ("PRINTNAME" NOT NULL ENABLE);
  ALTER TABLE "FIRMS" MODIFY ("UR_FIZ" NOT NULL ENABLE);
  ALTER TABLE "FIRMS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "FIRMS" ADD CONSTRAINT "FIRMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "FIRMS" MODIFY ("DELETED" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GROUPMEMBERS
--------------------------------------------------------

  ALTER TABLE "GROUPMEMBERS" MODIFY ("G_MEMBER" NOT NULL ENABLE);
  ALTER TABLE "GROUPMEMBERS" MODIFY ("G_NAME" NOT NULL ENABLE);
  ALTER TABLE "GROUPMEMBERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "GROUPMEMBERS" ADD CONSTRAINT "GROUPMEMBERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table GROUPS
--------------------------------------------------------

  ALTER TABLE "GROUPS" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "GROUPS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "GROUPS" ADD CONSTRAINT "GROUPS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "GROUPS" ADD CONSTRAINT "GROUPS_UK1" UNIQUE ("FULLNAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table IMPORTED_PRICE
--------------------------------------------------------

  ALTER TABLE "IMPORTED_PRICE" ADD CONSTRAINT "IMPORTED_PRICE_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("ED_IZM" NOT NULL ENABLE);
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("NOM_NAME" NOT NULL ENABLE);
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("PRICE_GOODS" NOT NULL ENABLE);
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("PRICE_USL" NOT NULL ENABLE);
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "IMPORTED_PRICE" MODIFY ("DAT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KASSA
--------------------------------------------------------

  ALTER TABLE "KASSA" MODIFY ("CURR_ID" NOT NULL ENABLE);
  ALTER TABLE "KASSA" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "KASSA" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "KASSA" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "KASSA" MODIFY ("IS_GROUP" NOT NULL ENABLE);
  ALTER TABLE "KASSA" MODIFY ("PREDEFINED" NOT NULL ENABLE);
  ALTER TABLE "KASSA" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "KASSA" ADD CONSTRAINT "KASSA_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table KONTRAGENTS
--------------------------------------------------------

  ALTER TABLE "KONTRAGENTS" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "KONTRAGENTS" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "KONTRAGENTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "KONTRAGENTS" MODIFY ("IS_BUYER" NOT NULL ENABLE);
  ALTER TABLE "KONTRAGENTS" MODIFY ("IS_GROUP" NOT NULL ENABLE);
  ALTER TABLE "KONTRAGENTS" MODIFY ("IS_MEASURER" NOT NULL ENABLE);
  ALTER TABLE "KONTRAGENTS" MODIFY ("IS_SUPPLIER" NOT NULL ENABLE);
  ALTER TABLE "KONTRAGENTS" MODIFY ("PREDEFINED" NOT NULL ENABLE);
  ALTER TABLE "KONTRAGENTS" MODIFY ("UR_FIZ" NOT NULL ENABLE);
  ALTER TABLE "KONTRAGENTS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "KONTRAGENTS" ADD CONSTRAINT "KONTRAGENTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEASURE_UNIT
--------------------------------------------------------

  ALTER TABLE "MEASURE_UNIT" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "MEASURE_UNIT" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "MEASURE_UNIT" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "MEASURE_UNIT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MEASURE_UNIT" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "MEASURE_UNIT" ADD CONSTRAINT "MEASURE_UNIT_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "MEASURE_UNIT" ADD CONSTRAINT "MEASURE_UNIT_CHK1" CHECK (DELETED IN (1, 0)) ENABLE;
--------------------------------------------------------
--  Constraints for Table MOVES
--------------------------------------------------------

  ALTER TABLE "MOVES" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
  ALTER TABLE "MOVES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MOVES" MODIFY ("PERIOD" NOT NULL ENABLE);
  ALTER TABLE "MOVES" MODIFY ("PLAN_ACC_DEB_ID" NOT NULL ENABLE);
  ALTER TABLE "MOVES" MODIFY ("PLAN_ACC_KRED_ID" NOT NULL ENABLE);
  ALTER TABLE "MOVES" MODIFY ("REGISTRATOR_ID" NOT NULL ENABLE);
  ALTER TABLE "MOVES" MODIFY ("REGISTRATOR_TYPE" NOT NULL ENABLE);
  ALTER TABLE "MOVES" MODIFY ("SUMM_UPR_DEB" NOT NULL ENABLE);
  ALTER TABLE "MOVES" MODIFY ("SUMM_UPR_KRED" NOT NULL ENABLE);
  ALTER TABLE "MOVES" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOMENKLATURA
--------------------------------------------------------

  ALTER TABLE "NOMENKLATURA" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "NOMENKLATURA" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "NOMENKLATURA" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "NOMENKLATURA" MODIFY ("IS_GROUP" NOT NULL ENABLE);
  ALTER TABLE "NOMENKLATURA" MODIFY ("PREDEFINED" NOT NULL ENABLE);
  ALTER TABLE "NOMENKLATURA" MODIFY ("USLUGA" NOT NULL ENABLE);
  ALTER TABLE "NOMENKLATURA" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "NOMENKLATURA" ADD CONSTRAINT "NOMENKLATURA_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTIFICATION
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" MODIFY ("DAT" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" MODIFY ("DESCRIPTION" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "NOTIFICATION" ADD CONSTRAINT "NOTIFICATION_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table NUMERATOR
--------------------------------------------------------

  ALTER TABLE "NUMERATOR" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "NUMERATOR" MODIFY ("PREFIX" NOT NULL ENABLE);
  ALTER TABLE "NUMERATOR" MODIFY ("TYPEDEF_ID" NOT NULL ENABLE);
  ALTER TABLE "NUMERATOR" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "NUMERATOR" ADD CONSTRAINT "NUMERATOR_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table OPERATORES_PHONES
--------------------------------------------------------

  ALTER TABLE "OPERATORES_PHONES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "OPERATORES_PHONES" ADD CONSTRAINT "OPERATORES_PHONES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ORDERS" MODIFY ("CURR_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("DAT" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("FIRM_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("KASSA_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("KONTRAG_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("KRATNOST" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("KURS" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("NUM" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("POSTED" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("STATUS_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_CHK1" CHECK (DELETED IN (1, 0)) ENABLE;
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_CHK2" CHECK (POSTED IN (1, 0)) ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDERS_TP_OPLATY
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_OPLATY" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_OPLATY" MODIFY ("DAT" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_OPLATY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_OPLATY" MODIFY ("ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_OPLATY" MODIFY ("SUM" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_OPLATY" ADD CONSTRAINT "ORDERS_TP_OPLATY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDERS_TP_USLUGI
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("DAT_COMPLETE" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("MEASURE_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("NOM_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("ORDER_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("QUANTITY" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("SOTR_ID" NOT NULL ENABLE);
  ALTER TABLE "ORDERS_TP_USLUGI" MODIFY ("SUMM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ORDER_STATUS
--------------------------------------------------------

  ALTER TABLE "ORDER_STATUS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ORDER_STATUS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "ORDER_STATUS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "ORDER_STATUS" ADD CONSTRAINT "ORDER_STATUS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PLAN_ACC
--------------------------------------------------------

  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_UK1" UNIQUE ("FULLNAME", "CODE")
  USING INDEX  ENABLE;
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_CHK1" CHECK (ZABALANSOV IN (1, 0)) ENABLE;
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_CHK2" CHECK (VALUTN IN (1, 0)) ENABLE;
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_CHK3" CHECK (DELETED IN (1, 0)) ENABLE;
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_CHK4" CHECK (KOLISHESTV IN (1, 0)) ENABLE;
  ALTER TABLE "PLAN_ACC" MODIFY ("ACC_TYPE" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC" MODIFY ("KOLISHESTV" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC" MODIFY ("VALUTN" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC" MODIFY ("ZABALANSOV" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PLAN_ACC_SUBCONTO
--------------------------------------------------------

  ALTER TABLE "PLAN_ACC_SUBCONTO" ADD CONSTRAINT "PLAN_ACC_SUBCONTO_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "PLAN_ACC_SUBCONTO" ADD CONSTRAINT "PLAN_ACC_SUBCONTO_CHK1" CHECK (OBOROT_ONLY IN (1, 0)) ENABLE;
  ALTER TABLE "PLAN_ACC_SUBCONTO" ADD CONSTRAINT "PLAN_ACC_SUBCONTO_CHK2" CHECK (SUMMOVOY IN (1, 0)) ENABLE;
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("OBOROT_ONLY" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("PLAN_ACC_ID" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("PLAN_TYPE_SUBC" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("SUMMOVOY" NOT NULL ENABLE);
  ALTER TABLE "PLAN_ACC_SUBCONTO" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PLAN_TYPE_SUBCONTO
--------------------------------------------------------

  ALTER TABLE "PLAN_TYPE_SUBCONTO" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "PLAN_TYPE_SUBCONTO" MODIFY ("TYPE_OF_OBJ" NOT NULL ENABLE);
  ALTER TABLE "PLAN_TYPE_SUBCONTO" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "PLAN_TYPE_SUBCONTO" ADD CONSTRAINT "PLAN_TYPE_SUBCONTO_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "PLAN_TYPE_SUBCONTO" ADD CONSTRAINT "PLAN_TYPE_SUBCONTO_UK1" UNIQUE ("TYPE_OF_OBJ")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PS_TXN
--------------------------------------------------------

  ALTER TABLE "PS_TXN" ADD CONSTRAINT "PS_TXN_PK" PRIMARY KEY ("COLLID", "ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_BLOB_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_BLOB_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_BLOB_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_BLOB_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "QRTZ_BLOB_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_CALENDARS
--------------------------------------------------------

  ALTER TABLE "QRTZ_CALENDARS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_CALENDARS" MODIFY ("CALENDAR_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_CALENDARS" MODIFY ("CALENDAR" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_CALENDARS" ADD CONSTRAINT "QRTZ_CALENDARS_PK" PRIMARY KEY ("SCHED_NAME", "CALENDAR_NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_CRON_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_CRON_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_CRON_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_CRON_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_CRON_TRIGGERS" MODIFY ("CRON_EXPRESSION" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "QRTZ_CRON_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_FIRED_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("ENTRY_ID" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("INSTANCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("FIRED_TIME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("SCHED_TIME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("PRIORITY" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" MODIFY ("STATE" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD CONSTRAINT "QRTZ_FIRED_TRIGGER_PK" PRIMARY KEY ("SCHED_NAME", "ENTRY_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_JOB_DETAILS
--------------------------------------------------------

  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("JOB_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("JOB_GROUP" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("JOB_CLASS_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("IS_DURABLE" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("IS_NONCONCURRENT" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("IS_UPDATE_DATA" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_JOB_DETAILS" MODIFY ("REQUESTS_RECOVERY" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_JOB_DETAILS" ADD CONSTRAINT "QRTZ_JOB_DETAILS_PK" PRIMARY KEY ("SCHED_NAME", "JOB_NAME", "JOB_GROUP")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_LOCKS
--------------------------------------------------------

  ALTER TABLE "QRTZ_LOCKS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_LOCKS" MODIFY ("LOCK_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_LOCKS" ADD CONSTRAINT "QRTZ_LOCKS_PK" PRIMARY KEY ("SCHED_NAME", "LOCK_NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_PAUSED_TRIGGER_GRPS
--------------------------------------------------------

  ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" ADD CONSTRAINT "QRTZ_PAUSED_TRIG_GRPS_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_GROUP")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_SCHEDULER_STATE
--------------------------------------------------------

  ALTER TABLE "QRTZ_SCHEDULER_STATE" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SCHEDULER_STATE" MODIFY ("INSTANCE_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SCHEDULER_STATE" MODIFY ("LAST_CHECKIN_TIME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SCHEDULER_STATE" MODIFY ("CHECKIN_INTERVAL" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD CONSTRAINT "QRTZ_SCHEDULER_STATE_PK" PRIMARY KEY ("SCHED_NAME", "INSTANCE_NAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_SIMPLE_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("REPEAT_COUNT" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("REPEAT_INTERVAL" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" MODIFY ("TIMES_TRIGGERED" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPLE_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_SIMPROP_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPROP_TRIG_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QRTZ_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("SCHED_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("TRIGGER_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("TRIGGER_GROUP" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("JOB_NAME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("JOB_GROUP" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("TRIGGER_STATE" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("TRIGGER_TYPE" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_TRIGGERS" MODIFY ("START_TIME" NOT NULL ENABLE);
  ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "QRTZ_TRIGGERS_PK" PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table QUARTZ_PROPERTY
--------------------------------------------------------

  ALTER TABLE "QUARTZ_PROPERTY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "QUARTZ_PROPERTY" ADD CONSTRAINT "QUARTZ_PROPERTY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table REG_PRICES
--------------------------------------------------------

  ALTER TABLE "REG_PRICES" ADD CONSTRAINT "REG_PRICES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "REG_PRICES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "REG_PRICES" MODIFY ("NOM_ID" NOT NULL ENABLE);
  ALTER TABLE "REG_PRICES" MODIFY ("PERIOD" NOT NULL ENABLE);
  ALTER TABLE "REG_PRICES" MODIFY ("PRICE_USL" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REG_RATES
--------------------------------------------------------

  ALTER TABLE "REG_RATES" ADD CONSTRAINT "REG_RATES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "REG_RATES" MODIFY ("CURR_ID" NOT NULL ENABLE);
  ALTER TABLE "REG_RATES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "REG_RATES" MODIFY ("KRATNOST" NOT NULL ENABLE);
  ALTER TABLE "REG_RATES" MODIFY ("KURS" NOT NULL ENABLE);
  ALTER TABLE "REG_RATES" MODIFY ("PERIOD" NOT NULL ENABLE);
  ALTER TABLE "REG_RATES" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TYPE_DEF
--------------------------------------------------------

  ALTER TABLE "TYPE_DEF" ADD CONSTRAINT "TYPE_DEF_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "TYPE_DEF" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "TYPE_DEF" MODIFY ("VERSION" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TYPE_OF_ACTIVITIES
--------------------------------------------------------

  ALTER TABLE "TYPE_OF_ACTIVITIES" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "TYPE_OF_ACTIVITIES" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "TYPE_OF_ACTIVITIES" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "TYPE_OF_ACTIVITIES" ADD CONSTRAINT "TYPE_OF_ACTIVITIES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "USERS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "USERS" MODIFY ("FIRST_NAME" NOT NULL ENABLE);
  ALTER TABLE "USERS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "USERS" MODIFY ("IS_ADMIN" NOT NULL ENABLE);
  ALTER TABLE "USERS" MODIFY ("LAST_NAME" NOT NULL ENABLE);
  ALTER TABLE "USERS" MODIFY ("LOGIN" NOT NULL ENABLE);
  ALTER TABLE "USERS" MODIFY ("PASS_WD" NOT NULL ENABLE);
  ALTER TABLE "USERS" MODIFY ("PREDEFINED" NOT NULL ENABLE);
  ALTER TABLE "USERS" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "USERS" ADD CONSTRAINT "USERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "USERS" ADD CONSTRAINT "USERS_UK1" UNIQUE ("LOGIN")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS_GROUPS
--------------------------------------------------------

  ALTER TABLE "USERS_GROUPS" MODIFY ("GROUPS_ID" NOT NULL DISABLE);
  ALTER TABLE "USERS_GROUPS" MODIFY ("ID" NOT NULL DISABLE);
  ALTER TABLE "USERS_GROUPS" MODIFY ("USER_ID" NOT NULL DISABLE);
  ALTER TABLE "USERS_GROUPS" ADD CONSTRAINT "USERS_GROUPS_PK" PRIMARY KEY ("ID") DISABLE;
--------------------------------------------------------
--  Constraints for Table USER_SETTINGS
--------------------------------------------------------

  ALTER TABLE "USER_SETTINGS" MODIFY ("ACTIVITIES_ID" NOT NULL ENABLE);
  ALTER TABLE "USER_SETTINGS" MODIFY ("CURRENCY_ID" NOT NULL ENABLE);
  ALTER TABLE "USER_SETTINGS" MODIFY ("DIVISION_ID" NOT NULL ENABLE);
  ALTER TABLE "USER_SETTINGS" MODIFY ("FIRMA_ID" NOT NULL ENABLE);
  ALTER TABLE "USER_SETTINGS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "USER_SETTINGS" MODIFY ("KASSA_ID" NOT NULL ENABLE);
  ALTER TABLE "USER_SETTINGS" MODIFY ("MAIN_USLUGA" NOT NULL ENABLE);
  ALTER TABLE "USER_SETTINGS" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_UK1" UNIQUE ("USER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table VOUCHER
--------------------------------------------------------

  ALTER TABLE "VOUCHER" MODIFY ("CODE" NOT NULL ENABLE);
  ALTER TABLE "VOUCHER" MODIFY ("EXPIRED_BY" NOT NULL ENABLE);
  ALTER TABLE "VOUCHER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "VOUCHER" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "VOUCHER" ADD CONSTRAINT "VOUCHER_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table XML_T
--------------------------------------------------------

  ALTER TABLE "XML_T" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "XML_T" MODIFY ("ONE" NOT NULL ENABLE);
  ALTER TABLE "XML_T" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "XML_T" ADD CONSTRAINT "XML_T_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZATRATY
--------------------------------------------------------

  ALTER TABLE "ZATRATY" MODIFY ("DELETED" NOT NULL ENABLE);
  ALTER TABLE "ZATRATY" MODIFY ("FULLNAME" NOT NULL ENABLE);
  ALTER TABLE "ZATRATY" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ZATRATY" MODIFY ("IS_GROUP" NOT NULL ENABLE);
  ALTER TABLE "ZATRATY" MODIFY ("PREDEFINED" NOT NULL ENABLE);
  ALTER TABLE "ZATRATY" MODIFY ("VERSION" NOT NULL ENABLE);
  ALTER TABLE "ZATRATY" ADD CONSTRAINT "ZATRATY_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CALL_LISTS
--------------------------------------------------------

  ALTER TABLE "CALL_LISTS" ADD CONSTRAINT "CALL_LISTS_FK1" FOREIGN KEY ("KONTRAGENTS_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CALL_LOG
--------------------------------------------------------

  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_FK1" FOREIGN KEY ("CALL_STATUS")
	  REFERENCES "CALL_STATUS" ("ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_FK2" FOREIGN KEY ("CONTACT_ID")
	  REFERENCES "CONTACT_DETAILS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_FK3" FOREIGN KEY ("COMP_DET_ID")
	  REFERENCES "COMPAIGNS_DETAILS" ("ID") ENABLE;
  ALTER TABLE "CALL_LOG" ADD CONSTRAINT "CALL_LOG_FK4" FOREIGN KEY ("CALL_RESULTS")
	  REFERENCES "CALL_RESULTS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CALL_MEMO
--------------------------------------------------------

  ALTER TABLE "CALL_MEMO" ADD CONSTRAINT "CALL_MEMO_FK1" FOREIGN KEY ("CALL_LOG")
	  REFERENCES "CALL_LOG" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CDR
--------------------------------------------------------

  ALTER TABLE "CDR" ADD CONSTRAINT "CDR_FK1" FOREIGN KEY ("KONTRAGENT_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMPAIGNS_DETAILS
--------------------------------------------------------

  ALTER TABLE "COMPAIGNS_DETAILS" ADD CONSTRAINT "COMPAIGNS_DETAILS_FK1" FOREIGN KEY ("COMPAIGN_ID")
	  REFERENCES "COMPAIGNS" ("ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "COMPAIGNS_DETAILS" ADD CONSTRAINT "COMPAIGNS_DETAILS_FK2" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "COMPAIGNS_DETAILS" ADD CONSTRAINT "COMPAIGNS_DETAILS_FK3" FOREIGN KEY ("CONTACT_ID")
	  REFERENCES "CONTACT_DETAILS" ("ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CONTACT_DETAILS
--------------------------------------------------------

  ALTER TABLE "CONTACT_DETAILS" ADD CONSTRAINT "CONTACT_DETAILS_FK1" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DIVISIONS
--------------------------------------------------------

  ALTER TABLE "DIVISIONS" ADD CONSTRAINT "DIVISIONS_DIVISIONS_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DIVISION_SOTR
--------------------------------------------------------

  ALTER TABLE "DIVISION_SOTR" ADD CONSTRAINT "DIVISION_SOTR_FK1" FOREIGN KEY ("DIV_ID")
	  REFERENCES "DIVISIONS" ("ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "DIVISION_SOTR" ADD CONSTRAINT "DIVISION_SOTR_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ENTRY_SETTINGS
--------------------------------------------------------

  ALTER TABLE "ENTRY_SETTINGS" ADD CONSTRAINT "ENTRY_SETTINGS_PLAN_ACC_DEB" FOREIGN KEY ("PLAN_ACC_DEB_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
  ALTER TABLE "ENTRY_SETTINGS" ADD CONSTRAINT "ENTRY_SETTINGS_PLAN_ACC_KRED" FOREIGN KEY ("PLAN_ACC_KRED_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
  ALTER TABLE "ENTRY_SETTINGS" ADD CONSTRAINT "ENTRY_SETTINGS_TYPE_DEF_FK1" FOREIGN KEY ("TYPEDEF_ID")
	  REFERENCES "TYPE_DEF" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EX_RATES_SETTINGS
--------------------------------------------------------

  ALTER TABLE "EX_RATES_SETTINGS" ADD CONSTRAINT "EX_RATES_SETTINGS_CURRENC_FK1" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GROUPMEMBERS
--------------------------------------------------------

  ALTER TABLE "GROUPMEMBERS" ADD CONSTRAINT "GROUPMEMBERS_FK2" FOREIGN KEY ("G_NAME")
	  REFERENCES "GROUPS" ("FULLNAME") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KASSA
--------------------------------------------------------

  ALTER TABLE "KASSA" ADD CONSTRAINT "KASSA_CURRENCY_FK1" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
  ALTER TABLE "KASSA" ADD CONSTRAINT "KASSA_DIVISIONS_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
  ALTER TABLE "KASSA" ADD CONSTRAINT "KASSA_KASSA_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KONTRAGENTS
--------------------------------------------------------

  ALTER TABLE "KONTRAGENTS" ADD CONSTRAINT "KONTRAGENTS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "KONTRAGENTS" ADD CONSTRAINT "KONTRAGENTS_KONTRAGENTS_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MOVES
--------------------------------------------------------

  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_CURRENCY_FK1" FOREIGN KEY ("CURR_DEB")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_CURRENCY_FK2" FOREIGN KEY ("CURR_KRED")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_FK1" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_PLAN_ACC_FK1" FOREIGN KEY ("PLAN_ACC_DEB_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_PLAN_ACC_FK2" FOREIGN KEY ("PLAN_ACC_KRED_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
  ALTER TABLE "MOVES" ADD CONSTRAINT "MOVES_TYPE_DEF_FK1" FOREIGN KEY ("REGISTRATOR_TYPE")
	  REFERENCES "TYPE_DEF" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOMENKLATURA
--------------------------------------------------------

  ALTER TABLE "NOMENKLATURA" ADD CONSTRAINT "NOMENKLATURA_NOMENKLATURA_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "NOMENKLATURA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTIFICATION
--------------------------------------------------------

  ALTER TABLE "NOTIFICATION" ADD CONSTRAINT "NOTIFICATION_FK1" FOREIGN KEY ("CONTACT")
	  REFERENCES "CONTACT_DETAILS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NUMERATOR
--------------------------------------------------------

  ALTER TABLE "NUMERATOR" ADD CONSTRAINT "NUMERATOR_TYPE_DEF_FK1" FOREIGN KEY ("TYPEDEF_ID")
	  REFERENCES "TYPE_DEF" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_CURRENCY_FK1" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_DIVISIONS_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_FIRMS_FK1" FOREIGN KEY ("FIRM_ID")
	  REFERENCES "FIRMS" ("ID") ENABLE;
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_FK1" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_FK2" FOREIGN KEY ("ZAMER_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_KASSA_FK1" FOREIGN KEY ("KASSA_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_KONTRAGENTS_FK1" FOREIGN KEY ("KONTRAG_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_STATUS_FK" FOREIGN KEY ("STATUS_ID")
	  REFERENCES "ORDER_STATUS" ("ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "ORDERS" ADD CONSTRAINT "ORDERS_USERS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS_TP_OPLATY
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_OPLATY" ADD CONSTRAINT "ORDERS_TP_OPLATY_FK1" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDERS" ("ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "ORDERS_TP_OPLATY" ADD CONSTRAINT "ORDERS_TP_OPLATY_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDERS_TP_USLUGI
--------------------------------------------------------

  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_FK1" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDERS" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_FK2" FOREIGN KEY ("NOM_ID")
	  REFERENCES "NOMENKLATURA" ("ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_FK3" FOREIGN KEY ("SOTR_ID")
	  REFERENCES "KONTRAGENTS" ("ID") ENABLE;
  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_FK4" FOREIGN KEY ("GROUP_ID")
	  REFERENCES "NOMENKLATURA" ("ID") ON DELETE SET NULL ENABLE;
  ALTER TABLE "ORDERS_TP_USLUGI" ADD CONSTRAINT "ORDERS_TP_USLUGI_FK5" FOREIGN KEY ("MEASURE_ID")
	  REFERENCES "MEASURE_UNIT" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLAN_ACC
--------------------------------------------------------

  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
  ALTER TABLE "PLAN_ACC" ADD CONSTRAINT "PLAN_ACC_FK2" FOREIGN KEY ("ACC_TYPE")
	  REFERENCES "ENUM_ACCOUNT_TYPE" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLAN_ACC_SUBCONTO
--------------------------------------------------------

  ALTER TABLE "PLAN_ACC_SUBCONTO" ADD CONSTRAINT "PLAN_ACC_SUBCONTO_FK1" FOREIGN KEY ("PLAN_ACC_ID")
	  REFERENCES "PLAN_ACC" ("ID") ENABLE;
  ALTER TABLE "PLAN_ACC_SUBCONTO" ADD CONSTRAINT "PLAN_ACC_SUBCONTO_FK2" FOREIGN KEY ("PLAN_TYPE_SUBC")
	  REFERENCES "PLAN_TYPE_SUBCONTO" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PLAN_TYPE_SUBCONTO
--------------------------------------------------------

  ALTER TABLE "PLAN_TYPE_SUBCONTO" ADD CONSTRAINT "PLAN_TYPE_SUBCONTO_TYPE_D_FK1" FOREIGN KEY ("TYPE_OF_OBJ")
	  REFERENCES "TYPE_DEF" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QRTZ_BLOB_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD CONSTRAINT "QRTZ_BLOB_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QRTZ_CRON_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD CONSTRAINT "QRTZ_CRON_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QRTZ_SIMPLE_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPLE_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QRTZ_SIMPROP_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD CONSTRAINT "QRTZ_SIMPROP_TRIG_TO_TRIG_FK" FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QRTZ_TRIGGERS
--------------------------------------------------------

  ALTER TABLE "QRTZ_TRIGGERS" ADD CONSTRAINT "QRTZ_TRIGGER_TO_JOBS_FK" FOREIGN KEY ("SCHED_NAME", "JOB_NAME", "JOB_GROUP")
	  REFERENCES "QRTZ_JOB_DETAILS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REG_PRICES
--------------------------------------------------------

  ALTER TABLE "REG_PRICES" ADD CONSTRAINT "REG_PRICES_FK1" FOREIGN KEY ("NOM_ID")
	  REFERENCES "NOMENKLATURA" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "REG_PRICES" ADD CONSTRAINT "REG_PRICES_FK2" FOREIGN KEY ("ED_IZM")
	  REFERENCES "MEASURE_UNIT" ("ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REG_RATES
--------------------------------------------------------

  ALTER TABLE "REG_RATES" ADD CONSTRAINT "REG_RATES_FK1" FOREIGN KEY ("CURR_ID")
	  REFERENCES "CURRENCY" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USER_SETTINGS
--------------------------------------------------------

  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_CURRENCY_FK1" FOREIGN KEY ("CURRENCY_ID")
	  REFERENCES "CURRENCY" ("ID") ENABLE;
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_DIVISIONS_FK1" FOREIGN KEY ("DIVISION_ID")
	  REFERENCES "DIVISIONS" ("ID") ENABLE;
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_FIRMS_FK1" FOREIGN KEY ("FIRMA_ID")
	  REFERENCES "FIRMS" ("ID") ENABLE;
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_FK1" FOREIGN KEY ("ACTIVITIES_ID")
	  REFERENCES "TYPE_OF_ACTIVITIES" ("ID") ENABLE;
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_KASSA_FK1" FOREIGN KEY ("KASSA_ID")
	  REFERENCES "KASSA" ("ID") ENABLE;
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_NOMENKLATUR_FK1" FOREIGN KEY ("MAIN_USLUGA")
	  REFERENCES "NOMENKLATURA" ("ID") ENABLE;
  ALTER TABLE "USER_SETTINGS" ADD CONSTRAINT "USER_SETTINGS_USERS_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZATRATY
--------------------------------------------------------

  ALTER TABLE "ZATRATY" ADD CONSTRAINT "ZATRATY_ZATRATY_FK1" FOREIGN KEY ("PARENT_ID")
	  REFERENCES "ZATRATY" ("ID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger ASTER_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ASTER_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "ASTER_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "ASTER_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CALL_LOG_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CALL_LOG_TRG" 
  BEFORE INSERT OR UPDATE ON "CALL_LOG"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "CALL_LOG_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CALL_RESULTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CALL_RESULTS_TRG" 
  BEFORE INSERT OR UPDATE ON "CALL_RESULTS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "CALL_RESULTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CALL_STATUS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CALL_STATUS_TRG" 
  BEFORE INSERT OR UPDATE ON "CALL_STATUS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "CALL_STATUS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMPAIGNS_DETAILS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "COMPAIGNS_DETAILS_TRG" 
  BEFORE INSERT OR UPDATE ON "COMPAIGNS_DETAILS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "COMPAIGNS_DETAILS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COMPAIGNS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "COMPAIGNS_TRG" 
  BEFORE INSERT OR UPDATE ON "COMPAIGNS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "COMPAIGNS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CONTACT_DETAILS_TGR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CONTACT_DETAILS_TGR" 
  BEFORE INSERT OR UPDATE ON "CONTACT_DETAILS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "CONTACT_DETAILS_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CURRENCY_TGR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CURRENCY_TGR" 
  BEFORE INSERT OR UPDATE ON "CURRENCY"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "CURRENCY_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CURRENCY_TRG_AI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "CURRENCY_TRG_AI" 
  AFTER INSERT ON "CURRENCY"
  REFERENCING FOR EACH ROW
  begin
  insert into reg_rates (curr_id) values(:new."ID");
end;
/
ALTER TRIGGER "CURRENCY_TRG_AI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DIVISIONS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "DIVISIONS_TRG" 
  BEFORE INSERT OR UPDATE ON "DIVISIONS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "DIVISIONS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DIVISION_SOTR_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "DIVISION_SOTR_TRG" 
  BEFORE INSERT OR UPDATE ON "DIVISION_SOTR"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "DIVISION_SOTR_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ENTRY_SETTINGS_TGR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ENTRY_SETTINGS_TGR" 
  BEFORE INSERT OR UPDATE ON "ENTRY_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "ENTRY_SETTINGS_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ENUM_ACCOUNT_TYPE_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ENUM_ACCOUNT_TYPE_TRG" 
  BEFORE INSERT OR UPDATE ON "ENUM_ACCOUNT_TYPE"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "ENUM_ACCOUNT_TYPE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger EX_RATES_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "EX_RATES_SETTINGS_TRG" 
  BEFORE INSERT OR UPDATE ON "EX_RATES_SETTINGS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "EX_RATES_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FIRMS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "FIRMS_TRG" 
  BEFORE INSERT OR UPDATE ON "FIRMS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "FIRMS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GROUPMEMBERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "GROUPMEMBERS_TRG" 
  BEFORE INSERT OR UPDATE ON "GROUPMEMBERS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "GROUPMEMBERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger GROUPS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "GROUPS_TRG" 
  BEFORE INSERT OR UPDATE ON "GROUPS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "GROUPS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger IMPORTED_PRICE_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "IMPORTED_PRICE_TRG" 
  BEFORE INSERT OR UPDATE ON "IMPORTED_PRICE"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "IMPORTED_PRICE_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger JOB_END_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "JOB_END_TRG" BEFORE DELETE ON QRTZ_TRIGGERS 
BEGIN  
 UPDATE NOTIFICATION SET SERVER='1' WHERE TRG_NAME=(SELECT TRIGGER_NAME FROM (SELECT TRIGGER_NAME FROM QRTZ_TRIGGERS ORDER BY NEXT_FIRE_TIME)  WHERE ROWNUM = 1);
END;
/
ALTER TRIGGER "JOB_END_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KASSA_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "KASSA_TRG" 
  BEFORE INSERT OR UPDATE ON "KASSA"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "KASSA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger KONTRAGENTS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "KONTRAGENTS_TRG" 
  BEFORE INSERT OR UPDATE ON "KONTRAGENTS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
        select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "KONTRAGENTS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MEASURE_UNIT_TGR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "MEASURE_UNIT_TGR" 
  BEFORE INSERT OR UPDATE ON "MEASURE_UNIT"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "MEASURE_UNIT_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger MOVES_TGR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "MOVES_TGR" 
  BEFORE INSERT OR UPDATE ON "MOVES"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "MOVES_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NOMENKLATURA_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "NOMENKLATURA_TRG" 
  BEFORE INSERT OR UPDATE ON "NOMENKLATURA"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
        select utility.uuid() into :new."ID" from dual; 
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "NOMENKLATURA_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger NUMERATOR_TGR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "NUMERATOR_TGR" 
  BEFORE INSERT OR UPDATE ON "NUMERATOR"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "NUMERATOR_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERS_TP_OPLATY_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ORDERS_TP_OPLATY_TRG" 
  BEFORE INSERT OR UPDATE ON "ORDERS_TP_OPLATY"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then
      
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      end if;
end;
/
ALTER TRIGGER "ORDERS_TP_OPLATY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERS_TP_USLUGI_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ORDERS_TP_USLUGI_TRG" 
  BEFORE INSERT OR UPDATE ON "ORDERS_TP_USLUGI"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then
      
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      end if;
end;
/
ALTER TRIGGER "ORDERS_TP_USLUGI_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ORDERS_TRG" 
  BEFORE INSERT OR UPDATE ON "ORDERS"
  REFERENCING FOR EACH ROW
  declare
  l_rec type_def%rowtype;
  l_num numerator.prefix%type;
begin  
   if inserting then
      select * into l_rec from type_def where upper(table_name) = 'ORDERS';
      if l_rec.id is not null then
          select prefix into l_num from numerator where typedef_id = l_rec.id;
      end if;
      
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if;
      if :new."NUM" is null then
          if l_num is null then
            select orders_num_seq.nextval into :new."NUM" from dual;
          else
            select l_num||orders_num_seq.nextval into :new."NUM" from dual;
          end if;  
      end if;
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "ORDERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ORDER_STATUS_TGR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ORDER_STATUS_TGR" 
  BEFORE INSERT OR UPDATE ON "ORDER_STATUS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "ORDER_STATUS_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PLAN_ACC_SUBCONTO_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PLAN_ACC_SUBCONTO_TRG" 
  BEFORE INSERT OR UPDATE ON "PLAN_ACC_SUBCONTO"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "PLAN_ACC_SUBCONTO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PLAN_ACC_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PLAN_ACC_TRG" 
  BEFORE INSERT OR UPDATE ON "PLAN_ACC"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "PLAN_ACC_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger PLAN_TYPE_SUBCONTO_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PLAN_TYPE_SUBCONTO_TRG" 
  BEFORE INSERT OR UPDATE ON "PLAN_TYPE_SUBCONTO"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "PLAN_TYPE_SUBCONTO_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger REG_PRICES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "REG_PRICES_TRG" 
  BEFORE INSERT OR UPDATE ON "REG_PRICES"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if; 
end;
/
ALTER TRIGGER "REG_PRICES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger REG_RATES_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "REG_RATES_TRG" 
  BEFORE INSERT OR UPDATE ON "REG_RATES"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "REG_RATES_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TYPE_DEF_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TYPE_DEF_TRG" 
  BEFORE INSERT OR UPDATE ON "TYPE_DEF"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "TYPE_DEF_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TYPE_OF_ACTIVITIES_TGR
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "TYPE_OF_ACTIVITIES_TGR" 
  BEFORE INSERT OR UPDATE ON "TYPE_OF_ACTIVITIES"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :new."ID" from dual;
      end if; 
   end if; 
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "TYPE_OF_ACTIVITIES_TGR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERS_GROUPS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "USERS_GROUPS_TRG" 
  BEFORE INSERT OR UPDATE ON "USERS_GROUPS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
end;
/
ALTER TRIGGER "USERS_GROUPS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "USERS_TRG" 
  BEFORE INSERT OR UPDATE ON "USERS"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :new."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual; 
      end if; 
       if :new."PASS_WD" is null then 
         select utility.md5( '1') into :new."PASS_WD" from dual; 
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "USERS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger USER_SETTINGS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "USER_SETTINGS_TRG" 
  BEFORE INSERT ON "USER_SETTINGS"
  REFERENCING FOR EACH ROW
  declare
    a number;   
begin  
   if inserting then
      select count(*) into a from USER_SETTINGS where user_id=:NEW."USER_ID" ;
      if a>=1 then
        raise_application_error(-20100,'Can not insert more than one row');
      end if;
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if; 
end;
/
ALTER TRIGGER "USER_SETTINGS_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VOUCHER_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "VOUCHER_TRG" 
  BEFORE INSERT OR UPDATE ON "VOUCHER"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "VOUCHER_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger XML_T_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "XML_T_TRG" 
  BEFORE INSERT OR UPDATE ON "XML_T"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
         select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "XML_T_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger ZATRATY_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ZATRATY_TRG" 
  BEFORE INSERT OR UPDATE ON "ZATRATY"
  REFERENCING FOR EACH ROW
  begin  
   if inserting then 
      if :NEW."ID" is null then 
        select utility.uuid() into :NEW."ID" from dual;
      end if; 
   end if;
   if updating then
      select systimestamp into :new."VERSION" from dual;
   end if;
end;
/
ALTER TRIGGER "ZATRATY_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Function ACC_TYPE_CONV
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ACC_TYPE_CONV" (bl_expr in varchar2) return varchar2 as 
begin
  if upper(bl_expr) = 'ACTIVE' then
    return 'АКТИВНЫЙ';
  end if;
  if upper(bl_expr) = 'PASSIVE' then
    return 'ПАССИВНЫЙ';
  end if;
  return 'АКТИВНЫЙ/ПАССИВНЫЙ';
end acc_type_conv;

/
--------------------------------------------------------
--  DDL for Function BOOL_TO_NUM
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "BOOL_TO_NUM" 
(
  bl_expr in varchar2  
) return number as 
begin
 /* if bl_expr is null Then
    return null;
  end if;*/
  if upper(bl_expr) = 'TRUE' Then
    return 1;
  end if;
  return 0;
end bool_to_num;

/
--------------------------------------------------------
--  DDL for Function PLAN_TYPE_SUBCONTO_CONV
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PLAN_TYPE_SUBCONTO_CONV" (bl_expr in varchar2) return varchar2 as
p_ref varchar2(50);
begin
  if upper(bl_expr) = 'ЦФО' then
    select id into p_ref from plan_type_subconto
        where type_of_obj = (select id from type_def where table_name = 'DIVISIONS');
    return p_ref;
  end if;
  if upper(bl_expr) = 'НОМЕНКЛАТУРА' then
    select id into p_ref from plan_type_subconto
        where type_of_obj = (select id from type_def where table_name = 'NOMENKLATURA');
    return p_ref;
  end if;
  if upper(bl_expr) = 'КОНТРАГЕНТЫ' then
    select id into p_ref from plan_type_subconto
        where type_of_obj = (select id from type_def where table_name = 'KONTRAGENTS');
    return p_ref;
  end if;
  if upper(bl_expr) = 'КАССА' then
    select id into p_ref from plan_type_subconto
        where type_of_obj = (select id from type_def where table_name = 'KASSA');
    return p_ref;
  end if;
  if upper(bl_expr) = 'СТАТЬЯ ЗАТРАТ' then
    select id into p_ref from plan_type_subconto
        where type_of_obj = (select id from type_def where table_name = 'ZATRATY');
    return p_ref;
  end if;
  return null;
end plan_type_subconto_conv;

/
--------------------------------------------------------
--  DDL for Function RANDOMUUID
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "RANDOMUUID" 
    RETURN VARCHAR2
    AS LANGUAGE JAVA
    NAME 'RandomUUID.create() return java.lang.String';

/
--------------------------------------------------------
--  DDL for Package CURRENCY_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "CURRENCY_PKG" as 

  function get_xmlfromurl(p_url varchar2, p_charset varchar2 default 'UTF8') return xmltype;
  procedure getratebydate(p_code in currency.id%type, p_dat in date);
  procedure getratebyShedule;
  function get_lastSectionRates(p_code in currency.id%type, p_dat in date) return varchar2;
  function calculate_from_curr_to_curr(p_curr_from in currency.id%type, p_curr_to in currency.id%type, p_dat in date, p_summ number) return number;

end currency_pkg;

/
--------------------------------------------------------
--  DDL for Package ENTRY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ENTRY" as 

  function sign_of_summ(p_acc in plan_acc.id%type, p_summ in number, p_type in number) return number;

end entry;

/
--------------------------------------------------------
--  DDL for Package FTP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "FTP" AS
-- --------------------------------------------------------------------------
-- Name         : http://www.oracle-base.com/dba/miscellaneous/ftp.pks
-- Author       : DR Timothy S Hall
-- Description  : Basic FTP API. For usage notes see:
--                  http://www.oracle-base.com/articles/misc/ftp-from-plsql.php
-- Requirements : UTL_TCP
-- Ammedments   :
--   When         Who       What
--   ===========  ========  =================================================
--   14-AUG-2003  Tim Hall  Initial Creation
--   10-MAR-2004  Tim Hall  Add convert_crlf procedure.
--                          Make get_passive function visible.
--                          Added get_direct and put_direct procedures.
--   03-OCT-2006  Tim Hall  Add list, rename, delete, mkdir, rmdir procedures.
--   15-Jan-2008  Tim Hall  login: Include timeout parameter (suggested by Dmitry Bogomolov).
--   12-Jun-2008  Tim Hall  get_reply: Moved to pakage specification.
--   22-Apr-2009  Tim Hall  nlst: Added to return list of file names only (suggested by Julian and John Duncan)
-- --------------------------------------------------------------------------

TYPE t_string_table IS TABLE OF VARCHAR2(32767);

FUNCTION login (p_host    IN  VARCHAR2,
                p_port    IN  VARCHAR2,
                p_user    IN  VARCHAR2,
                p_pass    IN  VARCHAR2,
                p_timeout IN  NUMBER := NULL)
  RETURN UTL_TCP.connection;

FUNCTION get_passive (p_conn  IN OUT NOCOPY  UTL_TCP.connection)
  RETURN UTL_TCP.connection;

PROCEDURE logout (p_conn   IN OUT NOCOPY  UTL_TCP.connection,
                  p_reply  IN             BOOLEAN := TRUE);

PROCEDURE send_command (p_conn     IN OUT NOCOPY  UTL_TCP.connection,
                        p_command  IN             VARCHAR2,
                        p_reply    IN             BOOLEAN := TRUE);

PROCEDURE get_reply (p_conn  IN OUT NOCOPY  UTL_TCP.connection);

FUNCTION get_local_ascii_data (p_dir   IN  VARCHAR2,
                               p_file  IN  VARCHAR2)
  RETURN CLOB;

FUNCTION get_local_binary_data (p_dir   IN  VARCHAR2,
                                p_file  IN  VARCHAR2)
  RETURN BLOB;

FUNCTION get_remote_ascii_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                p_file  IN             VARCHAR2)
  RETURN CLOB;

FUNCTION get_remote_binary_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                 p_file  IN             VARCHAR2)
  RETURN BLOB;

PROCEDURE put_local_ascii_data (p_data  IN  CLOB,
                                p_dir   IN  VARCHAR2,
                                p_file  IN  VARCHAR2);

PROCEDURE put_local_binary_data (p_data  IN  BLOB,
                                 p_dir   IN  VARCHAR2,
                                 p_file  IN  VARCHAR2);

PROCEDURE put_remote_ascii_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                 p_file  IN             VARCHAR2,
                                 p_data  IN             CLOB);

PROCEDURE put_remote_binary_data (p_conn  IN OUT  NOCOPY UTL_TCP.connection,
                                  p_file  IN             VARCHAR2,
                                  p_data  IN             BLOB);

PROCEDURE get (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
               p_from_file  IN             VARCHAR2,
               p_to_dir     IN             VARCHAR2,
               p_to_file    IN             VARCHAR2);

PROCEDURE put (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
               p_from_dir   IN             VARCHAR2,
               p_from_file  IN             VARCHAR2,
               p_to_file    IN             VARCHAR2);

PROCEDURE get_direct (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
                      p_from_file  IN             VARCHAR2,
                      p_to_dir     IN             VARCHAR2,
                      p_to_file    IN             VARCHAR2);

PROCEDURE put_direct (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
                      p_from_dir   IN             VARCHAR2,
                      p_from_file  IN             VARCHAR2,
                      p_to_file    IN             VARCHAR2);

PROCEDURE help (p_conn  IN OUT NOCOPY  UTL_TCP.connection);

PROCEDURE ascii (p_conn  IN OUT NOCOPY  UTL_TCP.connection);

PROCEDURE binary (p_conn  IN OUT NOCOPY  UTL_TCP.connection);

PROCEDURE list (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                p_dir   IN             VARCHAR2,
                p_list  OUT            t_string_table);

PROCEDURE nlst (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                p_dir   IN             VARCHAR2,
                p_list  OUT            t_string_table);

PROCEDURE rename (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                  p_from  IN             VARCHAR2,
                  p_to    IN             VARCHAR2);

PROCEDURE delete (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                  p_file  IN             VARCHAR2);

PROCEDURE mkdir (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                 p_dir   IN             VARCHAR2);

PROCEDURE rmdir (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                 p_dir   IN             VARCHAR2);

PROCEDURE convert_crlf (p_status  IN  BOOLEAN);

END ftp;

/
--------------------------------------------------------
--  DDL for Package KONTRAG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "KONTRAG" AS 

  procedure create_kontrag(p_parent kontragents.parent_id%type, p_fullname kontragents.fullname%type, p_namefull kontragents.namefull%type,
                            p_okpo kontragents.okpo%type, p_inn kontragents.inn%type);

END KONTRAG;

/
--------------------------------------------------------
--  DDL for Package PRICES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "PRICES" AS 

 function get_lastSectionPrice(p_code in nomenklatura.id%type, p_dat in date) return varchar2;
 procedure importprice(p_dat in date);

END PRICES;

/
--------------------------------------------------------
--  DDL for Package P_ENCRYPT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "P_ENCRYPT" 
AS 
  FUNCTION encrypt_ssn( p_ssn IN VARCHAR2, p_key IN VARCHAR2) RETURN RAW;
  FUNCTION decrypt_ssn( p_ssn IN RAW, p_key IN VARCHAR2 ) RETURN VARCHAR2;
END p_encrypt;

/
--------------------------------------------------------
--  DDL for Package USR_SETT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "USR_SETT" as 

  function get_userid(p_u_name in varchar2) return varchar2;
  function get_userfirma(p_id in varchar2) return varchar2;
  function get_currency(p_id in varchar2) return varchar2;
  function get_division(p_id in varchar2) return varchar2;
  function get_kassa(p_id in varchar2) return varchar2;
  function get_mainusluga(p_id in varchar2) return varchar2;
  function get_activities(p_id in varchar2) return varchar2;

end usr_sett;

/
--------------------------------------------------------
--  DDL for Package UTILITY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "UTILITY" as 

  function  uuid	return varchar2; 
  function  md5(str in varchar2)	return varchar2;
  procedure clear_base;
  procedure  get_acc_plan_xml;
  procedure set_acc_plan;
  procedure first_start;
  procedure enable_constraint;
  procedure disable_constraint;
  function retrieve_customer_parentid return varchar2;
  function retrieve_customer_parentname return varchar2;
  procedure add_kontragent_to_call_list(p_kontrag_id in varchar2, p_compaign_id in varchar2);
  procedure rem_kontragent_from_call_list(p_kontrag_id in varchar2);
  function retrieve_division_parentid return varchar2;
  procedure change_parent_in_division(p_id in varchar2, p_parent_id in varchar2);
  procedure add_user_to_group(p_user in varchar2, p_group in varchar2);
  function retrieve_zamer_parentid return varchar2;

end utility;

/
--------------------------------------------------------
--  DDL for Package Body CURRENCY_PKG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "CURRENCY_PKG" as

function get_xmlFromUrl(p_url varchar2, p_charset varchar2 default 'UTF8') return xmltype as
  req   utl_http.req; 
  resp  utl_http.resp;
  val varchar2(32547);
  a clob;
BEGIN
  dbms_lob.createtemporary(a,true);
  dbms_lob.open(a,dbms_lob.lob_readwrite);
  req := utl_http.begin_request(p_url);
  utl_http.set_body_charset(req, p_charset);
  resp := utl_http.get_response(req);
  LOOP
    a := a||val;
    utl_http.read_text(resp, val, 5000);
  END LOOP;
  utl_http.end_response(resp);
  return xmltype(a);
EXCEPTION
  WHEN utl_http.end_of_body THEN
    utl_http.end_response(resp);
    return xmltype(a);
  WHEN others then
    utl_http.end_response(resp);
    raise;
end;

procedure getratebydate(p_code in currency.id%type, p_dat in date) as
  p_curr_rec currency%rowtype;
  p_rates reg_rates%rowtype;
  p_date_str varchar2(10);
  nominal number(10,0);
  val number (10,6);
  p_count number;
begin
  select count(*) into p_count from reg_rates 
    where curr_id=p_code and to_char(period,'dd-mm-yyyy') = to_char(p_dat,'dd-mm-yyyy');
  if p_count <> 0 then
    return;
  end if;  
  select * into p_curr_rec from currency where id=p_code;
  select to_char(p_dat,'dd')|| to_char(p_dat,'mm')|| to_char(p_dat,'yyyy') into p_date_str from dual;
  
  select to_number(t.xml.extract('//ValCurs/Valute[@id='||p_curr_rec.id_xml||']/Nominal/text()'),'9999'),
      to_number(t.xml.extract('//ValCurs/Valute[@id='||p_curr_rec.id_xml||']/Value/text()'),'9999.999999') into nominal, val
  from (select currency_pkg.get_xmlfromurl('http://pfsoft.com.ua/service/currency/?date='||p_date_str||'','CL8MSWIN1251') xml from dual) t;
  
  insert into reg_rates(curr_id,period,kurs,kratnost) values (p_code,p_dat,val,nominal);
  
  EXCEPTION 
        when others then 
        RAISE_APPLICATION_ERROR (-20001,'Error getting rates! '||SQLERRM, TRUE) ;
end;

function get_lastsectionrates(p_code in currency.id%type, p_dat in date) return varchar2 as
res varchar2(50);
begin
  select id into res from reg_rates where period = (select max(period) from reg_rates where curr_id=p_code
                                          and period<=p_dat) and curr_id=p_code
  and rownum = 1;
  
  return res;
end;

procedure getratebyshedule as
p_date_str varchar2(50);
p_date date;
begin
  p_date_str:=to_char(sysdate,'dd-mm-yyyy');
  p_date:=to_date(p_date_str,'DD-MM-YYYY');
  for i in (select * from ex_rates_settings)
  loop
    getratebydate(i.curr_id, p_date);
  end loop;
end;

function calculate_from_curr_to_curr(p_curr_from in currency.id%type,
            p_curr_to in currency.id%type,
            p_dat in date,
            p_summ number) return number as
res number(10,2);
p_rate_from number;
p_rate_to number;
begin
    select kurs/kratnost into p_rate_from from reg_rates where id = get_lastsectionrates(p_curr_from,p_dat); 
    select kurs/kratnost into p_rate_to from reg_rates where id = get_lastsectionrates(p_curr_to,p_dat);
    res:=p_summ*p_rate_from/p_rate_to;
    return res;
end;

end currency_pkg;

/
--------------------------------------------------------
--  DDL for Package Body ENTRY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ENTRY" as

  --p_type 1 или 0; 1-сумма дебетуется, 0-сумма кредитуется
  function sign_of_summ(p_acc in plan_acc.id%type, p_summ in number, p_type in number) return number as
  p_out_summ number(10,2);
  p_acc_type enum_account_type.fullname%type;
  begin
    p_out_summ:=p_summ;
    select trim(fullname) into p_acc_type from enum_account_type
      where id=(select acc_type from plan_acc where id = p_acc);
    if (upper(p_acc_type)=upper('Активный')) then
      if (p_type=1) then
        p_out_summ:=p_summ;
      else
        p_out_summ:=-p_summ;
      end if;
    end if;      
    if (upper(p_acc_type)=upper('Пассивный')) then 
      if (p_type=1) then
        p_out_summ:=-p_summ;
      else
        p_out_summ:=p_summ;
      end if;
    end if; 
    return p_out_summ;
  end sign_of_summ;

end entry;

/
--------------------------------------------------------
--  DDL for Package Body FTP
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "FTP" AS
-- --------------------------------------------------------------------------
-- Name         : http://www.oracle-base.com/dba/miscellaneous/ftp.pkb
-- Author       : DR Timothy S Hall
-- Description  : Basic FTP API. For usage notes see:
--                  http://www.oracle-base.com/articles/misc/ftp-from-plsql.php
-- Requirements : http://www.oracle-base.com/dba/miscellaneous/ftp.pks
-- Ammedments   :
--   When         Who       What
--   ===========  ========  =================================================
--   14-AUG-2003  Tim Hall  Initial Creation
--   10-MAR-2004  Tim Hall  Add convert_crlf procedure.
--                          Incorporate CRLF conversion functionality into
--                          put_local_ascii_data and put_remote_ascii_data
--                          functions.
--                          Make get_passive function visible.
--                          Added get_direct and put_direct procedures.
--   23-DEC-2004  Tim Hall  The get_reply procedure was altered to deal with
--                          banners starting with 4 white spaces. This fix is
--                          a small variation on the resolution provided by
--                          Gary Mason who spotted the bug.
--   10-NOV-2005  Tim Hall  Addition of get_reply after doing a transfer to
--                          pickup the 226 Transfer complete message. This
--                          allows gets and puts with a single connection.
--                          Issue spotted by Trevor Woolnough.
--   03-OCT-2006  Tim Hall  Add list, rename, delete, mkdir, rmdir procedures.
--   12-JAN-2007  Tim Hall  A final call to get_reply was added to the get_remote%
--                          procedures to allow multiple transfers per connection.
--   15-Jan-2008  Tim Hall  login: Include timeout parameter (suggested by Dmitry Bogomolov).
--   21-Jan-2008  Tim Hall  put_%: "l_pos < l_clob_len" to "l_pos <= l_clob_len" to prevent
--                          potential loss of one character for single-byte files or files
--                          sized 1 byte bigger than a number divisible by the buffer size
--                          (spotted by Michael Surikov).
--   23-Jan-2008  Tim Hall  send_command: Possible solution for ORA-29260 errors included,
--                          but commented out (suggested by Kevin Phillips).
--   12-Feb-2008  Tim Hall  put_local_binary_data and put_direct: Open file with "wb" for
--                          binary writes (spotted by Dwayne Hoban).
--   03-Mar-2008  Tim Hall  list: get_reply call and close of passive connection added
--                          (suggested by Julian, Bavaria).
--   12-Jun-2008  Tim Hall  A final call to get_reply was added to the put_remote%
--                          procedures, but commented out. If uncommented, it may cause the
--                          operation to hang, but it has been reported (morgul) to allow
--                          multiple transfers per connection.
--                          get_reply: Moved to pakage specification.
--   24-Jun-2008  Tim Hall  get_remote% and put_remote%: Exception handler added to close the passive
--                          connection and reraise the error (suggested by Mark Reichman).
--   22-Apr-2009  Tim Hall  get_remote_ascii_data: Remove unnecessary logout (suggested by John Duncan).
--                          get_reply and list: Handle 400 messages as well as 500 messages (suggested by John Duncan).
--                          logout: Added a call to UTL_TCP.close_connection, so not necessary to close
--                          any connections manually (suggested by Victor Munoz).
--                          get_local_*_data: Check for zero length files to prevent exception (suggested by Daniel)
--                          nlst: Added to return list of file names only (suggested by Julian and John Duncan)
--   05-Apr-2011  Tim Hall  put_remote_ascii_data: Added comment on definition of l_amount. Switch to 10000 if you get
--                          ORA-06502 from this line. May give you unexpected result due to conversion. Better to use binary.
-- --------------------------------------------------------------------------

g_reply         t_string_table := t_string_table();
g_binary        BOOLEAN := TRUE;
g_debug         BOOLEAN := TRUE;
g_convert_crlf  BOOLEAN := TRUE;

PROCEDURE debug (p_text  IN  VARCHAR2);

-- --------------------------------------------------------------------------
FUNCTION login (p_host    IN  VARCHAR2,
                p_port    IN  VARCHAR2,
                p_user    IN  VARCHAR2,
                p_pass    IN  VARCHAR2,
                p_timeout IN  NUMBER := NULL)
  RETURN UTL_TCP.connection IS
-- --------------------------------------------------------------------------
  l_conn  UTL_TCP.connection;
BEGIN
  g_reply.delete;

  l_conn := UTL_TCP.open_connection(p_host, p_port, tx_timeout => p_timeout);
  get_reply (l_conn);
  send_command(l_conn, 'USER ' || p_user);
  send_command(l_conn, 'PASS ' || p_pass);
  RETURN l_conn;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
FUNCTION get_passive (p_conn  IN OUT NOCOPY  UTL_TCP.connection)
  RETURN UTL_TCP.connection IS
-- --------------------------------------------------------------------------
  l_conn    UTL_TCP.connection;
  l_reply   VARCHAR2(32767);
  l_host    VARCHAR(100);
  l_port1   NUMBER(10);
  l_port2   NUMBER(10);
BEGIN
  send_command(p_conn, 'PASV');
  l_reply := g_reply(g_reply.last);

  l_reply := REPLACE(SUBSTR(l_reply, INSTR(l_reply, '(') + 1, (INSTR(l_reply, ')')) - (INSTR(l_reply, '('))-1), ',', '.');
  l_host  := SUBSTR(l_reply, 1, INSTR(l_reply, '.', 1, 4)-1);

  l_port1 := TO_NUMBER(SUBSTR(l_reply, INSTR(l_reply, '.', 1, 4)+1, (INSTR(l_reply, '.', 1, 5)-1) - (INSTR(l_reply, '.', 1, 4))));
  l_port2 := TO_NUMBER(SUBSTR(l_reply, INSTR(l_reply, '.', 1, 5)+1));

  l_conn := utl_tcp.open_connection(l_host, 256 * l_port1 + l_port2);
  return l_conn;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE logout(p_conn   IN OUT NOCOPY  UTL_TCP.connection,
                 p_reply  IN             BOOLEAN := TRUE) AS
-- --------------------------------------------------------------------------
BEGIN
  send_command(p_conn, 'QUIT', p_reply);
  UTL_TCP.close_connection(p_conn);
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE send_command (p_conn     IN OUT NOCOPY  UTL_TCP.connection,
                        p_command  IN             VARCHAR2,
                        p_reply    IN             BOOLEAN := TRUE) IS
-- --------------------------------------------------------------------------
  l_result  PLS_INTEGER;
BEGIN
  l_result := UTL_TCP.write_line(p_conn, p_command);
  -- If you get ORA-29260 after the PASV call, replace the above line with the following line.
  -- l_result := UTL_TCP.write_text(p_conn, p_command || utl_tcp.crlf, length(p_command || utl_tcp.crlf));

  IF p_reply THEN
    get_reply(p_conn);
  END IF;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE get_reply (p_conn  IN OUT NOCOPY  UTL_TCP.connection) IS
-- --------------------------------------------------------------------------
  l_reply_code  VARCHAR2(3) := NULL;
BEGIN
  LOOP
    g_reply.extend;
    g_reply(g_reply.last) := UTL_TCP.get_line(p_conn, TRUE);
    debug(g_reply(g_reply.last));
    IF l_reply_code IS NULL THEN
      l_reply_code := SUBSTR(g_reply(g_reply.last), 1, 3);
    END IF;
    IF SUBSTR(l_reply_code, 1, 1) IN ('4', '5') THEN
      RAISE_APPLICATION_ERROR(-20000, g_reply(g_reply.last));
    ELSIF (SUBSTR(g_reply(g_reply.last), 1, 3) = l_reply_code AND
           SUBSTR(g_reply(g_reply.last), 4, 1) = ' ') THEN
      EXIT;
    END IF;
  END LOOP;
EXCEPTION
  WHEN UTL_TCP.END_OF_INPUT THEN
    NULL;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
FUNCTION get_local_ascii_data (p_dir   IN  VARCHAR2,
                               p_file  IN  VARCHAR2)
  RETURN CLOB IS
-- --------------------------------------------------------------------------
  l_bfile   BFILE;
  l_data    CLOB;
BEGIN
  DBMS_LOB.createtemporary (lob_loc => l_data,
                            cache   => TRUE,
                            dur     => DBMS_LOB.call);

  l_bfile := BFILENAME(p_dir, p_file);
  DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);

  IF DBMS_LOB.getlength(l_bfile) > 0 THEN
    DBMS_LOB.loadfromfile(l_data, l_bfile, DBMS_LOB.getlength(l_bfile));
  END IF;

  DBMS_LOB.fileclose(l_bfile);

  RETURN l_data;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
FUNCTION get_local_binary_data (p_dir   IN  VARCHAR2,
                                p_file  IN  VARCHAR2)
  RETURN BLOB IS
-- --------------------------------------------------------------------------
  l_bfile   BFILE;
  l_data    BLOB;
BEGIN
  DBMS_LOB.createtemporary (lob_loc => l_data,
                            cache   => TRUE,
                            dur     => DBMS_LOB.call);

  l_bfile := BFILENAME(p_dir, p_file);
  DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
  IF DBMS_LOB.getlength(l_bfile) > 0 THEN
    DBMS_LOB.loadfromfile(l_data, l_bfile, DBMS_LOB.getlength(l_bfile));
  END IF;
  DBMS_LOB.fileclose(l_bfile);

  RETURN l_data;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
FUNCTION get_remote_ascii_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                p_file  IN             VARCHAR2)
  RETURN CLOB IS
-- --------------------------------------------------------------------------
  l_conn    UTL_TCP.connection;
  l_amount  PLS_INTEGER;
  l_buffer  VARCHAR2(32767);
  l_data    CLOB;
BEGIN
  DBMS_LOB.createtemporary (lob_loc => l_data,
                            cache   => TRUE,
                            dur     => DBMS_LOB.call);

  l_conn := get_passive(p_conn);
  send_command(p_conn, 'RETR ' || p_file, TRUE);
  --logout(l_conn, FALSE);

  BEGIN
    LOOP
      l_amount := UTL_TCP.read_text (l_conn, l_buffer, 32767);
      DBMS_LOB.writeappend(l_data, l_amount, l_buffer);
    END LOOP;
  EXCEPTION
    WHEN UTL_TCP.END_OF_INPUT THEN
      NULL;
    WHEN OTHERS THEN
      NULL;
  END;
  UTL_TCP.close_connection(l_conn);
  get_reply(p_conn);

  RETURN l_data;

EXCEPTION
  WHEN OTHERS THEN
    UTL_TCP.close_connection(l_conn);
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
FUNCTION get_remote_binary_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                 p_file  IN             VARCHAR2)
  RETURN BLOB IS
-- --------------------------------------------------------------------------
  l_conn    UTL_TCP.connection;
  l_amount  PLS_INTEGER;
  l_buffer  RAW(32767);
  l_data    BLOB;
BEGIN
  DBMS_LOB.createtemporary (lob_loc => l_data,
                            cache   => TRUE,
                            dur     => DBMS_LOB.call);

  l_conn := get_passive(p_conn);
  send_command(p_conn, 'RETR ' || p_file, TRUE);

  BEGIN
    LOOP
      l_amount := UTL_TCP.read_raw (l_conn, l_buffer, 32767);
      DBMS_LOB.writeappend(l_data, l_amount, l_buffer);
    END LOOP;
  EXCEPTION
    WHEN UTL_TCP.END_OF_INPUT THEN
      NULL;
    WHEN OTHERS THEN
      NULL;
  END;
  UTL_TCP.close_connection(l_conn);
  get_reply(p_conn);

  RETURN l_data;

EXCEPTION
  WHEN OTHERS THEN
    UTL_TCP.close_connection(l_conn);
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put_local_ascii_data (p_data  IN  CLOB,
                                p_dir   IN  VARCHAR2,
                                p_file  IN  VARCHAR2) IS
-- --------------------------------------------------------------------------
  l_out_file  UTL_FILE.file_type;
  l_buffer    VARCHAR2(32767);
  l_amount    BINARY_INTEGER := 32767;
  l_pos       INTEGER := 1;
  l_clob_len  INTEGER;
BEGIN
  l_clob_len := DBMS_LOB.getlength(p_data);

  l_out_file := UTL_FILE.fopen(p_dir, p_file, 'w', 32767);

  WHILE l_pos <= l_clob_len LOOP
    DBMS_LOB.read (p_data, l_amount, l_pos, l_buffer);
    IF g_convert_crlf THEN
      l_buffer := REPLACE(l_buffer, CHR(13), NULL);
    END IF;

    UTL_FILE.put(l_out_file, l_buffer);
    UTL_FILE.fflush(l_out_file);
    l_pos := l_pos + l_amount;
  END LOOP;

  UTL_FILE.fclose(l_out_file);
EXCEPTION
  WHEN OTHERS THEN
    IF UTL_FILE.is_open(l_out_file) THEN
      UTL_FILE.fclose(l_out_file);
    END IF;
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put_local_binary_data (p_data  IN  BLOB,
                                 p_dir   IN  VARCHAR2,
                                 p_file  IN  VARCHAR2) IS
-- --------------------------------------------------------------------------
  l_out_file  UTL_FILE.file_type;
  l_buffer    RAW(32767);
  l_amount    BINARY_INTEGER := 32767;
  l_pos       INTEGER := 1;
  l_blob_len  INTEGER;
BEGIN
  l_blob_len := DBMS_LOB.getlength(p_data);

  l_out_file := UTL_FILE.fopen(p_dir, p_file, 'wb', 32767);

  WHILE l_pos <= l_blob_len LOOP
    DBMS_LOB.read (p_data, l_amount, l_pos, l_buffer);
    UTL_FILE.put_raw(l_out_file, l_buffer, TRUE);
    UTL_FILE.fflush(l_out_file);
    l_pos := l_pos + l_amount;
  END LOOP;

  UTL_FILE.fclose(l_out_file);
EXCEPTION
  WHEN OTHERS THEN
    IF UTL_FILE.is_open(l_out_file) THEN
      UTL_FILE.fclose(l_out_file);
    END IF;
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put_remote_ascii_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                 p_file  IN             VARCHAR2,
                                 p_data  IN             CLOB) IS
-- --------------------------------------------------------------------------
  l_conn      UTL_TCP.connection;
  l_result    PLS_INTEGER;
  l_buffer    VARCHAR2(32767);
  l_amount    BINARY_INTEGER := 32767; -- Switch to 10000 (or use binary) if you get ORA-06502 from this line.
  l_pos       INTEGER := 1;
  l_clob_len  INTEGER;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'STOR ' || p_file, TRUE);

  l_clob_len := DBMS_LOB.getlength(p_data);

  WHILE l_pos <= l_clob_len LOOP
    DBMS_LOB.READ (p_data, l_amount, l_pos, l_buffer);
    IF g_convert_crlf THEN
      l_buffer := REPLACE(l_buffer, CHR(13), NULL);
    END IF;
    l_result := UTL_TCP.write_text(l_conn, l_buffer, LENGTH(l_buffer));
    UTL_TCP.flush(l_conn);
    l_pos := l_pos + l_amount;
  END LOOP;

  UTL_TCP.close_connection(l_conn);
  -- The following line allows some people to make multiple calls from one connection.
  -- It causes the operation to hang for me, hence it is commented out by default.
  -- get_reply(p_conn);

EXCEPTION
  WHEN OTHERS THEN
    UTL_TCP.close_connection(l_conn);
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put_remote_binary_data (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                                  p_file  IN             VARCHAR2,
                                  p_data  IN             BLOB) IS
-- --------------------------------------------------------------------------
  l_conn      UTL_TCP.connection;
  l_result    PLS_INTEGER;
  l_buffer    RAW(32767);
  l_amount    BINARY_INTEGER := 32767;
  l_pos       INTEGER := 1;
  l_blob_len  INTEGER;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'STOR ' || p_file, TRUE);

  l_blob_len := DBMS_LOB.getlength(p_data);

  WHILE l_pos <= l_blob_len LOOP
    DBMS_LOB.READ (p_data, l_amount, l_pos, l_buffer);
    l_result := UTL_TCP.write_raw(l_conn, l_buffer, l_amount);
    UTL_TCP.flush(l_conn);
    l_pos := l_pos + l_amount;
  END LOOP;

  UTL_TCP.close_connection(l_conn);
  -- The following line allows some people to make multiple calls from one connection.
  -- It causes the operation to hang for me, hence it is commented out by default.
  -- get_reply(p_conn);

EXCEPTION
  WHEN OTHERS THEN
    UTL_TCP.close_connection(l_conn);
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE get (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
               p_from_file  IN             VARCHAR2,
               p_to_dir     IN             VARCHAR2,
               p_to_file    IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
BEGIN
  IF g_binary THEN
    put_local_binary_data(p_data  => get_remote_binary_data (p_conn, p_from_file),
                          p_dir   => p_to_dir,
                          p_file  => p_to_file);
  ELSE
    put_local_ascii_data(p_data  => get_remote_ascii_data (p_conn, p_from_file),
                         p_dir   => p_to_dir,
                         p_file  => p_to_file);
  END IF;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
               p_from_dir   IN             VARCHAR2,
               p_from_file  IN             VARCHAR2,
               p_to_file    IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
BEGIN
  IF g_binary THEN
    put_remote_binary_data(p_conn => p_conn,
                           p_file => p_to_file,
                           p_data => get_local_binary_data(p_from_dir, p_from_file));
  ELSE
    put_remote_ascii_data(p_conn => p_conn,
                          p_file => p_to_file,
                          p_data => get_local_ascii_data(p_from_dir, p_from_file));
  END IF;
  get_reply(p_conn);
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE get_direct (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
                      p_from_file  IN             VARCHAR2,
                      p_to_dir     IN             VARCHAR2,
                      p_to_file    IN             VARCHAR2) IS
-- --------------------------------------------------------------------------
  l_conn        UTL_TCP.connection;
  l_out_file    UTL_FILE.file_type;
  l_amount      PLS_INTEGER;
  l_buffer      VARCHAR2(32767);
  l_raw_buffer  RAW(32767);
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'RETR ' || p_from_file, TRUE);
  IF g_binary THEN
    l_out_file := UTL_FILE.fopen(p_to_dir, p_to_file, 'wb', 32767);
  ELSE
    l_out_file := UTL_FILE.fopen(p_to_dir, p_to_file, 'w', 32767);
  END IF;

  BEGIN
    LOOP
      IF g_binary THEN
        l_amount := UTL_TCP.read_raw (l_conn, l_raw_buffer, 32767);
        UTL_FILE.put_raw(l_out_file, l_raw_buffer, TRUE);
      ELSE
        l_amount := UTL_TCP.read_text (l_conn, l_buffer, 32767);
        IF g_convert_crlf THEN
          l_buffer := REPLACE(l_buffer, CHR(13), NULL);
        END IF;
        UTL_FILE.put(l_out_file, l_buffer);
      END IF;
      UTL_FILE.fflush(l_out_file);
    END LOOP;
  EXCEPTION
    WHEN UTL_TCP.END_OF_INPUT THEN
      NULL;
    WHEN OTHERS THEN
      NULL;
  END;
  UTL_FILE.fclose(l_out_file);
  UTL_TCP.close_connection(l_conn);
EXCEPTION
  WHEN OTHERS THEN
    IF UTL_FILE.is_open(l_out_file) THEN
      UTL_FILE.fclose(l_out_file);
    END IF;
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE put_direct (p_conn       IN OUT NOCOPY  UTL_TCP.connection,
                      p_from_dir   IN             VARCHAR2,
                      p_from_file  IN             VARCHAR2,
                      p_to_file    IN             VARCHAR2) IS
-- --------------------------------------------------------------------------
  l_conn        UTL_TCP.connection;
  l_bfile       BFILE;
  l_result      PLS_INTEGER;
  l_amount      PLS_INTEGER := 32767;
  l_raw_buffer  RAW(32767);
  l_len         NUMBER;
  l_pos         NUMBER := 1;
  ex_ascii      EXCEPTION;
BEGIN
  IF NOT g_binary THEN
    RAISE ex_ascii;
  END IF;

  l_conn := get_passive(p_conn);
  send_command(p_conn, 'STOR ' || p_to_file, TRUE);

  l_bfile := BFILENAME(p_from_dir, p_from_file);

  DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
  l_len := DBMS_LOB.getlength(l_bfile);

  WHILE l_pos <= l_len LOOP
    DBMS_LOB.READ (l_bfile, l_amount, l_pos, l_raw_buffer);
    debug(l_amount);
    l_result := UTL_TCP.write_raw(l_conn, l_raw_buffer, l_amount);
    l_pos := l_pos + l_amount;
  END LOOP;

  DBMS_LOB.fileclose(l_bfile);
  UTL_TCP.close_connection(l_conn);
EXCEPTION
  WHEN ex_ascii THEN
    RAISE_APPLICATION_ERROR(-20000, 'PUT_DIRECT not available in ASCII mode.');
  WHEN OTHERS THEN
    IF DBMS_LOB.fileisopen(l_bfile) = 1 THEN
      DBMS_LOB.fileclose(l_bfile);
    END IF;
    RAISE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE help (p_conn  IN OUT NOCOPY  UTL_TCP.connection) AS
-- --------------------------------------------------------------------------
BEGIN
  send_command(p_conn, 'HELP', TRUE);
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE ascii (p_conn  IN OUT NOCOPY  UTL_TCP.connection) AS
-- --------------------------------------------------------------------------
BEGIN
  send_command(p_conn, 'TYPE A', TRUE);
  g_binary := FALSE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE binary (p_conn  IN OUT NOCOPY  UTL_TCP.connection) AS
-- --------------------------------------------------------------------------
BEGIN
  send_command(p_conn, 'TYPE I', TRUE);
  g_binary := TRUE;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE list (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                p_dir   IN             VARCHAR2,
                p_list  OUT            t_string_table) AS
-- --------------------------------------------------------------------------
  l_conn        UTL_TCP.connection;
  l_list        t_string_table := t_string_table();
  l_reply_code  VARCHAR2(3) := NULL;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'LIST ' || p_dir, TRUE);

  BEGIN
    LOOP
      l_list.extend;
      l_list(l_list.last) := UTL_TCP.get_line(l_conn, TRUE);
      debug(l_list(l_list.last));
      IF l_reply_code IS NULL THEN
        l_reply_code := SUBSTR(l_list(l_list.last), 1, 3);
      END IF;
      IF SUBSTR(l_reply_code, 1, 1) IN ('4', '5') THEN
        RAISE_APPLICATION_ERROR(-20000, l_list(l_list.last));
      ELSIF (SUBSTR(g_reply(g_reply.last), 1, 3) = l_reply_code AND
             SUBSTR(g_reply(g_reply.last), 4, 1) = ' ') THEN
        EXIT;
      END IF;
    END LOOP;
  EXCEPTION
    WHEN UTL_TCP.END_OF_INPUT THEN
      NULL;
  END;

  l_list.delete(l_list.last);
  p_list := l_list;

  utl_tcp.close_connection(l_conn);
  get_reply (p_conn);
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE nlst (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                p_dir   IN             VARCHAR2,
                 p_list  OUT            t_string_table) AS
-- --------------------------------------------------------------------------
  l_conn        UTL_TCP.connection;
  l_list        t_string_table := t_string_table();
  l_reply_code  VARCHAR2(3) := NULL;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'NLST ' || p_dir, TRUE);

  BEGIN
    LOOP
      l_list.extend;
      l_list(l_list.last) := UTL_TCP.get_line(l_conn, TRUE);
      debug(l_list(l_list.last));
      IF l_reply_code IS NULL THEN
        l_reply_code := SUBSTR(l_list(l_list.last), 1, 3);
      END IF;
      IF SUBSTR(l_reply_code, 1, 1) IN ('4', '5') THEN
        RAISE_APPLICATION_ERROR(-20000, l_list(l_list.last));
      ELSIF (SUBSTR(g_reply(g_reply.last), 1, 3) = l_reply_code AND
             SUBSTR(g_reply(g_reply.last), 4, 1) = ' ') THEN
        EXIT;
      END IF;
    END LOOP;
  EXCEPTION
    WHEN UTL_TCP.END_OF_INPUT THEN
      NULL;
  END;

  l_list.delete(l_list.last);
  p_list := l_list;

  utl_tcp.close_connection(l_conn);
  get_reply (p_conn);
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE rename (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                  p_from  IN             VARCHAR2,
                  p_to    IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
  l_conn  UTL_TCP.connection;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'RNFR ' || p_from, TRUE);
  send_command(p_conn, 'RNTO ' || p_to, TRUE);
  logout(l_conn, FALSE);
END rename;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE delete (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                  p_file  IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
  l_conn  UTL_TCP.connection;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'DELE ' || p_file, TRUE);
  logout(l_conn, FALSE);
END delete;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE mkdir (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                 p_dir   IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
  l_conn  UTL_TCP.connection;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'MKD ' || p_dir, TRUE);
  logout(l_conn, FALSE);
END mkdir;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE rmdir (p_conn  IN OUT NOCOPY  UTL_TCP.connection,
                 p_dir   IN             VARCHAR2) AS
-- --------------------------------------------------------------------------
  l_conn  UTL_TCP.connection;
BEGIN
  l_conn := get_passive(p_conn);
  send_command(p_conn, 'RMD ' || p_dir, TRUE);
  logout(l_conn, FALSE);
END rmdir;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE convert_crlf (p_status  IN  BOOLEAN) AS
-- --------------------------------------------------------------------------
BEGIN
  g_convert_crlf := p_status;
END;
-- --------------------------------------------------------------------------



-- --------------------------------------------------------------------------
PROCEDURE debug (p_text  IN  VARCHAR2) IS
-- --------------------------------------------------------------------------
BEGIN
  IF g_debug THEN
    DBMS_OUTPUT.put_line(SUBSTR(p_text, 1, 255));
  END IF;
END;
-- --------------------------------------------------------------------------

END ftp;

/
--------------------------------------------------------
--  DDL for Package Body KONTRAG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "KONTRAG" AS

  procedure create_kontrag(p_parent kontragents.parent_id%type, p_fullname kontragents.fullname%type, p_namefull kontragents.namefull%type,
                            p_okpo kontragents.okpo%type, p_inn kontragents.inn%type) AS
  p_kont_rec kontragents%rowtype;                          
  BEGIN
    p_kont_rec.parent_id:=p_parent;
    p_kont_rec.fullname:=p_fullname;
    p_kont_rec.namefull:=p_namefull;
    p_kont_rec.okpo:=p_okpo;
    p_kont_rec.inn:=p_inn;
    p_kont_rec.is_group:=0;
    p_kont_rec.deleted:=0;
    p_kont_rec.ur_fiz:=0;
    p_kont_rec.predefined:=0;
    p_kont_rec.version:=systimestamp;
    insert into kontragents values p_kont_rec;
    
    exception
        when others then 
        raise;
  END create_kontrag;

END KONTRAG;

/
--------------------------------------------------------
--  DDL for Package Body PRICES
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "PRICES" AS

  function get_lastSectionPrice(p_code in nomenklatura.id%type, p_dat in date) return varchar2 AS
    res varchar2(50);
  BEGIN
    select id into res from reg_prices where period = (select max(period) from reg_prices where nom_id=p_code
                                          and period<=p_dat) and nom_id=p_code and rownum = 1;
  return res;
  END get_lastSectionPrice;
  
  procedure importprice(p_dat in date) as
    p_nom nomenklatura.id%type;
    p_group nomenklatura.id%type;
    p_group_parent nomenklatura.id%type;
    p_price_id reg_prices.id%type;
    p_ed_izm measure_unit.id%type;
    record_found EXCEPTION;
  begin
    select id into p_group_parent from nomenklatura n where upper(n.fullname) = upper('Услуги') and n.IS_GROUP = 1;
    for i in (select * from imported_price) loop
    
      begin --Ищем группу, если нет - создаем
      select id into p_group from nomenklatura n where upper(n.fullname) = upper(i.groups) and n.IS_GROUP = 1 and rownum = 1;
      EXCEPTION 
        WHEN OTHERS THEN
        select UTILITY.UUID() into p_group from dual;
        insert into nomenklatura (id, fullname, is_group, parent_id, usluga)
          values(p_group, i.groups, 1, p_group_parent, 0);
      end;
      
      begin  --Ищем номенклатуру, если нет - создаем
      select id into p_nom from nomenklatura n where n.IS_GROUP = 0 
            and (upper(n.ARTIKUL) = upper(i.artikul) or upper(n.fullname) = upper(i.nom_name)) and rownum = 1; 
      exception
        when others then
        select UTILITY.UUID() into p_nom from dual;
        insert into nomenklatura (id, fullname, is_group, parent_id, usluga, artikul)
          values(p_nom, i.nom_name, 0, p_group, 1, i.artikul);
      end;
      
      begin --Ищем единицу измерения, если нет - создаем
        select id into p_ed_izm from measure_unit m where upper(m.fullname) = upper(i.ed_izm) and rownum = 1;
        exception
          when others then
          select UTILITY.UUID() into p_ed_izm from dual;
          insert into measure_unit (id, fullname) values (p_ed_izm, i.ed_izm);
      end;
      
      begin --Ищем цену за текущую дату, если не находим - создаем
      select id into p_price_id from reg_prices where period = (select max(period) from reg_prices where nom_id=p_nom
                                          and period=p_dat) and nom_id=p_nom and rownum = 1;
      if p_price_id is null then
        raise no_data_found;
      end if;  
      exception
        when others then
          insert into reg_prices (nom_id, period, ed_izm, price_usl, price_goods)
            values(p_nom, p_dat, p_ed_izm, i.price_usl, i.price_goods);
      end;      
    end loop;
    
  EXCEPTION
        WHEN record_found THEN 
        RAISE_APPLICATION_ERROR (-20002,'REG_PRICES record found in this date! ', TRUE) ;
        WHEN OTHERS THEN 
        RAISE_APPLICATION_ERROR (-20001,'Error importing price! ', TRUE) ;  
  end importprice;

END PRICES;

/
--------------------------------------------------------
--  DDL for Package Body P_ENCRYPT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "P_ENCRYPT" 
AS
--DO NOT FORGET TO WRAP THIS BEFORE LOADING INTO DATABASE
--IF IT IS NOT WRAPPED, THE KEY WILL BE EXPOSED
--THE WRAP UTILITY IS LOCATED IN THE \BIN DIRECTORY (WRAP.EXE)
  G_DATE TIMESTAMP;
  G_CHARACTER_SET VARCHAR2(10) := 'AL32UTF8';
  G_STRING VARCHAR2(16);
  G_KEY RAW(250);
  G_ENCRYPTION_TYPE PLS_INTEGER := dbms_crypto.encrypt_aes128 
                                    + dbms_crypto.chain_cbc 
                                    + dbms_crypto.pad_pkcs5;
  
  PROCEDURE setg_date(p_dat timestamp) IS
  BEGIN
    G_DATE:=p_dat;
    G_STRING:= rtrim(TO_CHAR(G_DATE,'DDMMYYYYHH24miSS')||'70');
    G_KEY:= utl_i18n.string_to_raw
                      ( data => G_STRING,
                        dst_charset => G_CHARACTER_SET );
  END setg_date;
  
  FUNCTION encrypt_ssn( p_ssn IN VARCHAR2, p_key IN VARCHAR2 ) RETURN RAW
  IS
    l_ssn RAW(64) := UTL_I18N.STRING_TO_RAW( p_ssn, G_CHARACTER_SET );
    l_encrypted RAW(64);
  BEGIN
    setg_date(to_timestamp(p_key,'DD/MM/YYYY HH24:MI:SS'));
    l_ssn := utl_i18n.string_to_raw
              ( data => p_ssn,
                dst_charset => G_CHARACTER_SET );

    l_encrypted := dbms_crypto.encrypt
                   ( src => l_ssn,
                     typ => G_ENCRYPTION_TYPE,
                     key => G_KEY );
                     
    RETURN l_encrypted;
  END encrypt_ssn;
  
  FUNCTION decrypt_ssn( p_ssn IN RAW, p_key IN VARCHAR2 ) RETURN VARCHAR2
  IS
    l_decrypted RAW(64);
    l_decrypted_string VARCHAR2(64);
  BEGIN
    setg_date(to_date(p_key,'DD/MM/YYYY'));
    l_decrypted := dbms_crypto.decrypt
                    ( src => p_ssn,
                      typ => G_ENCRYPTION_TYPE,
                      key => G_KEY );

    l_decrypted_string := utl_i18n.raw_to_char
                            ( data => l_decrypted,
                              src_charset => G_CHARACTER_SET );
    RETURN l_decrypted_string;
  END decrypt_ssn;
  
END p_encrypt;

/
--------------------------------------------------------
--  DDL for Package Body USR_SETT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "USR_SETT" as

  function get_userid(p_u_name in varchar2) return varchar2 as
  p_id varchar2(60);
  begin
    select id into p_id from users where upper(trim(login)) = upper(trim(p_u_name));
    return p_id;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_userid;
  
  function get_userfirma(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select firma_id into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_userfirma;
  
  function get_currency(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select currency_id into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_currency;
  
  function get_division(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select division_id into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_division;
  
  function get_kassa(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select kassa_id into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_kassa;
  
  function get_mainusluga(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select main_usluga into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_mainusluga;
  
  function get_activities(p_id in varchar2) return varchar2 as
  p_ret varchar2(60);
  begin
    select activities_id into p_ret from user_settings where user_id = p_id;
    return p_ret;
    
    exception
        when no_data_found then 
        return '00000000-0000-0000-0000-000000000000';
  end get_activities;

end usr_sett;

/
--------------------------------------------------------
--  DDL for Package Body UTILITY
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "UTILITY" as

  function  uuid	return varchar2 as
  LANGUAGE JAVA
    NAME 'RandomUUID.create() return java.lang.String';
  --end uuid;
  
  FUNCTION              md5(str IN VARCHAR2)
	RETURN VARCHAR2
	as v_checksum VARCHAR2(36);
 
	BEGIN
		v_checksum := LOWER( RAWTOHEX( UTL_RAW.CAST_TO_RAW( sys.dbms_obfuscation_toolkit.md5(input_string => str) ) ) );
		RETURN v_checksum;
		EXCEPTION
			WHEN NO_DATA_FOUND THEN
			NULL;
		when others then
			-- Consider logging the error and then re-raise
			raise;
	end md5;
  
  procedure clear_base as --Очистка базы
  begin
    
    for c1 in (select y.table_name, y.constraint_name from user_constraints y, user_tables x where x.table_name = y.table_name) loop
    begin
        execute immediate  ('alter table '||c1.table_name||' disable constraint '||c1.constraint_name||' cascade');
    end;
    end loop;

    for t1 in (select table_name from user_tables) loop
    begin
        execute immediate ('truncate table '||t1.table_name);
    end;
    end loop;

    for c2 in (select y.table_name, y.constraint_name from user_constraints y, user_tables x where x.table_name = y.table_name) loop
    begin
        execute immediate ('alter table '||c2.table_name||' enable constraint '||c2.constraint_name);
    end;
    end loop;
    
    EXCEPTION
    WHEN OTHERS THEN
			-- Consider logging the error and then re-raise
			RAISE;
  end; 
  
  procedure  get_acc_plan_xml as
  host varchar2(100 char) :='bmexp.com';
  port varchar2(2 char) :=21;
  user_f varchar2(100 char) :='toftpconnect';
  pass varchar2(100 char) :='vjqangghjcnjzlkjdsqcwerj';
  l_conn  UTL_TCP.connection;
  clobdata clob;
  count_xml number;
  begin
    select count(*) into count_xml from XML_T;
    l_conn := ftp.login(host, port, user_f, pass, 60);
    ftp.ascii(p_conn => l_conn);
    clobdata:=ftp.get_remote_ascii_data(p_conn      => l_conn,
          p_file => '/acc_plan/acc_plan_bud.xml');
    if CLOBDATA is not null then
    if count_xml = 0 then
      insert into XML_T (ONE) values (xmltype(CLOBDATA));
    else
      update XML_T set ONE = xmltype(CLOBDATA)
      where id = (select max(id) from xml_t);
    end if;  
    end if;        
    ftp.logout(l_conn);
    
    EXCEPTION
    WHEN OTHERS THEN
			-- Consider logging the error and then re-raise
			RAISE;
  end;
  
  procedure set_acc_plan as
  begin
    get_acc_plan_xml();
    --План счетов
    insert into plan_acc(id,acc_type,parent_id,fullname,zabalansov,valutn,kolishestv,code) 
        select t.ref,
        (select id from enum_account_type where upper(fullname)=upper(acc_type_conv(t.type))),
        case when t.parent = '00000000-0000-0000-0000-000000000000' then null
        else t.parent end,
        t.disc,
        bool_to_num(t.offbalance),
        bool_to_num(t.valunt),
        bool_to_num(t.kolich),
        t.code
        from (select extract(one, '/V8Exch:_1CV8DtUD/V8Exch:Data/ChartOfAccountsObject.Бюджетирование','xmlns:V8Exch="http://www.1c.ru/V8/1CV8DtUD/" xmlns:v8="http://v8.1c.ru/data" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"') one
              from xml_t where id=(select max(id) from xml_t)) p,
              xmltable('/ChartOfAccountsObject.Бюджетирование' passing p.one
                      columns Ref VARCHAR2(100) PATH 'Ref',
                          disc varchar2(1000) path 'Description',
                          code varchar2(100) path 'Code',
                          type varchar2(100) path 'Type',
                          parent varchar2(100) path 'Parent',
                          offbalance varchar2(100) path 'OffBalance',
                          valunt varchar2(100) path 'Валютный',
                          kolich varchar2(100) path 'Количественный'
                          ) t
        order by t.code;
     --Субконто плана счетов   
     insert into plan_acc_subconto (plan_acc_id,plan_type_subc,oborot_only,summovoy)
     select * from (select t.id, 
     plan_type_subconto_conv((select disc
     from (select extract(one, '/V8Exch:_1CV8DtUD/V8Exch:Data/ChartOfCharacteristicTypesObject.ВидыСубконтоБюджетирования','xmlns:V8Exch="http://www.1c.ru/V8/1CV8DtUD/" xmlns:v8="http://v8.1c.ru/data" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"') one
              from xml_t where id=(select max(id) from xml_t)) p,
              xmltable('/ChartOfCharacteristicTypesObject.ВидыСубконтоБюджетирования' passing p.one
                      columns Ref VARCHAR2(100) PATH 'Ref',
                          disc varchar2(100) path 'Description'
                          ) t where ref = li.dimensiontype)) subconto,
    bool_to_num(li.turnovers), bool_to_num(li.summovoy) from
    (select extract(one, '/V8Exch:_1CV8DtUD/V8Exch:Data/ChartOfAccountsObject.Бюджетирование','xmlns:V8Exch="http://www.1c.ru/V8/1CV8DtUD/" xmlns:v8="http://v8.1c.ru/data" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"') one
                           FROM xml_t where id=(select max(id) from xml_t)) p,
       XMLTable('/ChartOfAccountsObject.Бюджетирование' PASSING p.one
                COLUMNS id VARCHAR2(100) PATH 'Ref',
                        lineitem  xmltype      path 'ExtDimensionTypes') t ,
       xmltable('/ExtDimensionTypes/Row' passing t.lineitem
                columns dimensiontype varchar2(100) path 'ExtDimensionType',
                        turnovers varchar2(100) path 'TurnoversOnly',
                        summovoy varchar2(100) path 'Суммовой',
                        kolishestv varchar2(100) path 'Количественный',
                        valutn varchar2(100) path 'Валютный') li)
      where subconto is not null;
  
  EXCEPTION
    WHEN OTHERS THEN
			-- Consider logging the error and then re-raise
			RAISE;      
  end;
  
  procedure first_start as --Первый запуск базы
  p_uid varchar2(50);
  fs number(5);
  begin
    select nvl(count(*),0) into fs from users;
    if fs<>0 then
      return;
    end if;
    --Заполнение типов данных
    insert into type_def(table_name) select table_name from user_tables;
    --Заполнение справочника субконто
    insert into plan_type_subconto(type_of_obj,fullname) select id,
      case when upper(table_name) = upper('kontragents')
      then 'Контрагенты'
      when upper(table_name) = upper('kassa')
      then 'Касса'
      when upper(table_name) = upper('zatraty')
      then 'Статья затрат'
      when upper(table_name) = upper('nomenklatura')
      then 'Номенклатура'
      when upper(table_name) = upper('divisions')
      then 'ЦФО'
      end fullname
      from type_def where
        upper(table_name) = upper('kontragents') or
        upper(table_name) = upper('nomenklatura') or
        upper(table_name) = upper('kassa') or
        upper(table_name) = upper('zatraty') or
        upper(table_name) = upper('divisions');
    
    --Заполнение типов счетов    
    insert into enum_account_type(fullname)
        values('Активный');
    insert into enum_account_type(fullname)
        values('Пассивный');  
    insert into enum_account_type(fullname)
        values('Активный/Пассивный');
    --Заполнение плана счетов    
    set_acc_plan();
    
    --Инициализация нумератора документов
    insert into numerator(typedef_id,prefix)
        values((select id from type_def where upper(table_name)=upper('orders')),'OR-');
    
    --Справочник единиц измерений
    insert into measure_unit(fullname,code) 
        values('шт','796');
    insert into measure_unit(fullname,code) 
        values('кг','166');
    insert into measure_unit(fullname,code) 
        values('услуга','808');
    insert into measure_unit(fullname,code) 
        values('м','006');    
    
    --Справочник пользователей, пользователь-администратор
    insert into users(first_name,last_name,email,is_admin,login,pass_wd,predefined) 
      values('Viacheslav','Bakum','bakum@bmexp.com',1,'sysdba','1',1);
    
    --Справочник валют  
    insert into currency(code,fullname,namefull,predefined,id_xml)
      values('980','грн','Гривна',1,'0');
      
    select uuid() into p_uid from dual;  
    insert into currency(id, code,fullname,namefull,predefined,id_xml)
      values(p_uid,'840','usd','USD',0,'6');
    insert into ex_rates_settings(curr_id) values (p_uid);
    
    select uuid() into p_uid from dual;  
    insert into currency(id,code,fullname,namefull,predefined,id_xml)
      values(p_uid,'978','EUR','Евро',0,'8'); 
    insert into ex_rates_settings(curr_id) values (p_uid);
    
    select uuid() into p_uid from dual;  
    insert into currency(id,code,fullname,namefull,predefined,id_xml)
      values(p_uid,'643','RUB','Рубль',0,'17');   
    insert into ex_rates_settings(curr_id) values (p_uid); 
    
    --Справочник подразделений
    insert into divisions(fullname,is_group,predefined)
      values('Подразделения',1,1);
    insert into divisions(fullname,parent_id,is_group)
      values('Украина',(select id from divisions where fullname = 'Подразделения'),1);  
    
    --Справочник номенклатуры  
    insert into nomenklatura(fullname,is_group,usluga,predefined)
      values('Номенклатура',1,0,1);
    insert into nomenklatura(fullname,is_group,parent_id,usluga,predefined)
      values('Услуги',1,(select id from nomenklatura where fullname = 'Номенклатура'),0,0); 
    
    --Справочник организаций  
    insert into firms(fullname,printname,ur_fiz)
      values('Организация','Моя организация',1);
    
    --Справочник контрагентов
    insert into kontragents(fullname,is_group,predefined)
      values('Контрагенты',1,1);
    insert into kontragents(fullname,is_group,parent_id,predefined)
      values('Поставщики',1,(select id from kontragents where fullname = 'Контрагенты'),1);
    insert into kontragents(fullname,is_group,parent_id,predefined)
      values('Покупатели',1,(select id from kontragents where fullname = 'Контрагенты'),1);
    insert into kontragents(fullname,is_group,parent_id,predefined)
      values('Замерщики',1,(select id from kontragents where fullname = 'Контрагенты'),1);  
    
    --Виды деятельности
    insert into type_of_activities(fullname)
        values('Юриспруденция');
    insert into type_of_activities(fullname)
        values('Окна');
    insert into type_of_activities(fullname)
        values('Мебель');
    
    --Статусы заказа
    insert into ORDER_STATUS(name, fullname)
        values('ВРаботе','В работе');
    insert into ORDER_STATUS(name, fullname)
        values('ВРасчете','В расчёте');
    insert into ORDER_STATUS(name, fullname)
        values('Выполнен','Выполнен'); 
    insert into ORDER_STATUS(name, fullname)
        values('Замер','Замер');
    insert into ORDER_STATUS(name, fullname)
        values('Новый','Новый');
    insert into ORDER_STATUS(name, fullname)
        values('Закрыт','Закрыт'); 
    insert into ORDER_STATUS(name, fullname)
        values('Аннулирован','Аннулирован');
    insert into ORDER_STATUS(name, fullname)
        values('НеОплачен','Не оплачен');     
    
    --Статусы звонков 
    insert into CALL_STATUS(name, fullname)
        values('New','Новый'); 
    insert into CALL_STATUS(name, fullname)
        values('Pending','В ожидании'); 
    insert into CALL_STATUS(name, fullname)
        values('FailedSubmit','Неудачный');
    
    --Статусы результата звонков
    insert into CALL_RESULTS(name, fullname)
        values('Sales','Продажа');
    insert into CALL_RESULTS(name, fullname)
        values('WrongNumber','Неверный номер');
    insert into CALL_RESULTS(name, fullname)
        values('InvalidNumber','Недействительный номер');
    insert into CALL_RESULTS(name, fullname)
        values('Voicemail','Голосовая почта');
    insert into CALL_RESULTS(name, fullname)
        values('PowerOff','Номер отключен');    
    insert into CALL_RESULTS(name, fullname)
        values('NoAnswer','Нет ответа');
    insert into CALL_RESULTS(name, fullname)
        values('SendFax','Отправить факс');
    insert into CALL_RESULTS(name, fullname)
        values('SendMail','Отправить почту');    
    insert into CALL_RESULTS(name, fullname)
        values('Success','Успешно');    
    insert into CALL_RESULTS(name, fullname)
        values('Fail','Неудача');    
    insert into CALL_RESULTS(name, fullname)
        values('AnswerMachine','Автоответчик');    
    insert into CALL_RESULTS(name, fullname)
        values('DontCallAgain','Больше не звонить');    
    insert into CALL_RESULTS(name, fullname)
        values('NotInterested','Не интересует');    
    insert into CALL_RESULTS(name, fullname)
        values('CallLater','Перезвонить позже');
    insert into CALL_RESULTS(name, fullname)
        values('Measuring','Вызов на замер');     
        
     --Кампании (колл-листы) по-умолчанию
     insert into COMPAIGNS(name, PREDEFINED)
        values('hot',1);
     insert into COMPAIGNS(name, PREDEFINED)
        values('cold',1);   
    
    --Проводки для заказа
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id)
        values((select id from type_def where upper(type_def.table_name)=upper('orders')),
               (select id from plan_acc where code = '20711'),
               (select id from plan_acc where code = '600'));
    insert into entry_settings(typedef_id,plan_acc_deb_id,plan_acc_kred_id)
        values((select id from type_def where upper(type_def.table_name)=upper('orders')),
               (select id from plan_acc where code = '701'),
               (select id from plan_acc where code = '20351'));           
      
    
    EXCEPTION
    WHEN OTHERS THEN
    -- Consider logging the error and then re-raise
        RAISE;
  end;
  
  procedure enable_constraint as
  begin
  for c2 in (select y.table_name, y.constraint_name from user_constraints y, user_tables x where x.table_name = y.table_name) loop
    begin
        execute immediate ('alter table '||c2.table_name||' enable constraint '||c2.constraint_name);
    end;
    end loop;
    
    EXCEPTION
    WHEN OTHERS THEN
			-- Consider logging the error and then re-raise
			RAISE;
  end;
  
  procedure disable_constraint as
  begin
  for c2 in (select y.table_name, y.constraint_name from user_constraints y, user_tables x where x.table_name = y.table_name) loop
    begin
        execute immediate ('alter table '||c2.table_name||' disable constraint '||c2.constraint_name);
    end;
    end loop;
    
    EXCEPTION
    WHEN OTHERS THEN
			-- Consider logging the error and then re-raise
			RAISE;
  end;
  
  function retrieve_customer_parentid return varchar2
  as v_return VARCHAR2(36);
  begin
    select id into v_return from kontragents where upper(fullname) = upper('Покупатели');
    return v_return;
  exception
  when others then
    return null;
  end;
  
  function retrieve_customer_parentname return varchar2
  as v_return VARCHAR2(150);
  begin
    select fullname into v_return from kontragents where upper(fullname) = upper('Покупатели');
    return v_return;
  exception
  when others then
    return null;
  end;
  
  procedure add_kontragent_to_call_list(p_kontrag_id in varchar2, p_compaign_id in varchar2)
  as
  begin
  for i in (select * from contact_details where kontrag_id = p_kontrag_id) loop
    insert into COMPAIGNS_DETAILS (compaign_id,kontrag_id,contact_id) 
      values(p_compaign_id,p_kontrag_id,i.id);
  end loop;
  exception
  when others then
    raise;
  end;
  
  procedure rem_kontragent_from_call_list(p_kontrag_id in varchar2)
  as
  cl_rec compaigns_details%rowtype;
  begin
  select * into cl_rec from compaigns_details where id = p_kontrag_id for update;
  delete from compaigns_details where id = p_kontrag_id;
  exception
  when others then
    raise;
  end;
  
  function retrieve_division_parentid return varchar2
  as v_return VARCHAR2(36);
  begin
    select id into v_return from DIVISIONS where parent_id is null and is_group = 1;
    return v_return;
  exception
  when others then
    return null;
  end;
  
  procedure change_parent_in_division(p_id in varchar2, p_parent_id in varchar2)
  as
  div_rec divisions%rowtype;
  begin
  select * into div_rec from divisions where id = p_id for update;
  div_rec.parent_id:=p_parent_id;
  update divisions
    set row = div_rec
  where id = p_id;
  exception
  when others then
    raise;
  end;
  
  procedure add_user_to_group(p_user in varchar2, p_group in varchar2)
  as
  begin
    insert into groupmembers (g_name, g_member) values (p_group,p_user);
    exception
    when others then
    raise;
  end;
  
  function retrieve_zamer_parentid return varchar2
  as v_return VARCHAR2(36);
  begin
    select id into v_return from kontragents where upper(fullname) = upper('Замерщики');
    return v_return;
  exception
  when others then
    return null;
  end;


end utility;

/
