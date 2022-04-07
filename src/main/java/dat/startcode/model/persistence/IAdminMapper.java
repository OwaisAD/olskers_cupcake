package dat.startcode.model.persistence;

import dat.startcode.model.dtos.OrderListDTO;
import dat.startcode.model.entities.Admin;
import dat.startcode.model.entities.Customer;
import dat.startcode.model.exceptions.DatabaseException;

import java.util.List;

public interface IAdminMapper
{
    public Admin login(String email, String password) throws DatabaseException;
    public List<Customer> checkCustomerList() throws DatabaseException;
    public List<OrderListDTO> getOrderList() throws DatabaseException;
    public Customer newCreditCustomer(Customer customer) throws DatabaseException;

}
