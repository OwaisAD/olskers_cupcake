package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.entities.Admin;
import dat.startcode.model.entities.Customer;
import dat.startcode.model.entities.User;
import dat.startcode.model.exceptions.DatabaseException;
import dat.startcode.model.persistence.AdminMapper;
import dat.startcode.model.persistence.ConnectionPool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "addcredit", urlPatterns = {"/addcredit"} )
public class AddCredit extends HttpServlet
{
    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException
    {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        // You shouldn't end up here with a GET-request, thus you get sent back to frontpage
        doPost(request, response);
        response.sendRedirect("index.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        AdminMapper adminMapper = new AdminMapper(connectionPool);
        Customer customer;
        String email = request.getParameter("cus-email");
        int newCredit = Integer.parseInt(request.getParameter("amount"));

        try {
            customer = new Customer(email,newCredit);
            customer = adminMapper.newCreditCustomer(customer);
            List<Customer> customerList = adminMapper.checkCustomerList();
            session.setAttribute("customer",customer);
            session.setAttribute("customerlist",customerList);
            request.getRequestDispatcher("WEB-INF/customers.jsp").forward(request,response);
        } catch (DatabaseException e) {
            Logger.getLogger("web").log(Level.SEVERE, e.getMessage());
            request.setAttribute("errormessage", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    public void destroy()
    {

    }
}