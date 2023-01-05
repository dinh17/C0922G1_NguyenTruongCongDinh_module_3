package service.employeeService.impl;

import model.employee.Employee;
import repository.employeeRepository.IEmployeeRepository;
import repository.employeeRepository.impl.EmployeeRepository;
import service.employeeService.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {

 IEmployeeRepository employeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> displayEmployee() {
        return employeeRepository.displayEmployee();
    }
}
