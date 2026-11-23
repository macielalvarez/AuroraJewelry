package tienda;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet{

    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Nombre del usuario
        String usuario = request.getParameter("usuario");
    
        // Clave
        String clave = request.getParameter("contrasena");
    
        // URL a la que debemos volver
    
        String url = request.getParameter("url");
    
        // Accedemos al entorno de sesión y si no está creado lo creamos
    
        HttpSession session = request.getSession(true);
    
        AccesoBD con = AccesoBD.getInstance();
    
        if ((usuario != null) && (clave != null)) {
            int codigo = con.comprobarUsuarioBD(usuario,clave);
            if (codigo>0) {
                session.setAttribute("usuario",usuario);
                response.sendRedirect(url);
            }
            else {
                session.setAttribute("mensaje","Usuario y/o clave incorrectos");
                response.sendRedirect("usuario.jsp"); // Redirigir de vuelta a la página de inicio de sesión
            }
        }
        else{
            // Si el usuario o la clave son nulos, establecer mensaje de error en la sesión
            session.setAttribute("mensaje", "Usuario y/o clave no proporcionados");
            response.sendRedirect("usuario.jsp"); 
        }    
    }
    
}
