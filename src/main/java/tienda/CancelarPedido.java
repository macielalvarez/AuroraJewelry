package tienda;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CancelarPedido extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AccesoBD con = AccesoBD.getInstance();
        Integer variable = Integer.parseInt(request.getParameter("idPedido"));
        
        con.cancelarPedido(variable);

        response.sendRedirect("Pedido.jsp");
	}
    
}
