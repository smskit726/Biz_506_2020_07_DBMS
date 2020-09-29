-- USER1 iolist project

CREATE TABLE tbl_iolist (
    seq	NUMBER		PRIMARY KEY,
    io_date	VARCHAR2(10),		
    io_time	VARCHAR2(10),		
    io_pname	nVARCHAR2(30)	NOT NULL,	
    io_input    CHAR(1) CONSTRAINT input_veri CHECK(io_input ='1' OR io_input = '2'),	
    io_price	NUMBER,		
    io_quan	NUMBER,		
    io_total	NUMBER
);

DROP TABLE Tbl_iolist;
DROP SEQUENCE seq_iolist;

CREATE SEQUENCE seq_iolist
START WITH 1 INCREMENT BY 1;

SELECT * FROM tbl_iolist ORDER BY IO_DATE,IO_TIME;

INSERT INTO tbl_iolist (
seq, io_date, io_time, io_pname, io_input, io_price, io_quan, io_total
) VALUES (
seq_iolist.NEXTVAL, '2020-04-01', '15:23:12', '카디건', '1', 59000, 10, 590000
);

commit;