-- 화면 출력기능 활성화
SET SERVEROUTPUT ON;

-- ex1
DECLARE -- 선언부 시작
    vno NUMBER(4);
    vname VARCHAR2(10);

BEGIN  -- 실행부 시작
    select empno, ename INTO vno, vname
    from emp
    where empno=7900;
    
    DBMS_OUTPUT.PUT_LINE(vno||'   '||vname);
END;

-- ex2
DECLARE
    -- %TYPE : profno의 tpye과 동일하게 선언
    v_profno professor.profno%TYPE;
    v_pay professor.pay%TYPE;
    
BEGIN
    select profno, pay INTO v_profno, v_pay
    from professor
    where profno=1001;
    
    DBMS_OUTPUT.PUT_LINE(v_profno||' 번 교수님의 급여는 '||v_pay||'입니다.');
END;

-- ex3
DECLARE
    v_empno emp2.empno%TYPE;
    v_name emp2.name%TYPE;
    v_birth emp2.birthday%TYPE;

BEGIN
    select empno, name, birthday INTO v_empno, v_name, v_birth
    from emp2
    where empno='&empno';
    
    DBMS_OUTPUT.PUT_LINE(v_empno||'   '||v_name||'   '||v_birth);
END;

-- ex4
DECLARE
    v_profno professor.profno%TYPE;
    v_name professor.name%TYPE;
    v_deptno professor.deptno%TYPE;
    v_hdate professor.hiredate%TYPE;

BEGIN
    select profno, name, deptno, hiredate INTO v_profno, v_name, v_deptno, v_hdate
    from professor
    where profno='&교수번호';
    
    DBMS_OUTPUT.PUT_LINE(v_profno||'   '||v_name||'   '||v_deptno||'   '||v_hdate);
END;

-- ex5 : insert 문장 수행
CREATE TABLE pl_test
(no NUMBER,
name VARCHAR2(10));

CREATE SEQUENCE pl_seq;

BEGIN 
    INSERT INTO pl_test
    VALUES(pl_seq.NEXTVAL,'AAA');
END;

select * from pl_test;

-- EX6 : 값을 입력받고 insert
CREATE TABLE pl_test2
(no NUMBER,
name VARCHAR2(10),
addr VARCHAR2(10));

DECLARE 
    -- ':=' : 변수에 특정 값 저장
    v_no number := '&no';
    v_name varchar2(10) := '&name';
    v_addr varchar2(10) := '&addr';
    
BEGIN
    INSERT INTO pl_test2
    VALUES(v_no, v_name, v_addr);
END;

-- EX7 : UPDATE
BEGIN
    UPDATE pl_test
    SET name='BBB'
    WHERE no = 2 ;
END;

-- EX7 : 중첩된 블록 작성하기
DECLARE 
    v_first VARCHAR2(15) := 'Outer';
    
BEGIN
    DECLARE
        v_second VARCHAR2(5) := 'Inner';
    BEGIN
    select * from pl_test;

    END;
    DBMS.OUTPUT.PUT_LINE(v_first);
    DBMS.OUTPUT.PUT_LINE(v_second);    
END;