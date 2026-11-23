<%@page language="java" contentType="text/html;charset=UTF-8" import="tienda.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Iniciar Sesión</title>
  <link rel="icon" type="image/ico" href="./img/gem.png" sizes="64x64">
  <link rel="stylesheet" type="text/css" href="estilos.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
  crossorigin="anonymous">
</head>
<body>
    <mi-menu></mi-menu>
  <%
      //Utilizamos una variable en la sesión para informar de los mensajes de Error
      String mensaje = (String)session.getAttribute("mensaje");
      if (mensaje != null) { // Eliminamos el mensaje consumido
        session.removeAttribute("mensaje");

	%>
	<h1> <%=mensaje%> </h1>
	<%
      }
        if ((session.getAttribute("usu") == null) ||
            ((Integer)session.getAttribute("usu") <=0 ))
      {
	%>
    <p>&iquest; Necesitas ayuda? Ponte en contacto con nuestro departamento de atencion al cliente en el numero de telefono&nbsp;<a href="tel:+34 678934456">678 93 44 56</a></p> 
    <div class="container mt-5">
        <div class="row justify-content-center">
          <div class="col-md-6">
            <form method="post" class="styled-form" action="login.html">
            <input type="hidden" name="url" value="Resguardo.jsp">
              <div class="mb-3">
                <label id="usuario1" for="usuario" class="form-label">Usuario:</label>
                <input type="text" class="form-control" id="usuario" name="usuario" maxlength="50" size="20" required>
              </div>
              <div class="mb-3">
                <label for="contrasena" class="form-label">Contraseña:</label>
                <input type="password" class="form-control" id="contrasena" name="contrasena" maxlength="50" size="20" required>
              </div>
              <button type="submit" class="styled-button">Iniciar Sesión</button>
              <button onclick="window.history.back()" class="styled-button">Volver atrás</button>

            </form>
          </div>
        </div>
      </div>
    <p> &iquest;No tienes cuenta? <a class="nav-link" id="registrar" href="usuario_registro.jsp">Crear Cuenta</a>	
  <%
    }
      else { //Si existe un usuario, se muestran las opciones del apartado del usuario
        response.sendRedirect("Resguardo.jsp");      
	%>

  <%
      }
  %>

    <mi-pie></mi-pie>
    <script src="menu.js"></script>
    <script src="pie.js"></script>
    <script src="funcionesFormulario.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
    crossorigin="anonymous"></script>
</body>
</html>
