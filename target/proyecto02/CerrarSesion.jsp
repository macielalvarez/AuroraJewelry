<%@page language="java" contentType="text/html;charset=UTF-8" import="tienda.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cerrar Sesión</title>
    <link rel="icon" type="image/ico" href="./img/gem.png" sizes="64x64">
    <link rel="stylesheet" type="text/css" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
    crossorigin="anonymous">
  </head>
    <body>
        <mi-menu></mi-menu>
        <%
            String user = (String)session.getAttribute("usuario");
            
            AccesoBD con = AccesoBD.getInstance();
            UsuarioBD usuarios = con.obtenerUsuarioEnBD(user);
        
            String usuario = usuarios.getUsuario();
            String clave = usuarios.getClave();
        %>
        <form  class="styled-form" method="post" action="CerrarSesion.html">
            <table class="formulario">
                <input type="hidden" name="url" value="usuario.jsp">
                <label> Usuario: <input type="text" name="usuario" maxlength="50" size=20 value="<%=usuario%>" readonly></label>
                <label> Clave: <input type="password" name="clave" maxlength="50" size=20 value="<%=clave%>" required></label> 
                <p>¿Quieres cerrar sesion <%=session.getAttribute("usuario") %>?<p>
                <input class="styled-button" type="submit" value="Aceptar">
                <input class="styled-button" type="button" onclick="window.history.back()" value="Volver atrás">
            </table>
        </form>

        <mi-pie></mi-pie>
        <script src="menu.js"></script>
        <script src="pie.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
        crossorigin="anonymous">
        </script>
    </body>
</html>