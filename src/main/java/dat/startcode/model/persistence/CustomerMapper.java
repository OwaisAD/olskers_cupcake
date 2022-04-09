package dat.startcode.model.persistence;

import dat.startcode.model.dtos.OrderlineDescriptionDTO;
import dat.startcode.model.entities.*;
import dat.startcode.model.exceptions.DatabaseException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
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
    public Customer createProfile(Customer customer) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        boolean result = false;
        int newId = 0;
        String sql = "insert into user (email, password, credit, role) values (?,?,?,?)";
        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ps.setString(1, customer.getEmail());
                ps.setString(2, customer.getPassword());
                ps.setInt(3, customer.getCredit());
                ps.setString(4, customer.getRole());
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected == 1)
                {
                    result = true;
                } else
                {
                    throw new DatabaseException("Customer med email = " + customer.getEmail() + " kunne ikke oprettes i databasen");
                }
                ResultSet idResultset = ps.getGeneratedKeys();
                if (idResultset.next())
                {
                    newId = idResultset.getInt(1);
                    customer.setUserId(newId);
                } else
                {
                    customer = null;
                }
            }
        }
        catch (SQLException ex)
        {
            throw new DatabaseException(ex, "Kunne ikke indsætte låner i databasen");
        }
        return customer;
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
                    int credit = rs.getInt("credit");
                    customer = new Customer(email,password,credit, role);
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

    @Override
    public List<Bottom> getAllBottoms() throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        List<Bottom> getAllBottomsList = new ArrayList<>();

        String sql = "SELECT * FROM bottom";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)){

                ResultSet rs = ps.executeQuery();

                while(rs.next()) {
                    int bottomId = rs.getInt("bottom_id");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");

                    Bottom bottom = new Bottom(bottomId, name, price);
                    getAllBottomsList.add(bottom);
                    //System.out.println(getAllBottomsList.size());
                }
            }
        }
        catch (Exception ex) {
            throw new DatabaseException(ex, "Fejl under indlæsning af bottom tabellen fra databasen.");
        }
        return getAllBottomsList;
    }

    @Override
    public Bottom getBottomById(int bottomId) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        Bottom bottom = null;
        String sql = "SELECT * FROM bottom WHERE bottom_id = ?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)){

                ps.setInt(1, bottomId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String name = rs.getString("name");
                    int price = rs.getInt("price");

                    bottom = new Bottom(name, price);
                } else {
                    throw new DatabaseException("Bottom med bottomId = " + bottomId + " findes ikke");
                }
            }
        } catch (Exception ex)
        {
            throw new DatabaseException(ex, "Fejl under indlæsning af bottom tabellen fra databasen.");
        }
        return bottom;
    }

    @Override
    public List<Topping> getAllToppings() throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");
        List<Topping> getAllToppingsList = new ArrayList<>();

        String sql = "SELECT * FROM topping";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)){

                ResultSet rs = ps.executeQuery();

                while(rs.next()) {
                    int toppingId = rs.getInt("topping_id");
                    String name = rs.getString("name");
                    int price = rs.getInt("price");

                    Topping topping = new Topping(toppingId, name, price);
                    getAllToppingsList.add(topping);
                    //System.out.println(getAllBottomsList.size());
                }
            }
        }
        catch (Exception ex) {
            throw new DatabaseException(ex, "Fejl under indlæsning af bottom tabellen fra databasen.");
        }
        return getAllToppingsList;
    }

    @Override
    public Topping getToppingById(int toppingId) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        Topping topping = null;
        String sql = "SELECT * FROM topping WHERE topping_id = ?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)){

                ps.setInt(1, toppingId);
                ResultSet rs = ps.executeQuery();


                if (rs.next()) {
                    String name = rs.getString("name");
                    int price = rs.getInt("price");

                    topping = new Topping(name, price);
                } else {
                    throw new DatabaseException("Topping med toppingId = " + toppingId + " findes ikke");
                }
            }
        } catch (Exception ex)
        {
            throw new DatabaseException(ex, "Fejl under indlæsning af bottom tabellen fra databasen.");
        }
        return topping;
    }

    @Override
    public List<OrderlineDescriptionDTO> getCustermersOrders(String email) throws DatabaseException {
        Logger.getLogger("web").log(Level.INFO, "");

        List<OrderlineDescriptionDTO> customerOrders = new ArrayList<>();

        String sql = "SELECT email, order_id, l.quantity as antal, b.name as bname, t.name as tname, (b.price + t.price) AS stykpris " +
                "from user " +
                "inner join ordered as o " +
                "using (user_id) " +
                "inner join orderline as l " +
                "using (order_id) " +
                "inner join bottom as b " +
                "using (bottom_id) " +
                "inner join topping as t " +
                "using (topping_id) " +
                "where email = ?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setString(1, email);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {

                    int orderId = rs.getInt("order_id");
                    int antal = rs.getInt("antal");
                    String bname = rs.getString("bname");
                    String tname = rs.getString("tname");
                    int price = rs.getInt("stykpris");

                    customerOrders.add(new OrderlineDescriptionDTO(orderId, bname, tname, price, antal, (antal * price)));
                }
            }
        }
        catch (Exception ex) {
            throw new DatabaseException(ex, "Fejl under indlæsning af bottom tabellen fra databasen.");

        }

        return customerOrders;
    }

}
