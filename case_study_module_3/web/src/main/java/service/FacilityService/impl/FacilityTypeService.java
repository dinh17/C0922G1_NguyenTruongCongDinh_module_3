package service.FacilityService.impl;

import model.facility.FacilityType;
import repository.facilityRepository.impl.FacilityTypeRepository;
import service.FacilityService.IFacilityTypeService;

import java.util.List;

public class FacilityTypeService implements IFacilityTypeService {

 FacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();
    @Override
    public List<FacilityType> findAllFacilityType() {
        return facilityTypeRepository.findAllFacilityType();
    }
}
