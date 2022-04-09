package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.dtos.OrderlineDescriptionDTO;
import dat.startcode.model.exceptions.DatabaseException;
import dat.startcode.model.persistence.ConnectionPool;
import dat.startcode.model.persistence.CustomerMapper;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProfilNavigation", value = "/ProfilNavigation")
public class ProfilNavigation extends HttpServlet {

    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        CustomerMapper customerMapper = new CustomerMapper(connectionPool);

        String email = (String) session.getAttribute("email");
        System.out.println(email);

        try {
            List<OrderlineDescriptionDTO> list = customerMapper.getCustermersOrders(email);
            session.setAttribute("list",list);
            System.out.println(list.size());
            request.getRequestDispatcher("WEB-INF/profil.jsp").forward(request,response);
        } catch (DatabaseException e) {
            e.printStackTrace();
            request.getRequestDispatcher("WEB-INF/cupcakefactory.jsp").forward(request,response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
