class Pie extends HTMLElement {
    constructor() {
        super()
        this.innerHTML = `
        <nav class="navbar navbar-expand-md navbar-dark bg-lightbrown fixed-bottom">
            <ul class="enlaces_utiles">
                <li><a href="index.html">Inicio</a></li>
                <li><a href="productos.html">Productos</a></li>
                <li><a href="contacto.html">Contáctanos</a></li>
            </ul>
            <ul class="derechos-de-autor">
                <li>&copy; 2024 Tu Empresa. Todos los derechos reservados.</li>
            </ul>
            <ul class="redes-sociales">
                <li><a href="https://facebook.com/tuempresa" target="_blank"><img src="./img/facebook.png" alt="Facebook"></a></li>
                <li><a href="https://instagram.com/tuempresa" target="_blank"><img src="./img/instagram.png" alt="Instagram"></a></li>
                <li><a href="https://twitter.com/tuempresa" target="_blank"><img src="./img/twitter-x.png" alt="Twitter"></a></li>
            </ul>
      </nav>
        `
    }
}
window.customElements.define('mi-pie', Pie);