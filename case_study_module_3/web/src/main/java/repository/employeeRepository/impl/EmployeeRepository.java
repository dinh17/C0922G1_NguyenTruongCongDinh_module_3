package repository.employeeRepository.impl;

import model.customer.Customer;
import model.customer.CustomerType;
import model.employee.Division;
import model.employee.EducationDegree;
import model.employee.Employee;
import model.employee.Position;
import repository.BaseRepository;
import repository.employeeRepository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository  implements IEmployeeRepository {
      BaseRepository baseRepository = new BaseRepository();
    private final static String SELECT_ALL_EMPLOYEE ="select e.*,d.name as division,ed.name as education_degree,p.name as position1 from employee e  join division d on e.division_id= d.id  join education_degree ed on ed.id=e.education_degree_id  join position p on p.id=e.position_id ;";

    @Override
    public List<Employee> displayEmployee() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet resultSet =preparedStatement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name =  resultSet.getString("name");
                String dateOfBirth = resultSet.getString("date_of_birth");
                String idCard = resultSet.getString("id_card");
                String salary = resultSet.getString("salary");
                String phoneNumber = resultSet.getString("phone_number");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int divisionId = Integer.parseInt(resultSet.getString("division_id"));
                int positionId = Integer.parseInt(resultSet.getString("position_id"));
                int educationDegreeId = Integer.parseInt(resultSet.getString("education_degree_id"));
                String divisionName = resultSet.getString("division");
                String positionName = resultSet.getString("position1");
                String educationDegreeName = resultSet.getString("education_degree");

                Division division = new Division(divisionId,divisionName);
                Position position = new Position(positionId,positionName);
                EducationDegree educationDegree = new EducationDegree(educationDegreeId,educationDegreeName);

                employeeList.add(new Employee(id,name,dateOfBirth,idCard,salary,phoneNumber,email,address,division,position,educationDegree));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return employeeList;
    }
}
