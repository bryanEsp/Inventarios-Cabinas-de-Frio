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
public class InstitucionVO {

    private String Cod_insti, nombre, celular, direccion, estado_insti;

    public InstitucionVO() {
    }

    public InstitucionVO(String Cod_insti, String nombre, String celular, String direccion, String estado_insti) {
        this.Cod_insti = Cod_insti;
        this.nombre = nombre;
        this.celular = celular;
        this.direccion = direccion;
        this.estado_insti = estado_insti;
    }

    public String getCod_insti() {
        return Cod_insti;
    }

    public void setCod_insti(String Cod_insti) {
        this.Cod_insti = Cod_insti;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEstado_insti() {
        return estado_insti;
    }

    public void setEstado_insti(String estado_insti) {
        this.estado_insti = estado_insti;
    }

}
