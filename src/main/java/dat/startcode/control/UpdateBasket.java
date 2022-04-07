package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.dtos.BasketListDTO;
import dat.startcode.model.entities.Bottom;
import dat.startcode.model.entities.Cupcake;
import dat.startcode.model.entities.Topping;
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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "updatebasket", urlPatterns = {"/updatebasket"} )
public class UpdateBasket extends HttpServlet
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

        //antallet af cupcake brugeren vil slette

        List<BasketListDTO> updatedList = (List<BasketListDTO>) session.getAttribute("basketlist");
        System.out.println(updatedList);

        String fullnameid = request.getParameter("fullnameid");
        int amountToDelete = Integer.parseInt(request.getParameter("amounttodelete"));
        System.out.println(amountToDelete);

        //lille trick til at hente 2 values fra td'er som er hidden
        String bottomname = request.getParameter("bottomname");
        String toppingname = request.getParameter("toppingname");


        boolean existing = false;
        for (BasketListDTO basketObj : updatedList) {
            if(!(basketObj.getBottom().getName().equals(bottomname) && basketObj.getTopping().getName().equals(toppingname)))
                continue;

            if(basketObj.getAmount() <= amountToDelete) {
                updatedList.remove(basketObj);
            } else {
                basketObj.setAmount(basketObj.getAmount()-amountToDelete);
            }
            break;
        }

        System.out.println(updatedList);

        //tilføje??

        session.setAttribute("basketlist", updatedList);
        request.getRequestDispatcher("WEB-INF/basket.jsp").forward(request, response);
    }

    public void destroy()
    {

    }
}