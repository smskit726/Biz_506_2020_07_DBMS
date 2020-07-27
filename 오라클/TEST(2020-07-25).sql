-- TEST 화면입니다.

CREATE TABLE test_student(
        st_num  NUMBER(5)  PRIMARY KEY,
        st_name nVARCHAR2(20) NOT NULL,
        st_tel  VARCHAR2(20),
        st_addr nVARCHAR2(125),
        st_grade NUMBER NOT NULL,
        st_dcode NUMBER(3),
        st_dept nVARCHAR2(10),
        st_prof nVARCHAR2(20)
);

SELECT * FROM test_student;

CREATE TABLE test_dept(
        d_code  NUMBER(3),
        d_name  nVARCHAR2(10),
        d_prof  nVARCHAR2(10)
);

SELECT * FROM test_dept;

CREATE TABLE test_score(
        sc_num NUMBER(5) NOT NULL,
        sc_sub nVARCHAR2(20) NOT NULL,
        sc_score NUMBER(3) DEFAULT 0
);

SELECT * FROM test_score;

SELECT ST.st_num,
       SUM(DECODE(SC.sc_sub,'국어',SC.sc_score,0)) AS 국어,
       SUM(DECODE(SC.sc_sub,'영어',SC.sc_score,0)) AS 영어,
       SUM(DECODE(SC.sc_sub,'수학',SC.sc_score,0)) AS 수학,
       SUM(DECODE(SC.sc_sub,'음악',SC.sc_score,0)) AS 음악,
       SUM(DECODE(SC.sc_sub,'미술',SC.sc_score,0)) AS 미술,
       SUM(DECODE(SC.sc_sub,'소프트웨어공학',SC.sc_score,0)) AS 소프트웨어공학,
       SUM(DECODE(SC.sc_sub,'데이터베이스',SC.sc_score,0)) AS 데이터베이스,
       
       SUM(DECODE(SC.sc_sub,'국어',SC.sc_score,0) + DECODE(SC.sc_sub,'영어',SC.sc_score,0) +
       DECODE(SC.sc_sub,'수학',SC.sc_score,0) + DECODE(SC.sc_sub,'음악',SC.sc_score,0) +
       DECODE(SC.sc_sub,'미술',SC.sc_score,0) + DECODE(SC.sc_sub,'소프트웨어공학',SC.sc_score,0) +
       DECODE(SC.sc_sub,'데이터베이스',SC.sc_score,0)) AS 총점,
       
       ROUND( SUM(DECODE(SC.sc_sub,'국어',SC.sc_score,0) + DECODE(SC.sc_sub,'영어',SC.sc_score,0) +
       DECODE(SC.sc_sub,'수학',SC.sc_score,0) + DECODE(SC.sc_sub,'음악',SC.sc_score,0) +
       DECODE(SC.sc_sub,'미술',SC.sc_score,0) + DECODE(SC.sc_sub,'소프트웨어공학',SC.sc_score,0) +
       DECODE(SC.sc_sub,'데이터베이스',SC.sc_score,0)) / 7 ,2) AS 평균
       
FROM test_student ST
    LEFT JOIN test_score SC
        ON ST.st_num = SC.sc_num
GROUP BY ST.st_num, st.st_dcode
ORDER BY ST.st_num;

/*
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

FROM test_student ST
    LEFT JOIN test_score SC
        ON ST.st_num = SC.sc_num
GROUP BY ST.st_num, st.st_dcode
ORDER BY ST.st_num;           
*/

/*
select *
FROM(
    SELECT sc_num, sc_score, sc_sub
    FROM test_score
        LEFT JOIN test_student
            ON st_num = sc_num
)
PIVOT
(
    SUM(sc_score)
    for
    sc_sub in('국어','영어','수학','음악','미술','데이터베이스','소프트웨어공학')
)
ORDER BY sc_num;
*/