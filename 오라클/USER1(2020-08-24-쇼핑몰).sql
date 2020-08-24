-- 여기는 user1 화면입니다.

SELECT * FROM tbl_product;
SELECT MIN(p_code) FROM tbl_product;
SELECT MAX(p_code) FROM tbl_product;

INSERT INTO tbl_product(p_code, p_name)
VALUES ('P001', '테스트상품1');

SELECT * FROM tbl_product WHERE p_code = RPAD('P001',6,' ');

COMMIT;

SELECT RPAD('가',10,'P') FROM DUAL;

