Create Table StudentRecords(
	Name VARCHAR(50),
	RollNo INT,
	Class VARCHAR(50),
	MATHS INT,
	SCIENCE INT,
	English INT
	)

	INSERT INTO StudentRecords VALUES('Siddharth',1150,'12th',90,92,98)
		INSERT INTO StudentRecords VALUES('Rahul',1040,'12th',80,52,58)
			INSERT INTO StudentRecords VALUES('Adi',9150,'12th',75,66,75)
				INSERT INTO StudentRecords VALUES('Vikram',2680,'12th',60,72,78)
					INSERT INTO StudentRecords VALUES('Pankaj',5050,'12th',80,53,88)

					--Select * From StudentRecords


					Declare @RollNo INT,
					@Name VARCHAR(50),
					@MATHS INT,
					@SCIENCE INT,
					@English INT

					
					Declare @MarksTotal INT,
					@Percentage INT

					----first Step---
--Declare CUrsor--

Declare StudentCursor Cursor For Select Name, RollNo,MATHS,SCIENCE, English From StudentRecords

-- opencursor-- entry ponit

Open StudentCursor

--Fetch-- value null no row pointed

Fetch NEXT From StudentCursor INTO  @Name, @RollNo,@MATHS,@SCIENCE,@English

					---LOOP--


					WHILE @@FETCH_STATUS = 0 --show status active data set record found

					Begin

					Print Concat ('Name: ', @Name)
					Print Concat ('Roll No: ', @RollNo)
					Print Concat ('Maths Marks: ', @MATHS)
					Print Concat ('Science Marks: ', @SCIENCE)
					Print Concat ('English Marks: ', @English)
	
	SET @MarksTotal = @MATHS+@SCIENCE+@English;
	Print Concat ('Total Marks: ', @MarksTotal);
	SET @Percentage = @MarksTotal/3
	Print Concat ('Total Marks: ', @Percentage, '%');

	IF @Percentage>80
	Begin
	Print 'Grade A';
	End

	ELSE IF @Percentage>60 AND @Percentage<80
	Begin
	Print 'Grade B';
	End

	Else
	Begin Print 'Grade C';
	End

	Print'-----------------------------'

	Fetch NEXT From StudentCursor INTO  @Name, @RollNo,@MATHS,@SCIENCE,@English
	End

	Close StudentCursor;
	Deallocate StudentCursor;

