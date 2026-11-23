<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.List,tienda.*" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Resguardo</title>
    <link rel="icon" type="image/ico" href="./img/gem.png" sizes="64x64">
    <link rel="stylesheet" type="text/css" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
    crossorigin="anonymous">
    <script src="funcionesCompra.js"></script>
</head>
<body>
    <mi-menu></mi-menu>
    <h1>RESGUARDO PEDIDO</h1>
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
    <!-- Contenedor donde se mostrarán los productos del carrito -->
    <div id="carrito-container"></div>
    <h1 id="price-total"></h1>
    <script> mostrarProductosEnPedido() </script>

    <h1>DATOS DE ENVIO Y DE USUARIO:</h1>
            <form id="form1" method="post" action="Tramitacion.html">
                <input type="hidden" name="url" value="PedidoFinalizado.jsp">
                <table class="formulario">            
                    <tr>
                        <td> Usuario: </td>
                        <td> 
                            <input type="text" name="usuario" maxlength="50" autofocus size=20 required placeholder="Escribe tu nickname"  value="<%=usu%>" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td> Contraseña: </td>
                        <td>
                            <input type="password" name="clave" maxlength="50" size=20 required placeholder="Escribe tu Contraseña" value="<%=clave%>">
                        </td>
                    </tr>    
                    <tr>
                        <td>Nombre:</td>
                        <td>
                            <input type="text" name="nombre" size="20" maxlength="50" required pattern="[A-Za-z]+" 
                            placeholder="Escribe tu nombre" form="form1"  value="<%=nombre%>" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>Apellidos:</td>
                        <td>
                            <input type="text" name="apellido" size="20" maxlength="50" required pattern="[A-Za-z]+" 
                            placeholder="Escribe tu apellido" form="form1"  value="<%=apellidos%>">
                        </td>
                    </tr>
                    <tr>
                        <td> Domicilio: </td>
                        <td> 
                            <input type="text" name="domicilio" maxlength="50" size=20 required  placeholder="Escribe tu domicilio" value="<%=domicilio%>">
                        </td>
                    </tr>
                    <tr>
                        <td> Poblacion: </td>
                        <td> 
                            <input type="text" name="poblacion" maxlength="50" size=20 required placeholder="Escribe tu poblacion" value="<%=poblacion%>">
                        </td>
                    </tr>
                    <tr>
                        <td> Provincia: </td>
                        <td> 
                            <input type="text" name="provincia" maxlength="50" size=20 required placeholder="Escribe tu provincia" value="<%=provincia%>">
                        </td>
                    </tr>
                    <tr>
                        <td> Código postal: </td>
                        <td> <input type="text" name="cp" maxlength="50" size=20 required placeholder="Escribe tu código postal" value="<%=cp%>"></td>
                    </tr>
                    <tr>
                        <td>Número de Teléfono:</td>
                        <td>
                        <input type="tel" name="telefono" size="20" maxlength="12" required 
                                title="Ingrese un número de teléfono válido" placeholder="Ejemplo: +34 645 34 67 29" 
                                form="form1" inputmode="tel" value="<%=telefono%>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="styled-button" type="submit" value="Finalizar Compra" form="form1">
                        </td>
                    </tr>
                </table>
            </form>

    <mi-pie></mi-pie>
    <script src="menu.js"></script>
    <script src="pie.js"></script>
</body>
</html>