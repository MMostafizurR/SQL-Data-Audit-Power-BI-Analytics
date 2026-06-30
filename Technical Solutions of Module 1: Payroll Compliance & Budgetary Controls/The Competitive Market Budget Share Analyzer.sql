SELECT 
    e.first_name,
    e.salary,
    DeptTotals.TotalDeptBudget,
    (e.salary / DeptTotals.TotalDeptBudget) * 100 AS [Budget_Share_Pct]
FROM employees e
INNER JOIN (
    SELECT department_id, SUM(salary) AS TotalDeptBudget
    FROM employees
    GROUP BY department_id
) AS DeptTotals 
ON e.department_id = DeptTotals.department_id
ORDER BY Budget_Share_Pct DESC;
