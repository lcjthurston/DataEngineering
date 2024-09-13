-- 1. Create Tables
DROP TABLE Enrollments;

CREATE TABLE Enrollments
(
	EnrollmentID number primary key,
	StudentID number,
	CourseID number,
	EnrollmentDate date not NULL,
	UNIQUE(StudentID, CourseID),
	--	Add constraint LT_FK_Students_Enrollment
	FOREIGN KEY (StudentID) 
		REFERENCES Students (StudentID)
		ON DELETE CASCADE,
	--	Add constraint LT_FK_Courses_Enrollment
	FOREIGN KEY (CourseID) 
		REFERENCES Courses (CourseID)
		ON DELETE SET NULL
);

DROP TABLE Students;

CREATE TABLE Students
(
	StudentID number primary key,
	FirstName varchar2(50) NOT NULL,
	LastName varchar2(50) NOT NULL,
	DateOfBirth DATE,
	Email varchar2(100) unique
);

DROP TABLE Courses;

CREATE TABLE Courses 
(
	CourseID number Primary Key,
	CourseName varchar2(100) Not Null,
	Credits number default 3
);

-- 2. Import Data 

-- 2.1 Disable Foreign Key Constraints

PRAGMA foreign_keys = 0;

-- 2.2 Enrollments Data

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES (1, 1, 101, '2023-01-15');

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES (2, 1, 102, '2023-01-20');

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES (3, 2, 101, '2023-01-17');

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES (4, 3, 103, '2023-01-18');

-- Note: Oracle syntax uses TO_DATE('2023-01-20', 'YYYY-MM-DD') for the fourth parameter of these insert statements

-- 2.3 Students Data

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Email) VALUES (1, 'John', 'Doe', '1998-05-15', 'john.doe@example.com');

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Email) VALUES (2, 'Jane', 'Smith', '1997-08-22', 'jane.smith@example.com');

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Email) VALUES (3, 'Alice', 'Johnson', '1999-12-10', 'alice.johnson@example.com');

-- 2.4 Courses Data

INSERT INTO Courses (CourseID, CourseName, Credits) VALUES (101, 'Database Systems', 3);

INSERT INTO Courses (CourseID, CourseName, Credits) VALUES (102, 'Operating Systems', 4);

INSERT INTO Courses (CourseID, CourseName, Credits) VALUES (103, 'Data Structures', 3);

-- 2.5 Enable Foreign Key Constraints

PRAGMA foreign_keys = 1;

-- 3. Validation

-- 3.1 Attempt to Insert a Duplicate Email in `Students`
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Email)
VALUES (4, 'Bob', 'Williams', '2000-02-25', 'john.doe@example.com');

-- 3.2: Attempt to Enroll a Student in the Same Course Twice
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate)
VALUES (5, 1, 101, '2023-02-01');

-- 3.3: Delete a Student
DELETE FROM Students WHERE StudentID = 1;

-- 3.4: Delete a Course
DELETE FROM Courses WHERE CourseID = 103;






































