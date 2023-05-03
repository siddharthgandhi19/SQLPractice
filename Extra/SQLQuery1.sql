create database ReviewDB


create table Employees(	
	EmployeesId INT PRIMARY KEY,
	Name VARCHAR(50),
	DepartmentId INT
)
	
INSERT INTO Employees VALUES (1,'Siddharth',11)	

Select * from Employees

create table Department(
	DepartmentId INT PRIMARY KEY,
	DepartmentName VARCHAR(50)
)

INSERT INTO Department VALUES(11,'Developer')	
select * from Department

create table Salary(
	EmployeesId INT,
	SalaryAmount INT
	)

	drop table Salary
	

	INSERT INTO Salary VALUES (1,45000)

	select * from Salary


	Select Employees.Name,Department.DepartmentName,Salary.SalaryAmount
	from Employees

	INNER JOIN Department ON Employees.DepartmentId = Department.DepartmentId
	INNER JOIN Salary ON Employees.EmployeesId = Salary.EmployeesId



