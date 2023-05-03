CREATE PROCEDURE spCloseAccount
   @AccountNumber int,
   @transferAccountNumber int
AS
BEGIN
   DECLARE @Balance decimal(10,2);
   
   -- Get the balance for the account to be closed
   SELECT @Balance = Balance
   FROM Accounts
   WHERE AccountNumber = @AccountNumber;
   
   -- Update the transfer account with the transferred funds
   UPDATE Accounts
   SET Balance = Balance + @balance
   WHERE AccountNumber = @transferAccountNumber;
   
   -- Log the transaction
   INSERT INTO Transactions (FromAccountNumber, ToAccountNumber, TransferAmount, TransactionDate)
   VALUES (@accountNumber, @transferAccountNumber, @Balance, GETDATE());
   
   -- Close the account by setting its status to closed
   UPDATE Accounts
  
   WHERE AccountNumber = @AccountNumber;

END
