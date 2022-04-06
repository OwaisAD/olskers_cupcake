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
        Logger.getLogger("web").log(Level.INFO,"");

        Admin admin;

        String sql = "SELECT * FROM user WHERE email = ? AND password = ?";

        try (Connection connection = connectionPool.getConnection()){
            try (PreparedStatement ps = connection.prepareStatement(sql)){
                ps.setString(1,email);
                ps.setString(2,password);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    String role = rs.getString("role");
                    admin = new Admin(email,password,role);
                } else {
                    throw new DatabaseException("Forkert brugernavn og/eller kodeord");
                }
            }
        } catch (SQLException ex) {
            throw new DatabaseException(ex,"Noget gik forkert");
        }

        return admin;
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
