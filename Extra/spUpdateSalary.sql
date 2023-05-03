ALTER Procedure spUpdateSalary(
 @Salary int,
 @Department varchar(100),
 @StartDate date,
 @EndDate Date

)
as
begin
UPDATE EmpyoyeeDetails SET Salary=Salary+@Salary
WHERE Department=@Department AND (StartDate BETWEEN @StartDate AND @EndDate)
end

EXEC spUpdateSalary 2500, 'Developer' , '2018-10-11', '2021-01-22'