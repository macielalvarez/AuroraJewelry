package tienda;

import java.io.IOException;

import java.io.InputStreamReader;
import java.util.*;

import jakarta.json.Json;
import jakarta.json.JsonArray;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RecorrerCarrito extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true); //Accedemos al entorno de sesion
		AccesoBD con = AccesoBD.getInstance();
		List<ProductoBD> productos = con.obtenerProductosBD();
		ArrayList <Producto> carritoJSON = new ArrayList<Producto>();
		JsonReader jsonReader = Json.createReader(new InputStreamReader(request.getInputStream())); 
		JsonArray jobj = jsonReader.readArray();
		int res=0;
		for(ProductoBD producto : productos){
			int id = producto.getCodigo();
			int existencias = producto.getExistencias();
			
			for (int i = 0; i < jobj.size(); i++) { 
				JsonObject prod = jobj.getJsonObject(i);
				Producto nuevo = new Producto(); 
				nuevo.setCodigo(prod.getInt("identificador"));
				nuevo.setNombre(prod.getString("nombre"));
				nuevo.setPrecio(Float.parseFloat(prod.getString("precio")));				
				nuevo.setCantidad(prod.getInt("cantidad"));
				if(nuevo.getCodigo() == id)
				{
					if(nuevo.getCantidad() <= existencias)
					{
						carritoJSON.add(nuevo);
					}
					else {
						res = -1;
						session.setAttribute("mensaje", "Cambiar cantidad del producto");
					}
					
				}
			}
		}
		if(res == -1)
		{
			response.sendRedirect("productosCompra.jsp");
		}
		else
		{
			session.setAttribute("Carrito", carritoJSON);
			response.sendRedirect("usuarioResguardo.jsp");
		}
	}
}


