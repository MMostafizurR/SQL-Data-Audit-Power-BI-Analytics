SELECT 
    e.first_name + ' ' + e.last_name AS [Employee_Name],
    j.job_title AS [Position],
    d.department_name AS [Department],
    l.city AS [City],
    c.country_name AS [Country],
    r.regions_name AS [Region],
    CASE 
        WHEN EXISTS (SELECT 1 FROM job_history jh WHERE jh.employee_id = e.employee_id) 
        THEN 'Veteran (Has History)' 
        ELSE 'New Role / No History' 
    END AS [Career_Status]
FROM employees e
INNER JOIN jobs j          ON e.job_id = j.job_id
INNER JOIN departments d  ON e.department_id = d.department_id
INNER JOIN locations l    ON d.location_id = l.location_id
INNER JOIN countries c    ON l.country_id = c.country_id
INNER JOIN regions r      ON c.regions_id = r.regions_id
ORDER BY r.regions_name, c.country_name, [Employee_Name];
