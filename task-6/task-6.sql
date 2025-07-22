CREATE DATABASE CompanyDB;
USE CompanyDB;
CREATE TABLE Employees ( EmpID INT PRIMARY KEY,Name VARCHAR(50),Department VARCHAR(50),
JoiningDate DATE);
DESC Employees;
INSERT INTO Employees (EmpID, Name, Department, JoiningDate) VALUES
(1, 'Aarav', 'HR', '2022-05-10'),(2, 'Bhavya', 'Finance', '2021-12-15'),(3, 'Charan', 'IT', '2023-03-20'),  (4, 'Divya', 'HR', '2022-01-10'),(5, 'Esha', 'Marketing', '2020-08-25');
ALTER TABLE Employees  ADD COLUMN LastUpdated DATE;
ALTER TABLE Employees ADD COLUMN Status VARCHAR(10) DEFAULT 'Active';
UPDATE Employees 
SET LastUpdated = CURRENT_DATE 
WHERE Status = 'Active' AND EmpID=3;
SELECT * FROM Employees;
UPDATE Employees SET Status = 'Inactive' WHERE EmpID IN (2, 5);
SELECT * FROM Employees;
DELETE FROM Employees WHERE EmpID IN (1, 2) AND Status = 'Inactive';
SELECT * FROM Employees WHERE Status = 'Inactive';
SET SQL_SAFE_UPDATES = 0;
DELETE FROM Employees WHERE LastUpdated < '2023-01-01';
SET SQL_SAFE_UPDATES = 1;  
SELECT * FROM Employees;



