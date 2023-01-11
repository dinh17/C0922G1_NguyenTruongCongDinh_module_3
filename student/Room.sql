create database  dethi;
use dethi ;

create table room_status(
id int primary key auto_increment,
name varchar(120) 
);


insert into room_status(name) values('trống'),('Hạ Tầng'),('Đầy Đủ');

create table room_type(
id int primary key auto_increment,
name varchar(120) 
);
insert into room_type(name) values('Sang'),('Trung'),('Thường');

create table room (
id int primary key auto_increment,
ma_mb varchar(45),
`area` double,
room_status_id int ,
`floor` int ,
room_type_id int ,
describer longtext,
price double ,
begin_date date,
end_date date,
foreign key(room_status_id) references room_status(id),
foreign key(room_type_id) references room_type(id)
);
drop table  room ;
insert into room(ma_mb,`area`,room_status_id,`floor`,room_type_id,describer,price,begin_date,end_date) values ('MB-3',12,2,2,3,'tốt',2022/12/3,2023/3/12)