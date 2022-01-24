-- <<계층형 쿼리>>
-- connect by : 각 행들이 어떻게 연결되어야 하는지 조건을 지정
-- start with : 계층형 구조를 어디서부터 출력할 것인지 (시작노드 느낌)

-- !!'PRIOR'의 위치가 중요!!
select LPAD(dname, LEVEL*6, '*') "부서명"
FROM dept2
connect by PRIOR dcode=pdept
start with dcode=0001;

select LPAD(dname, LEVEL*6, '*') "부서명"
FROM dept2
connect by dcode = PRIOR pdept
start with dcode=0001;

select LPAD(dname, LEVEL*7, '*') "부서명"
FROM dept2
connect by dcode = PRIOR pdept
start with dcode=1011;

-- <<사용자 관리>>
-- PROFILE : 사용자 계정의 행동에 제약사항을 두기 위해 사용

-- 1. PASSWORD PROFILE 관련 파라미터
-- FAILED_LOGIN_ATTEMPTS : login 실패를 몇 번 허용 -> 이후에는 잠금
-- PASSWORD_LOCK_TIME : 계정이 잠기는 기간
-- PASSWORD_LIFE_TIME : 같은 패스워드의 유효기간
-- PASSWORD_GRACE_TIME : 패스워드 변경기간 연장 
-- PASSWORD_REUSE_TIME : 같은 패스워드를 설정할 수 없는 기간
-- PASSWORD_VERIFY_FUNCTION : 패스워드 생성 조건

-- <<PRIVILEGE>>
-- 1. system 관련
-- 권한 할당(GRANT)
GRANT CREATE TABLE, CREATE SESSION TO SCOTT;
-- 권한 해제 (REVOKE)
REVOKE CREATE TABLE FROM SCOTT;

-- 2. object 관련
-- [테이블 생성자].[테이블이름]에 seelect 권한 부여
GRANT SELECT ON HR.EMPLOYEES TO SCOTT;
-- [테이블 생성자].[테이블이름]에 권한 부여 & 동일 권한을 다른 이에게 줄 수 있음
GRANT UPDATE ON HR.EMPLOYEES TO SCOTT WITH GRANT OPTION;
-- 해당 권한 회수
REVOKE SELECT ON HR.EMPLOYEES FROM SCOTT ;

-- <<Role>>
-- 권한의 그룹 (교수님 - 학생 출결 관리 권한, 성적 열람 권한...)

-- ROLE 생성
CREATE ROLE trole;
-- 2개의 권한 할당
GRANT CREATE SESSION, CREATE TABLE TO trole;
-- SCOTT사용자에게 trole 할당하기
GRANT trole TO SCOTT;

-- 어떤 사용자가 어떤 role인지 확인
select * 
from dba_role_privs
where grantee='SCOTT';