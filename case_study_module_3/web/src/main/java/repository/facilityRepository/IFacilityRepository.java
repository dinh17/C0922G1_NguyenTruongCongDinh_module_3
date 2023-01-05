package repository.facilityRepository;

import model.facility.Facility;

import java.util.List;

public interface IFacilityRepository {
    List<Facility> displayFacility ();
    Boolean addFacility (Facility facility);
    boolean deleteFacility (int id);
    boolean editFacility (Facility facility);
}
