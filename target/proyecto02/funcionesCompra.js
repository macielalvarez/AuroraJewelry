var carrito = []; // Array que contendrá los objetos que son los productos

var producto = new Object(); // Objeto que contendrá el producto que deseamos almacenar

// Asignamos valores a los atributos del objeto
producto.codigo = identificador; // Identificador único del objeto
producto.nombre = "Nombre/descripción del producto"; // Nombre del objeto
producto.cantidad = 1; // Cantidad que tenemos en el carrito (1 por ejemplo)
producto.precio = 100.0; // Precio unitario de cada elemento (100.0 por ejemplo)

carrito.push(producto); // Añadimos el producto en el array


// Llamar a la función inicializarCarrito al cargar la página
window.onload = inicializarCarrito();

function inicializarCarrito() {
    cargarCarrito();
    mostrarProductosEnCarrito();
}

function anadirCarrito(id, nombre, precio, stock) {
    cargarCarrito();
    const cantidad = 1; // Por defecto, se añade una unidad del producto
    const indice = carrito.findIndex(item => item.codigo === id);

    if (indice !== -1) {
        // El producto ya existe en el carrito, aumentar la cantidad si es posible
        const productoExistente = carrito[indice];
        const nuevaCantidad = productoExistente.cantidad + cantidad;
        if (nuevaCantidad <= stock) {
            carrito[indice].cantidad = nuevaCantidad;
            alert("Añadimos un producto más.");
        } else {
            alert("No hay suficientes existencias para añadir ese producto al carrito.");
            return; // Salir de la función si no hay suficiente stock
        }
    } else {
        // El producto no existe en el carrito, añadirlo
        const nuevaCantidad = cantidad;
        if (nuevaCantidad <= stock) {
            carrito.push({
                codigo: id,
                nombre: nombre,
                precio: precio,
                cantidad: nuevaCantidad,
                stock: stock
            });
            alert("Producto añadido al carrito.");
        } else {
            alert("No hay suficientes existencias para añadir ese producto al carrito.");
            return; // Salir de la función si no hay suficiente stock
        }
    }
    guardarCarrito();
    mostrarProductosEnCarrito();

}

function eliminarProductoDelCarrito(codigo) {
    const indice = carrito.findIndex(item => item.codigo === codigo);

    if (indice !== -1) {
        if (carrito[indice].cantidad > 1) {
            // Si la cantidad es mayor que 1, reducimos la cantidad en 1
            carrito[indice].cantidad--;
        } else {
            // Si la cantidad es 1 o menos, eliminamos el producto del carrito
            carrito.splice(indice, 1);
        }
        alert("Se ha eliminado una unidad del producto del carrito.");
        mostrarProductosEnCarrito();
    } else {
        alert("El producto no está en el carrito.");
    }
    guardarCarrito();
    mostrarProductosEnCarrito();
}

function actualizarCantidad(nombre, cantidad, existencias) {
    cargarCarrito();
    const producto = carrito.find(item => item.nombre === nombre);

    if (producto) {
        if (parseInt(cantidad) <= existencias) {
            producto.cantidad = parseInt(cantidad);
            alert("Se ha cambiado la cantidad del producto.");
        } else {
            alert("No hay suficientes existencias para esa cantidad.");
        }
    }
    mostrarProductosEnCarrito();
    mostrarCarrito();
    guardarCarrito();
}

function mostrarProductosEnCarrito() {
    window.onload = cargarCarrito();

    const carritoDropdown = document.getElementById('carrito-dropdown');
    // Limpiar el contenido actual del menú desplegable del carrito
    carritoDropdown.innerHTML = '';

    // Recorrer los productos en el carrito y agregarlos al menú desplegable
    carrito.forEach(producto => {
        const itemCarrito = document.createElement('li');
        itemCarrito.classList.add('dropdown-item');
        
        const nombreProducto = document.createElement('span');
        nombreProducto.textContent = producto.nombre + " ";

        const cantidadProducto = document.createElement('span');
        cantidadProducto.textContent = `Cantidad: ${producto.cantidad} `;

        const precioProducto = document.createElement('span');
        precioProducto.textContent = `${producto.precio}€`;

        const btnEliminar = document.createElement('button');
        btnEliminar.classList.add('btn', 'btn-sm', 'styled-button');
        btnEliminar.textContent = 'Eliminar';
        btnEliminar.addEventListener('click', function() {
            eliminarProductoDelCarrito(producto.codigo);
            mostrarProductosEnCarrito();
        });

        const btnModificar = document.createElement('button');
        btnModificar.classList.add('btn', 'btn-sm', 'styled-button');
        btnModificar.textContent = 'Modificar';
        btnModificar.addEventListener('click', function() {
            const nuevaCantidad = prompt("Ingrese la nueva cantidad:");
            if (nuevaCantidad !== null) {
                actualizarCantidad(producto.nombre, nuevaCantidad, producto.existencias);
            }
        });

        itemCarrito.appendChild(nombreProducto);
        itemCarrito.appendChild(cantidadProducto);
        itemCarrito.appendChild(precioProducto);
        itemCarrito.appendChild(btnEliminar);
        itemCarrito.appendChild(btnModificar);

        carritoDropdown.appendChild(itemCarrito);
    });

    // Si el carrito está vacío, mostrar un mensaje indicando que está vacío
    if (carrito.length === 0) {
        const itemVacio = document.createElement('li');
        itemVacio.textContent = 'El carrito está vacío';
        carritoDropdown.appendChild(itemVacio);
    }
    guardarCarrito();

}

