class Menu extends HTMLElement {
    constructor() {
        super()
        this.innerHTML = `
        <nav class="navbar navbar-expand-md navbar-dark bg-lightbrown fixed-top">
            <div class = "container-fluid">
                    <a class = "navbar-brand" href="#">
                        <img src="./img/logo0.png" alt="logo" style="width: 80px; height:30px; max-width: 100%; border-radius: 50%;">
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarExampleDefault">
                        <span class="navbar-toggler-icon"></span>
                    </button>
  
                    <div class="collapse navbar-collapse" id="navbarExampleDefault">
                          <ul class="navbar-nav me-auto">
                              <li class="nav-item">
                                <a class="nav-link" href="index.html"> Inicio </a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" href="empresa.html"> Empresa </a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" href="contacto.html"> Contáctanos </a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" href="productos.jsp"> Productos </a>
                              </li>
                        </ul>
                        

                        <div class="navbar-nav dropdown mb-8">
                            <a class="nav-link dropdown-toggle" href="#" id="carrito-toggle" role="button" data-bs-toggle="dropdown">
                                <img src="./img/bag-heart.png" alt="carrito">
                            </a>
                            <ul class="dropdown-menu" id="carrito-dropdown">
                                <!-- Aquí se listarán los elementos del carrito -->  
                            </ul>
                            <div>
                                <li class="nav-item">
                                    <a class="nav-link" href="productosCompra.jsp">VER MI CARRITO</a>
                                </li>
                            </div>
                        </div>

                        <div class="navbar-nav">
                            <a class="nav-link" href="usuario.jsp">
                                <img src="./img/person.png" alt="usuario">
                            </a>
                        </div>
                    </div>
                </div>
        </nav> `
    }
  }
  window.customElements.define('mi-menu', Menu);