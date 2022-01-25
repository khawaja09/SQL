
use SQLTutorial
use portfolioProject

--JOIN

select * from EmployeeInfo, EmployeeSalary
where EmployeeInfo.EmployeeID = EmployeeSalary.EmplyeeID

-- INNER JOIN (Returns records that have matching values in both tables)


select *
from EmployeeInfo as ed full outer JOIN EmployeeSalary as es
	ON ed.EmployeeID = es.EmplyeeID
order by Salary desc

-- OUTER JOIN (Returns all records when there is a match in either left or right table)

select * from EmployeeInfo FULL OUTER JOIN EmployeeSalary
ON EmployeeInfo.EmployeeID = EmployeeSalary.EmplyeeID

-- LEFT JOIN (Returns all records from the left table, and the matched records from the right table)

select * from EmployeeInfo LEFT JOIN EmployeeSalary
ON EmployeeInfo.EmployeeID = EmployeeSalary.EmplyeeID

-- RIGHT JOIN (Returns all records from the right table, and the matched records from the left table)

select * from EmployeeInfo RIGHT JOIN EmployeeSalary
ON EmployeeInfo.EmployeeID = EmployeeSalary.EmplyeeID

-- covid data

select cd.location, cd.new_cases, cd.new_deaths, cd.date, cv.new_vaccinations 
from covidDeaths$ as cd INNER JOIN covidVaccination$ as cv
	on cd.location = cv.location
	and cd.date = cv.date
where cd.date > '2021-12-31' and cd.continent = 'Asia' and cv.new_vaccinations is not null
order by date

-- PARTITION BY

SELECT FIRSTNAME, LastName, AGE, SALARY, GENDER,
COUNT(GENDER) OVER (PARTITION BY GENDER) AS TotalGender
FROM EmployeeInfo AS DEMO JOIN EmployeeSalary AS SAL
	ON DEMO.EmployeeID = SAL.EmplyeeID

select count(gender), gender
from EmployeeInfo
group by gender


--CASE STATEMENTS EXAMPLE:1

select FirstName, LastName, Age,
CASE
	WHEN AGE > 30 THEN 'middle aged'
	WHEN AGE BETWEEN 22 AND 30 THEN 'YOUNG'
	ELSE 'TEEN'
END
from EmployeeDemographics
where age is not null
order by Age Desc

-- CASE STATEMENTS EXAMPLE:2

select  ed.FirstName, ed.LastName, es.JobTitle, es.Salary,
CASE
	WHEN ES.JOBTITLE = 'SALESMAN' THEN SALARY + (SALARY *.1)
	WHEN ES.JOBTITLE = 'ACCOUNTANT' THEN SALARY + (SALARY *.05)
	WHEN ES.JobTitle = 'MANAGER' THEN SALARY + (SALARY *.005)
	ELSE SALARY
END AS SALARYAFTERRAISE

from EmployeeDemographics ed INNER JOIN EmployeeSalary es
	ON ed.EmployeeID = es.EmplyeeID


-- HAVING CLAUSE

select JobTitle, COUNT(jobtitle) AS TOTALEMP
from EmployeeSalary
group by JobTitle
HAVING COUNT(jobtitle) > 1	

SELECT FIRSTNAME, LastName, AGE, SALARY
FROM EmployeeDemographics AS DEMO JOIN EmployeeSalary AS SAL
	ON DEMO.EmployeeID = SAL.EmplyeeID
