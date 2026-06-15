
CREATE DATABASE online_exam;

USE online_exam;

CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255) NOT NULL,
    course VARCHAR(50)
);

CREATE TABLE Admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Exam (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_name VARCHAR(100) NOT NULL,
    total_marks INT,
    duration INT
);

CREATE TABLE Question (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_id INT,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255),
    option_b VARCHAR(255),
    option_c VARCHAR(255),
    option_d VARCHAR(255),
    correct_option CHAR(1),
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id)
);

CREATE TABLE Result (
    result_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    exam_id INT,
    score INT,
    exam_date DATE,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id)
);

CREATE TABLE Answer (
    answer_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    question_id INT,
    selected_option CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (question_id) REFERENCES Question(question_id)
);

-- Sample Data

INSERT INTO Student(name,email,password,course)
VALUES ('Ashu','ashu@gmail.com','123456','CSE');

INSERT INTO Exam(exam_name,total_marks,duration)
VALUES ('DBMS Test',100,60);

INSERT INTO Question
(exam_id,question_text,option_a,option_b,option_c,option_d,correct_option)
VALUES
(1,'What does DBMS stand for?',
'Database Management System',
'Data Base Main System',
'Database Memory System',
'None',
'A');

INSERT INTO Question
(exam_id,question_text,option_a,option_b,option_c,option_d,correct_option)
VALUES
(1,'SQL ka full form kya hai?',
'Structured Query Language',
'Simple Query Language',
'System Query Language',
'None',
'A');

INSERT INTO Result(student_id,exam_id,score,exam_date)
VALUES (1,1,95,'2026-06-15');
