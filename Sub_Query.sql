USE practice_sql;

-- 서브쿼리: 쿼리 내부에 위치하는 또 다른 쿼리, 쿼리 결과를 조건이나 테이블로 사용할 수 있도록 함

-- WHERE 절에서 서브쿼리: 쿼리 결과를 조건으로 사용하여 조건을 동적으로 지정
-- WHERE 절에서 비교 연산으로 사용될 때 조회하는 컬럼의 개수 및 레코드 개수 주의
SELECT * FROM employee_table
WHERE department_code = (
	SELECT code FROM department WHERE name = '인사부'
);

-- FROM 절에서의 서브쿼리: 쿼리 결과 테이블을 다시 FROM절에 사용하여 복합적인 테이블 조회
-- 반드시 서브쿼리 결과에 대한 이름이 필요함 AS사용
SELECT * 
FROM (
	SELECT name AS employee_name, department_code
    FROM employee_table
    WHERE department_code IS NULL
) AS SQ
WHERE employee_name = '홍길동';

-- 부서 이름이 '개발부'인 사원이름, 부서코드, 부서명을 조회
# 조인해야 가능(조인은 최소화 하는게 좋음 검색속도)
-- 부서 이름이 '개발부'인 사원이름, 부서코드를 조회
# 서브쿼리 만으로 가능(하나의 테이블로 조회가 가능 할 경우)
#step1
SELECT *
FROM department
WHERE name = '개발부';

#step2
SELECT name, department_code
FROM employee_table
WHERE department_code = (
	SELECT code
	FROM department
	WHERE name = '개발부'
);



