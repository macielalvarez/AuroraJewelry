<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,tienda.*" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cancelar Pedido</title>
    <link rel="icon" type="image/ico" href="./img/gem.png" sizes="64x64">
    <link rel="stylesheet" type="text/css" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
    crossorigin="anonymous">
</head>
<body>
    <mi-menu></mi-menu>
    <%
      String usuario = (String)session.getAttribute("usuario");
      AccesoBD con = AccesoBD.getInstance();
      
      UsuarioBD usuarios = con.obtenerUsuarioEnBD(usuario);
      int codigo1 = usuarios.getCodigo();
      ArrayList<PedidoBD> pedidos = con.obtenerPedidosBD(codigo1);
      ArrayList<ProductoBD> productos = con.obtenerProductosBD();    
	  %>
    <h1>MIS PEDIDOS:</h1>

    <table class="pedidos">
      <thead>
       	<tr>
          <th>CÓDIGO PEDIDO</th>
          <th>FECHA PEDIDO</th>
          <th>ESTADO</th>
          <th>IMPORTE TOTAL</th>

            <th></th>
			  </tr>
		  </thead>
      <%
			for(PedidoBD pedido : pedidos){
				int codigo = pedido.getCodigo();
				int persona = pedido.getPersona();
				String fecha = pedido.getFecha();
				int estado = pedido.getEstado();
        float importe = pedido.getImporte();
				ArrayList<DetallesBD> detalles = pedido.getProductos();
				String estadoP = "";
					switch(estado){
					case 1:
						estadoP ="Pendiente";
						break;
					case 2:
						estadoP ="Enviado";
						break;
					case 3:
						estadoP ="Cancelado";
						break;
					case 4:
						estadoP ="Entregado";
						break;
					default:
						break;
					}		
          %>
          <tbody>
            <tr>
              <td><%=codigo%></td>
              <td><%=fecha%></td>
              <td><%=estadoP%></td>
              <td><%=importe%>€</td>

            <%
            if (estado == 1) {
            %> 
                <td> 
                  <form id="cancelar" method="post" action="CancelarPedido.html">
                       <input type="hidden" name="idPedido" value="<%=codigo %>">
                          <button  class="styled-button" type="submit" value="Cancelar pedido">Cancelar pedido</button>
                  </form>
                </td>
            </tr>
            <%
            }
            for(DetallesBD detalle: detalles)
              {
                for(ProductoBD producto: productos)
                  {
                    if(detalle.getCodigo_producto() == producto.getCodigo()) 
                    {
                        int id = producto.getCodigo();
                        String nombre = producto.getNombre();
                        int cantidad = detalle.getUnidades();
                        float precio = producto.getPrecio();
                        %>
                           <tr>
                              <td>Nombre: <%=nombre %></td>
                              <td> Cantidad: <input type="number" min="1" id ="cantidadCarrito" value="<%=cantidad %>" min="1" readonly></td>
                              <td> Precio: <%=precio %>€</td>
                          </tr>
                        <%
                    }
                }
            }
          } 
          %>
      </tbody>        
    </table>
    <input class="styled-button" type="button" onclick="window.history.back()" value="Volver atrás">
    <mi-pie></mi-pie>
    <script src="menu.js"></script>
    <script src="pie.js"></script>
</body>
</html>