package service.impl.FacilityService;

import model.facility.RentType;
import repository.IRentTypeRepository;
import repository.impl.facilityRepository.RentTypeRepository;
import service.IRentTypeService;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    IRentTypeRepository rentTypeRepository = new RentTypeRepository();
    @Override
    public List<RentType> findAllRentType() {
        return rentTypeRepository.findAllRentType();
    }
}
