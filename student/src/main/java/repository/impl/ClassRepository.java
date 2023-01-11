package repository.impl;

import model.ClassType;
import model.StudentType;
import repository.BaseRepository;
import repository.IClassRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassRepository implements IClassRepository {
    private  final  String SELECT_ALL_CLASS_TYPE = "select* from class";
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<ClassType> findAllClass() {
        List<ClassType> classList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_CLASS_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                classList.add(new ClassType(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return classList;
    }
}
