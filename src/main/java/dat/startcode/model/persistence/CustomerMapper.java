package dat.startcode.model.persistence;

import dat.startcode.model.entities.Cupcake;
import dat.startcode.model.entities.Customer;
import dat.startcode.model.entities.Order;
import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CustomerMapper implements ICustomerMapper
{
    ConnectionPool connectionPool;

    public CustomerMapper(ConnectionPool connectionPool)
    {
        this.connectionPool = connectionPool;
    }


    @Override
    public Customer createProfile(String email, String password) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        boolean result = false;
        int newId = 0;
        String sql = "insert into user (email, password, credit, role) values (?,?,?,?)";
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ps.setString(1, email);
                ps.setString(2, password);
                ps.setInt(3, 100); // ? lidt usikker på vores sql query + credit
                ps.setString(4, "Customer");
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 1)
                {
                    result = true;
                } else
                {
                    //skal det være sådan her ? burde vi have et customer objekt ind som paramater? som vi får fra servlet?
                    //throw new DatabaseException("Customer med email = " + customer.getEmail() + " kunne ikke oprettes i databasen");
                }
                ResultSet idResultset = ps.getGeneratedKeys();
                if (idResultset.next())
                {
                    newId = idResultset.getInt(1);
                    laaner.setLaaner_id(newId);
                } else
                {
                    laaner = null;
                }
            }
        }
        catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Kunne ikke indsætte låner i databasen");
        }
        return laaner;


    }

    @Override
    public Customer login(String email, String password) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO,"");

        Customer customer;

        String sql = "SELECT * FROM user WHERE email = ? AND password = ?";

        try (Connection connection = connectionPool.getConnection()){
            try (PreparedStatement ps = connection.prepareStatement(sql)){
                ps.setString(1,email);
                ps.setString(2,password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String role = rs.getString("role");
                    customer = new Customer(email,password,role);
                } else {
                    throw new DatabaseException("Forkert brugernavn og/eller kodeord");
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex,"Noget gik forkert");
        }

        return customer;
    }

    @Override
    public Order placeOrder(Cupcake cupcake, int amount) throws DatabaseException {
        return null;
    }

    @Override
    public boolean payForOrder(int totalPriceForCupcakes, int customerCredit) throws DatabaseException {
        return false;
    }

    @Override
    public Order checkOrder() throws DatabaseException {
        return null;
    }
}
