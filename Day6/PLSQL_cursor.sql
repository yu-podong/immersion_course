DECLARE
    vempno number(4);
    vename varchar2(20);
    vsal number(7);
    
    CURSOR c1 is
        select empno, ename, sal
        from emp
        where deptno=20;
BEGIN
    open c1;
    
    DBMS_OUTPUT.PUT_LINE('번호   이름   급여');
        
    LOOP
        fetch c1 into vempno, vename, vsal;
        EXIT WHEN c1%notfound;
        
        DBMS_OUTPUT.PUT_LINE(vempno||'   '||vename||'   '||vsal);
    END LOOP;
    
    close c1;
END;

-- CURSOR FOR LOOP
DECLARE
    CURSOR emp_cur IS -- 커서 선언됩니다
    SELECT empno ,ename
    FROM emp;
BEGIN
    FOR emp_rec IN emp_cur -- 커서의 데이터를 저장할 emp_rec 변수 선언됨
    LOOP
        DBMS_OUTPUT.PUT_LINE(emp_rec.empno||' '||emp_rec.ename);
    END LOOP;
END;

-- CURSOR를 Sub query로 작업
DECLARE
BEGIN
    FOR emp_rec IN (SELECT empno, ename, sal
                    FROM emp)
    LOOP
        DBMS_OUTPUT.PUT_LINE(emp_rec.empno||' '||emp_rec.ename||' '||emp_rec.sal);
    END LOOP;
END ;