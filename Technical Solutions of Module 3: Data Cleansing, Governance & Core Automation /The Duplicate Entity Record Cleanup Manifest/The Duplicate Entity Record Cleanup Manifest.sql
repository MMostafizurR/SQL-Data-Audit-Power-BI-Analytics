SELECT *
FROM (
    SELECT 
        [employee_id], [first_name], [last_name], [hire_date],
        ROW_NUMBER() OVER (
            PARTITION BY first_name, last_name, hire_date 
            ORDER BY employee_id
        ) AS [DuplicateCount]
    FROM employees
) AS X
WHERE X.DuplicateCount > 1;
