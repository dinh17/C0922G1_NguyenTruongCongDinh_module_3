CREATE DATABASE student_management;
USE student_management;

 -- tao bang student 
CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45),
    age INT NOT NULL,
    country VARCHAR(45) NOT NULL
);
 -- tao bang teacher 
CREATE TABLE teacher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45),
    age INT NOT NULL,
    country VARCHAR(45) NOT NULL
);
 
 -- tao bang class 
CREATE TABLE class (
    id INT PRIMARY KEY,
    `name` VARCHAR(45)
);
 