-- USER1
CREATE TABLE tbl_employees(
    id NUMBER PRIMARY KEY,
    first_name nVARCHAR2(30),
    last_name nVARCHAR2(30),
    address nVARCHAR2(125),
    tel VARCHAR(20),
    email VARCHAR(125)
);

CREATE SEQUENCE seq_employees
START WITH 1 INCREMENT BY 1;

SELECT * FROM tbl_employees;

INSERT INTO tbl_employees(id, first_name, last_name, address, tel, email)
VALUES(
SEQ_EMPLOYEES.NEXTVAL,
'길동',
'홍',
'광주광역시',
'010-3333-3333',
'ghi@gmal.com'
);

DROP TABLE tbl_employees CASCADE CONSTRAINTS;
commit;
