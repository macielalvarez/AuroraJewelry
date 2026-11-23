<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,tienda.*" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Productos</title>
    <link rel="icon" type="image/ico" href="./img/gem.png" sizes="64x64">
    <link rel="stylesheet" type="text/css" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
    crossorigin="anonymous">
  </head>
  <body>
    <mi-menu></mi-menu>
    <div class="container">
      <div class="row">
        <%
          AccesoBD con = AccesoBD.getInstance();
          List<ProductoBD> productos = con.obtenerProductosBD();
          for (ProductoBD producto : productos) {
            int codigo = producto.getCodigo();
            String nombre = producto.getNombre();
            String descripcion = producto.getDescripcion();
            float precio = producto.getPrecio();
            String imagen = producto.getImagen();
            int existencias = producto.getExistencias();
        %>
        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
          <article id="articulo<%=codigo%>" style="text-align: center;"> 
            <img src="<%=imagen%>" alt="<%=nombre%>" class="img-thumbnail" style="border: none;">
            <div id="nombre<%=codigo%>" class="nombre"><%=nombre%></div>
            <div class="descripcion"><%=descripcion%></div>
            <div id="precio<%=codigo%>" class="precio"><%=precio%>€</div>
            <input type="number" id="existencias<%=codigo%>" class="form-control" value="1" min="1" max="<%=existencias%>">
            <% if (existencias > 0) { %>
              <button type="button" class="styled-button" onclick="anadirCarrito('<%=codigo%>', '<%=nombre%>','<%=precio%>', '<%=existencias%>')">Comprar</button>
              <% } else { %>
            &nbsp;
            <% } %>
          </article>
        </div>
        <% } %>
      </div>
    </div>
    <mi-pie></mi-pie>
    <script src="menu.js"></script>
    <script src="pie.js"></script>
    <script src="funcionesCompra.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" 
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" 
    crossorigin="anonymous"></script>
  </body>
</html>
