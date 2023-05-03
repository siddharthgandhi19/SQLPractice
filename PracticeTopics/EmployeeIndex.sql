create table EmployeeIndex(
EmployeeId INT PRIMARY KEY,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Department VARCHAR(50)
)

insert into EmployeeIndex values (1,'Siddharth','Gandhi','Developer')
insert into EmployeeIndex values (2,'Lalit','Raghuwanshi','Coder')
insert into EmployeeIndex values (3,'Saurabh','Rajankar','FrontEnd')
insert into EmployeeIndex values (4,'Ram','Sharma','Admin')
insert into EmployeeIndex values (5,'Shyam','Rathore','Developer')

select * from EmployeeIndex


CREATE NONCLUSTERED INDEX idx_LastName ON EmployeeIndex(LastName ASC)

select * from EmployeeIndex Where LastName = 'Gandhi'

EXEC sp_helpindex EmployeeIndex

