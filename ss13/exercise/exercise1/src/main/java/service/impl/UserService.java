package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public List<User> findByCountry(String country) {
        return userRepository.findByCountry(country);
    }


    @Override
    public boolean add(User user) {
        return userRepository.add(user);
    }

    @Override
    public boolean delete(int id) {
        return userRepository.delete(id);
    }

    @Override
    public boolean update(User user) {
        return userRepository.update(user);
    }
}