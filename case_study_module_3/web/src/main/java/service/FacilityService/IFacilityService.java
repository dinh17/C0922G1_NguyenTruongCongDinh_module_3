package service.FacilityService;

import model.customer.Customer;
import model.facility.Facility;

import java.util.List;

public interface IFacilityService {
    List<Facility> displayFacility ();
    Boolean addFacility (Facility facility);
    boolean deleteFacility (int id);
    boolean editFacility (Facility facility);
    List<Facility> findFacility(String facilityName, int rentTypeID);
}
