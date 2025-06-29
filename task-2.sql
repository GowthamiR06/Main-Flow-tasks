USE StudentManagement;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_description TEXT
);

CREATE TABLE Enrolments (
    enrolment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrolment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
-- Students
INSERT INTO Students (student_id, name, email) VALUES
(1, 'Aanya Singh', 'aanya@example.com'),
(2, 'Ravi Kumar', 'ravi@example.com'),
(3, 'Meena Iyer', 'meena@example.com'),
(4, 'Farhan Rahman', 'farhan@example.com');

-- Courses
INSERT INTO Courses (course_id, course_name, course_description) VALUES
(101, 'Data Analysis', 'Learn SQL, Excel, and statistics'),
(102, 'Python Programming', 'Basics to advanced Python coding'),
(103, 'Machine Learning', 'Supervised and unsupervised learning'),
(104, 'Soft Skills', 'Communication and teamwork strategies');

-- Enrolments
INSERT INTO Enrolments (enrolment_id, student_id, course_id, enrolment_date) VALUES
(1, 1, 101, '2025-06-01'),
(2, 1, 102, '2025-06-03'),
(3, 2, 102, '2025-06-02'),
(4, 3, 103, '2025-06-04');
SELECT s.name AS student_name, c.course_name
FROM Students s
INNER JOIN Enrolments e ON s.student_id = e.student_id
INNER JOIN Courses c ON e.course_id = c.course_id;
SELECT c.course_name, COUNT(e.student_id) AS enrolled_students
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;
SELECT s.name AS student_name, COUNT(e.course_id) AS course_count
FROM Enrolments e
JOIN Students s ON e.student_id = s.student_id
GROUP BY s.student_id, s.name
HAVING COUNT(e.course_id) > 1;
SELECT c.course_name
FROM Courses c
LEFT JOIN Enrolments e ON c.course_id = e.course_id
WHERE e.enrolment_id IS NULL;