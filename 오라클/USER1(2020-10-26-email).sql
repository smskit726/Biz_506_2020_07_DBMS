-- user1 ( Spring OneDay Project, tbl_ems )
CREATE TABLE tbl_ems (
        id	NUMBER		PRIMARY KEY,
        from_email	nVARCHAR2(30)	NOT NULL,	
        to_email	nVARCHAR2(30)	NOT NULL,	
        s_date	nVARCHAR2(10),	
        s_time	nVARCHAR2(10),		
        s_subject	nVARCHAR2(125),		
        s_content	nVARCHAR2(2000),		
        s_file1 	nVARCHAR2(125),		
        s_file2 	nVARCHAR2(125)
);

DROP TABLE tbl_ems CASCADE CONSTRAINTS;

CREATE SEQUENCE seq_ems
START WITH 1 INCREMENT BY 1;

SELECT * FROM tbl_ems;

DELETE FROM tbl_ems;

commit;
