package controller;

import repository.employeeRepository.IDivisionRepository;
import service.FacilityService.IFacilityService;
import service.FacilityService.IFacilityTypeService;
import service.FacilityService.IRentTypeService;
import service.FacilityService.impl.FacilityService;
import service.FacilityService.impl.FacilityTypeService;
import service.FacilityService.impl.RentTypeService;
import service.employeeService.IDivisionService;
import service.employeeService.IEducationDegreeService;
import service.employeeService.IEmployeeService;
import service.employeeService.IPositionService;
import service.employeeService.impl.DivisionService;
import service.employeeService.impl.EducationDegreeService;
import service.employeeService.impl.EmployeeService;
import service.employeeService.impl.PositionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet",value="/employee")
public class EmployeeServlet extends HttpServlet {

    IEmployeeService employeeService = new EmployeeService();
    IDivisionService divisionService = new DivisionService();
    IPositionService positionService = new PositionService();
    IEducationDegreeService educationDegreeService = new EducationDegreeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                displayEmployee(request, response);
        }
    }

    private void displayEmployee(HttpServletRequest request, HttpServletResponse response) {

        request.setAttribute("divisionList",divisionService.findAllDivision());
        request.setAttribute("positionList",positionService.findAllPosition());
        request.setAttribute("educationDegreeList",educationDegreeService.findAllEducationDegree());
        request.setAttribute("employeeList", employeeService.displayEmployee());

        try {
            request.getRequestDispatcher("/view/employee/listEmployee.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
