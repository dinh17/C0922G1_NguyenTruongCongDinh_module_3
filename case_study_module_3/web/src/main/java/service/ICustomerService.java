package service;

import model.customer.Customer;

import java.util.List;

public interface ICustomerService {

    List<Customer> displayCustomer();
    Boolean addCustomer(Customer customer);
    boolean deleteCustomer(int id);
    boolean editCustomer(Customer customer);
}
