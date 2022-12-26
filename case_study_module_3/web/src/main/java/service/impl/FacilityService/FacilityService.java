package service.impl.FacilityService;

import model.facility.Facility;
import repository.IFacilityRepository;
import repository.impl.facilityRepository.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepository facilityRepository = new FacilityRepository() ;

    @Override
    public List<Facility> displayFacility() {
        return facilityRepository.displayFacility();
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
