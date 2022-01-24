select ename, sal
from emp
where sal > ( select sal
                from emp
                where ename='SCOTT');
                
-- ���� �� Sub query: sub query�� ����� 1��
-- ��������1
select s.name, s.deptno1
from student s, department d
where s.name='������';

-- ���� �� Sub query: sub query�� ����� 2�� �̻�

-- ���� �÷� Sub Query : Sub query�� ����� ���� col�� ���
select grade, name, height
from student
where (grade, height) IN (
select grade, MAX(height)
from student
group by grade)
order by 1;

