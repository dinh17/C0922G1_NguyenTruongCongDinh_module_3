package service.employeeService.impl;

import model.employee.Position;
import repository.employeeRepository.IEmployeeRepository;
import repository.employeeRepository.IPositionRepository;
import repository.employeeRepository.impl.EmployeeRepository;
import repository.employeeRepository.impl.PositionRepository;
import service.employeeService.IPositionService;

import java.util.List;

public class PositionService  implements IPositionService {
   IPositionRepository positionRepository = new PositionRepository();
    @Override
    public List<Position> findAllPosition() {
        return positionRepository.findAllPosition();
    }
}
