create database practice ;
use practice ;
 
 create table users(
 id int primary key  auto_increment,
 `name` varchar(120) not null,
 email varchar(120) not null,
 country varchar(120)
 );
 
 insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

select * from users