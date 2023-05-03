create table employee(
	id INT,
	name VARCHAR(50),
	age INT,
	salary DECIMAL(10,2)
)

insert into employee values(1,'siddharth',25,52000.00)
insert into employee values(1,'lalit',26,42000.00)
insert into employee values(1,'saurabh',27,38000.00)
insert into employee values(1,'ram',26,62000.00)
insert into employee values(1,'ishaan',27,48000.00)

create table employee_audit (
	id INT,
	name VARCHAR(50),
	age INT,
	salary DECIMAL(10,2),
	operation_type VARCHAR(50),
	operation_date Date
)

Declare @id INT,@name VARCHAR(50),	@age INT,	@salary DECIMAL(10,2);
Declare @operation_type VARCHAR(50), @operation_date Date

Declare employeeCursor Cursor for 
select id, name,age,salary
from employee;
	

open employeeCursor;

fetch next from employeeCursor into @id,@name,@age,@salary

while @@FETCH_STATUS=0

begin
if exists (select * from employee where id =@id)
begin
set @operation_type = 'inserted'
print 'inserted'
end
else if exists (select * from employee where id =@id) and exists (select * from employee where id = @id)
begin
set @operation_type = 'updated'
print 'updated'
end
else if exists (select * from employee where id = @id)
begin
set @operation_type = 'deleted'
print 'deleted'
end

insert into employee_audit(id, name, age, salary, operation_type, operation_date)
values (@id, @name, @age, @salary, @operation_type, @operation_date)

fetch next from employeeCursor into @id,@name,@age,@salary

end

close employeeCursor
deallocate employeeCursor

select * from employee
select * from employee_audit