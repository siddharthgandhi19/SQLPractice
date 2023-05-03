ALTER PROCEDURE spOpenBankAccount
(
    @FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@Email VARCHAR(100),
	@PhoneNumber VARCHAR(20),
    @Address VARCHAR(100),
	@AccountNumber VARCHAR(10) OUTPUT,
	@AccountType VARCHAR(50),
    @InitialDeposit DECIMAL(18,2)
)

AS
BEGIN
    DECLARE @RandomNumber INT
    SET @RandomNumber = FLOOR(RAND()*(99999-10000+1)+10000) -- Generate a random 5 digit number for the account number
    
    SET @AccountNumber = CONVERT(VARCHAR(10), @RandomNumber) 
    
    INSERT INTO Accounts(FirstName,LastName,Email,PhoneNumber, Address, AccountNumber,AccountType, Balance)
    VALUES(@FirstName,@LastName, @Email,@PhoneNumber, @Address, @AccountNumber, @AccountType, @InitialDeposit)
    
    SELECT 'Bank Account created successfully. Account Number: ' + @AccountNumber AS 'Result'
END


DECLARE @AccountNumber VARCHAR(10)

EXEC spOpenBankAccount
 
    @FirstName = 'Siddharth', 
	@LastName = 'Gandhi',  
    @Email = 'siddharth.gandhi@gmail.com', 
    @PhoneNumber = '7415355579', 
	@Address = '123 Main St, Sehore, MP',     
    @AccountNumber = @AccountNumber OUTPUT,
	@AccountType = 'Saving',
	@InitialDeposit = 1000.00

