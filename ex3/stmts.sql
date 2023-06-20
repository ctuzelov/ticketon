-- ex1 --
SELECT DEPARTMENT, NAME, SALARY
FROM EMPLOYEE
WHERE (DEPARTMENT, SALARY) IN
    (SELECT DEPARTMENT, MAX(SALARY)
    FROM EMPLOYEE
    GROUP BY DEPARTMENT);

-- ex2 --
SELECT DEPARTMENT_ID, COUNT(*) AS EmployeeCount
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(*) <= 3;

-- ex3 --
SELECT e.ID, e.NAME, e.DEPARTMENT_ID
FROM EMPLOYEE e
LEFT JOIN EMPLOYEE m ON e.ManagerID = m.ID
WHERE e.DEPARTMENT_ID = m.DEPARTMENT_ID OR m.ID IS NULL;

-- ex4 --
SELECT DEPARTMENT_ID, SUM(SALARY) AS TotalSalary
FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY) = (SELECT MAX(TotalSalary) FROM
                      (SELECT DEPARTMENT_ID, SUM(SALARY) AS TotalSalary
                       FROM EMPLOYEE
                       GROUP BY DEPARTMENT_ID) AS Subquery);

-- ex5 --
-- VARCHAR хранит символы в кодировке, зависящей от настроек базы данных, и использует меньше памяти, в то время как NVARCHAR хранит символы в кодировке Unicode и использует больше памяти, но поддерживает больший набор языков и символов. --

-- ex6 --
SELECT ID
FROM EMPLOYEE
ORDER BY ID DESC
LIMIT 1;