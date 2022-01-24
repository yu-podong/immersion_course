--INSERT
desc dept2;

-- all attribute 입력
INSERT INTO dept2
VALUES ('9000', '특판1팀', '영업부', '임시지역');

select * from dept2;

-- 특정 attribute 입력
INSERT INTO dept2(dcode, dname)
VALUES (9001, '특판2팀');

desc professor;
select * from professor;

INSERT INTO professor (profno, name, ID, position, pay, hiredate)
VALUES (5001, '김설희', 'love_me', '정교수', 500, SYSDATE);

-- schema, data 복제 및 생성
CREATE TABLE professor2
AS SELECT * FROM professor;

-- 여러 테이블에 데이터 삽입
 INSERT ALL
 INTO p_01 (no , name)
 VALUES (1,'AAA')
 INTO p_02 (no , name)
 VALUES(2,'BBB')
 SELECT * FROM dual ;
 
 -- 다른 테이블에서 데이터를 가져와서 삽입
 INSERT ALL
 WHEN profno BETWEEN 1000 AND 1999 THEN
 INTO p_01 VALUES(profno,name)
 WHEN profno BETWEEN 2000 AND 2999 THEN
 INTO p_02 VALUES(profno,name)
 SELECT profno,name
 FROM professor ;
 
 -- 다른 테이블에 동시에 같은 데이터 입력
 INSERT ALL
 INTO p_01 VALUES (profno,name)
 INTO p_02 VALUES (profno,name)
 SELECT profno,name
 FROM professor
 WHERE profno BETWEEN 3000 AND 3999 ;
 
 
--UPDATE
UPDATE professor
SET bonus=100
WHERE position='조교수';

UPDATE professor
SET pay=pay*1.15
WHERE position= ( select position
from professor
where name='차범철')
AND pay < 250;

--DELETE
DELETE FROM dept2
WHERE dcode between 9000 and 9100;

--MERGE
select* from pt_01;
select* from pt_02;
select* from p_total;

MERGE INTO p_total total
USING pt_01 p01
ON (total.판매번호=p01.판매번호)
WHEN MATCHED THEN
    UPDATE SET total.제품번호=p01.제품번호
WHEN NOT MATCHED THEN
    INSERT VALUES (p01.판매번호, p01.제품번호, p01.수량, p01.금액);