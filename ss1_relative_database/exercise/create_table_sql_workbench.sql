create database student_management;
use student_management;

 -- tao bang student 
 create table student (
id int primary key auto_increment,
`name` varchar(45),
age int not null,
country varchar(45) not null
 
 );
 -- tao bang teacher 
  create table teacher (
id int primary key auto_increment,
`name` varchar(45),
age int not null,
country varchar(45) not null
 
 );
 
 -- tao bang class 
 create table  class (
 id int primary key ,
 `name` varchar(45)
 
 );
 