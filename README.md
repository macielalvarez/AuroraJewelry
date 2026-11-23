# Aurora Jewelry💎

AuroraJewelry es una aplicación web para una tienda ficticia de joyería. El proyecto fue desarrollado en la universidad y está basado en una arquitectura web que conecta una aplicación desarrollada con Java y Jakarta Servlets con una base de datos MariaDB.

La aplicación permite consultar un catálogo de joyas, registrarse e iniciar sesión, gestionar un carrito de compra, realizar pedidos y administrar la información personal de los usuarios.

### Página principal
<img width="1512" height="741" alt="image" src="https://github.com/user-attachments/assets/308cbc43-05e3-4cc2-9f6c-e249ba600785" />
<img width="1520" height="742" alt="image" src="https://github.com/user-attachments/assets/4db00c76-c65d-40dd-9ebd-b262bda6f92e" />

## Funcionalidades

### Tienda

- Página principal con presentación de la joyería.
- Catálogo de productos con información, imágenes y precios.
- Consulta de los productos disponibles y sus existencias.
- Registro de nuevos usuarios.
- Inicio y cierre de sesión.
- Carrito de compra con posibilidad de añadir productos y seleccionar cantidades.
- Proceso de compra y tramitación de pedidos.
- Registro de pedidos en la base de datos.
- Consulta de pedidos realizados.
- Visualización del detalle de los pedidos.
- Cancelación de pedidos.
- Área personal para consultar y modificar los datos del usuario.
- Página de información sobre la empresa.
- Página de contacto.

## Tecnologías utilizadas

- **Java:** desarrollo de la lógica del servidor.
- **Jakarta Servlets 6.0:** gestión de solicitudes y funcionalidades del servidor.
- **JSP (JavaServer Pages):** generación de páginas web dinámicas.
- **JavaScript:** interactividad y funcionalidades del carrito y formularios.
- **HTML5:** estructura de las páginas.
- **CSS3:** diseño y estilos de la aplicación.
- **Bootstrap 5.3.2:** componentes y diseño de la interfaz.
- **MariaDB:** gestión de la base de datos relacional.
- **JDBC:** conexión y comunicación con la base de datos.
- **Apache Maven:** gestión y construcción del proyecto.
- **Apache Tomcat 10.1:** servidor de aplicaciones web.

## Estructura del proyecto

```text
AuroraJewelry/
├── database/
│   └── daw.sql 
│
├── src/
│   └── main/
│       ├── java/
│       │   └── tienda/
│       │       ├── AccesoBD.java
│       │       ├── Login.java
│       │       ├── Registro.java
│       │       ├── CerrarSesion.java
│       │       ├── Modificar.java
│       │       ├── Tramitacion.java
│       │       ├── CancelarPedido.java
│       │       ├── Producto.java
│       │       ├── ProductoBD.java
│       │       ├── UsuarioBD.java
│       │       ├── PedidoBD.java
│       │       └── DetallesBD.java
│       │
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml
│           ├── img/
│           ├── index.html
│           ├── index.jsp
│           ├── productos.html
│           ├── productos.jsp
│           ├── productosCompra.html
│           ├── productosCompra.jsp
│           ├── usuario.html
│           ├── usuario.jsp
│           ├── usuario_registro.html
│           ├── usuario_registro.jsp
│           ├── Pedido.jsp
│           ├── Resguardo.jsp
│           ├── contacto.html
│           ├── empresa.html
│           ├── estilos.css
│           ├── menu.js
│           ├── pie.js
│           ├── funcionesCompra.js
│           └── funcionesFormulario.js
│
├── pom.xml
└── README.md
```

## Base de datos

El proyecto utiliza una base de datos relacional MariaDB llamada `daw`.

La base de datos está formada por cinco tablas principales:

