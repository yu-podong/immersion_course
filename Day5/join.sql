select * from emp;
select * from dept;

select * 
from emp e, dept d;


select * from student;
select * from department;

-- CROSS JOIN
select s.name, s.deptno1, d.dname
from student s, department d;

-- EQUIJOIN
select s.name AS "학생이름", s.profno AS "교수님 ID", p.name AS "지도교수님"
from student s, professor p
where s.profno = p.profno;

select s.name "학생이름", d.dname "학과", p.name "지도교수님"
from student s, department d, professor p
where s.deptno1=d.deptno and s.profno=p.profno;

select * from emp2;
select * from p_grade;

select e.name "사원이름", e.position "현재직급", e.pay "현재연봉", p.s_pay "하한금액", p.e_pay "상한금액"
from emp2 e, p_grade p;

-- NON-EQUI JOIN
select * from gogak;
select * from gift;

select go.gname, go.point, gi.gname
from gogak go, gift gi
where go.point between gi.g_start and gi.g_end;

select gi.gname, COUNT(*) "필요수량"
from gogak go, gift gi
where go.point between gi.g_start and gi.g_end
group by gi.gname;

-- OUTER JOIN
-- LEFT OUTER JOIN
select s.name "학생이름", p.name "교수이름"
from student s, professor p
where s.profno=p.profno(+);

-- RIGHT OUTER JOIN
select s.name "학생이름", p.name "교수이름"
from student s, professor p
where s.profno(+)=p.profno;

SELECT s.name "학생이름", p.name "교수이름"
FROM student s , professor p
WHERE s.profno(+) = p.profno
UNION
SELECT s.name "학생이름", p.name "교수이름"
FROM student s , professor p
WHERE s.profno = p.profno(+);

-- SELF JOIN
select * from dept2;

select a.dname "부서명", b.dname "상위부서명"
from dept2 a, dept2 b
where a.pdept=b.dcode;

select * from professor;

--select p1.profno, p1.name, p1.hiredate, 
--from professor p1, professor p2
--where 

