create database PracticeSQL
use PracticeSQL

create table Employees (
	EmployeeId INT IDENTITY (500,1) PRIMARY KEY,
	Name VARCHAR(50),
	Gender VARCHAR(10),
	Department VARCHAR(50),
	Salary INT
	)
	
	drop table Employees
	
	select * from Employees where Salary > 30000 and Salary < 60000

	INSERT INTO Employees VALUES
	('Siddharth','Male','IT',30000),
	('Lalit','Male','HR',20000),
	('Anamika','Female','DataScientist',45000),
	('Shikha','Female','Sales',29500),
	('Rajesh','Male','Admin',33000)

	

	sp_Helpindex Employees

	Create clustered index Idx_Employees_Salary ON Employees (Salary ASC)
	create clustered index idx_Employee_Gender_Salary ON Employees (Gender DESC, Salary ASC)

	DROP Index Employees.idx_Employee_Gender_Salary
	select * from Employees


	--Clustered Index : Clustered indexes sort and store the data rows in the table or view based on their key values.