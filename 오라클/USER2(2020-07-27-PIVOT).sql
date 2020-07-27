-- 여기는 USER2 화면입니다.

CREATE TABLE tbl_성적(
        학번      CHAR(5),
        과목명    nVARCHAR2(20),
        점수      NUMBER
);

SELECT * FROM tbl_성적;

/*
- 표준 SQL 이용한 PIVOT
1. 어떤 칼럼을 기준칼럼으로 할것인가 : 학번칼럼을 기준으로 삼는다. 기준칼럼에 대해서 GROUP BY를 설정
2. 어떤칼럼을 GROUP BY로 설정을 하게 되면 나머지 칼럼은 통계함수로 감싸거나, GROUP BY에 칼럼을 포함해줘야 한다.

점수를 SUM함수로 묶어주는 이유와 결과
학번을 GROUP BY로 묶어서 여러개 저장된 학번을 1개만 보이도록 하기위해 계산되는 각 과목의 점수를 SUM() 묶어준다.
현재 테이블 구조에서 학번 + 과목의 점수는 전체 데이터에서 1개의 레코드만 존재한다.
따라서 SUM()함수는 무언가 합산을 하는 용도가 아니라, 단순히 GROUP BY를 사용할 수 있도록 하는 용도일 뿐이다.
*/
SELECT 학번,
    SUM(CASE WHEN 과목명 = '국어' THEN 점수 ELSE 0 END) AS 국어,
    SUM(CASE WHEN 과목명 = '영어' THEN 점수 ELSE 0 END) AS 영어,
    SUM(CASE WHEN 과목명 = '수학' THEN 점수 ELSE 0 END) AS 수학
FROM tbl_성적
GROUP BY 학번;

-- 오라클의 DECODE() 함수를 이용해서
SELECT 학번,
    SUM(DECODE(과목명, '국어', 점수, 0)) AS 국어,
    SUM(DECODE(과목명, '영어', 점수, 0)) AS 영어,
    SUM(DECODE(과목명, '수학', 점수, 0)) AS 수학
FROM tbl_성적
GROUP BY 학번;

-- 오라클 11g 부터 지원하는 PIVOT 기능을 사용하는 방법
-- PIVOT() : 특정한 칼럼을 기준으로 테이블 PIVOT View 나타내는 내장 함수
-- PIVOT( SUM(값) ) : PIVOT으로 나열할 데이터값이 들어있는 칼럼을 SUM() 으로 묶어서 표시
-- FOR 칼럼 (칼럼값들) : '칼럼'에  '칼럼 값' 으로 가로(COLUMN)방향 나열하여 가상칼럼으로 만들기
SELECT 학번, 국어, 영어, 수학
FROM tbl_성적
PIVOT (
    SUM(점수)
    FOR 과목명 IN ('국어' AS 국어, '영어' AS 영어, '수학' AS 수학)
) 성적;


CREATE TABLE tbl_학생정보 (   
        학번          CHAR(5)         PRIMARY KEY,
        학생이름      nVARCHAR2(30)   NOT NULL,  
        전화번호      VARCHAR2(20),  
        주소          nVARCHAR2(125),
        학년          NUMBER,
        학과          CHAR(3)
);

SELECT * FROM tbl_학생정보;

/*
학번 칼럼명을 사용했는데 이 칼럼이 어떤 table에 있는 칼럼인지 모르겠다
JOIN을 수행하여 다수의 table이 Relation되었을 때, 다수의 table에 같은 이름의 칼럼이 있을 때 발생하는 오류
영문으로 작성할때는 칼럼에 prefix를 붙여서 이런 오류를 막지만
실제 프로젝트에서 여러테이블에 DOMAIN 설정(같은 정보를 담는 칼럼)을 만들경우 prefix를 통일하는 경우도 많다.
이 때는 아래 오류를 매우 자주 접하게 된다.

ORA-00918: column ambiguously defined
00918. 00000 -  "column ambiguously defined"

이 오류를 방지하기 위해 2개이상의 table을 JOIN할 때는 TABLEㅇ레 Alias를 설정하고
AS.칼럼 형식으로 어떤 Table의 칼럼인지 명확히 지정을 해주는것이 좋다.
JOIN, SUBQUERY를 만들때 한개의 테이블을 여러번 사용할 경우 반드시 Alias를 설정하고
명확히 칼럼을 지정해 주어야 한다.

통계함수로 감싸지 않은 칼럼을 반드시 GROUP BY에 명시
*/
SELECT SC.학번, ST.학생이름, ST.전화번호,
    SUM(DECODE(SC.과목명, '국어', 점수, 0)) AS 국어,
    SUM(DECODE(SC.과목명, '영어', 점수, 0)) AS 영어,
    SUM(DECODE(SC.과목명, '수학', 점수, 0)) AS 수학
FROM tbl_성적 SC
    LEFT JOIN tbl_학생정보 ST
        ON ST.학번 = SC.학번
GROUP BY SC.학번, ST.학생이름, ST.전화번호;


CREATE VIEW view_성적PIVOT
AS
(
        SELECT 학번, 국어, 영어, 수학
        FROM tbl_성적
        PIVOT (
            SUM(점수)
            FOR 과목명 IN ('국어' AS 국어, '영어' AS 영어, '수학' AS 수학)
        )
);

SELECT * FROM view_성적PIVOT;

SELECT ST.학번, ST.학생이름, SC.국어, SC.영어, SC.수학
FROM view_성적PIVOT SC
    LEFT JOIN tbl_학생정보 ST
        ON ST.학번 =  SC.학번;


SELECT SC.학번, ST.학생이름, SC.국어, SC.영어, SC.수학
FROM(
    SELECT 학번, 국어, 영어, 수학
        FROM tbl_성적
        PIVOT (
            SUM(점수)
            FOR 과목명 IN ('국어' AS 국어, '영어' AS 영어, '수학' AS 수학)
    )
) SC
    LEFT JOIN tbl_학생정보 ST
        ON ST.학번 = SC. 학번
ORDER BY SC.학번;