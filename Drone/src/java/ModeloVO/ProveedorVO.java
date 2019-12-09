/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author Usuario_1
 */
public class ProveedorVO {
    
    private String NIT, nombre, celular, direccion,correo, estado_Proveedor;

    public ProveedorVO() {
    }

    public ProveedorVO(String NIT, String nombre, String celular, String direccion, String correo, String estado_Proveedor) {
        this.NIT = NIT;
        this.nombre = nombre;
        this.celular = celular;
        this.direccion = direccion;
        this.correo = correo;
        this.estado_Proveedor = estado_Proveedor;
    }

    public String getNIT() {
        return NIT;
    }

    public void setNIT(String NIT) {
        this.NIT = NIT;
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
    public String getcorreo() {
        return correo;
    }

    public void setcorreo(String correo) {
        this.correo = correo;
    }

    
    public String getestado_Proveedor() {
        return estado_Proveedor;
    }

    public void setestado_Proveedor(String estado_Proveedor) {
        this.estado_Proveedor = estado_Proveedor;
    }

}
