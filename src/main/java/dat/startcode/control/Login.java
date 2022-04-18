package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.dtos.OrderlineDescriptionDTO;
import dat.startcode.model.entities.Bottom;
import dat.startcode.model.entities.Customer;
import dat.startcode.model.entities.Topping;
import dat.startcode.model.entities.User;
import dat.startcode.model.dtos.AllOrderlinesDTO;
import dat.startcode.model.dtos.OrderListDTO;
import dat.startcode.model.entities.Admin;
import dat.startcode.model.entities.Customer;
import dat.startcode.model.exceptions.DatabaseException;
import dat.startcode.model.persistence.AdminMapper;
import dat.startcode.model.persistence.ConnectionPool;
import dat.startcode.model.persistence.CustomerMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class Login extends HttpServlet {
    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
        List<AllOrderlinesDTO> aOLD = new ArrayList<>();
        AdminMapper adminMapper = new AdminMapper(connectionPool);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // You shouldn't end up here with a GET-request, thus you get sent back to frontpage
        doPost(request, response);
        response.sendRedirect("index.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        session.setAttribute("user", null); // adding empty user object to session scope
        CustomerMapper customerMapper = new CustomerMapper(connectionPool);
        Customer customer;
        AdminMapper adminMapper = new AdminMapper(connectionPool);
        Admin admin;
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        log("email og password: " + email + " " + password);

        List<Bottom> bottomsList = null;
        List<Topping> toppingsList = null;

        try {
            customer = customerMapper.login(email, password);
            session = request.getSession();
            session.setAttribute("customer", customer); // adding user object to session scope

            log("##" + customer);

            bottomsList = customerMapper.getAllBottoms();
            getServletContext().setAttribute("bottomlist", bottomsList);

            toppingsList = customerMapper.getAllToppings();
            getServletContext().setAttribute("toppinglist", toppingsList);

            session.setAttribute("email", customer.getEmail());
            String role = customer.getRole();
            if (role.equals("Customer")) {
                request.getRequestDispatcher("WEB-INF/cupcakefactory.jsp").forward(request, response);
            } else {
                // Når admin logger ind
                List<OrderlineDescriptionDTO> orderlineDescriptionDTOS = adminMapper.getOrderlineDescription();
                List<OrderListDTO> orderListDTOS = adminMapper.getOrderList();
                List<Customer> customerList = adminMapper.checkCustomerList();
                admin = adminMapper.login(email, password);
                session.setAttribute("orderlineDescription", orderlineDescriptionDTOS);
                session.setAttribute("orderlist", orderListDTOS);
                session.setAttribute("customerlist", customerList);
                session.setAttribute("admin", admin);
                request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
            }

        } catch (DatabaseException e) {
            Logger.getLogger("web").log(Level.SEVERE, e.getMessage());
            request.setAttribute("errormessage", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    public void destroy() {

    }
}