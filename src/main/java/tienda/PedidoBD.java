package tienda;

import java.util.ArrayList;

public class PedidoBD {

    private int codigo;
    private int persona;
    private String fecha;
    private int importe;
    private int estado;
    private String descripción;
    ArrayList<DetallesBD> productos;
    
    public int getCodigo() {
        return codigo;
    }
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    public int getPersona() {
        return persona;
    }
    public void setPersona(int persona) {
        this.persona = persona;
    }
    public String getFecha() {
        return fecha;
    }
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    public int getImporte() {
        return importe;
    }
    public void setImporte(int importe) {
        this.importe = importe;
    }
    public int getEstado() {
        return estado;
    }
    public void setEstado(int estado) {
        this.estado = estado;
    }
    public String getDescripción() {
        return descripción;
    }
    public void setDescripción(String descripción) {
        this.descripción = descripción;
    }
    public ArrayList<DetallesBD> getProductos() {
        return productos;
    }
    public void setProductos(ArrayList<DetallesBD> productos) {
        this.productos = productos;
    }
    
}
