
SELECT 
    first_name,
    department_id,
    salary,
    AVG(salary) OVER(PARTITION BY department_id) AS [Dept_Avg],
    salary - AVG(salary) OVER(PARTITION BY department_id) AS [Dept_Distance]
FROM employees;
