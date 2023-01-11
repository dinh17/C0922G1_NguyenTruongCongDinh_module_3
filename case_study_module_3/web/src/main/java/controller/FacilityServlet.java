package controller;

import model.facility.Facility;
import model.facility.FacilityType;
import model.facility.RentType;
import service.FacilityService.IFacilityService;
import service.FacilityService.IFacilityTypeService;
import service.FacilityService.IRentTypeService;
import service.FacilityService.impl.FacilityService;
import service.FacilityService.impl.FacilityTypeService;
import service.FacilityService.impl.RentTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "FacilityServlet",urlPatterns = "/facility")
    public class FacilityServlet extends HttpServlet {
        IFacilityService facilityService = new FacilityService();
        IFacilityTypeService facilityTypeService = new FacilityTypeService();
        IRentTypeService rentTypeService = new RentTypeService();


        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            String action = request.getParameter("action");
            if(action==null){
                action="";
            }
            switch (action){
                case "add" :
                    addFacility(request,response);
                    break;
                case "edit":
                    editFacility(request, response);
                    break;
                case "delete":
                    removeFacility(request, response);
                    break;
                case "search":
                    searchFacility(request, response);
                    break;
            }

        }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) {
        String facilityName = request.getParameter("name");
        int rentTypeId = Integer.parseInt(request.getParameter("rent_type_id"));
        request.setAttribute("facilityList", facilityService.findFacility(facilityName, rentTypeId));
        request.setAttribute("facilityTypeList", facilityTypeService.findAllFacilityType());
        request.setAttribute("rentTypeList", rentTypeService.findAllRentType());
        try {
            request.getRequestDispatcher("view/facility/listFacility.jsp").forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void removeFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        facilityService.deleteFacility(id);
        displayFacility(request, response);
    }

    private void editFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        int rentTypeId = Integer.parseInt(request.getParameter("rent_type_id"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facility_type_id"));
        String standardRoom = request.getParameter("standard_room");
        String descriptionOtherConvenience = request.getParameter("description_other_convenience");
        String poolAreaStr = request.getParameter("pool_area");
        double poolArea = 0;
        if (poolAreaStr != "") {
            poolArea = Double.parseDouble(poolAreaStr);
        }
        String numberOfFloorsStr = request.getParameter("number_of_floors");
        int numberOfFloors = 0;
        if (numberOfFloorsStr != "") {
            numberOfFloors = Integer.parseInt(numberOfFloorsStr);
        }
        String facilityFree = request.getParameter("facility_free");
        Facility facility = new Facility(id, name, area, cost, maxPeople, new RentType(rentTypeId), new FacilityType(facilityTypeId), standardRoom,
                descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        facilityService.editFacility(facility);
        request.setAttribute("facilityTypeList", facilityTypeService.findAllFacilityType());
        request.setAttribute("rentTypeList", rentTypeService.findAllRentType());
        displayFacility(request, response);
    }
    private void addFacility(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("max_people"));
        int rentTypeId = Integer.parseInt(request.getParameter("rent_type_id"));
        int facilityTypeId = Integer.parseInt(request.getParameter("facility_type_id"));
        String standardRoom = request.getParameter("standard_room");
        String descriptionOtherConvenience = request.getParameter("description_other_convenience");
        String poolAreaStr = request.getParameter("pool_area");
        double poolArea = 0;
        if (poolAreaStr != "") {
            poolArea = Double.parseDouble(poolAreaStr);
        }
        String numberOfFloorsStr = request.getParameter("number_of_floors");
        int numberOfFloors = 0;
        if (numberOfFloorsStr != "") {
            numberOfFloors = Integer.parseInt(numberOfFloorsStr);
        }
        String facilityFree = request.getParameter("facility_free");
        Facility facility = new Facility(name, area, cost, maxPeople, new RentType(rentTypeId), new FacilityType(facilityTypeId), standardRoom,
                descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        facilityService.addFacility(facility);
        displayFacility(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            switch (action) {
                default:
                    displayFacility(request, response);
            }
        }

        private void displayFacility(HttpServletRequest request, HttpServletResponse response) {
            request.setAttribute("facilityList", facilityService.displayFacility());
            request.setAttribute("facilityTypeList",facilityTypeService.findAllFacilityType());
            request.setAttribute("rentTypeList",rentTypeService.findAllRentType());

            try {
                request.getRequestDispatcher("/view/facility/listFacility.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
}
