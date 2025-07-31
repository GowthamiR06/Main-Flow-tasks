USE studentdb;
CREATE TABLE students ( student_id INT PRIMARY KEY, name VARCHAR(100) ); 
INSERT INTO students VALUES (1, 'Ayesha'), (2, 'Raj'), (3, 'Meena'), (4, 'Arjun'); 
INSERT INTO scores VALUES (1, 'Math', 85), (1, 'Science', 72), (2, 'Math', 39),
 (2, 'Science', 51), (3, 'Math', 64), (3, 'Science', 88), (4, 'Math', 40), (4, 'Science', 40); 
SELECT * FROM students;
SELECT * FROM scores;
CREATE VIEW student_scores AS SELECT s.student_id, s.name, sc.subject, sc.score FROM students s 
JOIN scores sc ON s.student_id = sc.student_id; 
CREATE VIEW passed_students AS SELECT student_id, name FROM students
 WHERE student_id NOT IN ( SELECT student_id FROM scores WHERE score < 40 ); 
CREATE VIEW subject_average_scores AS SELECT subject, AVG(score) AS average_score FROM scores GROUP BY subject; 
CREATE VIEW subject_top_scorers AS SELECT sc.student_id, s.name, sc.subject, sc.score FROM scores sc JOIN students s ON sc.student_id = s.student_id WHERE sc.score = ( SELECT MAX(score) FROM scores WHERE subject = sc.subject ); 
SELECT * FROM subject_top_scorers; 

