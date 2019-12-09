package ModeloDAO;

import ModeloVO.RolVO;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import Util.ConexionDB;

public class RolDAO {

    public static RolVO consultarRol(String usuid) {
        RolVO rolvo = null;
        try {
            ConexionDB conexionbd = new ConexionDB();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery("select Cedula_u,cargo,Concat(nombre,' ',apellido) from usuario where correo= '" + usuid + "' ;");
            while (mensajero.next()) {
                rolvo = new RolVO(mensajero.getString(2), mensajero.getString(1), mensajero.getString(3));

            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return rolvo;
    }
}
