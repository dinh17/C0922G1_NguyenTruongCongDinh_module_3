package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public boolean editUser(User user) {
        return userRepository.editUser(user);
    }

    @Override
    public boolean deleteUser(int id) {
        return userRepository.deleteUser(id);
    }

    @Override
    public boolean addUser(User user) {
        return userRepository.addUser(user);
    }

    @Override
    public List<User> findUserByCountry(String country) {
        return userRepository.findUserByCountry(country);
    }

    @Override
    public List<User> sortByName() {
        return userRepository.sortByName();
    }


}
