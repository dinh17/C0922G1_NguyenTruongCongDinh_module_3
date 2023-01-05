package service;

import model.User;

import java.util.List;

public interface IUserService {
    List<User> findAll();
    List<User> findByCountry(String country);

    boolean add(User user);
    boolean delete(int id);
    boolean update(User user);

}