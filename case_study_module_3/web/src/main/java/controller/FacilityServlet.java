package controller;

import service.IFacilityService;
import service.IFacilityTypeService;
import service.IRentTypeService;
import service.impl.FacilityService.FacilityService;
import service.impl.FacilityService.FacilityTypeService;
import service.impl.FacilityService.RentTypeService;

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
                    break;
            }

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
