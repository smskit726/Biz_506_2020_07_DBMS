-- 20.10.08 ReadBookV2 사용자권한 설정 (20.09.25 독서록 참고)
DELETE FROM tbl_member;
COMMIT;
DELETE FROM tbl_authority;

SELECT * FROM tbl_member;
SELECT * FROM tbl_authority;

-- 한개의 tabledp 여러개의 데이터를 INSERT 하고자 할때 사용하는 다중 INSERT SQL이다.
-- seq 값으로 PK를 설정을 해두면 SQL작동을 하지 않는다.
INSERT ALL
    INTO tbl_member (m_userid, m_password) VALUES('user1', 1)
    INTO tbl_member (m_userid, m_password) VALUES('user2', 1)
    INTO tbl_member (m_userid, m_password) VALUES('user3', 1)
    INTO tbl_member (m_userid, m_password) VALUES('user4', 1)
    INTO tbl_member (m_userid, m_password) VALUES('user5', 1)
SELECT * FROM dual;

-- SEQ 값을 SEQ의 NEXTVAL 값으로 설정하는 TABLE의 경우 다중 INSERT가 오류발생을 한다.
INSERT ALL INTO tbl_authority (m_userid, m_role) VALUES('admin', 'ADMIN')
    INTO tbl_authority (m_userid, m_role) VALUES('admin1', 'ADMIN')
    INTO tbl_authority (m_userid, m_role) VALUES('admin2', 'ADMIN')
    INTO tbl_authority (m_userid, m_role) VALUES('admin3', 'ADMIN')
SELECT * FROM dual;

DELETE FROM tbl_authority;

-- 오라클에서 SEQ PK 칼럼을 가진 TABLE에 다중 INSERT 문을 수행하기 위해서
-- 1. 추가할 데이터를 갖는 가상의 TABLE을 생성
-- 2. 가상 table 생성 SQL을 서브쿼리로 묶는다
-- 3. 서브쿼리 부모 SQL에서 seq.NEXTVAL을 실행하여 UNIQUE한 SEQ값을 생성
-- 4. 생성된 가상테이블의 데이터를 INSERT문을 사용하여 TABLE에 추가
-- 5. 생성된 가상테이블의 데이터를 tbl_authority에 복사하는 코드

INSERT INTO tbl_authority (seq, m_userid, m_role)
SELECT SEQ_AUTHORITY.NEXTVAL, SUB.* FROM
(
-- 가상 TABLE
SELECT 'user11' AS USERNAME, 'ROLE_ADMIN' AS AUTHORITY FROM DUAL
UNION ALL
SELECT 'user11' AS USERNAME, 'ROLE_USER' AS AUTHORITY FROM DUAL
UNION ALL
SELECT 'user12' AS USERNAME, 'ROLE_ADMIN' AS AUTHORITY FROM DUAL
UNION ALL
SELECT 'user12' AS USERNAME, 'ROLE_USER' AS AUTHORITY FROM DUAL
) SUB;

SELECT* FROM tbl_member;
SELECT * FROM tbl_authority;

SELECT * FROM tbl_member M
    LEFT JOIN tbl_authority A
        ON M.m_userid = A.m_userid;
        
UPDATE tbl_member SET enabled='1' WHERE m_userid = 'user';
commit;