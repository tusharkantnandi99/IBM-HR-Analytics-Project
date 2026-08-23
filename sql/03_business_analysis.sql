
USE hr_data_analysis;


-- ============================================
-- 1. BASIC EMPLOYEE OVERVIEW
-- ============================================

-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM employees;


-- Total employees by department
SELECT
    Department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY Department
ORDER BY employee_count DESC;


-- Total employees by gender
SELECT
    Gender,
    COUNT(*) AS employee_count
FROM employees
GROUP BY Gender;


-- ============================================
-- 2. ATTRITION ANALYSIS
-- ============================================

-- Total employees who left the company
SELECT
    COUNT(*) AS attrition_count
FROM employees
WHERE Attrition = 'Yes';


-- Attrition rate
SELECT
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)* 100.0 / COUNT(*),2) AS attrition_rate
FROM employees;


-- Attrition by department
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY Department
ORDER BY attrition_rate DESC;


-- Attrition by gender
SELECT
    Gender,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY Gender
ORDER BY attrition_rate DESC;


-- ============================================
-- 3. JOB ROLE ANALYSIS
-- ============================================

-- Employees by job role
SELECT
    JobRole,
    COUNT(*) AS employee_count
FROM employees
GROUP BY JobRole
ORDER BY employee_count DESC;


-- Attrition by job role
SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobRole
ORDER BY attrition_rate DESC;


-- ============================================
-- 4. SALARY ANALYSIS
-- ============================================

-- Average salary
SELECT
    ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income
FROM employees;


-- Average salary by department
SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS average_salary
FROM employees
GROUP BY Department
ORDER BY average_salary DESC;


-- Attrition by salary
SELECT
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS average_salary
FROM employees
GROUP BY Attrition;


-- ============================================
-- 5. AGE ANALYSIS
-- ============================================

-- Average age
SELECT
    ROUND(AVG(Age), 2) AS average_age
FROM employees;


-- Attrition by age
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,

    COUNT(*) AS total_employees,

    SUM(
        CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END
    ) AS attrition_count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM employees
GROUP BY age_group
ORDER BY attrition_rate DESC;


-- ============================================
-- 6. OVERTIME ANALYSIS
-- ============================================

-- Attrition based on overtime
SELECT
    OverTime,
    COUNT(*) AS total_employees,

    SUM(
        CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END
    ) AS attrition_count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM employees
GROUP BY OverTime
ORDER BY attrition_rate DESC;


-- ============================================
-- 7. JOB SATISFACTION ANALYSIS
-- ============================================

SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,

    SUM(
        CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END
    ) AS attrition_count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


-- ============================================
-- 8. YEARS AT COMPANY ANALYSIS
-- ============================================

SELECT
    YearsAtCompany,
    COUNT(*) AS total_employees,

    SUM(
        CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END
    ) AS attrition_count

FROM employees
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;


-- ============================================
-- 9. BUSINESS TRAVEL ANALYSIS
-- ============================================

SELECT
    BusinessTravel,
    COUNT(*) AS total_employees,

    SUM(
        CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END
    ) AS attrition_count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM employees
GROUP BY BusinessTravel
ORDER BY attrition_rate DESC;


-- ============================================
-- 10. TOP 10 HIGHEST PAID EMPLOYEES
-- ============================================

SELECT
    EmployeeNumber,
    Age,
    Department,
    JobRole,
    MonthlyIncome
FROM employees
ORDER BY MonthlyIncome DESC
LIMIT 10;


-- ============================================
-- 11. TOP JOB ROLES WITH HIGH ATTRITION
-- ============================================

SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees
GROUP BY JobRole
HAVING COUNT(*) >= 20
ORDER BY attrition_rate DESC;


-- ============================================
-- 12. MULTI-DIMENSIONAL ANALYSIS
-- ============================================

SELECT
    Department,
    JobRole,
    COUNT(*) AS total_employees,

    SUM(
        CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END
    ) AS attrition_count,

    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        * 100.0 / COUNT(*),
        2
    ) AS attrition_rate

FROM employees

GROUP BY Department, JobRole

ORDER BY attrition_rate DESC;


-- ============================================
-- 13. CTE ANALYSIS
-- ============================================

WITH department_attrition AS (

    SELECT
        Department,
        COUNT(*) AS total_employees,
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS attrition_count

    FROM employees
    GROUP BY Department
)

SELECT
    Department,
    total_employees,
    attrition_count,
    ROUND(
        attrition_count * 100.0 / total_employees,
        2
    ) AS attrition_rate

FROM department_attrition

ORDER BY attrition_rate DESC;


-- ============================================
-- 14. WINDOW FUNCTION
-- ============================================

SELECT
    Department,
    JobRole,
    AVG(MonthlyIncome) AS average_salary,

    RANK() OVER (
        PARTITION BY Department
        ORDER BY AVG(MonthlyIncome) DESC
    ) AS salary_rank

FROM employees

GROUP BY Department, JobRole;