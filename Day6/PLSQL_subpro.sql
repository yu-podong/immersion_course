-- <<PROCEDURE>>
-- ex1
CREATE OR REPLACE PROCEDURE update_20
IS
BEGIN
    UPDATE emp
    SET job='CHECK'
    where deptno=20;
END;

execute update_20;

-- ex2
CREATE OR REPLACE PROCEDURE up_sal(vempno emp.empno%TYPE)
IS
BEGIN
    UPDATE emp SET sal=5000
    WHERE empno=vempno;
END;
    
EXEC up_sal(7902);

-- ex3 : OUT MODE
CREATE OR REPLACE PROCEDURE info_prof
(v_profno IN professor.profno%TYPE,
v_name OUT professor.name%TYPE,
v_pay OUT professor.pay%TYPE)
IS 
BEGIN
    select name, pay INTO v_name, v_pay
    from professor
    where profno = v_profno;
END info_prof;

DECLARE 
    v_name professor.name%TYPE;
    v_pay professor.pay%TYPE;
BEGIN
    info_prof(1001, v_name, v_pay);
    DBMS_OUTPUT.PUT_LINE(v_name||' 교수님의 급여는 '||v_pay||'입니다.');
END;

-- <<FUNCTION>>
-- ex1
CREATE OR REPLACE FUNCTION s_max_sal(s_deptno emp.deptno%TYPE)
return number
IS
    max_sal emp.sal%TYPE ;
BEGIN
    SELECT max(sal) INTO max_sal
    FROM emp
    WHERE deptno=s_deptno;
    RETURN max_sal ;
END;

-- ex2
CREATE OR REPLACE FUNCTION f_dname (v_empno IN emp.empno%TYPE)
RETURN VARCHAR2
IS
    v_dname dept.dname%TYPE;
BEGIN
    SELECT DNAME INTO V_DNAME
    FROM DEPT
    WHERE DEPTNO = (SELECT DEPTNO
                    FROM EMP
                    WHERE EMPNO=V_EMPNO);
    RETURN V_DNAME ;
END ;

-- 생성된 함수 조회하기
SELECT text
FROM user_source
WHERE type='FUNCTION' AND name='S_MAX_SAL' ;

-- <<PACKAGE>>
CREATE OR REPLACE PACKAGE emp_total 
AS
    PROCEDURE emp_sum;
    PROCEDURE emp_avg;
END emp_total;

CREATE OR REPLACE PACKAGE BODY emp_total AS
    PROCEDURE emp_sum
    IS
    CURSOR emp_total_sum IS
        SELECT COUNT(*), SUM(NVL(sal,0))
        FROM emp;
        total_num NUMBER ;
        total_sum NUMBER;
    BEGIN
        OPEN emp_total_sum ;
        FETCH emp_total_sum INTO total_num , total_sum ;
        DBMS_OUTPUT.PUT_LINE('총인원수: '||total_num||' , 급여합계: '||total_sum);
        CLOSE emp_total_sum;
    END emp_sum ; --emp_sum 프로시저 끝
    
    PROCEDURE emp_avg -- emp_avg 프로시저 시작
    IS
        CURSOR emp_total_avg IS
            SELECT COUNT(*), AVG(NVL(sal,0))
            FROM emp;
        total_num NUMBER ;
        total_avg NUMBER ;
        BEGIN
            OPEN emp_total_avg ;
            FETCH emp_total_avg INTO total_num , total_avg;
            DBMS_OUTPUT.PUT_LINE('총인원수: '||total_num||' , 급여평균: '||total_avg);
            CLOSE emp_total_avg ;
    END emp_avg; -- 프로시저 끝
END emp_total;

-- 생성된 패키지 조회
SELECT text
FROM user_source
WHERE type='PACKAGE';

-- <<TRIGGER>>
-- BEFORE TRIGGER : DML 이벤트가 발생하기 전에 실행
-- AFTER TRIGGER : DML이 발생한 후에 실행

CREATE TABLE t_order
( no NUMBER,
ord_code VARCHAR2(10),
ord_date DATE );

-- BEFORE/AFTER : 트리거가 실행되는 시점
-- INSERT : 트리거를 실행시키는 사전
CREATE OR REPLACE TRIGGER t_order
BEFORE INSERT ON t_order
BEGIN
    IF (TO_CHAR(SYSDATE,'HH24:MI') NOT BETWEEN '15:20' AND '15:27') THEN
    RAISE_APPLICATION_ERROR(-20100,'허용시간 아닙니다');
    END IF ;
END;

INSERT INTO t_order
VALUES(1,'C100',SYSDATE);