--  Create the database
CREATE DATABASE StudentManagemet;
--  Use the database
USE StudentManagement;
--  Create the Students table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Gender VARCHAR(1) CHECK (Gender IN ('M', 'F')),
    Age INT,
    Grade VARCHAR(10),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT
);
-- Inserting details of the students into the table
INSERT INTO Students (Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore)
VALUES
('Aarav Mehta', 'M', 16, 'A', 92, 88, 85),
('Isha Verma', 'F', 15, 'B', 78, 82, 80),
('Rohan Das', 'M', 17, 'C', 65, 70, 68),
('Sneha Kapoor', 'F', 16, 'A', 90, 91, 89),
('Kabir Singh', 'M', 15, 'B', 75, 77, 72),
('Ananya Rao', 'F', 17, 'A', 95, 94, 96),
('Yash Patel', 'M', 16, 'C', 60, 58, 62),
('Meera Nair', 'F', 15, 'B', 82, 85, 84),
('Dev Sharma', 'M', 17, 'A', 88, 90, 87),
('Tanya Joshi', 'F', 16, 'C', 70, 68, 73);
-- Display all details of all the students
SELECT * FROM Students;
-- Display average score of each subject
SELECT AVG(MathScore) AS Avg_Math FROM Students;
SELECT AVG(ScienceScore) AS Avg_Science FROM Students;
SELECT AVG(EnglishScore) AS Avg_English FROM Students;
-- Display the top scores of the students
SELECT Name,
  (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

