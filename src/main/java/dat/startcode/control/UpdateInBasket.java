package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.dtos.BasketListDTO;
import dat.startcode.model.persistence.ConnectionPool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "updateinbasket", urlPatterns = {"/updateinbasket"} )
public class UpdateInBasket extends HttpServlet
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

        String bottomname = request.getParameter("bottomname");
        String toppingname = request.getParameter("toppingname");


        //change amount in list

        int getNewAmount = Integer.parseInt(request.getParameter("newamount"));

        for (BasketListDTO listDTO : updatedList) {
            if(listDTO.getBottom().getName().equals(bottomname) && listDTO.getTopping().getName().equals(toppingname)) {
                if(getNewAmount == 0) {
                    updatedList.remove(listDTO);
                } else {
                    listDTO.setAmount(getNewAmount);
                }
                break;
            }
        }

        // update the total price as well
        int totalPriceUpdated = 0;

        for (BasketListDTO i : updatedList) {
            totalPriceUpdated += (i.getBottom().getPrice() + i.getTopping().getPrice())*i.getAmount();
        }


        session.setAttribute("totalbasketlistprice", totalPriceUpdated);
        session.setAttribute("basketlist", updatedList);
        request.getRequestDispatcher("WEB-INF/basket.jsp").forward(request, response);
    }

    public void destroy()
    {

    }
}