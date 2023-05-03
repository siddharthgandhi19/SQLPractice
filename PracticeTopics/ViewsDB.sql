CREATE DATABASE ViewsDB

create table MyDepartment 
(
Id int, 
Dept_Name varchar(50) not null
);

select * from MyDepartment;
select * from MyEmployees;

insert into MyDepartment values(1,'Accounts');
insert into MyDepartment values(2,'H-R');
insert into MyDepartment values(3,'Administration');
insert into MyDepartment values(4,'Counselling');

create table MyEmployees 
(
Emp_Id int, 
Emp_Name varchar(50) not null, 
Gender varchar(50) not null, 
Salary int not null, 
City varchar(50), 
Dept_Id int
);

select * from MyEmployees;

insert into MyEmployees values(100,'Usman','male',25000,'Hyderabad',2);
insert into MyEmployees values(101,'Anas','male',45000,'Karachi',1);
insert into MyEmployees values(102,'Anum','Female',35000,'Sukkur',3);
insert into MyEmployees values(103,'Ali','male',45000,'Hyderabad',4);
insert into MyEmployees values(104,'Aghar','male',35000,'Karachi',2);
insert into MyEmployees values(105,'Osama','male',25000,'Sukkur',1);
insert into MyEmployees values(106,'Asmara','Female',15000,'Hyderabad',3);

select * from MyDepartment;
select * from MyEmployees;

-- Creating View With Inner Join
create view vWEmployees
as
select A.Emp_id,A.Emp_Name,A.Gender,A.City, B.Dept_Name
from MyEmployees as A
inner join MyDepartment as B
on A.Dept_Id = B.Id
where Dept_Name = 'Accounts';

select * from vWEmployees;

select * from vWEmp_Details;

-- Dropping View
drop view vWEmp_Details;

create view vWEmployees1
as
select * from MyEmployees;

Select * from vWEmployees1;

-- Insert With Views
insert into vWEmployees values(107,'Armaghan','Male',23000,'Sukkur',4);

-- Update With Views
update vWEmployees set Emp_Name = 'Anmol' where Emp_Id = 107;

-- Delete With Views
delete from vWEmployees where Emp_id = 107;

select * from vWEmployees;

-- Altering The Views
alter view vWEmployees
as
select Emp_Name,Gender,Salary from MyEmployees;