-- 여기는 USER1 화면
-- 상품정보의 삭제 기능을 구현하기 위해 삭제Flag 칼럼을 추가
DROP TABLE tbl_product CASCADE CONSTRAINTS;

CREATE TABLE tbl_product (
        P_CODE	CHAR(6)		PRIMARY KEY,
        P_NAME	nVARCHAR2(30)	NOT NULL,	
        P_DCODE	CHAR(4),		
        P_STD	nVARCHAR2(20),
        P_IPRICE	NUMBER,		
        P_OPRICE	NUMBER,		
        P_IMAGE	nVARCHAR2(125),		
        P_NOT_USE	CHAR(1)	DEFAULT NULL	
);

DROP TABLE tbl_dept CASCADE CONSTRAINTS;

CREATE TABLE tbl_dept (
        D_CODE	CHAR(4)		PRIMARY KEY,
        D_NAME	nVARCHAR2(50)	NOT NULL,	
        D_CEO	nVARCHAR2(30)	NOT NULL,	
        D_TEL	VARCHAR2(20),		
        D_ADDRESS	nVARCHAR2(255),		
        D_MANAGER	nVARCHAR2(50),		
        D_MN_TEL	VARCHAR2(20),		
        D_NOT_USE	CHAR(1)	DEFAULT NULL	
);

SELECT * FROM tbl_product;
SELECT * FROM tbl_dept;

-- 삭제 표시가 되지 않은 데이터만 조회
SELECT * FROM tbl_product WHERE p_not_use IS NULL;