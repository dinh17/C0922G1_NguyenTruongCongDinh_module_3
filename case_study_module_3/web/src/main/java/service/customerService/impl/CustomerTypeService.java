package service.customerService.impl;

import model.customer.CustomerType;
import repository.customerRepository.ICustomerTypeRepository;
import repository.customerRepository.impl.CustomerTypeRepository;
import service.customerService.ICustomerTypeService;

import java.util.List;

public class CustomerTypeService implements ICustomerTypeService {
    ICustomerTypeRepository customerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<CustomerType> findAllCustomerType() {
        return customerTypeRepository.findAllCustomerType();
    }
}
