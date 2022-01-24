-- IF
DECLARE
    vempno emp.empno%TYPE;
    vename emp.ename%TYPE;
    vdeptno emp.deptno%TYPE;
    vdname VARCHAR2(20) := null ;
BEGIN
    SELECT empno , ename , deptno 
    INTO vempno , vename , vdeptno 
    FROM emp 
    WHERE empno=7900;
    
    IF (vdeptno = 10) THEN -- IF 문이 시작됩니다.
        vdname := 'ACCOUNT';
    END IF ; -- IF 문이 끝나면 반드시 END IF 로 마쳐야 합니다.
    
    IF (vdeptno = 20) THEN
        vdname := 'RESEARCH';
    END IF ;
    
    IF (vdeptno = 30) THEN
        vdname := 'SALES';
    END IF ;
    
    IF (vdeptno = 40) THEN
        vdname := 'OPERATIONS';
    END IF ;

    DBMS_OUTPUT.PUT_LINE (vempno||' '||vename||' '||vdeptno||' '||vdname);
END ;

-- IF - ELSIF
DECLARE
    vempno emp.empno%TYPE;
    vename emp.ename%TYPE;
    vdeptno emp.deptno%TYPE;
    vdname VARCHAR2(20) := null ;
BEGIN
    SELECT empno , ename , deptno 
    INTO vempno , vename , vdeptno 
    FROM emp 
    WHERE empno=7900;
    
    IF (vdeptno = 10) THEN -- IF 문이 시작됩니다.
        vdname := 'ACCOUNT';
    
    ELSIF (vdeptno = 20) THEN
        vdname := 'RESEARCH';
        
    ELSIF (vdeptno = 30) THEN
        vdname := 'SALES';
    
    ELSIF (vdeptno = 40) THEN
        vdname := 'OPERATIONS';
    END IF ;

    DBMS_OUTPUT.PUT_LINE (vempno||' '||vename||' '||vdeptno||' '||vdname);
END ;

-- IF - ELSE
DECLARE
    vempno emp.empno%TYPE;
    vename emp.ename%TYPE;
    vcomm emp.comm%TYPE := NULL; 
BEGIN
    SELECT empno , ename , comm INTO vempno , vename , vcomm 
    FROM emp 
    WHERE empno=7900;
 
    IF vcomm > 0 THEN
        DBMS_OUTPUT.PUT_LINE (vename||' 사원의 보너스는 '||vcomm||'입니다 ');
    ELSE
        DBMS_OUTPUT.PUT_LINE (vename||' 사원의 보너스는 없습니다');
    END IF ;
END ;

-- CASE
DECLARE
    v_empno emp.empno%TYPE ;
    v_ename emp.ename%TYPE ;
    v_deptno emp.deptno%TYPE ;
    v_dname varchar2(10) ;

BEGIN
    SELECT empno , ename , deptno
    INTO v_empno , v_ename , v_deptno
    FROM emp
    WHERE empno = &empno ;
    v_dname := CASE v_deptno
                WHEN 10 THEN 'ACCOUNT'
                WHEN 20 THEN 'RESEARCH'
                WHEN 30 THEN 'SALES'
                WHEN 40 THEN 'OPERATIONS'
    END ;
    
    DBMS_OUTPUT.PUT_LINE (v_empno||' '||v_ename||' '||v_deptno||' '||v_dname);
END ;

-- LOOP
DECLARE
    num number := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(num);
        num := num+1;
        EXIT WHEN num > 5;
    END LOOP;
END;

-- WHILE
DECLARE
    num number := 0;
BEGIN
    WHILE num < 6 LOOP 
        DBMS_OUTPUT.PUT_LINE(num);
        num := num+1;
    END LOOP;
END;

-- FOR
BEGIN 
    FOR i IN 0..5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;

BEGIN 
    FOR i IN REVERSE 0..5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;
END;