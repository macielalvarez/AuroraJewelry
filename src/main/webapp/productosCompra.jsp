<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,tienda.*" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Carrito</title>
    <link rel="icon" type="image/ico" href="./img/gem.png" sizes="64x64">
    <link rel="stylesheet" type="text/css" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
    crossorigin="anonymous">
    <script src="funcionesCompra.js"></script>
    <script src="funcionesFormulario.js"></script>
</head>
<body>
    <mi-menu></mi-menu>
    <h1>PRODUCTOS EN EL CARRITO:</h1>
    <!-- Contenedor donde se mostrarán los productos del carrito -->
    <div id="carrito-container"></div>
    <h1 id="price-total"></h1>
    <script> mostrarCarrito() </script>

    <button onclick="generarTicketCompra()" class="styled-button">Generar Ticket</button>
    <button onclick="borrarCarrito()" class="styled-button">Borrar Carrito</button>
    <button class="styled-button" onclick="EnviarCarrito('RecogerCarrito.html','carrito-container', carrito)">Comprar</button>
    <button onclick="window.history.back()" class="styled-button">Volver atrás</button>
    <mi-pie></mi-pie>
    <script src="menu.js"></script>
    <script src="pie.js"></script>
</body>
</html>