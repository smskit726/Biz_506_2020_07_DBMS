-- user1 ( QnA Board )
CREATE TABLE tbl_question(
    q_seq NUMBER PRIMARY KEY,
    q_writer VARCHAR2(30),
    q_date VARCHAR(10),
    q_time VARCHAR(8),
    q_title VARCHAR2(30) NOT NULL,
    q_content VARCHAR2(2000) NOT NULL
);

CREATE SEQUENCE seq_question
START WITH 1 INCREMENT BY 1;

INSERT INTO tbl_question(q_seq, q_writer, q_date, q_time, q_title, q_content)
VALUES (seq_question.NEXTVAL, '홍길동', '2020-12-07', '10:15:35', '안녕하세요', '반갑습니다' );

INSERT INTO tbl_question(q_seq, q_writer, q_date, q_time, q_title, q_content)
VALUES (seq_question.NEXTVAL, '이몽룡', '2020-12-05', '17:15:35', 'QnA게시판', '만들어봅시다' );

INSERT INTO tbl_question(q_seq, q_writer, q_date, q_time, q_title, q_content)
VALUES (seq_question.NEXTVAL, '성춘향', '2020-12-03', '09:15:35', '테이블', '어떻게 만들어야 할까요?' );

SELECT * FROM tbl_question ORDER BY q_seq;


CREATE TABLE tbl_answer(
    q_seq NUMBER,
    a_seq NUMBER PRIMARY KEY,
    a_writer VARCHAR2(30),
    a_date VARCHAR(10),
    a_time VARCHAR(8),
    a_title VARCHAR2(30) NOT NULL,
    a_content VARCHAR2(2000) NOT NULL
);

CREATE SEQUENCE seq_answer
START WITH 1 INCREMENT BY 1;

INSERT INTO tbl_answer(q_seq, a_seq, a_writer, a_date, a_time, a_title, a_content)
VALUES ( 1 , seq_answer.NEXTVAL , '오바마', '2020-12-07', '12:14:00', '반가워요', '친하게 지내요');

INSERT INTO tbl_answer(q_seq, a_seq, a_writer, a_date, a_time, a_title, a_content)
VALUES ( 1 , seq_answer.NEXTVAL , '문재인', '2020-12-07', '14:14:00', 'ㅎㅇ', 'ㅎㅎ!');

INSERT INTO tbl_answer(q_seq, a_seq, a_writer, a_date, a_time, a_title, a_content)
VALUES ( 1 , seq_answer.NEXTVAL , '트럼프', '2020-12-07', '17:14:00', 'hi', 'nice to meet you');

INSERT INTO tbl_answer(q_seq, a_seq, a_writer, a_date, a_time, a_title, a_content)
VALUES ( 2 , seq_answer.NEXTVAL , '오바마', '2020-12-05', '19:14:00', '반가워요', '친하게 지내요');

INSERT INTO tbl_answer(q_seq, a_seq, a_writer, a_date, a_time, a_title, a_content)
VALUES ( 8 , seq_answer.NEXTVAL , '박근혜', '2020-12-08', '15:14:00', 'ㅎㅇ', '친하게 지내요');

INSERT INTO tbl_answer(q_seq, a_seq, a_writer, a_date, a_time, a_title, a_content)
VALUES ( 2 , seq_answer.NEXTVAL , '심슨', '2020-12-07', '15:14:00', '반가워요', '친하게 지내요');

INSERT INTO tbl_answer(q_seq, a_seq, a_writer, a_date, a_time, a_title, a_content)
VALUES ( 9 , seq_answer.NEXTVAL , '바트', '2020-12-07', '20:14:00', '공공db', '써볼까?');

SELECT * FROM tbl_answer ORDER BY a_seq;

SELECT QT.q_seq, q_writer, q_title, q_content, a_writer, a_title, a_content
FROM tbl_question QT
    LEFT JOIN tbl_answer AT
        ON QT.q_seq = AT.q_seq;

commit;