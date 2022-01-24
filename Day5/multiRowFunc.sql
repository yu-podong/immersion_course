-- COUNT
select COUNT(*), COUNT(hpage)
from professor;

-- SUM
select COUNT(bonus), SUM(bonus)
from professor;

-- AVG
--(bonus받는 인원으로 평균)
select COUNT(bonus), SUM(bonus), AVG(bonus)
from professor;

-- AVG
--(전체 교수님 명 수로 평균)
select COUNT(*), SUM(bonus), AVG(NVL(bonus, 0))
from professor;

-- GROUP BY
select deptno, AVG(NVL(pay, 0)) "평균급여"
from professor
group by deptno;

select deptno, position, AVG(NVL(pay, 0)) "평균급여"
from professor
group by deptno, position;

-- HAVING
select deptno, AVG(NVL(pay, 0))
from professor
where AVG(pay) > 450
group by deptno;

select deptno, AVG(NVL(pay, 0))
from professor
group by deptno
having AVG(pay) > 450;

-- ROLLUP : 주어진 데이터들의 소계 (position의 null 부분)
select deptno, position, COUNT(*), SUM(pay)
from professor
group by ROLLUP(deptno, position);

select deptno, position,  SUM(pay)
from professor
group by  position, ROLLUP(deptno);

-- CUBE
select deptno, position, COUNT(*), SUM(pay)
from professor
group by CUBE(deptno, position);

-- RANK
-- 집계용 문법
select RANK('송도권') WITHIN GROUP(ORDER BY name) "rank"
from professor;

-- 분석용 문법
select profno, name, pay,
RANK() over (order by pay) AS RANK,
RANK() over (order by pay DESC) AS RANK_DESC
from professor;