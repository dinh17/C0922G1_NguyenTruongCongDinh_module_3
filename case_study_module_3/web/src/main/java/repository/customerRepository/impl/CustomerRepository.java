package repository.customerRepository.impl;

import model.customer.Customer;
import model.customer.CustomerType;
import repository.BaseRepository;
import repository.customerRepository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    BaseRepository baseRepository = new BaseRepository();
    private final static String ADD_CUSTOMER = " insert into customer (customer_type_id,`name`,date_of_birth,gender,id_card,phone_number,email,address) value (?,?,?,?,?,?,?,?);  ";
    private final static String SELECT_ALL_CUSTOMER ="select c.*,ct.name as customer_type_name from customer c join customer_type ct on c.customer_type_id=ct.id ;";
    private final String DELETE_CUSTOMER = "delete from customer where id = ?;";
    private final String SQL_SAFE_UPDATES = "set sql_safe_updates = 0;";
    private final String FOREIGN_KEY_CHECKS = "set foreign_key_checks = 0;";
    private static final  String  EDIT_CUSTOMER = "update customer set customer_type_id = ?,name=?,date_of_birth=?,gender=?,id_card=?,phone_number=?,email=?,address=? where id = ?;";
    private final String FIND_CUSTOMER_BY_NAME = "select c.*,ct.name as customer_type_name from customer c join customer_type ct on c.customer_type_id = ct.id where c.name like ? and c.phone_number like ? and c.address like ?";

    @Override
    public List<Customer> displayCustomer() {
         List<Customer> customerList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet =preparedStatement.executeQuery();
            while(resultSet.next()){
                   int id = resultSet.getInt("id");
                   int customerTypeId =resultSet.getInt("customer_type_id");
                   String name =  resultSet.getString("name");
                   String dateOfBirth = resultSet.getString("date_of_birth");
                   Boolean gender = resultSet.getBoolean("gender");
                   String idCard = resultSet.getString("id_card");
                   String phoneNumber = resultSet.getString("phone_number");
                   String email = resultSet.getString("email");
                   String address = resultSet.getString("address");
                   String customerTypeName  = resultSet.getString("customer_type_name");
                CustomerType customerType = new CustomerType(customerTypeId,customerTypeName);

                customerList.add(new Customer(id,customerType,name,dateOfBirth,gender,idCard,phoneNumber,email,address));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return customerList;
    }

    @Override
    public Boolean addCustomer(Customer customer) {
     Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_CUSTOMER);
            preparedStatement.setInt(1,customer.getCustomerType().getId());
            preparedStatement.setString(2,customer.getName());
            preparedStatement.setString(3,customer.getDateOfBirth());
            preparedStatement.setBoolean(4,customer.isGender());
            preparedStatement.setString(5,customer.getIdCard());
            preparedStatement.setString(6,customer.getPhoneNumber());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getAddress());
           return preparedStatement.executeUpdate()>0 ;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false ;
    }

    @Override
    public boolean deleteCustomer(int id) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement1 = connection.prepareStatement(SQL_SAFE_UPDATES);
            preparedStatement1.executeUpdate();
            PreparedStatement preparedStatement2 = connection.prepareStatement(FOREIGN_KEY_CHECKS);
            preparedStatement2.executeUpdate();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1,id);
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean editCustomer(Customer customer) {

        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(EDIT_CUSTOMER);
            ps.setInt(1, customer.getCustomerType().getId());
            ps.setString(2, customer.getName());
            ps.setString(3, customer.getDateOfBirth());
            ps.setBoolean(4, customer.isGender());
            ps.setString(5, customer.getIdCard());
            ps.setString(6, customer.getPhoneNumber());
            ps.setString(7, customer.getEmail());
            ps.setString(8, customer.getAddress());
            ps.setInt(9, customer.getId());
            return ps.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return false;
    }

    @Override
    public List<Customer> findCustomerByName(String customerName, String customerPhoneNumber, String customerAddress) {
        Connection connection = baseRepository.getConnection();
        List<Customer> customerList = new ArrayList<>();
        try {
            PreparedStatement ps =connection.prepareStatement(FIND_CUSTOMER_BY_NAME);
            ps.setString(1,"%"+customerName+"%");
            ps.setString(2,"%"+customerPhoneNumber+"%");
            ps.setString(3,"%"+customerAddress+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                int customerTypeId = rs.getInt("customer_type_id");
                String customerTypeName = rs.getString("customer_type_name");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                boolean gender = rs.getBoolean("gender");
                String idCard = rs.getString("id_card");
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                Customer customer = new Customer(id,new CustomerType(customerTypeId,customerTypeName),name,dateOfBirth,gender,idCard,phoneNumber,email,address);
                customerList.add(customer);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customerList;
    }
}
