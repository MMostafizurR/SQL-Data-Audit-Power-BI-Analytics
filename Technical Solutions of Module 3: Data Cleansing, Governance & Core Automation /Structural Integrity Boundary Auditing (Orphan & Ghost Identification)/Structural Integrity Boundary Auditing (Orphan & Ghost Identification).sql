SELECT 
    e.employee_id, 
    e.first_name + ' ' + e.last_name AS [Employee], 
    e.department_id AS [Emp_Dept_ID],
    d.department_id AS [Dept_Table_ID], 
    d.department_name AS [System_Dept_Name]
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IS NULL OR d.department_id IS NULL;
