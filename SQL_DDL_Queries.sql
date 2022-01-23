use SQLTutorial

-- creating employee info table

create table EmployeeInfo
(
EmployeeID int,
FirstName varchar(40),
LastName varchar(40),
Age int,
Gender varchar(40)
)


-- creating employee salary table

create table EmployeeSalary
(EmplyeeID int,
JobTitle varchar(40),
Salary int
)


-- insert into EmployeeDemographics

insert into EmployeeInfo values
(102,'hamza', 'khan', 28, 'male'),
(103,'umair', 'hasan', 30, 'female'),
(104,'usama', 'khan', 31, 'male'),
(105,'ali', 'khan', 31, 'male'),
(106,'faizan', 'khan', 29, 'female')



select * from EmployeeInfo

insert into EmployeeSalary values
(101, 'Salesman', 30000),
(102, 'Manager', 50000),
(103, 'Accountant', 40000),
(104, 'General Manager', 60000),
(105, 'Salesman', 32000),
(106, 'Salesman', 35000)



select * from EmployeeDemographics

-- Update

update EmployeeInfo
set LastName = 'jalil' where EmployeeID = 101


update EmployeeInfo
set FirstName = 'M', LastName = 'ibrahim'
where EmployeeID = 106


-- Delete

delete from EmployeeInfo
where EmployeeID = 105

select Gender, count(Gender) from EmployeeInfo
group by Gender

select * from EmployeeSalary

