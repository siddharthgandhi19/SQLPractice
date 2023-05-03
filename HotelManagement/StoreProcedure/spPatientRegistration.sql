CREATE PROCEDURE spPatientRegistration(
	
	@PatientName VARCHAR(100),
	@PatientEmail VARCHAR(100),
	@PatientMobileNumber INT,
	@PatientGender VARCHAR(100),
	@DateOfBirth DATE,
	@PatientAddress VARCHAR(Max),
	@PatientCity VARCHAR(100),
	@PatientState VARCHAR(100)
	)

	AS
	BEGIN TRY 
	INSERT INTO PatientDetails (PatientName,PatientEmail,PatientMobileNumber,PatientGender,DateOfBirth,
	PatientAddress,PatientCity,PatientState)
	
	values
	(
	@PatientName,@PatientEmail,@PatientMobileNumber,@PatientGender,@DateOfBirth,
	@PatientAddress,@PatientCity,@PatientState
	)

	END TRY
	BEGIN CATCH 
	SELECT ERROR_MESSAGE() AS ERROR
	END CATCH