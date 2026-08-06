CREATE DATABASE student;
 use student;
 
 drop table students;
 
 CREATE TABLE Students(
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    city VARCHAR(30)
);  
CREATE TABLE Teachers(
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50),
    department VARCHAR(30)
); 
CREATE TABLE Courses(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    teacher_id INT,
    FOREIGN KEY (teacher_id)
    REFERENCES Teachers(teacher_id)
);
CREATE TABLE Enrollments(
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,

    FOREIGN KEY(student_id)
    REFERENCES Students(student_id),

    FOREIGN KEY(course_id)
    REFERENCES Courses(course_id)
);
DELETE FROM Enrollments;
DELETE FROM Courses;
DELETE FROM Teachers;
DELETE FROM Students;

INSERT INTO Students (student_id, student_name, age, city)
VALUES
(1, 'Udit', 20, 'Delhi'),
(2, 'Rahul', 19, 'Mumbai'),
(3, 'Aman', 21, 'Jaipur'),
(4, 'Priya', 20, 'Chandigarh'),
(5, 'Sneha', 22, 'Pune'),
(6, 'Arjun', 19, 'Lucknow'),
(7, 'Neha', 21, 'Delhi'),
(8, 'Karan', 23, 'Amritsar'),
(9, 'Riya', 20, 'Noida'),
(10, 'Mohit', 22, 'Gurgaon'),
(11, 'Ananya', 19, 'Kolkata'),
(12, 'Vikas', 24, 'Bhopal'),
(13, 'Simran', 20, 'Ludhiana'),
(14, 'Rohit', 21, 'Patiala'),
(15, 'Ishita', 22, 'Hyderabad');

SELECT *
FROM Students;
SELECT *
FROM Students
WHERE age > 20;

SELECT *
FROM Students
WHERE city='Delhi';

SELECT *
FROM Students
ORDER BY age DESC;

SELECT COUNT(*)
FROM Students;

SELECT DISTINCT city
FROM Students;

SELECT
Students.student_name,
Courses.course_name
FROM Students
JOIN Enrollments
ON Students.student_id=Enrollments.student_id

JOIN Courses
ON Courses.course_id=Enrollments.course_id;

SELECT
course_name,
teacher_name
FROM Courses
JOIN Teachers
ON Courses.teacher_id=Teachers.teacher_id;

SELECT
course_name,
teacher_name
FROM Courses
JOIN Teachers
ON Courses.teacher_id=Teachers.teacher_id;

SELECT
course_id,
COUNT(student_id) AS TotalStudents
FROM Enrollments
GROUP BY course_id;

SELECT AVG(age)
FROM Students;

SELECT MAX(age)
FROM Students;

SELECT MIN(age)
FROM Students;

SELECT
Teachers.teacher_name,
COUNT(Courses.course_id) AS TotalCourses
FROM Teachers
JOIN Courses
ON Teachers.teacher_id=Courses.teacher_id
GROUP BY Teachers.teacher_name
ORDER BY TotalCourses DESC;


SET SQL_SAFE_UPDATES = 0;