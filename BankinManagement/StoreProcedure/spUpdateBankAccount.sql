CREATE PROCEDURE spUpdateBankAccount
(
    @AccountNumber VARCHAR(10),
    @NewAddress VARCHAR(100),
    @NewEmail VARCHAR(50),
    @NewPhoneNumber VARCHAR(20)
)
AS
BEGIN
    UPDATE Accounts
    SET Address = @NewAddress, Email = @NewEmail, PhoneNumber = @NewPhoneNumber
    WHERE AccountNumber = @AccountNumber
    
    IF @@ROWCOUNT = 0   
    SELECT 'No account found with account number ' + @AccountNumber AS 'Result'
    
    ELSE
	 SELECT 'Account details updated successfully for account number ' + @AccountNumber AS 'Result'
  
END
