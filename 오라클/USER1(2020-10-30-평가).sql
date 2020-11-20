-- user1 ( 평가 : tbl_grade )

CREATE TABLE tbl_grade (
g_seq	NUMBER		PRIMARY KEY,
g_code	VARCHAR2(4)	NOT NULL,	
g_name	nVARCHAR2(30)	NOT NULL,	
g_kor	NUMBER,		
g_eng	NUMBER,		
g_math	NUMBER,		
g_total	NUMBER,		
g_avg	NUMBER		
);

CREATE SEQUENCE seq_grade
START WITH 1 INCREMENT BY 1;

SELECT * FROM tbl_grade;

INSERT INTO tbl_grade
(g_seq,g_code,g_name,g_kor,g_eng,g_math,g_total,g_avg)
VALUES
(seq_grade.NEXTVAL, 'S002', '이몽룡', 70,80,90,250,80);

commit;
