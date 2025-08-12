CREATE DATABASE student_management; 
USE student_management; 
CREATE TABLE students ( id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), score INT, grade VARCHAR(10) ); 
DESC students;
CREATE TABLE student_update_log ( log_id INT AUTO_INCREMENT PRIMARY KEY, student_id INT, old_name VARCHAR(100),
 new_name VARCHAR(100), old_grade VARCHAR(10), new_grade VARCHAR(10), updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP );
 DESC student_update_log;
INSERT INTO students (name, score, grade) VALUES
('Alice', 92, 'B'),
('Bob', 76, 'C'),
('Charlie', 65, 'D'),
('Diana', 88, 'B'),
('Ethan', 54, 'D');
SELECT * FROM students;
SELECT * FROM student_update_log;
-- Trigger
DELIMITER //
CREATE TRIGGER log_student_update
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
    INSERT INTO student_update_log (
        student_id,
        old_name, new_name,
        old_grade, new_grade
    )
    VALUES (
        OLD.id,
        OLD.name, NEW.name,
        OLD.grade, NEW.grade
    );
END;
//
DELIMITER ;
SET SQL_SAFE_UPDATES = 0;
UPDATE students
SET name = 'Alice Johnson', grade = 'A'
WHERE name = 'Alice';
SELECT * FROM students;
SELECT * FROM student_update_log;
DELIMITER //

CREATE PROCEDURE update_student_grades(
    IN min_score INT,
    IN max_score INT,
    IN new_grade VARCHAR(10)
)
BEGIN
    UPDATE students
    SET grade = new_grade
    WHERE score BETWEEN min_score AND max_score;
END;
//

DELIMITER ;
CALL update_student_grades(85, 100, 'A');
CALL update_student_grades(70, 84, 'B');
CALL update_student_grades(50, 69, 'C');
SELECT * FROM students;
SELECT * FROM student_update_log;
