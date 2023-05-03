CREATE TABLE PatientDetails(

	PatientId INT IDENTITY(1,1) PRIMARY KEY,
	PatientName VARCHAR(100),
	PatientEmail VARCHAR(100),
	PatientPassword VARCHAR (100),
	PatientMobileNumber INT,
	PatientGender VARCHAR(100),
	DateOfBirth DATE,
	PatientAddress VARCHAR(Max),
	PatientCity VARCHAR(100),
	PatientState VARCHAR(100),
	)

