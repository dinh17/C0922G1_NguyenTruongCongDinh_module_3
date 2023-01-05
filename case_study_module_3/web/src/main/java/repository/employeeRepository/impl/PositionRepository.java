package repository.employeeRepository.impl;

import model.employee.EducationDegree;
import model.employee.Position;
import repository.BaseRepository;
import repository.employeeRepository.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepository implements IPositionRepository {
    private final String SELECT_ALL_POSITION = "select * from position";
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Position> findAllPosition() {
        List<Position> positionList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_POSITION);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                positionList.add(new Position(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return positionList;
    }
}
