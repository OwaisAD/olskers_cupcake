package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.dtos.OrderlineDescriptionDTO;
import dat.startcode.model.exceptions.DatabaseException;
import dat.startcode.model.persistence.AdminMapper;
import dat.startcode.model.persistence.ConnectionPool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderDescription", value = "/OrderDescription")
public class OrderDescription extends HttpServlet {

    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // You shouldn't end up here with a GET-request, thus you get sent back to frontpage
        doPost(request, response);
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        response.setContentType("text/html");

        AdminMapper adminMapper = new AdminMapper(connectionPool);
        try {
            List<OrderlineDescriptionDTO> orderlineDescriptionDTO = adminMapper.descriptionOfOrder(orderId);
            request.setAttribute("orderlineDescriptionDTO", orderlineDescriptionDTO);
        } catch (DatabaseException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);


    }
}
