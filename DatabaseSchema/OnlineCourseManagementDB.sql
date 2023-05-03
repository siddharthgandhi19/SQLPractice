create database OnlineCourseManagementDB

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
);

CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
	student_id INT,
	FOREIGN KEY (student_id) REFERENCES Students(student_id),
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(100),
    description VARCHAR(255),
    instructor_id INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (instructor_id) REFERENCES instructors(instructor_id),
	student_id INT,
	FOREIGN KEY (student_id) REFERENCES Students(student_id),
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE BatchTiming(
	MorningBatch Time,
	EveningBatch Time,
	student_id INT,
	FOREIGN KEY (student_id) REFERENCES Students(student_id),
)

CREATE TABLE DoubtSession(
	DoubtSessionTiming Time,
	student_id INT,
	FOREIGN KEY (student_id) REFERENCES Students(student_id)
)

