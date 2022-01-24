-- NOT NULL : NULL값 입력 불가
-- UNIQUE : 설정된 컬럼은 중복 값 입력 불가
-- PRIMARY KEY : NOT NULL + UNIQUE -> 데이터끼리의 유일성 보장 장치
-- FORGEIGN KEY : 다른 테이블의 컬럼 참조
-- CHECK : 설정된 값만 입력되도록 허용

 CREATE TABLE emp3( 
no NUMBER(4) CONSTRAINT emp3_no_pk PRIMARY KEY ,
name VARCHAR2(10) CONSTRAINT emp3_name_nn NOT NULL,
jumin VARCHAR2(13) CONSTRAINT emp3_jumin_nn NOT NULL CONSTRAINT emp3_jumin_uk UNIQUE ,
area NUMBER(1) CONSTRAINT emp3_area_ck CHECK ( area < 5 ),
deptno VARCHAR2(6) CONSTRAINT emp3_deptno_fk REFERENCES dept2(dcode)
);

CREATE TABLE emp4
( no NUMBER(4) PRIMARY KEY ,
name VARCHAR2(10) NOT NULL,
jumin VARCHAR2(13) NOT NULL UNIQUE ,
area NUMBER(1) CHECK ( area < 5 ),
deptno VARCHAR2(6) REFERENCES dept2(dcode)
) ;

desc emp4;

-- 제약조건 추가
ALTER TABLE emp4
ADD CONSTRAINT emp4_name_uk UNIQUE(name);

-- 제약조건 수정
ALTER TABLE emp4
MODIFY (area constraint emp4_area_nn NOT NULL);

-- 참조키로 설정
ALTER TABLE emp4
ADD CONSTRAINT emp4_no_fk FOREIGN KEY(no) REFERENCES emp2(empno);

desc test_novalidate;

-- NOVALIDATE(Default) : 제약조건의 효력 정지
INSERT INTO test_novalidate VALUES(1,'DDD');

ALTER TABLE test_novalidate
DISABLE NOVALIDATE CONSTRAINT SYS_C0011123 ;

-- VALIDATE : 해당 COL의 데이터를 변경할 수 없도록
INSERT INTO test_validate VALUES(4,NULL);

ALTER TABLE test_validate
DISABLE VALIDATE CONSTRAINT tv_name_nn ;

-- ENABLE
-- NOVALIDATE : 제약조건을 ENABLE한 시점 이번에 들어온 데이터 검사 x, 이후만 검사
-- VALIDATE : ENABLE 시점 이전 & 이후 모두 검사 -> 검사동안 LOCK -> 도중 위반값 발견 시, error 발생 -> ENABLE 취소

-- 제약조건 조회 (desc는 null 적용여부만 가져옴)
select owner, constraint_name, constraint_type, status
from user_constraints
where table_name='EMP4';

-- 제약조건 삭제하기
ALTER TABLE emp4
DROP CONSTRAINT emp4_name_uk;