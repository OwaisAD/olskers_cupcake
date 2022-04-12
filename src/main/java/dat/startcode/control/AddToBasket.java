package dat.startcode.control;

import dat.startcode.model.config.ApplicationStart;
import dat.startcode.model.dtos.BasketListDTO;
import dat.startcode.model.entities.Bottom;
import dat.startcode.model.entities.Cupcake;
import dat.startcode.model.entities.Topping;
import dat.startcode.model.entities.User;
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

@WebServlet(name = "addtobasket", urlPatterns = {"/addtobasket"} )
public class AddToBasket extends HttpServlet
{
    private ConnectionPool connectionPool;
    int amount = 0;
    static int pricetotal = 0;
    List<BasketListDTO> basketList = new ArrayList<>();

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
        HttpSession session;
        int bottomId = Integer.parseInt(request.getParameter("bottoms"));
        int toppingId = Integer.parseInt(request.getParameter("toppings"));
        int currAmount = Integer.parseInt(request.getParameter("amount"));
        amount += currAmount;

        try {
            session = request.getSession();
            CustomerMapper customerMapper = new CustomerMapper(connectionPool);

            Bottom bottom = customerMapper.getBottomById(bottomId);
            System.out.println(bottom);
            Topping topping = customerMapper.getToppingById(toppingId);
            System.out.println(topping);
            Cupcake cupcake = new Cupcake(bottom, topping);

            pricetotal += cupcake.getPrice()*currAmount;

            BasketListDTO basketListDTO = new BasketListDTO(bottom, topping, currAmount);
            System.out.println(basketListDTO);

            //iterer over vores liste
            // sammenlign bund og topping
            //findes de allerede så tilføj antallet kun
            boolean existing = false;
            for (BasketListDTO listDTO : basketList) {
                if(listDTO.getBottom().getName().equals(basketListDTO.getBottom().getName()) && listDTO.getTopping().getName().equals(basketListDTO.getTopping().getName())) {
                    listDTO.setAmount(listDTO.getAmount()+currAmount);
                    existing = true;
                }
                if(existing) {
                    break;
                }
            }
            if(!existing) {
                basketList.add(basketListDTO);
            }

            session.setAttribute("basketlist", basketList);
            session.setAttribute("amount", amount);
            session.setAttribute("pricetotal", pricetotal);
            session.setAttribute("cupcake", cupcake);
        }
        catch (DatabaseException e)
        {
            Logger.getLogger("web").log(Level.SEVERE, e.getMessage());
            request.setAttribute("errormessage", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

        request.getRequestDispatcher("WEB-INF/cupcakefactory.jsp").forward(request, response);
    }

    public void destroy()
    {

    }
}