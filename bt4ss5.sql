CREATE DATABASE BlackFridaySale;

USE BlackFridaySale;

CREATE TABLE Courses (
    id INT PRIMARY KEY,
    course_name NVARCHAR(255),
    price DECIMAL(10,2)
);

CREATE TABLE Enrollments (
    id INT PRIMARY KEY,
    student_name NVARCHAR(255),
    course_id INT NULL
);

INSERT INTO Courses (id, course_name, price)
VALUES
(1, 'SQL Beginner', 100),
(2, 'Python Basic', 120),
(3, 'Java Master', 150),
(4, 'Docker For DevOps', 200),
(5, 'ReactJS Complete', 180);

INSERT INTO Enrollments (id, student_name, course_id)
VALUES
(1, 'An', 1),
(2, 'Binh', 2),
(3, 'Cuong', NULL),
(4, 'Dung', NULL);

SELECT *
FROM Courses
WHERE id NOT IN (
    SELECT course_id
    FROM Enrollments
);

SELECT *
FROM Courses c
WHERE NOT EXISTS (
    SELECT 1
    FROM Enrollments e
    WHERE e.course_id = c.id
);

SELECT *
FROM Courses
WHERE id NOT IN (
    SELECT course_id
    FROM Enrollments
    WHERE course_id IS NOT NULL
);