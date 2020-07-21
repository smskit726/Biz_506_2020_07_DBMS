-- 여기는 관리자 화면입니다.
-- 새로운 TableSpace와 사용자를 등록
-- TableSpace : user2Ts
-- USER : user2
-- PassWord : user2

-- C:\bizwork\workspace\oracle_data
CREATE TABLESPACE user2TS
DATAFILE 'C:/bizwork/workspace/oracle_data/user2.dbf'
SIZE 1M AUTOEXTEND ON NEXT 10K;

CREATE USER user2 IDENTIFIED BY user2
DEFAULT TABLESPACE user2TS;

GRANT DBA TO user2;