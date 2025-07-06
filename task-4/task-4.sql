USE StudentPerformance;
-- student table creation
CREATE TABLE Students ( StudentID INT PRIMARY KEY, Name VARCHAR(50), MathScore INT, TotalScore INT ); 
-- sample data insertion
INSERT INTO Students (StudentID, Name, MathScore, TotalScore) VALUES (1, 'Arjun', 78, 230), (2, 'Bhavna', 88, 255), (3, 'Chitra', 95, 255), (4, 'Dev', 65, 200), (5, 'Esha', 85, 240); 
SELECT * FROM Students;
SELECT StudentID, Name, TotalScore, RANK() OVER (ORDER BY TotalScore DESC) AS `Rank` FROM Students;
SELECT StudentID, Name, MathScore, SUM(MathScore) OVER (ORDER BY StudentID) AS RunningTotalMathScore FROM Students;
