package repository.impl;

import model.ClassType;
import model.Student;
import model.StudentType;
import repository.BaseRepository;
import repository.IStudentRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {

    BaseRepository baseRepository = new BaseRepository();

    private final String SELECT_ALL_STUDENT = "select  s.*,c.name as class_name,st.name as student_type_name from student s join class c on c.id=s.class_id join student_type st on s.student_type_id=st.id; ";
    private final String DELETE_STUDENT = "delete from student where id = ?;";
    private final String SQL_SAFE_UPDATES = "set sql_safe_updates = 0;";
    private final String FOREIGN_KEY_CHECKS = "set foreign_key_checks = 0;";
    private static final String EDIT_STUDENT = "update student set class_id=?,student_type_id = ?,name=?,gender=?,age=?,number_phone=? where id = ?;";
    private final String INSERT_INTO_STUDENT = "insert into student( name, gender , age, number_phone,class_id,student_type_id )\n" +
            " values (?,?,?,?,?,?);";

    private final String FIND_STUDENT_BY_NAME = "select  s.*,c.name as class_name,st.name as student_type_name from student s join class c on c.id=s.class_id join student_type st on s.student_type_id=st.id where s.name like ? and s.number_phone like ? and s.student_type_id like ?";

    @Override
    public List<Student> displayStudent() {

        List<Student> studentList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STUDENT);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Boolean gender = resultSet.getBoolean("gender");
                int numberPhone = Integer.parseInt(resultSet.getString("number_phone"));
                int age = Integer.parseInt(resultSet.getString("age"));
                int studentTypeId = resultSet.getInt("student_type_id");
                String studentTypeName = resultSet.getString("student_type_name");
                int classId = resultSet.getInt("class_id");
                String className = resultSet.getString("class_name");
                studentList.add(new Student(id, name, gender, age, numberPhone, new ClassType(classId,className), new StudentType(studentTypeId,studentTypeName)));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return studentList;

    }

    @Override
    public Boolean addStudent(Student student) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_STUDENT);
            preparedStatement.setString(1, student.getName());
            preparedStatement.setBoolean(2, student.isGender());
            preparedStatement.setInt(3, student.getAge());
            preparedStatement.setInt(4, student.getNumberPhone());
            preparedStatement.setInt(5,student.getClassType().getId());
            preparedStatement.setInt(6, student.getStudentType().getId());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;

    }

    @Override
    public boolean delete(int id) {

        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps1 = connection.prepareStatement(SQL_SAFE_UPDATES);
            ps1.executeUpdate();
            PreparedStatement ps2 = connection.prepareStatement(FOREIGN_KEY_CHECKS);
            ps2.executeUpdate();
            PreparedStatement ps = connection.prepareStatement(DELETE_STUDENT);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;

    }

    @Override
    public boolean edit(Student student) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(EDIT_STUDENT);
            ps.setInt(1, student.getClassType().getId());
            ps.setInt(2, student.getStudentType().getId());
            ps.setString(3, student.getName());
            ps.setBoolean(4, student.isGender());
            ps.setInt(5, student.getAge());
            ps.setInt(6, student.getNumberPhone());
            ps.setInt(7, student.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;

    }

    @Override
    public List<Student> find(String name, String phoneNumber, String type) {

        Connection connection = baseRepository.getConnection();
        List<Student> studentList = new ArrayList<>();
        try {
            PreparedStatement ps =connection.prepareStatement(FIND_STUDENT_BY_NAME);
            ps.setString(1,"%"+name+"%");
            ps.setString(2,"%"+phoneNumber+"%");
            ps.setString(3,"%"+type+"%");
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name1 = resultSet.getString("name");
                Boolean gender = resultSet.getBoolean("gender");
                int numberPhone = Integer.parseInt(resultSet.getString("number_phone"));
                int age = Integer.parseInt(resultSet.getString("age"));
                int studentTypeId = resultSet.getInt("student_type_id");
                String studentTypeName = resultSet.getString("student_type_name");
                int classId = resultSet.getInt("class_id");
                String className = resultSet.getString("class_name");
                studentList.add(new Student(id, name1, gender, age, numberPhone, new ClassType(classId,className), new StudentType(studentTypeId,studentTypeName)));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentList;
    }
//
//    Connection connection = baseRepository.getConnection();
//    List<Customer> customerList = new ArrayList<>();
//        try {
//        PreparedStatement ps =connection.prepareStatement(FIND_CUSTOMER_BY_NAME);
//        ps.setString(1,"%"+customerName+"%");
//        ps.setString(2,"%"+customerPhoneNumber+"%");
//        ps.setString(3,"%"+customerType+"%");
//        ResultSet rs = ps.executeQuery();
//        while (rs.next()){
//            int id = rs.getInt("id");
//            int customerTypeId = rs.getInt("customer_type_id");
//            String customerTypeName = rs.getString("customer_type_name");
//            String name = rs.getString("name");
//            String dateOfBirth = rs.getString("date_of_birth");
//            boolean gender = rs.getBoolean("gender");
//            String idCard = rs.getString("id_card");
//            String phoneNumber = rs.getString("phone_number");
//            String email = rs.getString("email");
//            String address = rs.getString("address");
//            Customer customer = new Customer(id,new CustomerType(customerTypeId,customerTypeName),name,dateOfBirth,gender,idCard,phoneNumber,email,address);
//            customerList.add(customer);
//        }
//    } catch (SQLException throwables) {
//        throwables.printStackTrace();
//    }
//        return customerList;
//}
}
