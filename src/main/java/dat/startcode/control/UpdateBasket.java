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

@WebServlet(name = "updatebasket", urlPatterns = {"/updatebasket"})
public class UpdateBasket extends HttpServlet {
    private ConnectionPool connectionPool;

    @Override
    public void init() throws ServletException {
        this.connectionPool = ApplicationStart.getConnectionPool();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // You shouldn't end up here with a GET-request, thus you get sent back to frontpage
        doPost(request, response);
        response.sendRedirect("index.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();

        //cupcake antal som brugeren har ændret til

        List<BasketListDTO> updatedList = (List<BasketListDTO>) session.getAttribute("basketlist");

        int newAmount = Integer.parseInt(request.getParameter("newamount"));


        //lille trick til at hente 2 values fra td'er som er hidden
        String bottomname = request.getParameter("bottomname");
        String toppingname = request.getParameter("toppingname");

        for (BasketListDTO basketObj : updatedList) {
            if (basketObj.getBottom().getName().equals(bottomname) && basketObj.getTopping().getName().equals(toppingname)) {
                if (newAmount == 0) {
                    updatedList.remove(basketObj);
                } else {
                    basketObj.setAmount(newAmount);
                }
                break;
            }
        }
        System.out.println(updatedList);


        session.setAttribute("basketlist", updatedList);
        request.getRequestDispatcher("WEB-INF/basket.jsp").forward(request, response);
    }

    public void destroy() {

    }
}