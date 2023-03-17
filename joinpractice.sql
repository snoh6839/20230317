-- 실습

-- 1. employee의 emp_no, last_name, first_name from employees  그리고  title from titles을 출력해주세요
SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name) AS Full_name, t.title
FROM employees e
	INNER JOIN titles t
		ON e.emp_no = t.emp_no
where t.to_date >= NOW();

-- emp_no, CONCAT 함수로 직원의 성(last name)과 이름(first name)을 띄어쓰기로 연결하여
-- 하나의 문자열로 합쳐주고,
-- 직책(title) 을 선택해서
-- "employees"테이블에서 데이터를 가져와서
-- INNER JOIN 으로 "titles" 테이블 데이터와  emp_no 열이 일치하는 행을 결합해서
-- 해당 직책이 있는 직원만 결과 집합에 포함되도록 했습니다.

-- 2. employee의 emp_no, gender from employees  그리고  현재 salary from salaries을 출력해주세요
SELECT e.emp_no, e.gender, s.salary
FROM employees e
	INNER JOIN salaries s
		ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01';

-- emp_no, 성별(gender), 급여(salary) 를 선택하여
-- "employees"의 테이블에서 데이터를 가져와
-- INNER JOIN으로 emp_no 열이 "salaries" 테이블에서 일치하는 행을 결합했습니다.
-- 이를 통해 직원과 그들의 현재 급여 정보가 결과 집합에 포함됩니다.
-- WHERE 절은 s.to_date가 '9999-01-01'인 행만 선택해서 현재 유효한 급여 정보만 선택하도록 필터링했습니다.

-- 3. 10010 employee의 last_name, first_name from employees,
-- 그리고 salary 이력  from salaries을 출력해주세요
SELECT concat(e.last_name, ' ' ,e.first_name) AS Full_name, s.salary, s.from_date, s.to_date
FROM employees e
	INNER JOIN salaries s
		ON e.emp_no = s.emp_no
WHERE e.emp_no = 10010;

-- CONCAT 함수로 직원의 성(last name)과 이름(first name)을 띄어쓰기로 연결하여 하나의 문자열로 합쳐주고,
-- 급여, 시작일, 마지막일을 선택하여 이력을 확인 할 수 있도록 했고
-- "employees"의 테이블에서 데이터를 가져와
-- INNER JOIN으로 emp_no 열이 "salaries" 테이블에서 일치하는 행을 결합했습니다.
-- WHERE 절은 emp_no 가 10010인 직원을 선택하여 한 사람의 이력만 나오도록 해줬습니다.

-- 4. dept_emp의 dept_no와 departments의 dept_no를 연결해 dept_name을 employee의 emp_no,
-- last_name, first_name from employees 와 함께 출력해주세요
SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name) AS Full_name, d.dept_name
FROM employees e
	INNER JOIN dept_emp de
		ON e.emp_no = de.emp_no
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
WHERE de.to_date >= NOW()
ORDER BY e.emp_no;
		
-- INNER JOIN을 사용하여
-- employees 테이블과 dept_emp 테이블은 emp_no를 공통값으로,
-- dept_emp 테이블과 departments 테이블은 dept_no를 공통값으로 연결해 줬습니다.
-- 쿼리의 결과는 각 직원의 사번, 성명 (이름과 성), 그리고 해당 직원이 속한 부서명이 출력됩니다.
-- Full_name이라는 별칭(alias)을 사용하여 first_name과 last_name 열을 합쳐서 출력하였습니다.

-- 5. 현재 salary from salaries 의 상위 10위까지 employee의  last_name, first_name from employees와
-- 월급을 출력해 주세요.
SELECT concat(employees.last_name, ' ' ,employees.first_name) AS Full_name, salaries.salary
FROM employees
	INNER JOIN (
	  SELECT emp_no, salary, RANK() OVER (ORDER BY salary DESC) as salary_rank
	  FROM salaries
	  WHERE to_date = '9999-01-01'
	) salaries
		ON employees.emp_no = salaries.emp_no
WHERE salaries.salary_rank <= 10;

-- 직원의 이름과 해당 직원의 현재 연봉을 선택하여
-- INNER JOIN 으로 emp_no 열이 일치하는 두 테이블의 행을 결합합니다.
-- 이를 통해 직원과 그들의 현재 연봉 정보가 결과에 포함됩니다.
-- 서브쿼리에는 to_date가 '9999-01-01'인 행에서
-- emp_no, salary, 그리고 해당 직원의 연봉순위(salary_rank)를 선택합니다.
-- RANK() 함수를 사용하여 salaries 테이블을 salary 값에 따라 내림차순으로 정렬한 후
-- 각 행에 대한 순위를 부여합니다. 
-- WHERE 절은 salary_rank가 10 이하인 직원만 선택해 하위 10명의 연봉을 가진 직원만 결과 집합에 포함합니다.

