CREATE DATABASE mydb;
SHOW DATABASES;
use mydb;
SHOW TABLES;
DESC tbl_book;

INSERT INTO tbl_book(title, author, comp, price)
VALUES('Do it 자바', '이지즈퍼블리시', '박은종', 30000 );

INSERT INTO tbl_book(title, author, comp, price)
VALUES('Do it 자바스크립트', '이지즈퍼블리시', '박은종', 25000 );

INSERT INTO tbl_book(title, author, comp, price)
VALUES('Do it 몽고', '이지즈퍼블리시', '박은종', 20000 );

SELECT * FROM tbl_book;

SHOW CREATE TABLE tbl_book;

DROP TABLE tbl_book;

SHOW TABLES;