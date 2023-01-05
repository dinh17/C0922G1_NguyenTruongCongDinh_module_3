package service.employeeService.impl;

import model.employee.EducationDegree;
import repository.employeeRepository.IEducationDegreeRepository;
import repository.employeeRepository.IEmployeeRepository;
import repository.employeeRepository.impl.EducationDegreeRepository;
import repository.employeeRepository.impl.EmployeeRepository;
import service.employeeService.IEducationDegreeService;

import java.util.List;

public class EducationDegreeService  implements IEducationDegreeService {
   IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepository();
    @Override
    public List<EducationDegree> findAllEducationDegree() {
        return educationDegreeRepository.findAllEducationDegree();
    }
}
