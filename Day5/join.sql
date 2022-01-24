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
select s.name AS "�л��̸�", s.profno AS "������ ID", p.name AS "����������"
from student s, professor p
where s.profno = p.profno;

select s.name "�л��̸�", d.dname "�а�", p.name "����������"
from student s, department d, professor p
where s.deptno1=d.deptno and s.profno=p.profno;

select * from emp2;
select * from p_grade;

select e.name "����̸�", e.position "��������", e.pay "���翬��", p.s_pay "���ѱݾ�", p.e_pay "���ѱݾ�"
from emp2 e, p_grade p;

-- NON-EQUI JOIN
select * from gogak;
select * from gift;

select go.gname, go.point, gi.gname
from gogak go, gift gi
where go.point between gi.g_start and gi.g_end;

select gi.gname, COUNT(*) "�ʿ����"
from gogak go, gift gi
where go.point between gi.g_start and gi.g_end
group by gi.gname;

-- OUTER JOIN
-- LEFT OUTER JOIN
select s.name "�л��̸�", p.name "�����̸�"
from student s, professor p
where s.profno=p.profno(+);

-- RIGHT OUTER JOIN
select s.name "�л��̸�", p.name "�����̸�"
from student s, professor p
where s.profno(+)=p.profno;

SELECT s.name "�л��̸�", p.name "�����̸�"
FROM student s , professor p
WHERE s.profno(+) = p.profno
UNION
SELECT s.name "�л��̸�", p.name "�����̸�"
FROM student s , professor p
WHERE s.profno = p.profno(+);

-- SELF JOIN
select * from dept2;

select a.dname "�μ���", b.dname "�����μ���"
from dept2 a, dept2 b
where a.pdept=b.dcode;

select * from professor;

--select p1.profno, p1.name, p1.hiredate, 
--from professor p1, professor p2
--where 

