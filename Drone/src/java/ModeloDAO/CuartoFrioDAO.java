package ModeloDAO;

import ModeloVO.CuartoFrioVO;
import Util.CRUD;
import Util.ConexionDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CuartoFrioDAO extends ConexionDB implements CRUD {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;
    private String Cod_Cufi = "";
    private String longitud = "";
    private String altura = "";
    private String temperatura = "";
    private String estado_cuartofrio = "";
    private String cant_estan = "";
    private String cant_profundidad = "";
    private String cant_nivel = "";
    private String institucion = "";

    private boolean operacion = false;

    public CuartoFrioDAO(CuartoFrioVO cuartofriovo) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            Cod_Cufi = cuartofriovo.getCod_Cufi();
            longitud = cuartofriovo.getLongitud();
            altura = cuartofriovo.getAltura();
            temperatura = cuartofriovo.getTemperatura();
            estado_cuartofrio = cuartofriovo.getEstado_cuartofrio();
            institucion = cuartofriovo.getInstitucion();
            cant_estan = cuartofriovo.getCant_es();
            cant_profundidad = cuartofriovo.getCant_pro();
            cant_nivel = cuartofriovo.getCant_nivel();

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
    }

    @Override
    public boolean Agregarregistro() {
        try {
            puente.executeUpdate("call crudcuartofrio (null,'" + longitud + "'," + altura + ",'" + temperatura + "',null,"+ cant_estan +","+ cant_profundidad +","+ cant_nivel +",'" + institucion + "','insertar');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());

        }
        return operacion;
    }

    @Override
    public boolean ActualizarRegistro() {
        try {
            puente.executeUpdate("call crudcuartofrio (" + Cod_Cufi + "," + longitud + "," + altura + ",'" + temperatura + "',null,"+ cant_estan +","+ cant_profundidad +","+ cant_nivel +"," + institucion + ",'actualizar');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operacion;
    }

    @Override
    public boolean EliminarRegistro() {
        try {
            puente.executeUpdate("call crudcuartofrio (" + Cod_Cufi + ",null,null,null,null,null,null,null,null,'eliminar');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operacion;
    }

    public ArrayList<CuartoFrioVO> listarInstitucion() {
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<CuartoFrioVO> listaInstitucion = new ArrayList<>();
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from Cuarto_Frio where estado_cufi='A';");

            while (mensajero.next()) {
                CuartoFrioVO cuartofriovo = new CuartoFrioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),mensajero.getString(7),mensajero.getString(8),mensajero.getString(9));
                listaInstitucion.add(cuartofriovo);

            }
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return listaInstitucion;
    }

    public CuartoFrioDAO() {
    }

    public static CuartoFrioVO consultarPorid(String id) {
        CuartoFrioVO cuartofriovo = null;
        try {
            ConexionDB conexionbd = new ConexionDB();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery("call crudcuartofrio (" + id + ",null,null,null,null,null,null,null,null,'consultar');");
            while (mensajero.next()) {

                cuartofriovo = new CuartoFrioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6),mensajero.getString(7),mensajero.getString(8),mensajero.getString(9));

            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return cuartofriovo;
    }
}
