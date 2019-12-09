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
public class CuartoFrioVO {

    private String Cod_Cufi, longitud, altura, temperatura, estado_cuartofrio,cant_es ,cant_pro,cant_nivel,institucion;

    public CuartoFrioVO(String Cod_Cufi, String longitud, String altura, String temperatura, String estado_cuartofrio, String cant_es, String cant_pro, String cant_nivel, String institucion) {
        this.Cod_Cufi = Cod_Cufi;
        this.longitud = longitud;
        this.altura = altura;
        this.temperatura = temperatura;
        this.estado_cuartofrio = estado_cuartofrio;
        this.cant_es = cant_es;
        this.cant_pro = cant_pro;
        this.cant_nivel = cant_nivel;
        this.institucion = institucion;
    }

    public CuartoFrioVO() {
    }

    public String getCod_Cufi() {
        return Cod_Cufi;
    }

    public void setCod_Cufi(String Cod_Cufi) {
        this.Cod_Cufi = Cod_Cufi;
    }

    public String getLongitud() {
        return longitud;
    }

    public void setLongitud(String longitud) {
        this.longitud = longitud;
    }

    public String getAltura() {
        return altura;
    }

    public void setAltura(String altura) {
        this.altura = altura;
    }

    public String getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(String temperatura) {
        this.temperatura = temperatura;
    }

    public String getEstado_cuartofrio() {
        return estado_cuartofrio;
    }

    public void setEstado_cuartofrio(String estado_cuartofrio) {
        this.estado_cuartofrio = estado_cuartofrio;
    }

    public String getCant_es() {
        return cant_es;
    }

    public void setCant_es(String cant_es) {
        this.cant_es = cant_es;
    }

    public String getCant_pro() {
        return cant_pro;
    }

    public void setCant_pro(String cant_pro) {
        this.cant_pro = cant_pro;
    }

    public String getCant_nivel() {
        return cant_nivel;
    }

    public void setCant_nivel(String cant_nivel) {
        this.cant_nivel = cant_nivel;
    }

    public String getInstitucion() {
        return institucion;
    }

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }

    
    
}