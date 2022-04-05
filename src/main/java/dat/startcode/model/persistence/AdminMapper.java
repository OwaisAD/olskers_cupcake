package dat.startcode.model.persistence;

import dat.startcode.model.entities.Admin;
import dat.startcode.model.entities.Customer;
import dat.startcode.model.entities.Order;
import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AdminMapper implements IAdminMapper
{
    ConnectionPool connectionPool;

    public AdminMapper(ConnectionPool connectionPool)
    {
        this.connectionPool = connectionPool;
    }


    @Override
    public Admin login(String email, String password) throws DatabaseException {
        return null;
    }

    @Override
    public List<Customer> checkCustomerList() throws DatabaseException {
        return null;
    }

    @Override
    public List<Order> checkOrderList() throws DatabaseException {
        return null;
    }
}
