package tienda;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Tramitacion extends HttpServlet{

    public Tramitacion() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String usuario = (String) session.getAttribute("usuario");

		AccesoBD con = AccesoBD.getInstance();
		@SuppressWarnings("unchecked")
        ArrayList <Producto> carrito = (ArrayList <Producto>) session.getAttribute("productosCompra");
		
		if((usuario != null)) {
			int codigo = con.comprobarUsuarioRegistradoEnBD(usuario);
			if(codigo > 0) {
				int codigop =con.registrarPedidoEnBD(codigo, carrito);
				
				con.registrarDetallePedidoEnBD(codigop, carrito);

				response.sendRedirect("PedidoFinalizado.jsp");
			}
			else {
				session.setAttribute("mensaje", "Usuario no existe");
				response.sendRedirect("usuario_registro.jsp");
			}
		}
	}
    
}
