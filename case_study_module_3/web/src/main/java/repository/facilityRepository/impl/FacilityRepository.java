package repository.facilityRepository.impl;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import repository.BaseRepository;
import repository.facilityRepository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    BaseRepository baseRepository = new BaseRepository();
    private final String SELECT_ALL_FACILITY = "select f.*,ft.name as facility_type_name,rt.name as rent_type_name from facility f join facility_type ft on f.facility_type_id = ft.id join rent_type rt on f.rent_type_id = rt.id; ";

    @Override
    public List<Facility> displayFacility() {
        List<Facility>  facilityList = new ArrayList<>();
        Connection connection =baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FACILITY );
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int area = rs.getInt("area");
                double cost = rs.getInt("cost");
                int maxPeople = rs.getInt("max_people");
                int rentTypeId = rs.getInt("rent_type_id");
                String rentTypeName = rs.getString("rent_type_name");
                int facilityTypeId = rs.getInt("facility_type_id");
                String facilityTypeName = rs.getString("facility_type_name");
                String standardRoom = rs.getString("standard_room");
                String descriptionOtherConvenience = rs.getString("description_other_convenience");
                double poolArea = rs.getDouble("pool_area");
                int numberOfFloors = rs.getInt("number_of_floors");
                String facilityFree = rs.getString("facility_free");
                FacilityType facilityType = new FacilityType(facilityTypeId,facilityTypeName);
                RentType rentType = new RentType(rentTypeId,rentTypeName);
                facilityList.add(new Facility(id,name,area,cost,maxPeople,rentType,facilityType,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloors,facilityFree));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }

    @Override
    public Boolean addFacility(Facility facility) {
        return null;
    }

    @Override
    public boolean deleteFacility(int id) {
        return false;
    }

    @Override
    public boolean editFacility(Facility facility) {
        return false;
    }
}
