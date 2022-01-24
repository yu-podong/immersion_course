-- NOT NULL : NULL�� �Է� �Ұ�
-- UNIQUE : ������ �÷��� �ߺ� �� �Է� �Ұ�
-- PRIMARY KEY : NOT NULL + UNIQUE -> �����ͳ����� ���ϼ� ���� ��ġ
-- FORGEIGN KEY : �ٸ� ���̺��� �÷� ����
-- CHECK : ������ ���� �Էµǵ��� ���

 CREATE TABLE emp3( 
no NUMBER(4) CONSTRAINT emp3_no_pk PRIMARY KEY ,
name VARCHAR2(10) CONSTRAINT emp3_name_nn NOT NULL,
jumin VARCHAR2(13) CONSTRAINT emp3_jumin_nn NOT NULL CONSTRAINT emp3_jumin_uk UNIQUE ,
area NUMBER(1) CONSTRAINT emp3_area_ck CHECK ( area < 5 ),
deptno VARCHAR2(6) CONSTRAINT emp3_deptno_fk REFERENCES dept2(dcode)
);

CREATE TABLE emp4
( no NUMBER(4) PRIMARY KEY ,
name VARCHAR2(10) NOT NULL,
jumin VARCHAR2(13) NOT NULL UNIQUE ,
area NUMBER(1) CHECK ( area < 5 ),
deptno VARCHAR2(6) REFERENCES dept2(dcode)
) ;

desc emp4;

-- �������� �߰�
ALTER TABLE emp4
ADD CONSTRAINT emp4_name_uk UNIQUE(name);

-- �������� ����
ALTER TABLE emp4
MODIFY (area constraint emp4_area_nn NOT NULL);

-- ����Ű�� ����
ALTER TABLE emp4
ADD CONSTRAINT emp4_no_fk FOREIGN KEY(no) REFERENCES emp2(empno);

desc test_novalidate;

-- NOVALIDATE(Default) : ���������� ȿ�� ����
INSERT INTO test_novalidate VALUES(1,'DDD');

ALTER TABLE test_novalidate
DISABLE NOVALIDATE CONSTRAINT SYS_C0011123 ;

-- VALIDATE : �ش� COL�� �����͸� ������ �� ������
INSERT INTO test_validate VALUES(4,NULL);

ALTER TABLE test_validate
DISABLE VALIDATE CONSTRAINT tv_name_nn ;

-- ENABLE
-- NOVALIDATE : ���������� ENABLE�� ���� �̹��� ���� ������ �˻� x, ���ĸ� �˻�
-- VALIDATE : ENABLE ���� ���� & ���� ��� �˻� -> �˻絿�� LOCK -> ���� ���ݰ� �߰� ��, error �߻� -> ENABLE ���

-- �������� ��ȸ (desc�� null ���뿩�θ� ������)
select owner, constraint_name, constraint_type, status
from user_constraints
where table_name='EMP4';

-- �������� �����ϱ�
ALTER TABLE emp4
DROP CONSTRAINT emp4_name_uk;