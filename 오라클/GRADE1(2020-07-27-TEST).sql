-- 여기는 grade1 화면입니다.

-- tbl_student table 생성
CREATE TABLE tbl_student(
        st_num	CHAR(5)		PRIMARY KEY,
        st_name	nVARCHAR2(20)	NOT NULL,	
        st_tel	nVARCHAR2(20)	NOT NULL,	
        st_addr	nVARCHAR2(125),		
        st_grade	NUMBER(1)	NOT NULL,	
        st_dcode	CHAR(3)	NOT NULL
);

-- tbl_dept table 생성
CREATE TABLE tbl_dept(
        d_code	CHAR(3)		PRIMARY KEY,
        d_name	nVARCHAR2(20) NOT NULL UNIQUE,
        d_prof	nVARCHAR2(20)
);

-- tbl_score에서 사용할 sequence 생성
CREATE SEQUENCE seq_score
START WITH 1 INCREMENT BY 1;

-- tbl_score table 생성
CREATE TABLE tbl_score(
        sc_seq	NUMBER		PRIMARY KEY,
        sc_num	CHAR(5)	NOT NULL,	
        sc_sub	nVARCHAR2(20)	NOT NULL,
        sc_score	NUMBER	NOT NULL
);

-- tbl_score table의 학번 + 과목 UNIQUE 설정
ALTER TABLE tbl_score 
    ADD CONSTRAINT UQ_score 
        UNIQUE (sc_num, sc_sub);


-- tbl_student 에 데이터 추가
INSERT INTO tbl_student(st_num, st_name, st_tel, st_addr, st_grade, st_dcode)
    VALUES ('20001' , '길한수', '010-2217-7851', '경남 김해시 어방동 1088-7', 3, '008');
    
INSERT INTO tbl_student(st_num, st_name, st_tel, st_addr, st_grade, st_dcode)
    VALUES ('20002' , '강이찬', '010-4311-1533', '강원도 속초시 대포동 956-5', 1, '006');
    
INSERT INTO tbl_student(st_num, st_name, st_tel, st_addr, st_grade, st_dcode)
    VALUES ('20003' , '개원훈', '010-6262-7441', '경북 영천시 문외동 38-3번', 1, '009');
    
INSERT INTO tbl_student(st_num, st_name, st_tel, st_addr, st_grade, st_dcode)
    VALUES ('20004' , '경시현', '010-9794-9856', '서울시 구로구 구로동 3-35번지', 1, '006');
    
INSERT INTO tbl_student(st_num, st_name, st_tel, st_addr, st_grade, st_dcode)
    VALUES ('20005' , '공동영', '010-8811-7761', '강원도 동해시 천공동 1077-3', 2, '010');


-- tbl_dept 에 데이터 추가
INSERT INTO tbl_dept(d_code, d_name, d_prof)
    VALUES ('001', '컴퓨터공학', '토발즈');
    
INSERT INTO tbl_dept(d_code, d_name, d_prof)
    VALUES ('002', '전자공학', '이철기');
    
INSERT INTO tbl_dept(d_code, d_name, d_prof)
    VALUES ('003', '법학', '킹스필드');
    
    
-- tbl_score 에 데이터 추가
INSERT INTO tbl_score(sc_seq, sc_num, sc_sub, sc_score)
    VALUES (seq_score.NEXTVAL, '20001', '데이터베이스', 71);
    
INSERT INTO tbl_score(sc_seq, sc_num, sc_sub, sc_score)
    VALUES (seq_score.NEXTVAL, '20001', '수학', 63);
    
INSERT INTO tbl_score(sc_seq, sc_num, sc_sub, sc_score)
    VALUES (seq_score.NEXTVAL, '20001', '미술', 50);

INSERT INTO tbl_score(sc_seq, sc_num, sc_sub, sc_score)
    VALUES (seq_score.NEXTVAL, '20002', '데이터베이스', 84);
    
INSERT INTO tbl_score(sc_seq, sc_num, sc_sub, sc_score)
    VALUES (seq_score.NEXTVAL, '20002', '음악', 75);
    
INSERT INTO tbl_score(sc_seq, sc_num, sc_sub, sc_score)
    VALUES (seq_score.NEXTVAL, '20002', '국어', 52);
    
INSERT INTO tbl_score(sc_seq, sc_num, sc_sub, sc_score)
    VALUES (seq_score.NEXTVAL, '20003', '수학', 89);
    
INSERT INTO tbl_score(sc_seq, sc_num, sc_sub, sc_score)
    VALUES (seq_score.NEXTVAL, '20003', '영어', 63);
    
INSERT INTO tbl_score(sc_seq, sc_num, sc_sub, sc_score)
    VALUES (seq_score.NEXTVAL, '20003', '국어', 70);

-- tbl_student 데이터 조회
SELECT * FROM tbl_student;

-- tbl_score 에서 60점 성적이 60점 미만인 학생들의 학번 조회
SELECT sc_num FROM tbl_score
WHERE sc_score < 60;

