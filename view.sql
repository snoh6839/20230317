-- CREATE VIEW test_view
-- AS
-- 	SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name) AS Full_name, t.title
-- 	FROM employees e
-- 		INNER JOIN titles t
-- 			ON e.emp_no = t.emp_no
-- 	where t.to_date >= NOW();
-- 
-- SELECT * FROM test_view WHERE title = 'staff';

-- CREATE OR REPLACE VIEW test_view
-- AS
-- 	SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name) AS Full_name
-- 	FROM employees e
-- 		INNER JOIN titles t
-- 			ON e.emp_no = t.emp_no
-- 	where t.to_date >= NOW();
-- 
-- SELECT * FROM test_view WHERE emp_no <= 300000;

-- DROP VIEW test_view;

-- CREATE VIEW now_dept
-- AS
-- 	SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name) AS Full_name, d.dept_name
-- 	FROM employees e
-- 		INNER JOIN dept_emp de
-- 			ON e.emp_no = de.emp_no
-- 		INNER JOIN departments d
-- 			ON de.dept_no = d.dept_no
-- 	WHERE de.to_date >= NOW()
-- 	ORDER BY e.emp_no;
	
SELECT * FROM now_dept;