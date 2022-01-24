SET SERVEROUTPUT ON;
--
CREATE TABLE emp3
AS
SELECT empno, ename , sal
FROM emp ;

DECLARE
    vno emp3.empno%TYPE ;
    vname emp3.ename%TYPE ;
    vsal emp3.sal%TYPE ;

BEGIN
    SELECT empno, ename, sal
    INTO vno, vname, vsal
    FROM emp3
    WHERE empno=7900 ;

    DBMS_OUTPUT.PUT_LINE(vno||' '||vname||' '||vsal) ;
END ;

--
DECLARE
    v_row emp3%ROWTYPE ;
BEGIN
    SELECT * INTO v_row
    FROM emp3
    WHERE empno=7900 ;

    DBMS_OUTPUT.PUT_LINE(v_row.empno||'**'||v_row.ename||'**'||v_row.sal);
END ;

--
CREATE TABLE row_test
( no NUMBER,
name VARCHAR2(10),
hdate DATE );
 
CREATE TABLE row_test2
AS SELECT * FROM row_test;
  
INSERT INTO row_test
VALUES (1,'AAA',SYSDATE);
 
INSERT INTO row_test
VALUES (2,'BBB',SYSDATE);
 
INSERT INTO row_test
VALUES (3,'CCC',SYSDATE);
 
COMMIT;

DECLARE
    v_record row_test%ROWTYPE;
BEGIN
    SELECT * INTO v_record
    FROM row_test
    WHERE no=1 ;

    v_record.name := 'DDD' ;
    
    UPDATE row_test2
    SET row=v_record
    WHERE no=1;
END ;

select * from row_test;

-- 바인드 변수
select * from professor;

SET AUTOPRINT ON ;

VAR v_bind NUMBER;

BEGIN
    SELECT (pay*12)+NVL(bonus,0) INTO :v_bind
    FROM professor
    WHERE profno=1001 ;
END;