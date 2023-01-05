package controller;

import model.User;
import service.IUserService;
import service.impl.UserService;

import java.io.*;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/user")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                add(req, resp);
                break;
            case "delete":
                delete(req, resp);
                break;
            case "update":
                update(req, resp);
                break;
            case "find":
                findCountry(req, resp);
                break;
            default:
                showList(req, resp);
                break;

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showListAdd(req, resp);
                break;
            case "update":
                showListUpdate(req, resp);
                break;
            case "find":
                showFindCountry(req, resp);
                break;
            default:
                showList(req, resp);
                break;

        }
    }

    private void showListUpdate(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            req.setAttribute("id", id);
            req.getRequestDispatcher("view/update.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListAdd(HttpServletRequest req, HttpServletResponse resp) {
        try {
            req.getRequestDispatcher("view/add.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(id, name, email, country);
        userService.update(user);
        showList(req, resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        boolean check = userService.delete(id);
        String mess = " Delete success";
        if (!check) {
            mess = "Not Delete success";
        }
        req.setAttribute("mess", mess);
        showList(req, resp);
    }


    private void add(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        User user = new User(name, email, country);
        boolean check = userService.add(user);
        String mess = "Add new success";
        if(!check){
            mess ="Not Add new success";
        }
        req.setAttribute("mess", mess);
        showList(req, resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<User> userList = userService.findAll();
        req.setAttribute("userList", userList);
        try {
            req.getRequestDispatcher("view/list.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void findCountry(HttpServletRequest req, HttpServletResponse resp) {
        String country = req.getParameter("country");
        req.setAttribute("user", userService.findByCountry(country));
        showFindCountry(req, resp);
    }
    private void showFindCountry(HttpServletRequest req, HttpServletResponse resp) {
        String country = req.getParameter("country");
        List<User> userList = userService.findByCountry(country);
        req.setAttribute("userList", userList);
        try {
            req.getRequestDispatcher("view/find.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }
}