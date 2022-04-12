package dat.startcode.model.persistence;

import dat.startcode.model.dtos.OrderlineDescriptionDTO;
import dat.startcode.model.entities.*;
import dat.startcode.model.exceptions.DatabaseException;

import java.util.List;

public interface ICustomerMapper
{
    public Customer createProfile(Customer customer) throws DatabaseException;
    public Customer login(String email, String password) throws DatabaseException;

    public Customer getCustomerByEmail(String email) throws DatabaseException;

    public Order createOrder(Order order) throws DatabaseException;
    public Orderline createOrderline(Orderline orderline) throws DatabaseException;

    public boolean payForOrder(int totalPriceForCupcakes, int customerCredit) throws DatabaseException;
    public Order checkOrder() throws DatabaseException;
    public List<Bottom> getAllBottoms() throws DatabaseException;
    public Bottom getBottomById(int bottomId) throws DatabaseException;
    public List<Topping> getAllToppings() throws DatabaseException;
    public Topping getToppingById(int toppingId) throws DatabaseException;
    public List<OrderlineDescriptionDTO> getCustermersOrders(String email) throws DatabaseException;

}
