ALTER PROCEDURE spTransferFunds
   @fromAccountNumber int,
   @toAccountNumber int,
   @transferAmount decimal(10,2)
AS
BEGIN
   DECLARE @transactionDate datetime;
   SET @transactionDate = GETDATE();
   

   
   -- Deduct the transfer amount from the 'from' account
   UPDATE Accounts
   SET Balance = Balance - @transferAmount
   WHERE AccountNumber = @fromAccountNumber;
   
   -- Add the transfer amount to the 'to' account
   UPDATE Accounts
   SET Balance = Balance + @transferAmount
   WHERE AccountNumber = @toAccountNumber;
   
   -- Insert a new transaction record
   INSERT INTO Transactions (FromAccountNumber, ToAccountNumber, TransferAmount, TransactionDate)
   VALUES (@fromAccountNumber, @toAccountNumber, @transferAmount, @transactionDate);
   
 
 
END


EXEC spTransferFunds @fromAccountNumber = 77482, @toAccountNumber = 91430, @transferAmount = 150.00;