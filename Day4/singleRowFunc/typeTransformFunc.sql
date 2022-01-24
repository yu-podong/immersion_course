-- 암묵적 형 변환 (= select 1+to_number('1') from dual;)
select 1+'1'
from dual;

select TO_CHAR(SYSDATE, 'YYYY'),
TO_CHAR(SYSDATE, 'RRRR'),
TO_CHAR(SYSDATE, 'YY'),
TO_CHAR(SYSDATE, 'YEAR')
from dual;

select TO_CHAR(SYSDATE, 'DD'),
TO_CHAR(SYSDATE, 'DAY'),
TO_CHAR(SYSDATE, 'DDTH')
from dual;

select name, TO_CHAR((pay*12)+bonus, '99,999')
from professor
where deptno=101;
