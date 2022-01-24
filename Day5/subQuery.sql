select ename, sal
from emp
where sal > ( select sal
                from emp
                where ename='SCOTT');
                
-- 단잃 행 Sub query: sub query의 결과가 1개
-- 연습문제1
select s.name, s.deptno1
from student s, department d
where s.name='이윤나';

-- 복수 행 Sub query: sub query의 결과가 2개 이상

-- 다중 컬럼 Sub Query : Sub query의 결과가 여러 col인 경우
select grade, name, height
from student
where (grade, height) IN (
select grade, MAX(height)
from student
group by grade)
order by 1;