-- 공동영 학생의 주소 업데이트
UPDATE tbl_student
SET st_addr = '광주광역시 북구 중흥동 경양로 170번'
WHERE st_num = '20005';

-- 개원훈 학생 데이터 삭제
DELETE tbl_student
WHERE st_num = '20003';

SELECT * FROM tbl_student;

DROP TABLE tbl_dept
CASCADE CONSTRAINTS;

DROP TABLE tbl_score
CASCADE CONSTRAINTS;

DROP TABLE tbl_student
CASCADE CONSTRAINTS;

-- tbl_student에 tbl_dept JOIN
SELECT * 
FROM tbl_student ST
    LEFT JOIN tbl_dept D
        ON ST.st_dcode = D.d_code;
        
        
-- 학생 성적 테이블에서 학생의 학번별 총점과 평균 구하기
SELECT ST.st_num AS 학번,
       SUM( (CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) + 
           (CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) ) AS 총점,
           
       ROUND( SUM( (CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) + 
           (CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) ) / 7 , 2)AS 평균
           
FROM tbl_student ST
    LEFT JOIN tbl_score SC
        ON ST.st_num = SC.sc_num
GROUP BY ST.st_num, st.st_dcode
ORDER BY ST.st_num;


-- 학번, 이름, 전화번호, 총점, 평균 구하기
SELECT ST.st_num AS 학번, ST.st_name AS 이름, ST.st_tel AS 전화번호,
       SUM( (CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) + 
           (CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) ) AS 총점,
           
       ROUND( SUM( (CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) + 
           (CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) ) / 7 , 2)AS 평균
           
FROM tbl_student ST
    LEFT JOIN tbl_score SC
        ON ST.st_num = SC.sc_num
GROUP BY ST.st_num, st.st_dcode, ST.st_name, ST.st_tel
ORDER BY ST.st_num;


-- 학생 성적정보 PIVOT
SELECT ST.st_num AS 학번,
       SUM(CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) AS 국어,
       SUM(CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) AS 영어,
       SUM(CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) AS 수학,
       SUM(CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) AS 음악,
       SUM(CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) AS 미술,
       SUM(CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) AS 소프트웨어공학,
       SUM(CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) AS 데이터베이스,
       
       SUM( (CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) + 
           (CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) ) AS 총점,
           
       ROUND( SUM( (CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) + 
           (CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) ) / 7 , 2)AS 평균

FROM tbl_student ST
    LEFT JOIN tbl_score SC
        ON ST.st_num = SC.sc_num
GROUP BY ST.st_num, st.st_dcode
ORDER BY ST.st_num;

-- 학생정보, 학생성적 PIVOT
SELECT ST.st_num AS 학번, ST.st_name AS 이름, ST.st_tel AS 전화번호, ST.st_dcode AS 학과코드,
       SUM(CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) AS 국어,
       SUM(CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) AS 영어,
       SUM(CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) AS 수학,
       SUM(CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) AS 음악,
       SUM(CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) AS 미술,
       SUM(CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) AS 소프트웨어공학,
       SUM(CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) AS 데이터베이스,
       
       SUM( (CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) + 
           (CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) ) AS 총점,
           
       ROUND( SUM( (CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) + 
           (CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) ) / 7 , 2)AS 평균

FROM tbl_student ST
    LEFT JOIN tbl_score SC
        ON ST.st_num = SC.sc_num
GROUP BY ST.st_num, st.st_dcode, ST.st_name, ST.st_tel, ST.st_dcode
ORDER BY ST.st_num;


-- 학생정보, 학과정보, 성적정보 PIVOT
SELECT ST.st_num AS 학번, ST.st_name AS 이름, ST.st_tel AS 전화번호, ST.st_dcode AS 학과, D.d_name AS 학과명,
       SUM(CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) AS 국어,
       SUM(CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) AS 영어,
       SUM(CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) AS 수학,
       SUM(CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) AS 음악,
       SUM(CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) AS 미술,
       SUM(CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) AS 소프트웨어공학,
       SUM(CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) AS 데이터베이스,
       
       SUM( (CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) + 
           (CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) ) AS 총점,
           
       ROUND( SUM( (CASE WHEN SC.sc_sub = '국어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '영어' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '수학' THEN SC.sc_score ELSE 0 END) + 
           (CASE WHEN SC.sc_sub = '음악' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '미술' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '소프트웨어공학' THEN SC.sc_score ELSE 0 END) +
           (CASE WHEN SC.sc_sub = '데이터베이스' THEN SC.sc_score ELSE 0 END) ) / 7 , 2)AS 평균

FROM tbl_student ST
    LEFT JOIN tbl_score SC
        ON ST.st_num = SC.sc_num
    LEFT JOIN tbl_dept D
        ON ST.st_dcode = D.d_code
GROUP BY ST.st_num, st.st_dcode, ST.st_name, ST.st_tel, ST.st_dcode, D.d_code, D.d_name
ORDER BY ST.st_num;
