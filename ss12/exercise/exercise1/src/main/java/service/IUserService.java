package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    boolean editUser(User user);
    boolean deleteUser(int id);
    boolean addUser(User user);
    List<User> findUserByCountry(String country);
    List<User> sortByName();
}