// Función para generar un ticket de compra
function generarTicketCompra() {
    // Obtener los productos del carrito del almacenamiento local
    const carrito = JSON.parse(localStorage.getItem("mi-carrito-almacenado"));

    // Verificar si hay productos en el carrito
    if (carrito && carrito.length > 0) {
        // Crear un mensaje de alerta para mostrar la información del ticket de compra
        let ticketInfo = "RESUMEN DE TU PEDIDO:\n";

        // Iterar sobre cada producto en el carrito y agregar su información al mensaje de alerta
        carrito.forEach(producto => {
            ticketInfo += `Producto: ${producto.nombre}\n`;
            ticketInfo += `Precio: ${producto.precio}€\n`;
            ticketInfo += `Cantidad: ${producto.cantidad}\n`;
        });

        // Obtener el precio total del carrito almacenado en el localStorage
        const totalPrecioCarrito = parseFloat(localStorage.getItem("precioTotalCarrito"));

        // Agregar el precio total al mensaje de alerta
        ticketInfo += `PRECIO TOTAL: ${totalPrecioCarrito.toFixed(2)}€`;

        // Mostrar el mensaje de alerta con la información del ticket de compra
        alert(ticketInfo);
    } else {
        // Mostrar un mensaje si el carrito está vacío
        alert("No hay productos en el carrito");
    }
}

// Función para borrar todo el carrito
function borrarCarrito() {
    carrito = [];
    alert("Carrito vaciado.");
    guardarCarrito();
}

function mostrarCarrito() {
    // Obtener los datos del carrito del almacenamiento local
    cargarCarrito();
    carrito = JSON.parse(localStorage.getItem("mi-carrito-almacenado"));

    // Verificar si hay productos en el carrito
    if (carrito && carrito.length > 0) {
        // Crear el HTML para cada producto en el carrito
        const carritoHTML = carrito.map(producto => {
            return `
                <div>
                    <p>${producto.nombre}</p>
                    <p>Precio : ${producto.precio}€</p>
                    <div>
                        <p>Cantidad: ${producto.cantidad}</p>
                        <button class="styled-button" onclick="eliminarProductoDelCarrito('${producto.codigo}')">Eliminar</button>
                        <button class="styled-button" onclick="actualizarCantidad('${producto.nombre}', ${producto.cantidad}, ${producto.existencias})">Modificar</button>
                    </div>
                </div>
            `;
        }).join('');

        // Mostrar el contenido del carrito en el contenedor
        document.getElementById('carrito-container').innerHTML = carritoHTML;

        // Calcular y mostrar el precio total del carrito
        const totalPrecioCarrito = calcularPrecioTotal(carrito);
        document.getElementById('price-total').innerText = `TOTAL: ${totalPrecioCarrito.toFixed(2)}€`;
    } else {
        // Mostrar un mensaje si el carrito está vacío
        document.getElementById('carrito-container').innerHTML = "<p>El carrito está vacío</p>";
        document.getElementById('price-total').innerText = '';
    }
}

// Función para calcular el precio total del carrito
function calcularPrecioTotal(carrito) {
    let total = 0;
    carrito.forEach(producto => {
        total += producto.precio * producto.cantidad;
    });
    return total;
}


function mostrarProductosEnPedido() {
    // Obtener los datos del carrito del almacenamiento local
    cargarCarrito();
    const carrito = JSON.parse(localStorage.getItem("mi-carrito-almacenado"));

    // Verificar si hay productos en el carrito
    if (carrito && carrito.length > 0) {
        // Crear el HTML para cada producto en el carrito
        const carritoHTML = carrito.map(producto => {
            return `
                <div>
                    <p>${producto.nombre}</p>
                    <p>Precio : ${producto.precio}€</p>
                    <div>
                        <p>Cantidad: ${producto.cantidad}</p>
                    </div>
                </div>
            `;
        }).join('');

        // Mostrar el contenido del carrito en el contenedor
        document.getElementById('carrito-container').innerHTML = carritoHTML;

        // Calcular y mostrar el precio total del carrito
        const totalPrecioCarrito = calcularPrecioTotal(carrito);
        document.getElementById('price-total').innerText = `PRECIO TOTAL: ${totalPrecioCarrito.toFixed(2)}€`;
    } else {
        // Mostrar un mensaje si el carrito está vacío
        document.getElementById('carrito-container').innerHTML = "<p>El carrito está vacío</p>";
        document.getElementById('price-total').innerText = '';
    }
}
function cargarCarrito() {
	if (carrito === null) { // Si no hemos cargado todavía el carrito
		// Cargamos el carrito almacenado
        carrito = JSON.parse(localStorage.getItem("mi-carrito-almacenado"));
		if (carrito === null) { // Si no existía carrito almacenado
			carrito = []; // Creamos un vector vacío
		}
	}
}

function guardarCarrito() {
	localStorage.setItem("mi-carrito-almacenado",JSON.stringify(carrito));
}
