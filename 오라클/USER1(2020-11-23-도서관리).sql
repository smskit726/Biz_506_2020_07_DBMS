SELECT SEQ_BBS.NEXTVAL FROM DUAL;

DROP TABLE tbl_book CASCADE CONSTRAINTS;
DROP SEQUENCE seq_book;

commit;

SELECT * FROM tbl_book;