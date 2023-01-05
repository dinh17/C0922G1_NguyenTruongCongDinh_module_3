package repository.customerRepository.impl;

import model.customer.CustomerType;
import repository.BaseRepository;
import repository.customerRepository.ICustomerTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    BaseRepository baseRepository = new BaseRepository();
    private final String FIND_ALL_CUSTOMER_TYPE = "select* from customer_type ;";

    @Override
    public List<CustomerType> findAllCustomerType() {
        List<CustomerType> customerTypeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_CUSTOMER_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                customerTypeList.add(new CustomerType(id,name));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerTypeList;
    }


}
