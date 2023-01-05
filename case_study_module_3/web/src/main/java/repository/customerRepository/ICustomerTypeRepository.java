package repository.customerRepository;

import model.customer.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository {
 List<CustomerType> findAllCustomerType();
}
