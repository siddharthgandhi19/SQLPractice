CREATE PROCEDURE spDeleteBankAccount
(
    @AccountNumber VARCHAR(10)
)
AS
BEGIN
    IF EXISTS (SELECT * FROM Accounts WHERE AccountNumber = @AccountNumber)
    BEGIN
        DELETE FROM Accounts WHERE AccountNumber = @AccountNumber
        SELECT 'Bank Account deleted successfully' AS 'Result'
    END
    ELSE
    BEGIN
        SELECT 'Bank Account not found' AS 'Result'
    END
END
