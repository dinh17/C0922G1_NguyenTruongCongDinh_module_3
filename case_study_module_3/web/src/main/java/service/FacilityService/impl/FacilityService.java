package service.FacilityService.impl;

import model.facility.Facility;
import repository.facilityRepository.IFacilityRepository;
import repository.facilityRepository.impl.FacilityRepository;
import service.FacilityService.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    IFacilityRepository facilityRepository = new FacilityRepository() ;

    @Override
    public List<Facility> displayFacility() {
        return facilityRepository.displayFacility();
    }

    @Override
    public Boolean addFacility(Facility facility) {
        return facilityRepository.addFacility(facility);
    }

    @Override
    public boolean deleteFacility(int id) {
        return facilityRepository.deleteFacility(id);
    }

    @Override
    public boolean editFacility(Facility facility) {
        return facilityRepository.editFacility(facility);
    }

    @Override
    public List<Facility> findFacility(String facilityName, int rentTypeID) {
        return facilityRepository.findFacility(facilityName,rentTypeID);
    }
}
