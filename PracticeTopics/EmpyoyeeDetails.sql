CREATE DATABASE PracticeSQL


 CREATE TABLE EmpyoyeeDetails(
 EmployeId INT IDENTITY(1,1) PRIMARY KEY,
 EmployeName VARCHAR(100),
 Department VARCHAR(100),
 Salary INT,
 StartDate Date
 )


 INSERT INTO EmpyoyeeDetails VALUES ('Siddharth','Developer',50000,'2020-11-11')
  INSERT INTO EmpyoyeeDetails VALUES ('Ram','HR',25000,'2021-01-22')
   INSERT INTO EmpyoyeeDetails VALUES ('Lalit','Developer',40000,'2019-10-01')
    INSERT INTO EmpyoyeeDetails VALUES ('Priyanka','Developer',45000,'2018-10-11')




Select * from EmpyoyeeDetails



Drop Table EmpyoyeeDetails