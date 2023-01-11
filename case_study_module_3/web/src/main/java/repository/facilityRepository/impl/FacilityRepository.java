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
    private final String SELECT_FACILITY = "";
    private final String FIND_FACILITY_BY = "select f.*,ft.name as facility_type_name,rt.name as rent_type_name from facility f join facility_type ft on f.facility_type_id = ft.id join rent_type rt on f.rent_type_id = rt.id where f.name like ? and f.rent_type_id = ?;";
    private final String INSERT_INTO_FACILITY = "insert into facility( name, area, cost, max_people, rent_type_id, facility_type_id, standard_room, description_other_convenience, pool_area, number_of_floors, facility_free)\n" +
            " values (?,?,?,?,?,?,?,?,?,?,?);";
    private final String UPDATE_FACILITY = "update facility set name =?,area=?,cost=?,max_people=?,rent_type_id=?,facility_type_id=?,standard_room=?,description_other_convenience=?,pool_area=?,number_of_floors=?,facility_free=? where id = ?;";
    private final String DELETE_FACILITY = "delete from facility where id = ?;";
    private final String SQL_SAFE_UPDATES = "set sql_safe_updates = 0;";
    private final String FOREIGN_KEY_CHECKS = "set foreign_key_checks = 0;";
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
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO_FACILITY);
            preparedStatement.setString(1, facility.getName());
            preparedStatement.setInt(2, facility.getArea());
            preparedStatement.setDouble(3, facility.getCost());
            preparedStatement.setInt(4, facility.getMaxPeople());
            preparedStatement.setInt(5, facility.getRentType().getId());
            preparedStatement.setInt(6, facility.getFacilityType().getId());
            preparedStatement.setString(7, facility.getStandardRoom());
            preparedStatement.setString(8, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, facility.getPoolArea());
            preparedStatement.setInt(10, facility.getNumberOfFloors());
            preparedStatement.setString(11, facility.getFacilityFree());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    @Override
    public boolean editFacility(Facility facility) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(UPDATE_FACILITY);
            ps.setString(1,facility.getName());
            ps.setInt(2,facility.getArea());
            ps.setDouble(3,facility.getCost());
            ps.setInt(4,facility.getMaxPeople());
            ps.setInt(5,facility.getRentType().getId());
            ps.setInt(6,facility.getFacilityType().getId());
            ps.setString(7,facility.getStandardRoom());
            ps.setString(8,facility.getDescriptionOtherConvenience());
            ps.setDouble(9,facility.getPoolArea());
            ps.setInt(10,facility.getNumberOfFloors());
            ps.setString(11,facility.getFacilityFree());
            ps.setInt(12,facility.getId());
            return ps.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteFacility(int id) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps1 = connection.prepareStatement(SQL_SAFE_UPDATES);
            ps1.executeUpdate();
            PreparedStatement ps2 = connection.prepareStatement(FOREIGN_KEY_CHECKS);
            ps2.executeUpdate();
            PreparedStatement ps = connection.prepareStatement(DELETE_FACILITY);
            ps.setInt(1,id);
            return ps.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Facility> findFacility(String facilityName, int rentTypeID) {
        List<Facility> facilityList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(FIND_FACILITY_BY);
            ps.setString(1,"%" +facilityName+ "%");
            ps.setInt(2,rentTypeID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int area = rs.getInt("area");
                double cost = rs.getInt("cost");
                int maxPeople = rs.getInt("max_people");
                int newRentTypeId = rs.getInt("rent_type_id");
                String newRentTypeName = rs.getString("rent_type_name");
                int facilityTypeId = rs.getInt("facility_type_id");
                String facilityTypeName = rs.getString("facility_type_name");
                String standardRoom = rs.getString("standard_room");
                String descriptionOtherConvenience = rs.getString("description_other_convenience");
                double poolArea = rs.getDouble("pool_area");
                int numberOfFloors = rs.getInt("number_of_floors");
                String facilityFree = rs.getString("facility_free");
                FacilityType facilityType = new FacilityType(facilityTypeId,facilityTypeName);
                RentType rentType = new RentType(newRentTypeId,newRentTypeName);
                facilityList.add(new Facility(id,name,area,cost,maxPeople,rentType,facilityType,standardRoom,descriptionOtherConvenience,poolArea,numberOfFloors,facilityFree) );
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facilityList;
    }
}
