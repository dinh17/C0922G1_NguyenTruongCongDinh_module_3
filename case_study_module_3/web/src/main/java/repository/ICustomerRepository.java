package repository;

import model.customer.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> displayCustomer();
    Boolean addCustomer(Customer customer);
     boolean deleteCustomer(int id);
    boolean editCustomer(Customer customer);
}
