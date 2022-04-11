package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.dtos.BasketListDTO;
import dat.startcode.model.exceptions.DatabaseException;
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

@WebServlet(name = "openbasket", value = "/openbasket" )
public class OpenBasket extends HttpServlet
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

        List<BasketListDTO> updatedList = (List<BasketListDTO>) session.getAttribute("basketlist");

        if(!(updatedList == null)) {
        int totalPriceUpdated = 0;

        for (BasketListDTO i : updatedList) {
            totalPriceUpdated += (i.getBottom().getPrice() + i.getTopping().getPrice())*i.getAmount();
        }
            session.setAttribute("totalbasketlistprice", totalPriceUpdated);

        }

        request.getRequestDispatcher("WEB-INF/basket.jsp").forward(request, response);
    }

    public void destroy()
    {

    }
}