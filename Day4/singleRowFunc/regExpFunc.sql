select * from reg_test;

-- 문자set과 숫자set
select * 
from reg_test
where REGEXP_LIKE(text, '[a-z][0-9]');

-- 문자set과 숫자set 사이에 공백이 1개
select * 
from reg_test
where REGEXP_LIKE(text, '[a-z] [0-9]');

-- 문자set과 숫자set 사이에 공백이 0개 이상인 것
select * 
from reg_test
where REGEXP_LIKE(text, '[a-z]?[0-9]');