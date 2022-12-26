package repository;

import model.facility.FacilityType;

import java.util.List;

public interface IFacilityTypeRepository {
    List<FacilityType> findAllFacilityType();
}
