-- <<SEQUENCE >>
-- : �������� �Ϸ� ��ȣ�� ����
-- INCREMENT BY : ������ ��ȣ�� ���� ������ �⺻����   
-- START WITH : ������ ���۹�ȣ�� �⺻���� 1
-- MAXVALUE/NOMAXVALUE: ���� ������ ������ �ִ밪
-- MINVALUE/NOMINVALUE : CYCLE�� ��� ���� ���۵Ǵ� ��
-- CYCLE/NOCYCLE : ������ ��ȣ�� ��ȯ ����� ������ ����
-- CHCHE/NOCACHE : ������ �����ӵ��� �����ϱ� ���� ĳ�̿��� ����

-- SEQUENCE ����
CREATE SEQUENCE seq_jumun_no
INCREMENT BY 1 START WITH 1000
MAXVALUE 1010
MINVALUE 990
CYCLE
CACHE 2;

-- ���ο� ���̺� ����
CREATE TABLE jumun
( j_no number(4) ,
j_name varchar2(10));

-- ������ ����
INSERT INTO jumun
VALUES(seq_jumun_no.NEXTVAL,'AAAA');
INSERT INTO jumun
VALUES(seq_jumun_no.NEXTVAL,'BBBB') ;

SELECT * FROM jumun ;

-- ������ ���� (MAXVALUE�� �ѱ⵵��)
BEGIN
 FOR i in 1..11 LOOP
     INSERT INTO jumun VALUES(seq_jumun_no.NEXTVAL ,
     DBMS_RANDOM.STRING('A',4) );
 END LOOP;
 COMMIT ;
END ;
/

-- MAXVALUE���� �� ����ϸ�, MINVALUE���� �ٽ� ����
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

-- <<SEQUENCE ��ȸ �� ����>>
-- ��ȸ
SELECT sequence_name "�̸�" , MIN_VALUE "MIN ��" , MAX_VALUE "�ִ밪" ,
INCREMENT_BY "������" , CYCLE_FLAG "CYCLE?" , ORDER_FLAG "����" , CACHE_SIZE "ĳ�̰�", LAST_NUMBER "������������"
FROM user_sequences
WHERE sequence_name='SEQ_JUMUN2_NO' ;

-- ����
ALTER SEQUENCE seq_jumun2_no
MAXVALUE 110
CACHE 5 ;

-- <<SYNONYM>>
-- : ���̺� ���̴� ���� (SYNONYM�� ���� ����� ��� ����)
-- PUBLIC: �ٸ� ����ڵ� �� �� �ֵ��� ����
CREATE SYNONYM e2 FOR emp2 ;
CREATE PUBLIC SYNONYM d2 FOR department;

-- ��ȸ
SELECT synonym_name, table_owner , table_name
FROM user_synonyms
WHERE table_name='EMP2' ;

-- ����
DROP SYNONYM e2 ;