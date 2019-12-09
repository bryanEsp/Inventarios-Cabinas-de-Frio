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
public class CategoriaVO {
String idCat,NombreCat,DescripcionCat,EstadoCat;

    public CategoriaVO(String idCat, String NombreCat, String DescripcionCat, String EstadoCat) {
        this.idCat = idCat;
        this.NombreCat = NombreCat;
        this.DescripcionCat = DescripcionCat;
        this.EstadoCat = EstadoCat;
    }
    public CategoriaVO() {
    }

    public String getIdCat() {
        return idCat;
    }

    public void setIdCat(String idCat) {
        this.idCat = idCat;
    }

    public String getNombreCat() {
        return NombreCat;
    }

    public void setNombreCat(String NombreCat) {
        this.NombreCat = NombreCat;
    }

    public String getDescripcionCat() {
        return DescripcionCat;
    }

    public void setDescripcionCat(String DescripcionCat) {
        this.DescripcionCat = DescripcionCat;
    }

    public String getEstadoCat() {
        return EstadoCat;
    }

    public void setEstadoCat(String EstadoCat) {
        this.EstadoCat = EstadoCat;
    }
    
    
}