| Tabla | Descripción |
|---|---|
| `usuarios` | Almacena los datos personales y las credenciales de los usuarios registrados. También incluye un campo para identificar administradores. |
| `productos` | Contiene el catálogo de joyas, incluyendo nombre, descripción, precio, existencias e imagen. |
| `pedidos` | Registra los pedidos realizados por los usuarios, su fecha, importe y estado. |
| `detalle` | Almacena los productos incluidos en cada pedido, sus unidades y el precio unitario. |
| `estados` | Contiene los diferentes estados que puede tener un pedido. |

### Relaciones entre las tablas

- **Usuarios – Pedidos:** un usuario puede realizar varios pedidos. Cada pedido pertenece a un usuario.
- **Estados – Pedidos:** un estado puede estar asociado a varios pedidos. Cada pedido tiene un estado.
- **Pedidos – Detalle:** un pedido puede contener varios productos. Cada registro de detalle pertenece a un pedido.
- **Productos – Detalle:** un producto puede aparecer en diferentes pedidos. Cada registro de detalle hace referencia a un producto.

La tabla `detalle` utiliza una clave primaria compuesta por `codigo_pedido` y `codigo_producto`, permitiendo identificar cada producto dentro de un pedido.

### Estados de los pedidos

La tabla `estados` contiene los siguientes estados:

| Código | Estado |
|---|---|
| 1 | Pendiente |
| 2 | Enviado |
| 3 | Cancelado |
| 4 | Entregado |

### Datos de prueba

El volcado SQL incluye:

- 16 productos de ejemplo.
- 4 registros de usuarios.
- 5 pedidos de prueba.
- Los 4 estados disponibles.
- Los detalles de los productos asociados a los pedidos.

### Importar la base de datos

El proyecto incluye un archivo SQL con la estructura de las tablas y los datos de prueba.

Para importar la base de datos en MariaDB, primero hay que crearla:

```sql
CREATE DATABASE daw
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;
```

A continuación, desde una terminal, ejecutar:

```bash
mariadb -u root -p daw < database/daw.sql
```

Este comando importa la estructura de las tablas y los registros de prueba.

La conexión con la base de datos se realiza mediante JDBC. La clase `AccesoBD.java` centraliza las operaciones de acceso a los datos.

## Configuración

Para ejecutar correctamente la aplicación es necesario disponer de una instalación de MariaDB y configurar los datos de conexión en la aplicación.

Los parámetros de conexión deben corresponder con la base de datos local:

```text
Servidor: localhost
Puerto: 3306
Base de datos: daw
Usuario: tu_usuario
Contraseña: tu_contraseña
```

La configuración de acceso a la base de datos se encuentra centralizada en la clase `AccesoBD.java`.

Es necesario comprobar que las credenciales configuradas coinciden con las utilizadas en la instalación local de MariaDB.

## Ejecutar la aplicación

### 1. Clonar el repositorio

```bash
git clone https://github.com/macielalvarez/AuroraJewelry.git
```

### 2. Abrir el proyecto

Abrir en Visual Studio Code o en el IDE preferido la carpeta que contiene el archivo `pom.xml`.

### 3. Configurar MariaDB

Crear la base de datos `daw` e importar el archivo SQL siguiendo las instrucciones del apartado anterior.

### 4. Configurar la conexión

Comprobar los datos de conexión a MariaDB en `AccesoBD.java`.

### 5. Construir la aplicación

Desde la carpeta que contiene el archivo `pom.xml`, ejecutar:

```bash
mvn clean package
```

Maven generará el siguiente archivo:

```text
target/proyecto02.war
```

### 6. Desplegar en Apache Tomcat

Copiar el archivo WAR generado en la carpeta `webapps` de Apache Tomcat 10.1.

Iniciar el servidor y acceder a la aplicación desde el navegador:

```text
http://localhost:8080/proyecto02/
```

## Sobre el proyecto

AuroraJewelry fue desarrollado inicialmente como proyecto universitario de desarrollo de aplicaciones web.

El objetivo principal fue poner en práctica conocimientos de programación en Java, desarrollo web, gestión de bases de datos y comunicación entre el cliente y el servidor.

El proyecto permitió trabajar con tecnologías de frontend y backend, implementar operaciones sobre una base de datos relacional y desarrollar las principales funcionalidades de una tienda online.
