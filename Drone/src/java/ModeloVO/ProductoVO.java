/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloVO;

/**
 *
 * @author Usuario
 */
public class ProductoVO {
String CodigoPro,NombrePro,DescripcionPro,UnidadesdeMedidaPro,PesoPro,CantidadgeneralPro,TemperaturaPro,EstadoPro,CategoriaPro,proveedor;

    public ProductoVO(String CodigoPro, String NombrePro, String DescripcionPro, String UnidadesdeMedidaPro, String PesoPro, String CantidadgeneralPro, String TemperaturaPro, String EstadoPro, String CategoriaPro, String proveedor) {
        this.CodigoPro = CodigoPro;
        this.NombrePro = NombrePro;
        this.DescripcionPro = DescripcionPro;
        this.UnidadesdeMedidaPro = UnidadesdeMedidaPro;
        this.PesoPro = PesoPro;
        this.CantidadgeneralPro = CantidadgeneralPro;
        this.TemperaturaPro = TemperaturaPro;
        this.EstadoPro = EstadoPro;
        this.CategoriaPro = CategoriaPro;
        this.proveedor = proveedor;
    }

    public ProductoVO() {
   
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getCodigoPro() {
        return CodigoPro;
    }

    public void setCodigoPro(String CodigoPro) {
        this.CodigoPro = CodigoPro;
    }

    public String getNombrePro() {
        return NombrePro;
    }

    public void setNombrePro(String NombrePro) {
        this.NombrePro = NombrePro;
    }

    public String getDescripcionPro() {
        return DescripcionPro;
    }

    public void setDescripcionPro(String DescripcionPro) {
        this.DescripcionPro = DescripcionPro;
    }

    public String getUnidadesdeMedidaPro() {
        return UnidadesdeMedidaPro;
    }

    public void setUnidadesdeMedidaPro(String UnidadesdeMedidaPro) {
        this.UnidadesdeMedidaPro = UnidadesdeMedidaPro;
    }

    public String getPesoPro() {
        return PesoPro;
    }

    public void setPesoPro(String PesoPro) {
        this.PesoPro = PesoPro;
    }

    public String getCantidadgeneralPro() {
        return CantidadgeneralPro;
    }

    public void setCantidadgeneralPro(String CantidadgeneralPro) {
        this.CantidadgeneralPro = CantidadgeneralPro;
    }

    public String getTemperaturaPro() {
        return TemperaturaPro;
    }

    public void setTemperaturaPro(String TemperaturaPro) {
        this.TemperaturaPro = TemperaturaPro;
    }

    public String getEstadoPro() {
        return EstadoPro;
    }

    public void setEstadoPro(String EstadoPro) {
        this.EstadoPro = EstadoPro;
    }

    public String getCategoriaPro() {
        return CategoriaPro;
    }

    public void setCategoriaPro(String CategoriaPro) {
        this.CategoriaPro = CategoriaPro;
    }
    
    
}
