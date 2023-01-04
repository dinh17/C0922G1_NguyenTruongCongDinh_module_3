package repository.impl;

import model.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    BaseRepository baseRepository = new BaseRepository();
    private final String SELECT_ALL = "select * from users";

    private final String INSERT_USER = "insert into users(`name`,email,country) values (?,?,?)";
    private final String EDIT_USER = "update users set `name`=?,email=?,country=? where id = ? ;";
    private final String DELETE_USER = "delete from users where id = ?;";
    private final String SQL_SAFE_UPDATES = "set sql_safe_updates = 0;";
    private final String FOREIGN_KEY_CHECKS = "set foreign_key_checks = 0;";

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean editUser(User user) {
//        Connection connection = baseRepository.getConnection();
//        try {
//            PreparedStatement ps = connection.prepareStatement(EDIT_USER);
//            ps.setString(1, user.getName());
//            ps.setString(2, user.getEmail());
//            ps.setString(3, user.getCountry());
//            return ps.executeUpdate() > 0;
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
        return false;
    }

    @Override
    public boolean deleteUser(int id) {
//        Connection connection = baseRepository.getConnection();
//        try {
//            PreparedStatement ps1 = connection.prepareStatement(SQL_SAFE_UPDATES);
//            ps1.executeUpdate();
//            PreparedStatement ps2 = connection.prepareStatement(FOREIGN_KEY_CHECKS);
//            ps2.executeUpdate();
//            PreparedStatement ps = connection.prepareStatement(DELETE_USER);
//            ps.setInt(1, id);
//            return ps.executeUpdate() > 0;
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
        return false;

    }

    @Override
    public boolean addUser(User user) {
//        Connection connection = baseRepository.getConnection();
//        try {
//            PreparedStatement ps = connection.prepareStatement(INSERT_USER);
//            ps.setString(1, user.getName());
//            ps.setString(2, user.getEmail());
//            ps.setString(3, user.getCountry());
//            return ps.executeUpdate() > 0;
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }


        return false;
    }
}
