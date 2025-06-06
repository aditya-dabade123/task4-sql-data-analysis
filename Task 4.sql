
CREATE DATABASE task4_db;
USE task4_db;


CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student (rollno, name, marks, grade, city)
VALUES
(101, "anil", 78, "C", "Pune"),
(102, "bhumika", 93, "A", "Mumbai"),
(103, "chetan", 85, "B", "Mumbai"),
(104, "dhruv", 96, "A", "Delhi"),
(105, "emanuel", 12, "F", "Delhi"),
(106, "farah", 82, "B", "Delhi");


SELECT * FROM student;
SELECT city FROM student;
SELECT name FROM student;
SELECT * FROM student WHERE marks + 10 > 100 AND city = "Mumbai";
SELECT * FROM student LIMIT 3;


SELECT city, AVG(marks) AS average_marks FROM student GROUP BY city;
SELECT grade, COUNT(*) AS total_students FROM student GROUP BY grade;


SELECT * FROM student
WHERE marks > (SELECT AVG(marks) FROM student);


CREATE VIEW high_scorers AS
SELECT name, marks FROM student WHERE marks > 90;

CREATE TABLE city_info (
    city VARCHAR(20) PRIMARY KEY,
    state VARCHAR(20)
);

INSERT INTO city_info (city, state) VALUES
("Pune", "Maharashtra"),
("Mumbai", "Maharashtra"),
("Delhi", "Delhi");


SELECT s.name, s.city, c.state
FROM student s
INNER JOIN city_info c ON s.city = c.city;

SELECT s.name, s.city, c.state
FROM student s
LEFT JOIN city_info c ON s.city = c.city;


CREATE INDEX idx_city ON student(city);


SELECT name, COALESCE(marks, 0) AS safe_marks FROM student;
