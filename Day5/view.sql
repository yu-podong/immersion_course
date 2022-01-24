-- 단순 view
CREATE OR REPLACE VIEW v_prof
AS
SELECT profno, name, email, hpage
FROM professor ;

SELECT * FROM v_prof;

-- 복합 view
CREATE OR REPLACE VIEW v_prof_dept
AS
SELECT p.profno "교수번호", p.name "교수명", d.dname "소속학과명"
FROM professor p , department d
WHERE p.deptno = d.deptno ;

SELECT * FROM v_prof_dept ;

-- Inline view
SELECT d.dname "학과명", s.max_height "최대키", s.max_weight "최대몸무게"
FROM ( SELECT deptno1, MAX(height) max_height, MAX(weight) max_weight
FROM student
GROUP BY deptno1) s , department d
WHERE s.deptno1 = d.deptno ;
