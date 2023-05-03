CREATE PROCEDURE spPatientLogin(
	
	@PatientEmail varchar (100),
	@PatientPassword varchar(100)
	)

	AS

BEGIN TRY
		
SELECT * FROM PatientDetails WHERE PatientEmail=@PatientEmail  and PatientPassword=@PatientPassword
END TRY

BEGIN CATCH 
SELECT ERROR_MESSAGE() AS ERROR
END CATCH

