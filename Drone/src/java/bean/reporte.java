/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.sql.SQLException;
import javax.faces.context.FacesContext;
import javax.servlet.ServletContext;

/**
 *
 * @author APRENDIZ
 */
@Named(value = "reporte")
@SessionScoped
public class reporte implements Serializable {

    /**
     * Creates a new instance of reporte
     */
    public reporte() {
    }
         public void verReporte() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        
        //Instancia hacia la clase stock        
        Stock stockkk= new Stock();
        
        FacesContext facesContext = FacesContext.getCurrentInstance();
        ServletContext servletContext = (ServletContext) facesContext.getExternalContext().getContext();
        String ruta = servletContext.getRealPath("/Reporte/Stock1.jasper");
       
        stockkk.getReporte(ruta);        
        FacesContext.getCurrentInstance().responseComplete();               
    }
}
