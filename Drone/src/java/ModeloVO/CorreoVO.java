package ModeloVO;

public class CorreoVO {

    String Usuario, clave, ruta, nombre, destino, asunto, mensaje;

    public CorreoVO(String Usuario, String clave, String ruta, String nombre, String destino, String asunto, String mensaje) {
        this.Usuario = Usuario;
        this.clave = clave;
        this.ruta = ruta;
        this.nombre = nombre;
        this.destino = destino;
        this.asunto = asunto;
        this.mensaje = mensaje;
    }

    public CorreoVO() {
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getAsunto() {
        return asunto;
    }

    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
}
