package service.FacilityService.impl;

import model.facility.RentType;
import repository.facilityRepository.IRentTypeRepository;
import repository.facilityRepository.impl.RentTypeRepository;
import service.FacilityService.IRentTypeService;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    IRentTypeRepository rentTypeRepository = new RentTypeRepository();
    @Override
    public List<RentType> findAllRentType() {
        return rentTypeRepository.findAllRentType();
    }
}
