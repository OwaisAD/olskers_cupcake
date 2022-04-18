package dat.startcode.control;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminNavigation", value = "/AdminNavigation")
public class AdminNavigation extends HttpServlet {

    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String handling = request.getParameter("handling");
        log(handling);
        if (handling.equals("Ordrer")) {
            request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
        }
        if (handling.equals("Kunder")) {
            request.getRequestDispatcher("WEB-INF/customers.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
