package repository.employeeRepository.impl;

import model.employee.Division;
import model.employee.EducationDegree;
import repository.BaseRepository;
import repository.employeeRepository.IEducationDegreeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepository implements IEducationDegreeRepository {
    private final String SELECT_ALL_EDUCATION_DEGREE = "select * from education_degree";
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<EducationDegree> findAllEducationDegree() {
        List<EducationDegree> educationDegreeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_EDUCATION_DEGREE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                educationDegreeList.add(new EducationDegree(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return educationDegreeList;
    }
}
