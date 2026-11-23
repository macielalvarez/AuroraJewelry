package tienda;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CerrarSesion extends HttpServlet{
    public CerrarSesion() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usuario = request.getParameter("usuario"); //Nombre del usuario
		String clave = request.getParameter("clave"); //Clave
		
		HttpSession session = request.getSession(true); //Accedemos al entorno de sesion
		AccesoBD con = AccesoBD.getInstance();
		if((usuario != null) && (clave !=null)){
			int codigo = con.comprobarUsuarioBD(usuario,clave);
			System.out.println(codigo);
			if(codigo>0) {
				session.invalidate();
				response.sendRedirect("usuario.jsp");
			}
			else {
				session.setAttribute("mensaje", "Usuario y/o clave incorrectos");
			}
		}
	}
    
}
