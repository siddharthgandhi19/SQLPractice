CREATE PROCEDURE spCalculateInterest
   @Balance decimal(10,2),
   @interestRate decimal(5,2),
   @numberOfDays int
AS
BEGIN
   DECLARE @interest decimal(10,2);
   SET @interest = (@Balance * @interestRate * @numberOfDays) / 365;
   SELECT @interest AS Interest;
END


EXEC spCalculateInterest @Balance = 1000.00, @interestRate = 0.05, @numberOfDays = 30;