package service.employeeService.impl;


import model.employee.Division;
import repository.employeeRepository.IDivisionRepository;
import repository.employeeRepository.IEmployeeRepository;
import repository.employeeRepository.impl.DivisionRepository;
import repository.employeeRepository.impl.EmployeeRepository;
import service.employeeService.IDivisionService;

import java.util.List;

public class DivisionService  implements IDivisionService {
   IDivisionRepository divisionRepository = new DivisionRepository();
    @Override
    public List<Division> findAllDivision() {
        return divisionRepository.findAllDivision();
    }
}
