package tienda;

public class DetallesBD {

    private int codigo_pedido;
    private int codigo_producto;
    private int unidades;
    private int precio_unitario;
    private ProductoBD productos;

    public int getCodigo_pedido() {
        return codigo_pedido;
    }
    public void setCodigo_pedido(int codigo_pedido) {
        this.codigo_pedido = codigo_pedido;
    }
    public int getCodigo_producto() {
        return codigo_producto;
    }
    public void setCodigo_producto(int codigo_producto) {
        this.codigo_producto = codigo_producto;
    }
    public int getUnidades() {
        return unidades;
    }
    public void setUnidades(int unidades) {
        this.unidades = unidades;
    }
    public int getPrecio_unitario() {
        return precio_unitario;
    }
    public void setPrecio_unitario(int precio_unitario) {
        this.precio_unitario = precio_unitario;
    }
    public ProductoBD getProductos() {
        return productos;
    }
    public void setProductos(ProductoBD productos) {
        this.productos = productos;
    }
 
}
