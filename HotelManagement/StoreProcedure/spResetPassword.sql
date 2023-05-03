CREATE PROCEDURE spResetPassword(

	@PatientEmail VARCHAR(100),
	@PatientPassword VARCHAR (100)
)

AS
BEGIN TRY
UPDATE PatientDetails SET  PatientPassword = @PatientPassword WHERE PatientEmail = @PatientEmail 

END TRY
	BEGIN CATCH 
	SELECT ERROR_MESSAGE() AS ERROR
	END CATCH