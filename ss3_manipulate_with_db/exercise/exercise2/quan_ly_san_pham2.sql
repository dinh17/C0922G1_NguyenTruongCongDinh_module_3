create database quan_ly_san_pham;
use quan_ly_san_pham;
-- tạo bảng customer
create table customer (
  c_id int primary key auto_increment, 
  c_name varchar(45), 
  c_age int
);
-- tao bảng order
create table `order` (
  c_id int, 
  o_id int primary key auto_increment, 
  o_date date, 
  o_total_price int, 
  foreign key (c_id) references customer(c_id) on delete 
  set 
    null
);
-- tạo bảng product
create table product (
  p_id int primary key auto_increment, 
  p_name varchar(45), 
  p_price int
);
-- tạo bảng chung order_detail
create table order_detail (
  o_id int, 
  p_id int, 
  od_qty int, 
  primary key (o_id, p_id), 
  foreign key(o_id) references `order` (o_id) ,
  foreign key(p_id) references `product` (p_id)
);
-- chèn dữ liệu  ----------- 
insert into customer (c_name,c_age)
values 
  ( 'Minh Quan', 10), 
  ( 'Ngoc Oanh', 20), 
  ( 'Hong Ha', 50);
insert into `order` (c_id, o_date, o_total_price) 
values 
  (1, '2006-03-21', null), 
  (2, '2006-03-23', null), 
  (1, '2006-03-16', null);
insert into product (p_name, p_price) 
values 
  ('May Giat', 3), 
  ('Tu Lanh', 5), 
  ('Dieu Hoa', 7), 
  ('Quat', 1), 
  ('Bep Dien', 2);
insert into order_detail 
values 
  (1, 1, 3), 
  (1, 3, 7), 
  (1, 4, 2), 
  (2, 1, 1), 
  (3, 1, 8), 
  (2, 5, 4), 
  (2, 3, 3);
  
  
--  truy vấn dữ liệu ----------------------
--  Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select 
  o_id, 
  o_date, 
  o_total_price 
from 
  `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng và danh sách sản phẩm được mua bởi các khách

select 
  c.c_name, 
  p.p_name 
from 
  customer c 
  join `order` o on c.c_id = o.c_id 
  join order_detail od on od.o_id = o.o_id 
  join product p on p.p_id = od.p_id;
--  Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select 
  c.c_id, 
  c.c_name, 
  c.c_age 
from 
  customer c 
where 
  c.c_id not in (
    select 
      o.c_id 
    from 
      `order` o
  );
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán
--  của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

select 
  o.o_id, 
  o.o_date, 
  od.od_qty, 
  (p.p_price * od.od_qty) as o_total_price 
from 
  customer c 
  join `order` o on c.c_id = o.c_id 
  join order_detail od on od.o_id = o.o_id 
  join product p on p.p_id = od.p_id;


