
package ModeloVO;

public class RolVO {
    
   private String rolID, usuID,nombre;

    public RolVO() {
    }

    public RolVO(String rolID, String usuID, String nombre) {
        this.rolID = rolID;
        this.usuID = usuID;
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }



    public String getRolID() {
        return rolID;
    }

    public void setRolID(String rolID) {
        this.rolID = rolID;
    }

    public String getUsuID() {
        return usuID;
    }

    public void setUsuID(String usuID) {
        this.usuID = usuID;
    }
   
   
    
}
