-- 여기는 관리자 화면입니다.

CREATE TABLESPACE grade2TS
DATAFILE 'C:/bizwork/workspace/oracle_data/grade2TS.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER grade1 IDENTIFIED BY grade1
DEFAULT TABLESPACE grade2TS;

GRANT DBA TO grade1;
