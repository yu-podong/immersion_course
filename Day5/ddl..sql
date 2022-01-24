--CREATE
CREATE TABLE ddl_test (
no NUMBER(3),
name VARCHAR2(10),
birth DATE DEFAULT SYSDATE)
TABLESPACE users;

-- 테이블 복사
CREATE TABLE dept3
AS SELECT * FROM dept2;

-- 특정 col만 복제
CREATE TABLE dept4
AS SELECT dcode , dname
FROM dept2 ;

-- 테이블의 구조만 가져오기(data X)
CREATE TABLE dept5
AS
SELECT *
FROM dept2
WHERE 1=2 ;

-- 가상 컬럼을 가지는 테이블 생성
CREATE TABLE vt001 (
no1 number, 
no2 number,
no3 number GENERATED ALWAYS AS(no1+no2) VIRTUAL);

SELECT * FROM vt001 ;

INSERT INTO vt001(no1,no2)
VALUES(1,2);

UPDATE vt001
SET no1=10 ;

INSERT INTO vt001 (no1, no2)
VALUES (3,4);

INSERT INTO vt001 (no1,no2)
VALUES(6,6);

ALTER TABLE vt001
ADD (no4 GENERATED ALWAYS AS ((no1*12)+no2));

SELECT column_name, data_type, data_default
from user_tab_columns
where table_name = 'VT001'
order by column_id;

-- ALTER
CREATE TABLE dept6
AS  SELECT dcode, dname
from dept2
where dcode IN (1000,1001,1002);

select * from dept6;

-- 새로운 COL 생성
ALTER TABLE dept6
ADD (loc VARCHAR2(20));

ALTER TABLE dept6
ADD (loc2 VARCHAR2(20) DEFAULT '서울');

-- 컬럼 이름 변겅
ALTER TABLE dept6 RENAME COLUMN loc2 TO AREA;

RENAME dept6 TO dept7;

desc dept7;

-- 특정 col의 type 변경
ALTER TABLE dept7
MODIFY(dcode VARCHAR2(10));

-- 특정 col 삭제
ALTER TABLE dept7 DROP COLUMN loc ;


-- TRUNCATE : 데이터 all 삭제 & 사용한 공간 반납( schema 존재)
TRUNCATE TABLE dept7;

-- DROP : 테이블 삭제 ( CONSTRAINT, SCHEMA 모두 삭제)
DROP TABLE dept7;

