package tienda;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Registro extends HttpServlet{

    public Registro() {
        super();
        
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getParameter("url");
		String usuario = request.getParameter("usuario"); 
		String clave = request.getParameter("clave"); 
		String nombre = request.getParameter("nombre"); 
		String apellidos = request.getParameter("apellidos");
		String domicilio = request.getParameter("domicilio");
		String poblacion = request.getParameter("poblacion");
		String provincia = request.getParameter("provincia");
		String cp = request.getParameter("cp");
		String telefono = request.getParameter("telefono");
		
		
		HttpSession session = request.getSession(true); //Accedemos al entorno de sesion
		AccesoBD con = AccesoBD.getInstance();
		
		if((usuario != null)){
			int codigo = con.comprobarUsuarioRegistradoEnBD(usuario);
			if(codigo>0) {
				session.setAttribute("mensaje", "Usuario ya existente. Cambia el usuario");
				response.sendRedirect(url);
			}
			else {
				con.registrarUsuario(usuario, clave, nombre, apellidos, domicilio, poblacion, provincia, cp, telefono);
				session.setAttribute("mensaje", "Usuario registrado");
				response.sendRedirect(url);
			}
		}
		
	}
    
}
