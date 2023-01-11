package service.customerService.impl;

import model.customer.Customer;
import repository.customerRepository.ICustomerRepository;
import repository.customerRepository.impl.CustomerRepository;
import service.customerService.ICustomerService;

import java.util.List;

public class CustomerService  implements ICustomerService {
    ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public List<Customer> displayCustomer() {
        return customerRepository.displayCustomer();
    }

    @Override
    public Boolean addCustomer(Customer customer) {
        return customerRepository.addCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return customerRepository.deleteCustomer(id);
    }

    @Override
    public boolean editCustomer(Customer customer) {
        return customerRepository.editCustomer(customer);
    }

    @Override
    public List<Customer> findCustomerByName(String customerName, String customerPhoneNumber, String customerType) {
        return customerRepository.findCustomerByName(customerName,customerPhoneNumber,customerType);
    }


}
