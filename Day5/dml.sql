--INSERT
desc dept2;

-- all attribute �Է�
INSERT INTO dept2
VALUES ('9000', 'Ư��1��', '������', '�ӽ�����');

select * from dept2;

-- Ư�� attribute �Է�
INSERT INTO dept2(dcode, dname)
VALUES (9001, 'Ư��2��');

desc professor;
select * from professor;

INSERT INTO professor (profno, name, ID, position, pay, hiredate)
VALUES (5001, '�輳��', 'love_me', '������', 500, SYSDATE);

-- schema, data ���� �� ����
CREATE TABLE professor2
AS SELECT * FROM professor;

-- ���� ���̺� ������ ����
 INSERT ALL
 INTO p_01 (no , name)
 VALUES (1,'AAA')
 INTO p_02 (no , name)
 VALUES(2,'BBB')
 SELECT * FROM dual ;
 
 -- �ٸ� ���̺��� �����͸� �����ͼ� ����
 INSERT ALL
 WHEN profno BETWEEN 1000 AND 1999 THEN
 INTO p_01 VALUES(profno,name)
 WHEN profno BETWEEN 2000 AND 2999 THEN
 INTO p_02 VALUES(profno,name)
 SELECT profno,name
 FROM professor ;
 
 -- �ٸ� ���̺� ���ÿ� ���� ������ �Է�
 INSERT ALL
 INTO p_01 VALUES (profno,name)
 INTO p_02 VALUES (profno,name)
 SELECT profno,name
 FROM professor
 WHERE profno BETWEEN 3000 AND 3999 ;
 
 
--UPDATE
UPDATE professor
SET bonus=100
WHERE position='������';

UPDATE professor
SET pay=pay*1.15
WHERE position= ( select position
from professor
where name='����ö')
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
ON (total.�ǸŹ�ȣ=p01.�ǸŹ�ȣ)
WHEN MATCHED THEN
    UPDATE SET total.��ǰ��ȣ=p01.��ǰ��ȣ
WHEN NOT MATCHED THEN
    INSERT VALUES (p01.�ǸŹ�ȣ, p01.��ǰ��ȣ, p01.����, p01.�ݾ�);