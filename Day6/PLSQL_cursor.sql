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
    
    DBMS_OUTPUT.PUT_LINE('��ȣ   �̸�   �޿�');
        
    LOOP
        fetch c1 into vempno, vename, vsal;
        EXIT WHEN c1%notfound;
        
        DBMS_OUTPUT.PUT_LINE(vempno||'   '||vename||'   '||vsal);
    END LOOP;
    
    close c1;
END;

-- CURSOR FOR LOOP
DECLARE
    CURSOR emp_cur IS -- Ŀ�� ����˴ϴ�
    SELECT empno ,ename
    FROM emp;
BEGIN
    FOR emp_rec IN emp_cur -- Ŀ���� �����͸� ������ emp_rec ���� �����
    LOOP
        DBMS_OUTPUT.PUT_LINE(emp_rec.empno||' '||emp_rec.ename);
    END LOOP;
END;

-- CURSOR�� Sub query�� �۾�
DECLARE
BEGIN
    FOR emp_rec IN (SELECT empno, ename, sal
                    FROM emp)
    LOOP
        DBMS_OUTPUT.PUT_LINE(emp_rec.empno||' '||emp_rec.ename||' '||emp_rec.sal);
    END LOOP;
END ;