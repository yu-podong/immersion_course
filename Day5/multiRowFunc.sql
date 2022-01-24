-- COUNT
select COUNT(*), COUNT(hpage)
from professor;

-- SUM
select COUNT(bonus), SUM(bonus)
from professor;

-- AVG
--(bonus�޴� �ο����� ���)
select COUNT(bonus), SUM(bonus), AVG(bonus)
from professor;

-- AVG
--(��ü ������ �� ���� ���)
select COUNT(*), SUM(bonus), AVG(NVL(bonus, 0))
from professor;

-- GROUP BY
select deptno, AVG(NVL(pay, 0)) "��ձ޿�"
from professor
group by deptno;

select deptno, position, AVG(NVL(pay, 0)) "��ձ޿�"
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

-- ROLLUP : �־��� �����͵��� �Ұ� (position�� null �κ�)
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
-- ����� ����
select RANK('�۵���') WITHIN GROUP(ORDER BY name) "rank"
from professor;

-- �м��� ����
select profno, name, pay,
RANK() over (order by pay) AS RANK,
RANK() over (order by pay DESC) AS RANK_DESC
from professor;