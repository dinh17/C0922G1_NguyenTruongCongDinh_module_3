package repository.facilityRepository;

import model.facility.RentType;

import java.util.List;

public interface IRentTypeRepository {
    List<RentType> findAllRentType();
}
