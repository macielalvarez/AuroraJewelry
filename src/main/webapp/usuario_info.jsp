<%@page language="java" contentType="text/html;charset=UTF-8" import="tienda.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mi perfil</title>
    <link rel="icon" type="image/ico" href="./img/gem.png" sizes="64x64">
    <link rel="stylesheet" type="text/css" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
    crossorigin="anonymous">
  </head>
  <body>
    <mi-menu></mi-menu>
    <h1> Bienvenid@ <%=session.getAttribute("usuario") %></h1>
    <div class="d-flex justify-content-center">
        <nav id="smenu" class="navbar navbar-expand-md navbar-dark bg-white">
            <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExampleDefault">
                <span class="navbar-toggler-icon"></span>			
            </button>
            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav me-auto">
                <li class="opciones"><a href="Modificar.jsp"> MODIFICAR DATOS </a></li> </br>
                <li class="opciones"><a href="Pedido.jsp" > PEDIDO </a></li> </br>
                <li class="opciones"><a href="CerrarSesion.jsp" > CERRAR SESIÓN </a></li> </br>
                </ul>
            </div>
            </div>
        </nav>
    </div>

    <div>
        <%
            String usuario = (String)session.getAttribute("usuario");
            AccesoBD con = AccesoBD.getInstance();
            UsuarioBD usuarios = con.obtenerUsuarioEnBD(usuario);
        
            String usu = usuarios.getUsuario();
            String clave = usuarios.getClave();
            String nombre = usuarios.getNombre();
            String apellidos = usuarios.getApellidos();
            String domicilio = usuarios.getDomicilio();
            String poblacion = usuarios.getPoblacion();
            String provincia = usuarios.getProvincia();
            String cp = usuarios.getCp();
            String telefono = usuarios.getTelefono();
		%>

        <table class="formulario">
        <th><h3>MI CUENTA</h3></th>  
        <tr class="row1">
            <td colspan="2"><img src="./img/usu_log.jpeg" alt="foto" width="200" height="200"></td>
        </tr>
        <tr class="row2">
            <td>Usuario: </td>
            <td><%=usu %></td>
        </tr>
        <tr class="row1">
            <td>Contraseña: </td>
            <td><%=clave%></td>
        </tr>
        <tr class="row2">
            <td>Nombre: </td>
            <td><%=nombre%></td>
        </tr>
        <tr class="row1">
            <td>Apellidos: </td>
            <td><%=apellidos%></td>
        </tr>
        <tr class="row2">
            <td>Domicilio: </td>
            <td><%=domicilio%></td>
        </tr>
        <tr class="row1">
            <td>Población: </td>
            <td><%=poblacion%></td>
        </tr>
        <tr class="row2">
            <td>Provincia: </td>
            <td><%=provincia%></td>
        </tr>
        <tr class="row1">
            <td>CP: </td>
            <td><%=cp%></td>
        </tr>  
        <tr class="row2">
            <td> Número de Teléfono: </td>
            <td><%=telefono%></td>
        </tr>
        </table>
    </div>

    <mi-pie></mi-pie>
    <script src="menu.js"></script>
    <script src="pie.js"></script>
    <script src="funcionesFormulario.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
    crossorigin="anonymous"></script>
  </body>
</html>
