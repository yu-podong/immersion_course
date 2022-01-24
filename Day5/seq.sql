-- <<SEQUENCE >>
-- : 연속적인 일련 번호를 생성
-- INCREMENT BY : 시퀀스 번호의 증가 값으로 기본값은   
-- START WITH : 시퀀스 시작번호로 기본값은 1
-- MAXVALUE/NOMAXVALUE: 생성 가능한 시퀀스 최대값
-- MINVALUE/NOMINVALUE : CYCLE일 경우 새로 시작되는 값
-- CYCLE/NOCYCLE : 시퀸스 번호를 순환 사용할 것인지 지정
-- CHCHE/NOCACHE : 시퀸스 생성속도를 개선하기 위해 캐싱여부 지정

-- SEQUENCE 생성
CREATE SEQUENCE seq_jumun_no
INCREMENT BY 1 START WITH 1000
MAXVALUE 1010
MINVALUE 990
CYCLE
CACHE 2;

-- 새로운 테이블 생성
CREATE TABLE jumun
( j_no number(4) ,
j_name varchar2(10));

-- 데이터 삽입
INSERT INTO jumun
VALUES(seq_jumun_no.NEXTVAL,'AAAA');
INSERT INTO jumun
VALUES(seq_jumun_no.NEXTVAL,'BBBB') ;

SELECT * FROM jumun ;

-- 데이터 삽입 (MAXVALUE를 넘기도록)
BEGIN
 FOR i in 1..11 LOOP
     INSERT INTO jumun VALUES(seq_jumun_no.NEXTVAL ,
     DBMS_RANDOM.STRING('A',4) );
 END LOOP;
 COMMIT ;
END ;
/

-- MAXVALUE값을 다 사용하면, MINVALUE부터 다시 시작
SELECT * FROM jumun ;

CREATE TABLE jumun2
( j_no number(4) ,
j_name varchar2(4) );

CREATE SEQUENCE seq_jumun2_no
INCREMENT BY 1 START WITH 100
MAXVALUE 105
CACHE 2 ;

INSERT INTO jumun2
VALUES(seq_jumun2_no.NEXTVAL,'AAAA') ;

CREATE TABLE s_test1 (
s_rev NUMBER(10));

CREATE SEQUENCE s_rev
INCREMENT BY -1 START WITH 5 
MINVALUE 0
MAXVALUE 10;

INSERT INTO jumun2
VALUES(seq_jumun2_no.NEXTVAL,'AAAA') ;

-- <<SEQUENCE 조회 및 수정>>
-- 조회
SELECT sequence_name "이름" , MIN_VALUE "MIN 값" , MAX_VALUE "최대값" ,
INCREMENT_BY "증가값" , CYCLE_FLAG "CYCLE?" , ORDER_FLAG "정렬" , CACHE_SIZE "캐싱값", LAST_NUMBER "마지막생성값"
FROM user_sequences
WHERE sequence_name='SEQ_JUMUN2_NO' ;

-- 변경
ALTER SEQUENCE seq_jumun2_no
MAXVALUE 110
CACHE 5 ;

-- <<SYNONYM>>
-- : 테이블에 붙이는 별명 (SYNONYM를 만든 사람만 사용 가능)
-- PUBLIC: 다른 사용자도 쓸 수 있도록 설정
CREATE SYNONYM e2 FOR emp2 ;
CREATE PUBLIC SYNONYM d2 FOR department;

-- 조회
SELECT synonym_name, table_owner , table_name
FROM user_synonyms
WHERE table_name='EMP2' ;

-- 삭제
DROP SYNONYM e2 ;