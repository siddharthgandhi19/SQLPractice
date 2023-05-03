----Subquery can be simply defined as a query within another query.-----


Create Table Students (
		NAME VARCHAR(50),
		ROLL_NO INT,
		LOCATION VARCHAR(50),
		PHONE_NUMBER VARCHAR(50)
)

INSERT INTO Students VALUES ('Siddharth',101,'Bhopal','7415289630')
INSERT INTO Students VALUES ('Ravi',105,'Indore','7896541230')
INSERT INTO Students VALUES ('Ayush',507,'Chennai','7896541230')
INSERT INTO Students VALUES ('Abhinay',807,'Bangalore','8080707050')
INSERT INTO Students VALUES ('Deepesh',901,'Ujjain','7895412630')

select * from Students


Create Table StudentsData(
	NAME VARCHAR(50),
		ROLL_NO INT,
		SECTION VARCHAR(10)
)

INSERT INTO StudentsData VALUES ('Siddharth',101,'A')
INSERT INTO StudentsData VALUES ('Ravi',105,'B')
INSERT INTO StudentsData VALUES ('Ayush',507,'B')
INSERT INTO StudentsData VALUES ('Abhinay',807,'A')
INSERT INTO StudentsData VALUES ('Deepesh',901,'A')

SELECT * FROM StudentsData


Select NAME, LOCATION, PHONE_NUMBER from Students 
WHERE ROLL_NO IN
(SELECT ROLL_NO from StudentsData where SECTION='A'); --Sub Query