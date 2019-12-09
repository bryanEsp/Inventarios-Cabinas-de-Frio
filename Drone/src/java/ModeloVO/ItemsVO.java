/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author SEVEN
 */
public class ItemsVO {

    private String Codigo_barras, Fecha_vencimiento, estante, nivel, profundidad, cantidad, observacion, lote, fecha_ingreso, embalaje, cod_producto, cuarto_frio;

    public ItemsVO() {
    }

    public ItemsVO(String Codigo_barras,String Fecha_vencimiento,String estante,String nivel,String profundidad,String cantidad,String observacion,String lote,String fecha_ingreso,String embalaje,String cod_producto,String cuarto_frio) {
        this.Codigo_barras = Codigo_barras;
        this.Fecha_vencimiento = Fecha_vencimiento;
        this.estante = estante;
        this.nivel = nivel;
        this.profundidad = profundidad;
        this.cantidad = cantidad;
        this.observacion = observacion;
        this.lote = lote;
        this.fecha_ingreso = fecha_ingreso;
        this.embalaje = embalaje;
        this.cod_producto = cod_producto;
        this.cuarto_frio = cuarto_frio;
    }

    public String getCodigo_barras() {
        return Codigo_barras;
    }

    public void setCodigo_barras(String Codigo_barras) {
        this.Codigo_barras = Codigo_barras;
    }

    public String getFecha_vencimiento() {
        return Fecha_vencimiento;
    }

    public void setFecha_vencimiento(String Fecha_vencimiento) {
        this.Fecha_vencimiento = Fecha_vencimiento;
    }

    public String getestante() {
        return estante;
    }

    public void setestante(String estante) {
        this.estante = estante;
    }

    public String getnivel() {
        return nivel;
    }

    public void setnivel(String nivel) {
        this.nivel = nivel;
    }

    public String getprofundidad() {
        return profundidad;
    }

    public void setprofundidad(String profundidad) {
        this.profundidad = profundidad;
    }

     public String getcantidad() {
        return cantidad;
    }

    public void setcantidad(String cantidad) {
        this.cantidad = cantidad;
    }
     public String getobservacion() {
        return observacion;
    }

    public void setobservacion(String observacion) {
        this.observacion = observacion;
    }
     public String getlote() {
        return lote;
    }

    public void setlote(String lote) {
        this.lote = lote;
    }
     public String getfecha_ingreso() {
        return fecha_ingreso;
    }

    public void setfecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
     public String getembalaje() {
        return embalaje;
    }

    public void setembalaje(String embalaje) {
        this.embalaje = embalaje;
    }
     public String getcod_producto() {
        return cod_producto;
    }

    public void setcod_producto(String cod_producto) {
        this.cod_producto = cod_producto;
    }
     public String getcuarto_frio() {
        return cuarto_frio;
    }

    public void setcuarto_frio(String cuarto_frio) {
        this.cuarto_frio = cuarto_frio;
    }
}
