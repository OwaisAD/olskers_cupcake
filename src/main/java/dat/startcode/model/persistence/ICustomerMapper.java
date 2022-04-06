package dat.startcode.model.persistence;

import dat.startcode.model.entities.*;
import dat.startcode.model.exceptions.DatabaseException;

import java.util.List;

public interface ICustomerMapper
{
    public Customer createProfile(Customer customer) throws DatabaseException;
    public Customer login(String email, String password) throws DatabaseException;
    public Order placeOrder(Cupcake cupcake, int amount) throws DatabaseException;
    public boolean payForOrder(int totalPriceForCupcakes, int customerCredit) throws DatabaseException;
    public Order checkOrder() throws DatabaseException;
    public List<Bottom> getAllBottoms() throws DatabaseException;
    public List<Topping> getAllToppings() throws DatabaseException;
}
