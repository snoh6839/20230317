CREATE VIEW test_view
AS
	SELECT e.emp_no, concat(e.last_name, ' ' ,e.first_name) AS Full_name, t.title
	FROM employees e
		INNER JOIN titles t
			ON e.emp_no = t.emp_no
	where t.to_date >= NOW();

SELECT * FROM test_view WHERE title = 'staff';