-- SELECT concat(e.last_name, ' ' ,e.first_name), s.salary
-- FROM employees e
-- INNER JOIN salaries s ON e.emp_no = s.emp_no
-- WHERE s.to_date = '9999-01-01'
-- ORDER BY s.salary DESC
-- LIMIT 10;
-- 어제 리미트 방식이 빨라 써봤는데
-- 리미트 방식 rank 방식보다 .3초 느려서 코멘트 아웃처리했습니다.

-- 6. dept_manager테이블의 emp_no를employees와 연결해 first_name을 구하고 dept_manager에서 
-- 각 dept_no의 to_date가 가장 큰 사람의 first_name과 to_date를 출력해 주세요
SELECT concat(e.last_name, ' ' ,e.first_name) AS Full_name, e.hire_date, d.dept_name, dm.from_date
FROM employees e
	INNER JOIN dept_manager dm
		ON e.emp_no = dm.emp_no
		AND dm.to_date = '9999-01-01'
	INNER JOIN departments d
		ON dm.dept_no = d.dept_no;

-- emp_no, dept_no 등으로 조인을 수행하여
-- Full_name, hire_date, dept_name, from_date의 정보를 가져옵니다.
-- 이때 dept_manager 테이블에서 to_date가 '9999-01-01'인 데이터만 가져오므로,
-- 현재 매니저로서 근무 중인 정보만을 가져옵니다.
-- SELECT 문의 CONCAT 함수는 e.last_name과 e.first_name을 합쳐
-- Full_name이라는 별칭을 가지는 새로운 컬럼을 생성합니다.

-- 7. 현재 title이 staff인 employee의 (from titles) 현재 평균 salary (from salaries)을
-- emp_no와 함께 출력해 주세요
SELECT s.emp_no, t.title, AVG(s.salary) AS avg_salary
FROM salaries s
	INNER JOIN titles t
		ON s.emp_no = t.emp_no
WHERE t.title = 'Staff'
GROUP BY s.emp_no;

-- salaries 테이블과 titles 테이블을 emp_no 컬럼을 기준으로 조인해서
-- 이때 Staff 직책을 가진 직원들만 가져오도록 WHERE 절을 이용했습니다.
-- 그리고 GROUP BY 구문을 이용해 각 직원의 emp_no 별로 평균 연봉을 구하고,
-- AVG 함수를 이용해 평균값을 계산합니다.

-- 현재 staff인 직원의  전체 평균
SELECT t.title, AVG(s.salary) AS avg_salary
FROM salaries s
	INNER JOIN titles t
		ON s.emp_no = t.emp_no
WHERE t.title = 'Staff'
	AND s.to_date = '9999-01-01'
GROUP BY t.title;

-- salaries 테이블과 titles 테이블을 emp_no 컬럼을 기준으로 INNER JOIN하여
-- 직원들의 연봉 정보와 직책 정보를 가져옵니다.
-- 그리고 WHERE 절에서는 Staff 직책에 속하는 직원들만을 가져오고,
-- 현재 근무 중인 직원들만을 대상으로 하기 위해 to_date가 '9999-01-01'인 데이터만 가져옵니다.
-- GROUP BY 구문을 이용해 직책 별로 평균 연봉을 계산합니다.

-- 8. dept_manager의 모든 emp_no와 employees 테이블의 emp_no가 일치하는 모든 employee의  emp_no, last_name, first_name, hire_date, dept_no를 출력해주세요 dept_no는 dept_manager테이블에 있습니다.
SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name) AS Full_name, e.hire_date, dm.dept_no
FROM employees e
	INNER JOIN dept_manager dm
		ON e.emp_no = dm.emp_no;
		
-- employees와 dept_manager 테이블을 emp_no 컬럼을 기준으로 INNER JOIN 하여
-- 각 직원의 사번(emp_no), 성(last_name), 이름(first_name), 입사일(hire_date),
-- 그리고 해당 직원이 맡고 있는 부서의 번호(dept_no)를 가져옵니다.

-- 9. 현재 각 title (from titles)별 AVG(salary) from salaries 가 60,000이상인 title의 
-- title과 AVG(salary) 를 정수로 내림차순 출력해주세요.
SELECT t.title, CAST(AVG(s.salary) AS INT) AS avg_salary
FROM titles t
	INNER JOIN salaries s
		ON t.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
	 AND t.to_date = '9999-01-01'
GROUP BY t.title
HAVING avg_salary >= 60000
ORDER BY avg_salary DESC;

