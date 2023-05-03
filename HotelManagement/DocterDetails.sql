CREATE TABLE DocterDetails(
	
	DoctorId INT IDENTITY(1,1) PRIMARY KEY,
	DoctorName Varchar(100),
	DoctorsNumber INT,
	Gender VARCHAR(100),
	Specialization VARCHAR(100),
	PatientId INT FOREIGN KEY REFERENCES PatientDetails(PatientId),
)

