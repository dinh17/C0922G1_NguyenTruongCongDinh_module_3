create database student1102023 ;
use student1102023;


create table class(
id int primary key auto_increment,
name varchar(120)
);
 
 insert into class(name) values ('C0822G1'),('C0922G1'),('C1022G1');
 
 
create table student_type(
id int primary key auto_increment,
name varchar(120)
);
 insert into student_type(name) values ('Giàu'),('Nghèo'),('Khá giả');
 
 
create table student(
id int primary key auto_increment,
name varchar(120),
gender bit (1),
age  int ,
number_phone int,
class_id int,
student_type_id int ,
 foreign key  (class_id) references class(id),
 foreign key  (student_type_id) references student_type(id)
);
insert into student( name, gender , age, number_phone,class_id,student_type_id )values ('dinh',1,2,3,2,2);
insert into student values(4,'dinh',1,2,3,2,2);
select  s.*,c.name as class,st.name as type from student s join class c on c.id=s.class_id join student_type st on s.student_type_id=st.id;
select  s.*,c.name as class_name,st.name as student_type_name from student s join class c on c.id=s.class_id join student_type st on s.student_type_id=st.id where s.name like 'dinh' and s.number_phone like 3 and s.student_type_id like 2