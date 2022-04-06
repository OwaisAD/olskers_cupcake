package dat.startcode.model.persistence;

import dat.startcode.model.entities.Cupcake;
import dat.startcode.model.entities.Customer;
import dat.startcode.model.entities.Order;
import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;

public interface ICustomerMapper
{
    public Customer createProfile(Customer customer) throws DatabaseException;
    public Customer login(String email, String password) throws DatabaseException;
    public Order placeOrder(Cupcake cupcake, int amount) throws DatabaseException;
    public boolean payForOrder(int totalPriceForCupcakes, int customerCredit) throws DatabaseException;
    public Order checkOrder() throws DatabaseException;

}
