package tienda;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public final class AccesoBD {
	private static AccesoBD instanciaUnica = null;
	private Connection conexionBD = null;

	public static AccesoBD getInstance(){
		if (instanciaUnica == null){
			instanciaUnica = new AccesoBD();
		}
		return instanciaUnica;
	}

	private AccesoBD() {
		abrirConexionBD();
	}

	public void abrirConexionBD() {
		if (conexionBD == null)
		{
			String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
			// daw es el nombre de la base de datos que hemos creado con anterioridad.
			String DB_URL = System.getenv("DB_URL");
			String USER = System.getenv("DB_USER");
			String PASS = System.getenv("DB_PASSWORD");
			try {
				if (DB_URL == null || DB_URL.isEmpty()) {
					DB_URL = "jdbc:mariadb://localhost:3306/daw";
				}
				if (USER == null || USER.isEmpty()) {
					throw new IllegalStateException("Configura la variable de entorno DB_USER");
				}
				if (PASS == null || PASS.isEmpty()) {
					throw new IllegalStateException("Configura la variable de entorno DB_PASSWORD");
				}
				Class.forName(JDBC_DRIVER);
				conexionBD = DriverManager.getConnection(DB_URL,USER,PASS);
			}
			catch(Exception e) {
				System.err.println("No se ha podido conectar a la base de datos");
				System.err.println(e.getMessage());
                e.printStackTrace();
			}
		}
	}

	public void cerrarConexionBD() {
		if(conexionBD != null) {
			try {
				conexionBD.close();
				conexionBD = null;
			}
			catch(Exception e) {
				System.err.println("No se ha podido desconectar de la base de datos");
				System.err.println(e.getMessage());
			}
		}
	}

	public boolean comprobarAcceso() {
		abrirConexionBD();
		return (conexionBD != null);
	}

    public ArrayList<ProductoBD> obtenerProductosBD() {
		abrirConexionBD();
	
		ArrayList<ProductoBD> productos = new ArrayList<>();
	
		try {
			// hay que tener en cuenta las columnas de la tabla de productos
		String con = "SELECT codigo,descripcion,precio,existencias,imagen,nombre FROM productos";
			Statement s = conexionBD.createStatement();
			ResultSet resultado = s.executeQuery(con);
			while(resultado.next()){
				ProductoBD producto = new ProductoBD();
				producto.setCodigo(resultado.getInt("codigo"));
				producto.setDescripcion(resultado.getString("descripcion"));
				producto.setNombre(resultado.getString("nombre"));
				producto.setPrecio(resultado.getFloat("precio"));
				producto.setExistencias(resultado.getInt("existencias"));
				producto.setImagen(resultado.getString("imagen"));
				productos.add(producto);
			}
		}
		catch(Exception e) {
			System.err.println("Error ejecutando la consulta a la base de datos");
			System.err.println(e.getMessage());
		}
	
		return productos;
	}

	public int comprobarUsuarioBD(String usuario, String clave) {
		abrirConexionBD();
	
		int codigo = -1;
	
		try{
			String con = "SELECT codigo FROM usuarios WHERE usuario=? AND clave=?";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1,usuario);
			s.setString(2,clave);
	
			ResultSet resultado = s.executeQuery();
	
			// El usuario/clave se encuentra en la BD
	
			if ( resultado.next() ) {
				codigo =  resultado.getInt("codigo");
			}
		}
		catch(Exception e) {
	
			// Error en la conexión con la BD
			System.err.println("Error verificando usuario/clave");
			System.err.println(e.getMessage());
			e.printStackTrace();
		}
	
		return codigo;
	}

	public UsuarioBD obtenerUsuarioEnBD(String user){
		abrirConexionBD();
		UsuarioBD usuarios = new UsuarioBD();
		
		try {
			String con = "SELECT * FROM usuarios WHERE usuario=?";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1, user);
			ResultSet resultado = s.executeQuery();
			if (resultado.next())
			{
				usuarios.setCodigo(resultado.getInt("codigo"));
				usuarios.setUsuario(resultado.getString("usuario"));
				usuarios.setClave(resultado.getString("clave"));
				usuarios.setNombre(resultado.getString("nombre"));
				usuarios.setApellidos(resultado.getString("apellidos"));
				usuarios.setDomicilio(resultado.getString("domicilio"));					
				usuarios.setPoblacion(resultado.getString("poblacion"));
				usuarios.setProvincia(resultado.getString("provincia"));
				usuarios.setCp(resultado.getString("cp"));
				usuarios.setTelefono(resultado.getString("telefono"));				
			}		
		}
		catch(Exception e) {
			System.err.println("Error obteniendo el usuario de la base de datos.");
			System.err.println(e.getMessage());
		}
		
		return usuarios;
	}
	public int comprobarUsuarioRegistradoEnBD(String usuario) {
		abrirConexionBD();
		
		try {
			String con = "SELECT codigo FROM usuarios WHERE usuario=?";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1,usuario);
			
			ResultSet resultado = s.executeQuery();
			
			if(resultado.next()) { //El usuario se encuentra en la BD
				return resultado.getInt("codigo");
			}
		}
		catch(Exception e) { //Error en la conexion con la BD
			System.err.println("Error verificando usuario/clave");
			System.err.println(e.getMessage());
		}
		return -1;
		
	}

	public void registrarUsuario(String usuario, String clave, String nombre, String apellidos, 
	String domicilio, String poblacion, String provincia, String cp, String telefono) {
		abrirConexionBD();
		
		try {
			String con = "INSERT INTO usuarios(usuario,clave,nombre,apellidos,domicilio,poblacion,provincia,cp,telefono) VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement s = conexionBD.prepareStatement(con);
			s.setString(1, usuario);
			s.setString(2, clave);
			s.setString(3, nombre);
			s.setString(4, apellidos);
			s.setString(5, domicilio);
			s.setString(6, poblacion);
			s.setString(7, provincia);
			s.setString(8, cp);
			s.setString(9, telefono);
			
			s.executeUpdate();		
		}
		catch(Exception e) { //Error en la conexion con la BD
			System.err.println("Error al registrar usuario en la base de datos");
			System.err.println(e.getMessage());
		}
		return;	
	}

	public int modificarUsuarioEnBD(String usuario, String clave, String nombre, String apellidos, 
	String domicilio, String poblacion, String provincia, String cp, String telefono)
	{
		abrirConexionBD();
		try {
					String con = "UPDATE usuarios "
								+ "SET usuario=?, clave=?, nombre=?, apellidos=?, domicilio=?, poblacion=?, provincia=?, cp=?, telefono=? "
								+ "WHERE usuario = ?";
					PreparedStatement s = conexionBD.prepareStatement(con);
					s.setString(1, usuario);
					s.setString(2, clave);
					s.setString(3, nombre);
					s.setString(4, apellidos);
					s.setString(5, domicilio);
					s.setString(6, poblacion);
					s.setString(7, provincia);
					s.setString(8, cp);
					s.setString(9, telefono);
					s.setString(10, usuario);
					s.executeUpdate();
					
					return 1;
				}
			catch(Exception e) {
					System.err.println("Error al modificar usuario en la base de datos");
					System.err.println(e.getMessage());
				}
		
		
		return -1;
	}


	public int registrarPedidoEnBD(int codigo, ArrayList<Producto> vCarrito) {
		abrirConexionBD();
		
		float totalP = 0;
		float total = 0;
		int codigoP = 0;
		
		for(Producto pedido: vCarrito)
		{
			totalP = pedido.getPrecio() * pedido.getCantidad();
			total = totalP + total;
		}
		
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		    Calendar calendar = Calendar.getInstance();
		    Date date = calendar.getTime();
		    String fecha = format.format(date);
		    
			String con = "INSERT INTO pedidos(persona,fecha,importe,estado) VALUES (?,?,?,?)";
			PreparedStatement s = conexionBD.prepareStatement(con, Statement.RETURN_GENERATED_KEYS);
			s.setInt(1,codigo);
			s.setString(2, fecha);
			s.setFloat(3, total);
			s.setInt(4, 1);
			
			s.executeUpdate();
			
			ResultSet result = s.getGeneratedKeys();
			
			if(result.next())
			{
				codigoP = Math.toIntExact(result.getLong(1));
			}
		}
		catch(Exception e) {
			System.err.println("Error al insertar el pedido en la base de datos");
			System.err.println(e.getMessage());
		}
		return codigoP;
	}
	
	
	public void registrarDetallePedidoEnBD(int codigoP, ArrayList<Producto> vCarrito){
		abrirConexionBD();

		for(Producto producto : vCarrito)
		{
			try {
				String con = "INSERT INTO detalle(codigo_pedido,codigo_producto,unidades,precio_unitario) VALUES (?,?,?,?)";
				PreparedStatement s = conexionBD.prepareStatement(con);
				s.setInt(1, codigoP);
				s.setInt(2,producto.getCodigo());
				s.setInt(3, producto.getCantidad());
				s.setFloat(4, producto.getPrecio());
				
				s.executeUpdate();
			}
			catch(Exception e) {
				System.err.println("Error al insertar los detalles del pedido");
				System.err.println(e.getMessage());
			}
		}
	}

	public void cancelarPedido(int cod) {
        try {
        	String con = "UPDATE pedidos SET estado=? WHERE codigo=?";
            PreparedStatement s = conexionBD.prepareStatement(con);
            s.setInt(1, 3);
            s.setInt(2, cod);
            s.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error al cancelar el pedido");
            System.err.println(e.getMessage());
        }
    }
	public ArrayList<PedidoBD> obtenerPedidosBD(int user){
		abrirConexionBD();
		ArrayList<PedidoBD> pedidos = new ArrayList<>();
		
		try {
			String con = "SELECT * FROM pedidos";
			PreparedStatement s = conexionBD.prepareStatement(con);
			ResultSet resultado = s.executeQuery();
			
			while(resultado.next()) {
				if(resultado.getInt("persona") == user)
				{
					PedidoBD pedido = new PedidoBD();
					pedido.setCodigo(resultado.getInt("codigo"));
					pedido.setPersona(resultado.getInt("persona"));
					pedido.setImporte(resultado.getInt("importe"));
					pedido.setFecha(resultado.getString("fecha"));
					pedido.setEstado(resultado.getInt("estado"));
					pedido.setProductos(obtenerDetallesBD(resultado.getInt("codigo")));
					
					pedidos.add(pedido);
				}
			}
		}
		catch(Exception e) {
			System.err.println("Error1 ejecutando la consulta con la base de datos.");
			System.err.println(e.getMessage());
		}
		return pedidos;
	}
	
	public ArrayList<DetallesBD> obtenerDetallesBD(int pedido) {
		abrirConexionBD();
		ArrayList<DetallesBD> detalles = new ArrayList<>();
		
		try {
			String consulta = "SELECT * FROM detalle WHERE codigo_pedido = ?";
			try (PreparedStatement statement = conexionBD.prepareStatement(consulta)) {
				statement.setInt(1, pedido);
				try (ResultSet resultado = statement.executeQuery()) {
					while (resultado.next()) {
						DetallesBD detalle = new DetallesBD();
						detalle.setCodigo_pedido(resultado.getInt("codigo_pedido"));
						detalle.setCodigo_producto(resultado.getInt("codigo_producto"));
						detalle.setUnidades(resultado.getInt("unidades"));
						detalle.setPrecio_unitario(resultado.getInt("precio_unitario"));
						detalle.setProductos(obtenerProductoBD(resultado.getInt("codigo_producto")));
						
						detalles.add(detalle);
					}
				}
			}
		} catch (SQLException e) {
			System.err.println("Error ejecutando la consulta con la base de datos.");
			e.printStackTrace();
		}
		return detalles;
	}
	
	public ProductoBD obtenerProductoBD(int p) {
		abrirConexionBD();
		ProductoBD producto = null;
		
		try {
			String consulta = "SELECT * FROM productos WHERE codigo = ?";
			try (PreparedStatement statement = conexionBD.prepareStatement(consulta)) {
				statement.setInt(1, p);
				try (ResultSet resultado = statement.executeQuery()) {
					if (resultado.next()) {
						producto = new ProductoBD();
						producto.setCodigo(resultado.getInt("codigo"));
						producto.setNombre(resultado.getString("nombre"));
						producto.setPrecio(resultado.getInt("precio"));
						producto.setExistencias(resultado.getInt("existencias"));
					}
				}
			}
		} catch (SQLException e) {
			System.err.println("Error ejecutando la consulta con la base de datos.");
			e.printStackTrace();
		}
		return producto;
	}
	
}
