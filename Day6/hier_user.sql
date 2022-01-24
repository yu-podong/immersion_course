-- <<������ ����>>
-- connect by : �� ����� ��� ����Ǿ�� �ϴ��� ������ ����
-- start with : ������ ������ ��𼭺��� ����� ������ (���۳�� ����)

-- !!'PRIOR'�� ��ġ�� �߿�!!
select LPAD(dname, LEVEL*6, '*') "�μ���"
FROM dept2
connect by PRIOR dcode=pdept
start with dcode=0001;

select LPAD(dname, LEVEL*6, '*') "�μ���"
FROM dept2
connect by dcode = PRIOR pdept
start with dcode=0001;

select LPAD(dname, LEVEL*7, '*') "�μ���"
FROM dept2
connect by dcode = PRIOR pdept
start with dcode=1011;

-- <<����� ����>>
-- PROFILE : ����� ������ �ൿ�� ��������� �α� ���� ���

-- 1. PASSWORD PROFILE ���� �Ķ����
-- FAILED_LOGIN_ATTEMPTS : login ���и� �� �� ��� -> ���Ŀ��� ���
-- PASSWORD_LOCK_TIME : ������ ���� �Ⱓ
-- PASSWORD_LIFE_TIME : ���� �н������� ��ȿ�Ⱓ
-- PASSWORD_GRACE_TIME : �н����� ����Ⱓ ���� 
-- PASSWORD_REUSE_TIME : ���� �н����带 ������ �� ���� �Ⱓ
-- PASSWORD_VERIFY_FUNCTION : �н����� ���� ����

-- <<PRIVILEGE>>
-- 1. system ����
-- ���� �Ҵ�(GRANT)
GRANT CREATE TABLE, CREATE SESSION TO SCOTT;
-- ���� ���� (REVOKE)
REVOKE CREATE TABLE FROM SCOTT;

-- 2. object ����
-- [���̺� ������].[���̺��̸�]�� seelect ���� �ο�
GRANT SELECT ON HR.EMPLOYEES TO SCOTT;
-- [���̺� ������].[���̺��̸�]�� ���� �ο� & ���� ������ �ٸ� �̿��� �� �� ����
GRANT UPDATE ON HR.EMPLOYEES TO SCOTT WITH GRANT OPTION;
-- �ش� ���� ȸ��
REVOKE SELECT ON HR.EMPLOYEES FROM SCOTT ;

-- <<Role>>
-- ������ �׷� (������ - �л� ��� ���� ����, ���� ���� ����...)

-- ROLE ����
CREATE ROLE trole;
-- 2���� ���� �Ҵ�
GRANT CREATE SESSION, CREATE TABLE TO trole;
-- SCOTT����ڿ��� trole �Ҵ��ϱ�
GRANT trole TO SCOTT;

-- � ����ڰ� � role���� Ȯ��
select * 
from dba_role_privs
where grantee='SCOTT';