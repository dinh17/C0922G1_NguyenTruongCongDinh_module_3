package service.impl.FacilityService;

import model.facility.FacilityType;
import repository.impl.facilityRepository.FacilityTypeRepository;
import service.IFacilityTypeService;

import java.util.List;

public class FacilityTypeService implements IFacilityTypeService {

 FacilityTypeRepository facilityTypeRepository = new FacilityTypeRepository();
    @Override
    public List<FacilityType> findAllFacilityType() {
        return facilityTypeRepository.findAllFacilityType();
    }
}
