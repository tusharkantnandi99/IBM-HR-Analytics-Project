USE hr_analytics;

CREATE TABLE employees (
    EmployeeNumber INT,
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    Department VARCHAR(100),
    DistanceFromHome INT,
    Education INT,
    Gender VARCHAR(20),
    JobLevel INT,
    JobRole VARCHAR(100),
    JobSatisfaction INT,
    MonthlyIncome DECIMAL(10,2),
    OverTime VARCHAR(10),
    PerformanceRating INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);
DESCRIBE employees;
SELECT COUNT(*) FROM employees; -- 0
