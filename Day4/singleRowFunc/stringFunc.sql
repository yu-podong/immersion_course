-- << 문자함수 >>
-- 첫 문자 대문자
select INITCAP(ID)
from student
where deptno1=201;

-- LOWER : 모둔 문자 소문자, UPPER : 모든 문자 대문자
select name, id, LOWER(ID), UPPER(ID)
from student
where deptno1=201;

-- LENGTH() : 글자 수 출력
select name, id, length(ID)
from student
where LENGTH(id) > 9;

-- LENGTHB() : byte값 출력
select name, id, length(ID), lengthb(ID)
from student
where deptno1 = 101;

-- 2개의 param plus
select CONCAT(name, position)
from professor
where deptno=101;

-- 부분 문자열 추출 (dual : table을 사용하지 않고, 단순 계산만 할 때 사용)
select SUBSTR('ABCDE', 2,3)
from dual;

select name, SUBSTR(jumin, 1, 6)
from student
where deptno1=101;

-- 2nd param가 [4th param]번째 나오는 위치 출력
select INSTR('A*B*C', '*' , 1,2)
from dual;

select name, tel, INSTR(tel, ')', 1,1)
from student
where deptno1 = 101;

-- [1st param] + [3rd param]*i = [2nd param]자리
select id, RPAD(id, 12, '*')
from student
where  deptno1=101;

-- [3rd param]*i + [1st param] = [2nd param]자리
select id, LPAD(id, 12, '&')
from student
where  deptno1=101;

-- 왼쪽 끝 문자가 [2nd param]이면 삭제
select LTRIM(dname, '영')
from dept2;

-- 오른쪽 끝 문자가 [2nd param]이면 삭제
select RTRIM(dname, '부')
from dept2;

-- [2dn param]을 [3nd param]으로 대체
select REPLACE(name, SUBSTR(name,1,1),'#')
from student
where deptno1=101;