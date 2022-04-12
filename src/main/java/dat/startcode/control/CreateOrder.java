package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.dtos.BasketListDTO;
import dat.startcode.model.entities.Cupcake;
import dat.startcode.model.entities.Customer;
import dat.startcode.model.entities.Order;
import dat.startcode.model.entities.Orderline;
import dat.startcode.model.exceptions.DatabaseException;
import dat.startcode.model.persistence.ConnectionPool;
import dat.startcode.model.persistence.CustomerMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "createorder", urlPatterns = {"/createorder"} )
public class CreateOrder extends HttpServlet
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
        Customer customer = null;
        CustomerMapper customerMapper = new CustomerMapper(connectionPool);

        // get the list from session scope
        List<BasketListDTO> updatedList = (List<BasketListDTO>) session.getAttribute("basketlist");
        System.out.println(updatedList);
        //get the customer by email
        String email = (String) session.getAttribute("email");

        Orderline orderline = null;

        int totalFinPrice = (int) session.getAttribute("totalbasketlistprice");

        // used to clear
        Cupcake cupcake = (Cupcake) session.getAttribute("cupcake");

        try
        {
            session = request.getSession();
            customer = customerMapper.getCustomerByEmail(email);
            int customerId = customer.getUserId();

            //createOrder fra customermapper
            Order order = new Order(customerId, false);
            order = customerMapper.createOrder(order);
            int orderId = order.getOrderId();

            //place order fra customerMapper
            // iterer over basket list fra sessionscope og lav orderlines for product

            for (BasketListDTO i : updatedList) {
                int quantity = i.getAmount();
                int totalPrice = (i.getBottom().getPrice()+i.getTopping().getPrice())*quantity;
                int bottomId = (i.getBottom().getBottomId());
                int toppingId = (i.getTopping().getToppingId());

                orderline = new Orderline(orderId, quantity, totalPrice, bottomId, toppingId);
                System.out.println("This orderline will be inserted in the orderlines table: " + orderline);
                customerMapper.createOrderline(orderline);
            }

            // updateCustomerBalance
            Customer newCustomer = customerMapper.updateCustomerBalance(customer, totalFinPrice);

            updatedList.clear();
            session.setAttribute("basketlist", updatedList);
            session.setAttribute("customer", newCustomer);
            cupcake = null;
            session.setAttribute("cupcake", cupcake);
            session.setAttribute("amount", 0);
            session.setAttribute("pricetotal", 0);


            //send til profil side
            request.getRequestDispatcher("ProfilNavigation").forward(request, response);
        }
        catch (DatabaseException e)
        {
            Logger.getLogger("web").log(Level.SEVERE, e.getMessage());
            request.setAttribute("errormessage", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    public void destroy()
    {

    }
}