-- titles 테이블과 salaries 테이블을 emp_no 컬럼을 기준으로 INNER JOIN하여
-- 각 직원의 직책 정보와 연봉 정보를 가져옵니다.
-- WHERE 절에서는 현재 근무 중인 직원들만을 대상으로 하기 위해
-- to_date가 '9999-01-01'인 데이터만 가져옵니다.
-- 그리고 GROUP BY 구문을 이용하여 직책 별로 평균 연봉을 계산합니다.
-- HAVING 구문을 이용하여 평균 연봉이 60,000 이상인 직책들만을 대상으로 하고,
-- ORDER BY 구문을 이용하여 평균 연봉이 높은 직책부터 내림차순으로 정렬합니다.
-- CAST(AVG(s.salary) AS INT) AS avg_salary = FLOOR(AVG(s.salary)) AS avg_salary
-- = CAST(AVG(s.salary) AS unsigned) AS avg_salary = truncate(AVG(s.salary), 0) AS avg_salary 

-- 10. gender가 f 인 employoee의 (from employees) title (from titles)별 employoee 수를
-- title과 함께 출력해 주세요 
SELECT t.title, COUNT(*) AS employee_count, e.gender
FROM employees e
	INNER JOIN titles t
		ON e.emp_no = t.emp_no
WHERE e.gender = 'F'
GROUP BY t.title;

-- employees 테이블과 titles 테이블을 emp_no 컬럼을 기준으로 INNER JOIN하여
-- 각 직원의 직책 정보와 성별 정보를 가져옵니다.
-- WHERE 절에서는 성별이 여성인 직원들만을 대상으로 하기 위해 gender가 'F'인 데이터만 가져옵니다.
-- 그리고 GROUP BY 구문을 이용하여 직책 별로 직원 수를 계산합니다.
-- 이 때, 성별 정보도 함께 조회하기 위해 gender 컬럼도 GROUP BY 구문에 추가합니다.

-- 11. gender가 f 인 employoee의 (from employees) title (from titles)별 퇴사한 employoee 수를
-- title과 함께 출력해 주세요 
SELECT e.emp_no, t.title, e.gender, t.to_date
FROM employees e
	JOIN (
		SELECT emp_no, title, from_date, to_date
		FROM titles
		WHERE to_date < NOW()
		AND (emp_no, from_date) IN (
			SELECT emp_no, MAX(from_date)
			FROM titles
			GROUP BY emp_no
		)
	) t
		ON e.emp_no = t.emp_no
WHERE e.gender = 'F'
GROUP BY e.emp_no, t.title;

-- 일단 여성 사원들 번호, 직급, 퇴사일 출력
-- emp_no가 겹칠 경우  from date가 가장 큰 것만 선택되게 함

SELECT t.title, COUNT(*) AS num_resigned, e.gender
FROM employees e
	JOIN (
		SELECT emp_no, title, from_date, to_date
		FROM titles
		WHERE to_date < NOW()
		AND (emp_no, from_date) IN (
			SELECT emp_no, MAX(from_date)
			FROM titles
			GROUP BY emp_no
		)
	) t
		ON e.emp_no = t.emp_no
WHERE e.gender = 'F'
GROUP BY t.title;



-- 사번을 빼고 직책으로 묶어서 카운트 해줌

-- SELECT e.gender, COUNT(e.gender) AS num_resigned
-- FROM employees e
-- 	JOIN (
-- 		SELECT emp_no, from_date
-- 		FROM titles
-- 		WHERE to_date < NOW()
-- 			AND (emp_no, from_date) IN (
-- 				SELECT emp_no, MAX(from_date)
-- 				FROM titles
-- 				GROUP BY emp_no
-- 			)
-- 	) t
-- ON e.emp_no = t.emp_no
-- GROUP BY e.gender;

SELECT e.gender, COUNT(e.gender) AS num_resigned
FROM employees e
	JOIN (
		SELECT emp_no
		FROM titles
		GROUP BY emp_no
		HAVING MAX(to_date) != DATE('9999-01-01')
			) t
ON e.emp_no = t.emp_no
GROUP BY e.gender;

-- SELECT COUNT(*) AS num_resigned
-- FROM employees e
-- 	JOIN (
-- 		SELECT emp_no, from_date
-- 		FROM titles
-- 		WHERE to_date < NOW()
-- 		AND (emp_no, from_date) IN (
-- 			SELECT emp_no, MAX(from_date)
-- 			FROM titles
-- 			GROUP BY emp_no
-- 		)
-- 	) t
-- 		ON e.emp_no = t.emp_no
-- WHERE e.gender = 'm';

