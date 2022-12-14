use student_management ;


-- 1.Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where student_name like 'h%';
-- 2.Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class where month(start_date)=12; 
-- 3.Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5
select * from mark where mark between 3 and 5 ;
-- 4.Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
  set SQL_SAFE_UPDATES = 0 ;
 update student set class_id=2 where student_name ="Hung";
 select  * from student ;
--  5.Hiển thị các thông tin: StudentName, SubName, Mark. 
--  Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.student_name,sub.sub_name,m.mark from mark m join student s on s.student_id = m.student_id join `subject` sub on sub.sub_id = m.sub_id order by mark desc,mark asc; 

