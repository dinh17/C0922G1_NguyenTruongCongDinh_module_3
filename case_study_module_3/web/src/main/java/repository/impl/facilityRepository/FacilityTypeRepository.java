package repository.impl.facilityRepository;

import model.customer.CustomerType;
import model.facility.FacilityType;
import repository.BaseRepository;
import repository.ICustomerTypeRepository;
import service.IFacilityTypeService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityTypeRepository implements IFacilityTypeService {
    private final String SELECT_ALL_FACILITY_TYPE = "select * from facility_type";
    BaseRepository baseRepository = new BaseRepository();
    @Override
    public List<FacilityType> findAllFacilityType() {
        List<FacilityType> facilityTypeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(SELECT_ALL_FACILITY_TYPE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                facilityTypeList.add(new FacilityType(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityTypeList;
    }
}

