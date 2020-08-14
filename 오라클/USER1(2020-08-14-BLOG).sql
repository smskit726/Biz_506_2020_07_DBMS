-- 여기는 USER1의 작업 화면 입니다.

-- 블로그 테이블 생성
CREATE TABLE tbl_blogs (
        bl_seq	NUMBER		PRIMARY KEY,
        bl_user	nVARCHAR2(20)	NOT NULL,	
        bl_date	VARCHAR2(10)	NOT NULL,	
        bl_time	VARCHAR2(10)	NOT NULL,	
        bl_title	nVARCHAR2(125)	NOT NULL,
        bl_contents	nVARCHAR2(2000)	NOT NULL
);

-- 일련번호생성을 위하여 SEQUENCE를 생성
-- 시작값을 1로 그리고 1씩 증가하는 조건
CREATE SEQUENCE seq_blog
START WITH 1 INCREMENT BY 1;

INSERT INTO tbl_blogs(bl_seq, bl_user, bl_date, bl_time, bl_title, bl_contents)
VALUES(SEQ_BLOG.NEXTVAL, '홍길동', '2020-08-14', '09:47:00', '나의 블로그', '블로그를 만들자');

INSERT INTO tbl_blogs(bl_seq, bl_user, bl_date, bl_time, bl_title, bl_contents)
VALUES(SEQ_BLOG.NEXTVAL, '이몽룡', '2020-08-14', '09:47:01', '너의 블로그', '안녕하세요');

INSERT INTO tbl_blogs(bl_seq, bl_user, bl_date, bl_time, bl_title, bl_contents)
VALUES(SEQ_BLOG.NEXTVAL, '성춘향', '2020-08-14', '09:47:02', '님의 블로그', '반갑습니다');

SELECT * FROM tbl_blogs;

