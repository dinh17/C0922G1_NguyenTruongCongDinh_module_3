create database table_furama_ver2 ;
use table_furama_ver2;
 
create table `position` (
id int primary key auto_increment,
`name` varchar(45)
);

create table education_degree(
id int primary key auto_increment,
`name` varchar(45)
);

create table division (
id int primary key auto_increment,
`name` varchar(45)
);

create table employee (
id int primary key  auto_increment,
`name` varchar(45),
date_of_birth date,
id_card varchar(45),
salary double ,
phone_number varchar(45),
email varchar(45),
address varchar(45),
position_id int ,
education_degree_id int ,
division_id int ,
username varchar(45),
foreign key(position_id) references `position`(id),
foreign key(education_degree_id) references education_degree(id),
foreign key(division_id) references division(id)

);


create table customer_type (
id int primary key auto_increment ,
`name` varchar(45)
);

create table customer (
id int primary key auto_increment ,
customer_type_id  int ,
`name` varchar(45),
date_of_birth date,
gender bit (1),
id_card varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45),
foreign key (customer_type_id) references customer_type(id)
);


 create table attach_facility (
 id int primary key auto_increment,
 `name` varchar(45),
 cost double ,
 unit varchar(10),
 `status` varchar(45)

 );



create table facility_type (
id int primary key auto_increment,
`name` varchar(45)
);

create table rent_type (
id int primary key auto_increment,
`name` varchar(45)
);

create table facility (
id int primary key auto_increment,
`name` varchar(45),
`area` int ,
cost double ,
max_people int ,
rent_type_id int,
facility_type_id int,
standard_room varchar (45),
description_other_convenience varchar(45),
pool_area double ,
number_of_floors int ,
facility_free  text,
foreign key (rent_type_id ) references rent_type(id),
foreign key (facility_type_id ) references facility_type(id)
);



create table contract(
id int primary key auto_increment,
start_date datetime,
end_date datetime ,
deposit double ,
employee_id int ,
customer_id int ,
facility_id int ,
foreign key  (employee_id) references employee(id),
foreign key  (customer_id) references customer(id),
foreign key  (facility_id) references facility(id)
);

create table contract_detail (
id int primary key auto_increment,
contract_id int ,
attach_facility_id int,
quantity int ,
foreign key (contract_id) references contract(id),
foreign key  (attach_facility_id) references  attach_facility(id)
);

create table `user`(
username varchar(225) primary key ,
`password` varchar(255)
);

create table `role` (
role_id int primary key  ,
role_name varchar(255)
);

create table user_role (
role_id int ,
username varchar(255),
foreign key (role_id) references `role`(role_id),
foreign key (username) references `user`(username)
);



select e.*,d.name as division,ed.name as education_degree,p.name as position from employee e  join division d on e.division_id= d.id  join education_degree ed on ed.id=e.education_degree_id  join position p on p.id=e.position_id ;

select e.* from employee e join division d on d.position_id= e.id;
select * from education_degree
