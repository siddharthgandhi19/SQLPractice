CREATE PROCEDURE spForgotPassword(
	
	@PatientEmail VARCHAR(100)
	
)

AS
BEGIN TRY
SELECT * FROM PatientDetails WHERE PatientEmail = @PatientEmail 
END TRY

BEGIN CATCH
SELECT ERROR_MESSAGE() AS ERROR
END CATCH