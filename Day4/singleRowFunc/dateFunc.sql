-- 현재 날짜 출력
select SYSDATE 
from dual;

-- 두 날짜 사이의 개월 차이 (최근 - 과거)
select ROUND(MONTHS_BETWEEN(SYSDATE, '2001-01-16'))
from dual;

select ROUND(MONTHS_BETWEEN('2001-01-01', '2001-01-16'))
from dual;

select MONTHS_BETWEEN('2001-12-01', '2001-10-01')
from dual;


select SYSDATE, NEXT_DAY(SYSDATE, 'FRI')
from dual;

select SYSDATE, LAST_DAY(SYSDATE)
from dual;