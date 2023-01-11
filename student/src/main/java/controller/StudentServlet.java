package controller;

import model.ClassType;
import model.Student;
import model.StudentType;
import repository.IStudentRepository;
import repository.impl.StudentRepository;
import service.IClassService;
import service.IStudentService;
import service.IStudentTypeService;
import service.impl.ClassService;
import service.impl.StudentService;
import service.impl.StudentTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet",urlPatterns = "/student")
public class StudentServlet extends HttpServlet {

    IStudentService studentService = new StudentService();
    IStudentTypeService studentTypeService = new StudentTypeService();
    IClassService classService = new ClassService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action== null){
            action="";
        }
        switch (action){
            case "delete" :
                remove(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "add":
                add(request,response);
            case "search" :
                search(request,response);
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("number_phone");
        String type = request.getParameter("customer_type_id");

//        String address = request.getParameter("address");
        List<Student> studentList = studentService.find(name,phoneNumber,type);
        request.setAttribute("studentList", studentList);
        List<StudentType> studentTypeList = studentTypeService.findAllStudentType();
        request.setAttribute("studentTypeList",studentTypeList);

        String mess = "";
        if (studentList.size() == 0) {
            mess = "Không tìm thấy";
        }
        request.setAttribute("mess",mess);
        try {
            request.getRequestDispatcher("/view/listStudent.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        int age = Integer.parseInt(request.getParameter("age"));
        int phoneNumber = Integer.parseInt(request.getParameter("number_phone"));
        int studentTypeId = Integer.parseInt(request.getParameter("student_type_id"));
        int classTypeId = Integer.parseInt(request.getParameter("class_id"));
        Student student = new Student(name, gender, age, phoneNumber,new ClassType(classTypeId), new StudentType(studentTypeId));
         studentService.addStudent(student);
        showListStudent(request, response);
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        int age = Integer.parseInt(request.getParameter("age"));
        int phoneNumber = Integer.parseInt(request.getParameter("number_phone"));
         int studentTypeId = Integer.parseInt(request.getParameter("student_type_id"));
         int classTypeId = Integer.parseInt(request.getParameter("class_id"));
        StudentType studentType = new StudentType(studentTypeId);
        ClassType classType = new ClassType(classTypeId);
        Student student = new Student(id, name, gender, age, phoneNumber,classType, studentType);
        boolean check = studentService.edit(student);
        String mess = "Cập nhật không thành công";
        if (check) {
            mess = "Cập nhật thành công";
        }
        request.setAttribute("mess", mess);
        showListStudent(request, response);
    }

    private void remove(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        studentService.delete(id);
        showListStudent(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String action = request.getParameter("action");
     if(action== null){
         action="";
     }
     switch (action){
         default:
             showListStudent(request,response);
     }
    }

    private void showListStudent(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("studentList", studentService.displayStudent());
        request.setAttribute("studentTypeList", studentTypeService.findAllStudentType());
        request.setAttribute("classList",classService.findAllClass());
        try {
            request.getRequestDispatcher("view/listStudent.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
