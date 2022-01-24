-- 보너스가 없으면 0으로 치환하여 계산
select name, pay, bonus, (pay*12+NVL(bonus, 0))
from professor
where deptno=101;

-- PL의 삼항 연산자와 동일
select name, pay, bonus, NVL2(bonus, pay*12+bonus, pay*0)
from professor
where deptno=101;

-- if([1st param == [2nd param]) then return 101
select name, deptno, DECODE(deptno, 101, '컴퓨터공학과') "학과명"
from professor;

-- if([1st param == [2nd param]) then return [3rd param] else return [4th param]
select name, deptno, DECODE(deptno, 101, '컴퓨터공학과', '기타학과') "학과명"
from professor;

-- if - else if - else
select name, deptno, DECODE(deptno, 101 '컴퓨터공학과'
                                  , 102, '멀티미디어 공학과'
                                  , 103, '소프트웨어학과'
                                  , '기타학과') "학과명"
from professor;

-- if() { if()} else
select name, deptno,
DECODE(deptno, 101, DECODE(name, '조인형', '석좌교수후보', '후보아님')) "비고"
from professor
where deptno=101;

-- switch문(다중 선택형)
select name, tel, 
CASE (SUBSTR(tel, 1, INSTR(tel, ')')-1)
    WHEN '02' THEN '서울'
    WHEN '031' THEN '경기'
    WHEN '051' THEN '부산'
    WHEN '052' THEN '울산'
    WHEN '055' THEN '경남';
ELSE '기타'
END "지역명"'
from student;


select name, SUBSTR(jumin,3,2) "출생일" 
CASE WHEN SUBSTR(jumin, 3,2) between '01' and '03 THEN '1/4분기'
    WHEN SUBSTR(jumin, 3,2) between '04' and '06' THEN '2/4분기'
    WHEN SUBSTR(jumin, 3,2) between '07' and '09' THEN '3/4분기'
    WHEN SUBSTR(jumin, 3,2) between '10' and '12' THEN '4/4분기'
ELSE '안태어남'
END "분기별"
from student;

