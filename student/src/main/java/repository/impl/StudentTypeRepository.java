package repository.impl;

import model.StudentType;
import repository.BaseRepository;
import repository.IStudentTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentTypeRepository implements IStudentTypeRepository {
    private  final  String SELECT_ALL_STUDENT_TYPE = "select* from student_type";
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<StudentType> findAllStudentType() {
        List<StudentType> studentTypeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_STUDENT_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
               studentTypeList.add(new StudentType(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return studentTypeList;

    }
}
