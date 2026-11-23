<%@page language="java" contentType="text/html;charset=UTF-8" import="tienda.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Registro</title>
    <link rel="icon" type="image/ico" href="./img/gem.png" sizes="64x64">
    <link rel="stylesheet" type="text/css" href="estilos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" 
    crossorigin="anonymous">
  </head>
  <body>
    <mi-menu></mi-menu>
    <%
	//Utilizamos una variable en la sesion para informar de los mensajes de Error
	String mensaje = (String)session.getAttribute("mensaje");
	if(mensaje != null){//Eliminamos el mensaje consumido
		session.removeAttribute("mensaje");
	%>
	<h1><%=mensaje %></h1>
	<%
	}
	%>
    <form id="form1" method="post" action="registro.html">
    <input type="hidden" name="url" value="usuario.jsp">
        <table class="formulario">
            
            <th id="contacto"><h3 class="contacto1">CREAR MI CUENTA</h3></th> 
            <tr>
                <td> Usuario: </td>
                <td> 
                    <input type="text" name="usuario" maxlength="50" autofocus size=20 required placeholder="Escribe tu nickname">
                </td>
            </tr>
            <tr>
                <td> Contraseña: </td>
                <td>
                    <input type="password" name="clave" maxlength="50" size=20 required placeholder="Escribe tu Contraseña">
                </td>
            </tr>    
            <tr>
                <td>Nombre:</td>
                <td>
                    <input type="text" name="nombre" size="20" maxlength="50" required pattern="[A-Za-z]+" 
                     placeholder="Escribe tu nombre" form="form1">
                </td>
            </tr>
            <tr>
                <td>Apellidos:</td>
                <td>
                    <input type="text" name="apellido" size="20" maxlength="50" required pattern="[A-Za-z]+" 
                    placeholder="Escribe tu apellidos" form="form1">
                </td>
            </tr>
            <tr>
                <td> Domicilio: </td>
                <td> 
                    <input type="text" name="domicilio" maxlength="50" size=20 required  placeholder="Escribe tu domicilio">
                </td>
            </tr>
            <tr>
                <td> Poblacion: </td>
                <td> 
                    <input type="text" name="poblacion" maxlength="50" size=20 required placeholder="Escribe tu poblacion">
                </td>
            </tr>
            <tr>
                <td> Provincia: </td>
                <td> 
                    <input type="text" name="provincia" maxlength="50" size=20 required placeholder="Escribe tu provincia">
                </td>
            </tr>
            <tr>
                <td> CP: </td>
                <td> <input type="text" name="cp" maxlength="50" size=20 required placeholder="Escribe tu código postal"></td>
            </tr>
            <tr>
                <td>Número de Teléfono:</td>
                <td>
                <input type="tel" name="telefono" size="20" maxlength="12" required placeholder="Ejemplo: +34 645 34 67 29" 
                    form="form1" inputmode="tel">
                </td>
            </tr>

            <tr>
                <td>
                    <input class="styled-button" type="reset" value="Vaciar el Formulario" form="form1">
                </td>
                <td>
                    <input class="styled-button" type="submit" value="Crear mi cuenta" form="form1">
                </td>
                <td>
                    <input class="styled-button" type="button" onclick="window.history.back()" value="Volver atrás">
                </td>
            </tr>
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