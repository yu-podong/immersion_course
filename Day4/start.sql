select * from tab;

-- employee들의 사원번호와 이름 출력
select empno, ename
from emp;

-- 각 사원마다 이름과 '교수님 배고파요..'가 출력
select name, '교수님 배고파요..'
from PROFESSOR;

-- student의 scheme 확인
desc student;

-- student의 학번, 이름 출력
select studno, name
from student;

-- Alias 부여
select studno "학번", naem AS "이름", profno "지도교수번호"
from student;

select empno AS "사원번호", ename AS "이름", job AS "직업"
from emp;

select deptno as "부서#", dname AS "부서명", loc AS "위치"
from dept;

-- 해당 attr의 중복된 값은 제외하고 출력
select DISTINCT deptno1
from student;

select name, position
from professor;

-- [name][position] : 둘이 붙어서 출력
select name || position
from professor;

-- 교수님 이름과 직위를 원하는 문자열과 함께 출력
select name||'님은 '||position||'입니다.'
from professor;

-- [학생이름]의 키는 [height]cm, 몸무게는 [weight]kg 입니다. 형식으로 출력
select name || '의 키는 ' || weight || 'cm, 몸무게는 ' || weight || 'kg 입니다.' AS "학생의 키와 몸무게"
from student;

-- 각 sal값에 100이 더해진 값 출력
select ename, sal, sal+100
from emp;

-- 각 sal값에서 10%가 인상된 값으로 출력
select sal, sal*1.1 AS "10% 인상된 sal"
from emp;

-- ()를 통해 연산 우선순위 부여
select sal, sal+100/2, (sal+100)/2
from emp;

-- 부서번호가 10인 employee들의 정보만 출력
select ename, sal, deptno
from emp
where deptno=10;

-- 급여가 4000 이상인 직원의 정보만 출력
select ename, sal
from emp
where sal > 4000;

-- 이름이 SCOTT인 시람의 정보 출력
select ename, empno, sal
from emp
where ename = 'SCOTT';

-- 고용날짜가 1987/01/30인 교수님의 정보 출력
select name, pay, hiredate
from professor
where hiredate='87/01/30';

-- 키가 180cm 이상인 학생 정보 출력
select name, height
from student
where height >= 180;

-- 몸무게가 60~80kg인 학생 정보 출력
select name, weight
from student
where weight between 60 and 80;

-- 주전공ID가 101 or 201인 학생의 정보 출력
select name, deptno1
from student
where deptno1 IN (101,201);

-- 글자수에 상관없이 이름이 '김'으로 시작하는 학생 정보 출력
select name
from student
where name LIKE '김%';

select name, bonus
from professor
where bonus IS NULL;

select name, bonus
from professor
where bonus IS NOT NULL;

-- 2가지 이상 조건을 만족하는 row 출력 (AND로 연결)
select name, grade, height
from student
where grade=4 and height > 150;

select name, height, grade, weight
from student
where grade=1 and weight>=80;

select name, grade, height, weight
from student
where grade=2 and height>180 and weight>70;

select name, grade, height, weight
from student
where grade=2 and (height>180 or weight>70);

-- 1학년 학생들의 키를 오름차순으로 정렬
select name, height
from student
where grade=1
order by height ASC;

-- 1학년 학생들의 키를 내림차순으로 정렬
select name, height
from student
where grade=1
order by height DESC;

-- 2번째 col인 'birthday'를 기준으로 오름차순 진행
select name, birthday, height, weight
from student
where grade=1
order by 2;

select name "이름", height "키"
from student
where grade=1
order by 키;

-- UNION : 정렬 및 duplication 제거
select studno, name, deptno1
from student
where deptno1=101
UNION
select profno, name, deptno
from professor
where deptno=101;

-- UNION ALL: 정렬X 및 duplication
select studno, name, deptno1
from student
where deptno1=101
UNION ALL
select profno, name, deptno
from professor
where deptno=101;

-- 주전공이 101 또는 201인 학생 정보 출력
select name
from student
where deptno1=101
UNION
select name
from student
where deptno1=201;

-- 주전공인 101, 부전공은 201인 학생 정보 출력
select name
from student
where deptno1=101
INTERSECT
select name
from student
where deptno2=201;

-- 전임교수는 제외한 나머지 교수님 정보 출력
select name, position
from professor
MINUS
select name, position
from professor
where position='전임강사';