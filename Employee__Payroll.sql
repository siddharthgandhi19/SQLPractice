CREATE DATABASE Payroll_Service; --UC1
USE Payroll_Service;

--UC2--
CREATE TABLE Employee_Payroll(id int primary key identity(1,1),name varchar (150), salary bigint NOT NULL, start Date NOT NULL);

--UC3--
INSERT INTO Employee_Payroll(name,salary,start) VALUES
('Sid', 100000.00, '2018-01-03'),
('Lalit', 200000.00, '2019-11-13'),
('Shubhi', 300000.00, '2021-02-03');

--UC4--
SELECT * FROM Employee_Payroll;
SELECT salary FROM Employee_Payroll WHERE name = 'Sid';

--UC5--
SELECT * FROM Employee_Payroll WHERE start BETWEEN CAST('2018-01-03' AS DATE) AND GETDATE();

--UC6--
ALTER TABLE Employee_Payroll ADD gender CHAR(1);
UPDATE Employee_Payroll set gender = 'M' WHERE name = 'Sid';
UPDATE Employee_Payroll set gender = 'M' WHERE name = 'Lalit';
UPDATE Employee_Payroll set gender = 'F' WHERE name = 'Shubhi';
SELECT * FROM Employee_Payroll;

--UC7--
SELECT AVG(salary) FROM Employee_Payroll WHERE gender = 'M' GROUP BY gender;
SELECT SUM(Salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
SELECT MIN(Salary) FROM employee_payroll WHERE Gender = 'M' GROUP BY gender;
SELECT MAX(Salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;
SELECT COUNT(Salary) FROM employee_payroll WHERE gender = 'M' GROUP BY gender;

SELECT * FROM Employee_Payroll;

--UC8-- Extent table add Employee phone number, address,and depertment and add data
ALTER TABLE Employee_Payroll ADD address VARCHAR(50);
ALTER TABLE Employee_Payroll ADD phoneNumber VARCHAR(10);
ALTER TABLE Employee_Payroll ADD department VARCHAR(10);

INSERT INTO Employee_Payroll(name,salary,start,gender,address,phoneNumber,department)VALUES
('Sid', 100000.00, '2018-01-03','M','Bhopal','7418529630','CODER'),
('Lalit', 200000.00, '2019-11-13','M','Vidisha','9638527410','TESTER'),
('Shubhi', 300000.00, '2021-02-03','F','Indore','8529637410','HR');
SELECT * FROM Employee_Payroll;

--UC9--
-Uc9 Extend table to have basic pay, Deduction,Taxable pay,Income tax,Net pay
--ALTER TABLE employee_payroll CHANGE COLUMN Salary TO Basic_Pay;(USE IN MYSQL)
SP_RENAME 'employee_payroll.Salary' ,'Basic_Pay','COLUMN';
ALTER TABLE Employee_Payroll ADD basicPay BIGINT;
ALTER TABLE Employee_Payroll ADD deductions BIGINT;
ALTER TABLE Employee_Payroll ADD taxablePay BIGINT;
ALTER TABLE Employee_Payroll ADD incomeTax BIGINT ;
ALTER TABLE Employee_Payroll ADD netPay BIGINT ;
UPDATE Employee_Payroll SET  basicPay = 0 WHERE Name = 'Sid' or Name = 'Lalit' or Name ='Shubhi';
UPDATE Employee_Payroll SET  deductions = 0 WHERE Name = 'Sid' or Name = 'Lalit' or Name ='Shubhi';
UPDATE Employee_Payroll SET  taxablePay = 0 WHERE Name = 'Sid' or Name = 'Lalit' or Name ='Shubhi';
UPDATE Employee_Payroll SET  incomeTax = 0 WHERE Name = 'Sid' or Name = 'Lalit' or Name ='Shubhi';
UPDATE Employee_Payroll SET   netPay = 0 WHERE Name = 'Sid' or Name = 'Lalit' or Name ='Shubhi';
SELECT * FROM Employee_Payroll;

--UC10-- 
INSERT INTO Employee_Payroll(name,salary,start,gender,address,phoneNumber,department,deductions,taxablePay,incomeTax, netPay,basicPay)VALUES('Terisa',2200000,'2021-01-21','F','USA','0214698742','Sale',10000,10000,0,200000.452222,60000);
INSERT INTO Employee_Payroll(name,salary,start,gender,address,phoneNumber,department,deductions,taxablePay,incomeTax, netPay,basicPay)VALUES('Terisa',2200000,'2021-01-21','F','USA','0214698742','Marketing',10000,10000,0,200000.452222,60000);
SELECT * FROM Employee_Payroll;


--UC11-- ER Diagram along with attributes
CREATE TABLE department(
employeeId INT PRIMARY KEY IDENTITY (1,1),
departmentId INT NOT NULL
);
ALTER TABLE Employee_Payroll DROP COLUMN department ;
ALTER TABLE Employee_Payroll ADD department INT CONSTRAINT fk1 FOREIGN KEY(department) REFERENCES department(employeeId);

