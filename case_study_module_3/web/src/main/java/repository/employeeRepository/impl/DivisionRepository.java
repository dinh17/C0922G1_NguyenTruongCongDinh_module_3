package repository.employeeRepository.impl;

import model.employee.Division;
import model.facility.FacilityType;
import repository.BaseRepository;
import repository.employeeRepository.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepository implements IDivisionRepository {
    private final String SELECT_ALL_POSITION = "select * from position";
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<Division> findAllDivision() {
        List<Division> divisionList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_POSITION);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                divisionList.add(new Division(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return divisionList;
    }
}
