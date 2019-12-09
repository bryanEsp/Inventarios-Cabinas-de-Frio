package ModeloVO;

public class Motivo {

    String CodigoBarras, Cantidad, Motivo, fecha,tipo;

    public Motivo(String CodigoBarras, String Cantidad, String Motivo, String fecha, String tipo) {
        this.CodigoBarras = CodigoBarras;
        this.Cantidad = Cantidad;
        this.Motivo = Motivo;
        this.fecha = fecha;
        this.tipo = tipo;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Motivo() {
    }

    public String getCodigoBarras() {
        return CodigoBarras;
    }

    public void setCodigoBarras(String CodigoBarras) {
        this.CodigoBarras = CodigoBarras;
    }

    public String getCantidad() {
        return Cantidad;
    }

    public void setCantidad(String Cantidad) {
        this.Cantidad = Cantidad;
    }

    public String getMotivo() {
        return Motivo;
    }

    public void setMotivo(String Motivo) {
        this.Motivo = Motivo;
    }

}
