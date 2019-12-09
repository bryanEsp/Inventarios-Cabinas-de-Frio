package ModeloDAO;

import ModeloVO.Motivo;
import Util.CRUD;
import Util.ConexionDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MotivoDAO extends ConexionDB implements CRUD {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    private String barras = "";
    private String cantidad = "";
    private String motivo = "";
    private String fecha = "";

    private boolean operacion = false;

    public MotivoDAO() {
    }

    public MotivoDAO(Motivo mov) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            barras = mov.getCodigoBarras();
            cantidad = mov.getCantidad();
            motivo = mov.getMotivo();
            fecha = mov.getFecha();

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
    }

    public boolean Agregarregistro() {
        try {
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());

        }
        return operacion;
    }

    public ArrayList<Motivo> listarInstitucion() {
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<Motivo> listaInstitucion = new ArrayList<Motivo>();
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select Cod_M, CodigoBarras, CantidadRegistrada, FechaRegistro, Motivo, Tipo from EntradaSalida where estado_insti='A';");

            while (mensajero.next()) {
                Motivo instiVO = new Motivo(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(6));
                listaInstitucion.add(instiVO);
                System.out.println(mensajero.getString(5));

            }
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return listaInstitucion;
    }

    @Override
    public boolean ActualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean EliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
