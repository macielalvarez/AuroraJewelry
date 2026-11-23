package tienda;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Modificar extends HttpServlet{
    
    public Modificar() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("usuario"); 
		String clave = request.getParameter("clave");
		String nombre = request.getParameter("nombre");
		String apellidos = request.getParameter("apellidos");
		String domicilio = request.getParameter("domicilio");
		String poblacion = request.getParameter("poblacion");
		String provincia = request.getParameter("provincia");
		String cp = request.getParameter("cp");
		String tel = request.getParameter("telefono");
		
		HttpSession session = request.getSession(true);
		
		AccesoBD con = AccesoBD.getInstance();

		if((usuario != null)&&(clave!=null)) {
			int codigo = con.comprobarUsuarioRegistradoEnBD(usuario);
			if(codigo > 0) {
				con.modificarUsuarioEnBD(usuario, clave, nombre, apellidos, domicilio, poblacion, provincia, cp, tel);
				session.setAttribute("mensaje", "Usuario modificado");
				response.sendRedirect("usuario_info.jsp");
			}
			else {
				session.setAttribute("mensaje", "Usuario no se encuentra en la base de datos");
				response.sendRedirect("usuario.jsp");
			}
		}
	}
}
