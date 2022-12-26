package repository.impl.facilityRepository;

import model.facility.RentType;
import repository.BaseRepository;
import repository.IRentTypeRepository;
import service.IRentTypeService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RentTypeRepository implements IRentTypeRepository {
    private final String SELECT_ALL_FACILITY_TYPE = "select * from rent_type";
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<RentType> findAllRentType() {
        List<RentType> rentTypeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_FACILITY_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                rentTypeList.add(new RentType(id, name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rentTypeList;
    }
}