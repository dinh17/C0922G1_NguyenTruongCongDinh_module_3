package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    IUserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "search":
                searchByName(request, response);
                break;

        }
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        List<User> userList = userService.findUserByName(name);
        request.setAttribute("userList", userList);
        String mess = "";
        if (userList.size() == 0) {
            mess = "Không tìm thấy";
        }
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("view/listUser.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String mess = "Xóa Không thành công";
        boolean check = userService.deleteUser(id);
        if (check) {
            mess = "Xóa Thành công";
        }
        request.setAttribute("mess", mess);
        displayListUser(request, response);
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        boolean check = userService.editUser(user);
        String mess = "Cập nhật không thành công";
        if (check) {
            mess = "Cập nhật thành công";
        }
        request.setAttribute("mess", mess);
        displayListUser(request, response);
    }


    private void addUser(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(name, email, country);
        boolean check = userService.addUser(user);
        String mess = "Thêm mới không thành công";
        if (check) {
            mess = "thêm mới thành công ";
        }
        request.setAttribute("mess", mess);
        try {
            request.getRequestDispatcher("view/addUser.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddUser(request, response);
                break;
            default:
                displayListUser(request, response);

        }
    }

    private void showAddUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/addUser.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayListUser(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("userList", userService.findAll());
        try {
            request.getRequestDispatcher("/view/listUser.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
