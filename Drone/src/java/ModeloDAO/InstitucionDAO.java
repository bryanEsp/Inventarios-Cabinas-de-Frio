package ModeloDAO;

import ModeloVO.InstitucionVO;
import Util.CRUD;
import Util.ConexionDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class InstitucionDAO extends ConexionDB implements CRUD {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    private String Cod_insti = "";
    private String nombre = "";
    private String celular = "";
    private String direccion = "";
    private String estado_insti = "";

    private boolean operacion = false;

    public InstitucionDAO(InstitucionVO instivo) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            Cod_insti = instivo.getCod_insti();
            nombre = instivo.getNombre();
            celular = instivo.getCelular();
            direccion = instivo.getDireccion();
            estado_insti = instivo.getEstado_insti();

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
    }

    @Override
    public boolean Agregarregistro() {
        try {
            puente.executeUpdate("call crudinsti (null,'" + nombre + "'," + celular + ",'" + direccion + "','insertar');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());

        }
        return operacion;
    }

    @Override
    public boolean ActualizarRegistro() {
        try {
            puente.executeUpdate("call crudinsti (" + Cod_insti + ",'" + nombre + "'," + celular + ",'" + direccion + "','actualizar');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operacion;
    }

    @Override
    public boolean EliminarRegistro() {
        try {
            puente.executeUpdate("call crudinsti (" + Cod_insti + ",null,null,null,'eliminar');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operacion;
    }

    public ArrayList<InstitucionVO> listarInstitucion() {
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<InstitucionVO> listaInstitucion = new ArrayList<>();
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from Institucion where estado_insti='A';");

            while (mensajero.next()) {
                InstitucionVO instiVO = new InstitucionVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
                listaInstitucion.add(instiVO);

            }
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return listaInstitucion;
    }

    public InstitucionDAO() {
    }

    public static InstitucionVO consultarPorid(String id) {
        InstitucionVO instivo = null;
        try {
            ConexionDB conexionbd = new ConexionDB();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery("call crudinsti (" + id + ",null,null,null,'consultar');");
            while (mensajero.next()) {

                instivo = new InstitucionVO(id, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));

            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return instivo;
    }

    public ArrayList<InstitucionVO> consultarPorcoin(String id) {
        InstitucionVO instivo = null;
        ArrayList<InstitucionVO> listaInstitucion2 = new ArrayList<>();
        try {
            ConexionDB conexionbd = new ConexionDB();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery("call consultaInstiLike('" + id + "');");
            while (mensajero.next()) {

                instivo = new InstitucionVO(id, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
                listaInstitucion2.add(instivo);
            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return listaInstitucion2;
    }
}
