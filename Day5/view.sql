-- �ܼ� view
CREATE OR REPLACE VIEW v_prof
AS
SELECT profno, name, email, hpage
FROM professor ;

SELECT * FROM v_prof;

-- ���� view
CREATE OR REPLACE VIEW v_prof_dept
AS
SELECT p.profno "������ȣ", p.name "������", d.dname "�Ҽ��а���"
FROM professor p , department d
WHERE p.deptno = d.deptno ;

SELECT * FROM v_prof_dept ;

-- Inline view
SELECT d.dname "�а���", s.max_height "�ִ�Ű", s.max_weight "�ִ������"
FROM ( SELECT deptno1, MAX(height) max_height, MAX(weight) max_weight
FROM student
GROUP BY deptno1) s , department d
WHERE s.deptno1 = d.deptno ;
