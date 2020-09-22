-- USER1 독서록 프로젝트

-- TABLE 생성
CREATE TABLE tbl_books(   
    seq	NUMBER		PRIMARY KEY,
    title	nVARCHAR2(125)	NOT NULL,
    link	nVARCHAR2(255),		
    image	nVARCHAR2(255),		
    author	nVARCHAR2(125),		
    price	NUMBER,		
    discount	NUMBER,		
    publisher	nVARCHAR2(125),		
    isbn	CHAR(13),		
    description	nVARCHAR2(2000),		
    pubdate	CHAR(15),		
    buydate	CHAR(10),		
    buyprice	NUMBER,		
    buystore	nVARCHAR2(50)		
);

-- SEQUENCE 생성
CREATE SEQUENCE seq_books
START WITH 1 INCREMENT BY 1;

SELECT * FROM tbl_books;

INSERT INTO tbl_books (seq, title, author, publisher)
VALUES(SEQ_BOOKS.NEXTVAL, '자바입문', '박은종', '이지스퍼블리싱');

INSERT INTO tbl_books (seq, title, author, publisher)
VALUES(SEQ_BOOKS.NEXTVAL, '오라클데이터베이스', '이지훈', '이지스퍼블리싱');

commit;

DELETE FROM tbl_books;

commit;