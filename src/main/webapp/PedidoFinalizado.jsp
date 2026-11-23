<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,tienda.*" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pedido Finalizado</title>
    <link rel="icon" type="image/ico" href="./img/gem.png" sizes="64x64">
    <link rel="stylesheet" type="text/css" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
    crossorigin="anonymous">
    <script src="funcionesCompra.js"></script>
</head>
<body>
    <mi-menu></mi-menu>

    <h1>LA COMPRA SE HA REALIZADO CON ÉXITO. </h1><br>
    <h1>¡GRACIAS POR SU COMPRA :)! </h1><br>
    <script> borrarCarrito() </script>
    <p> ¿Quieres seguir navegando por nuestra página? <a class="nav-link" id="navegar" href="index.html">PÁGINA DE INICIO</a>	
    <p> ¿Quieres cerrar sesión? <a class="nav-link" id="cerrar sesion" href="CerrarSesion.jsp">IR A CERRAR SESIÓN</a>

    <mi-pie></mi-pie>
    <script src="menu.js"></script>
    <script src="pie.js"></script>
</body>
</html>