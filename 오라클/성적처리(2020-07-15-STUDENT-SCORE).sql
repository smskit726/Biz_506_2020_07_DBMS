-- 여기는 grade 화면입니다.

/*
================================================================================
성적일람표 출력
================================================================================
성적 정보 Table(tbl_score)에는 학번과 각 과목별 점수가 저장되어 있다.
학생 정보 Table(tbl_student)에는 학번과 이름 등이 저장되어 있다.
성적일람표를 보고 싶은데, 학생의 학번과 이름이 포함된 리스트를 보고싶다.
두개 Table, tbl_score, tbl_student를 연동하여 리스트를 조회해야 한다.
이러한 기법을 JOIN 이라고 한다.
*/

SELECT *
FROM tbl_score
WHERE sc_num BETWEEN '20001' AND '20010';

/*
- 완전 JOIN
sc_score table에 있는 학번의 정보는 반드시 st_student 에 있다 라는 전제하에
결과가 원하는대로 나온다.
FROM 다음에 JOIN할 Table을 나열하고
WHERE 절에 두 테이블의 연결점 칼럼을 설정해 주면된다.
*/
SELECT sc_num, st_name, sc_kor, sc_eng, sc_math, sc_music, sc_art
FROM tbl_score, tbl_student
WHERE
--sc_num BETWEEN '20001' AND '20010' AND
sc_num = st_num;


/*
- OUTER JOIN
성적 Table에는 1 ~ 100까지 데이터가 있고
학생 Table에는 1 ~ 50 까지만 데이터가 있다.
이러한 상황에서 성적리스트를 확인하면서 학생 정보와 연동하여 보고 싶을 때 
EQ JOIN을 사용 하게 되면 실제 데이터가 1 ~ 50 까지만 나타나는 현상이 발생한다.

이런 상황에서 성적 Table의 데이터는 모두 확인하면서 학생 Table에 있는 경우만
연결해 보여주는 방식의 JOIN
*/
DELETE FROM tbl_student
WHERE st_num >'20050';

SELECT * FROM tbl_student;

-- EQ JOIN
SELECT sc_num, st_name, sc_kor, sc_eng, sc_math, sc_music, sc_art
FROM tbl_score, tbl_student
WHERE sc_num = st_num;
-- EQ JOIN 과 같다 (INNER JOIN ,INNER 생략가능)
SELECT sc_num, st_name, sc_kor, sc_eng, sc_math, sc_music, sc_art
FROM tbl_score
    INNER JOIN tbl_student
        ON sc_num = st_num;

/*
- LEFT JOIN
OUTER JOIN의 대표적으로 많이 사용하는 JOIN Query

1. JOIN 키워드 왼쪽에는 모든 리스트업 할 Table을 위치시키고
2. 이 Table과 연동하여 정보를 보조적으로 가져올 table을 JOIN 다음에 위치
3. 두 Table의 연결점(Key) ON 키워드 다음에 작성해준다.

JOIN 왼쪽 Table의 데이터를 모두 보여주고 키값으로 오른쪽 Table에서 값을 찾은 후
있으면 PROJECTION에 나열된 칼럼 위치에 값을 표시하고
없으면 (null)이라고 표시한다.

왼쪽 테이블에 데이터가 잘 입력되었나 검증하는 용도로도 많이 사용되고 아직 FK(외래키)
설정이 되지 않은 Table간의 정보를 리스트 업하는 용도로 사용된다.
*/
SELECT sc_num, st_name, sc_kor, sc_eng, sc_math, sc_music, sc_art
FROM tbl_score
    LEFT JOIN tbl_student
        ON sc_num = st_num;