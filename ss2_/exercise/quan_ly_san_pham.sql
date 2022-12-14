create database quan_ly_san_pham ;
use quan_ly_san_pham;

-- tạo bảng customer
create table customer (
c_id int primary key ,
c_name varchar(45),
cAge date
); 
-- tao bảng order
create table `order` (
c_id int,
o_id  int primary key ,
o_date date ,
o_total_price double ,
foreign key (c_id) references customer(c_id)
);
-- tạo bảng product
create table product (
p_id int primary key ,
p_name varchar(45),
p_price int 
); 

-- tạo bảng chung order_detail
create table order_detail (
o_id int,
p_id int,
primary key (o_id,p_id),
foreign key(o_id) references `order` (o_id),
foreign key(p_id) references `product` (p_id)
);
