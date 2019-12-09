package ModeloDAO;

import ModeloVO.ItemsVO;
import Util.CRUD;
import Util.ConexionDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ItemsDAO extends ConexionDB implements CRUD {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    private String Codigo_barras = "";
    private String Fecha_vencimiento = "";
    private String estante = "";
    private String nivel = "";
    private String profundidad = "";
    private String cantidad = "";
    private String observacion = "";
    private String lote = "";
    private String fecha_ingreso = "";
    private String embalaje = "";
    private String cod_producto = "";
    private String cuarto_frio = "";

    private boolean operacion = false;

    public ItemsDAO(ItemsVO itemsvo) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            Codigo_barras = itemsvo.getCodigo_barras();
            Fecha_vencimiento = itemsvo.getFecha_vencimiento();
            estante = itemsvo.getestante();
            nivel = itemsvo.getnivel();
            profundidad = itemsvo.getprofundidad();
            cantidad = itemsvo.getcantidad();
            observacion = itemsvo.getobservacion();
            lote = itemsvo.getlote();
            fecha_ingreso = itemsvo.getfecha_ingreso();
            embalaje = itemsvo.getembalaje();
            cod_producto = itemsvo.getcod_producto();
            cuarto_frio = itemsvo.getcuarto_frio();

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
    }

    @Override
    public boolean Agregarregistro() {
        try {
            puente.executeUpdate("call CrudITEMS(" + Codigo_barras + ",'" + Fecha_vencimiento + "','" + estante + "','" + nivel + "','" + profundidad + "','" + cantidad + "','" + observacion + "','" + lote + "',null,'" + embalaje + "','" + cod_producto + "','" + cuarto_frio + "','insertar',null);");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());

        }
        return operacion;
    }

    @Override
    public boolean ActualizarRegistro() {
        try {
            puente.executeUpdate("call CrudITEMS('" + Codigo_barras + "','" + Fecha_vencimiento + "','" + estante + "','" + nivel + "','" + profundidad + "','" + cantidad + "','" + observacion + "','" + lote + "',null,'" + embalaje + "','" + cod_producto + "','" + cuarto_frio + "','actualizar',null);");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operacion;
    }

    @Override
    public boolean EliminarRegistro() {
        try {
            puente.executeUpdate("call CrudITEMS('" + Codigo_barras + "',null,null,null,null,null,null,null,null,null,null,null,'eliminar',null);");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR eliminar!" + e.toString());

        }
        return operacion;
    }

    public ArrayList<ItemsVO> listarInstitucion() {
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<ItemsVO> listaInstitucion = new ArrayList<>();
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from Items where estado='A';");

            while (mensajero.next()) {
                ItemsVO itemsVO = new ItemsVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11), mensajero.getString(12));
                listaInstitucion.add(itemsVO);

            }
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return listaInstitucion;
    }

    public ItemsDAO() {
    }

    public static ItemsVO consultarPorid(String id) {
        ItemsVO itemsvo = null;
        try {
            ConexionDB conexionbd = new ConexionDB();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery("call CrudITEMS(" + id + ",null,null,null,null,null,null,null,null,null,null,null,'consultar',null);");
            while (mensajero.next()) {

                itemsvo = new ItemsVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11), mensajero.getString(12));

            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return itemsvo;
    }

    public boolean ActualizarCantidad(String esta1, String esta2) {
        try {
            puente.executeUpdate(" call ActualizaItem (" + esta1 + "," + esta2 + ")");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operacion;
    }

    public boolean RestarCantidad(String esta1, String esta2) {
        try {
            puente.executeUpdate(" call RestarItem (" + esta1 + "," + esta2 + ")");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operacion;
    }

    public ArrayList<ItemsVO> listarInstitucionUbi(String estante, int profundidad, int nivel, int cufi) {
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<ItemsVO> listaInstitucion = new ArrayList<>();
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("call ConsultarPosicion('" + estante + "'," + profundidad + "," + nivel + "," + cufi + ");");
            while (mensajero.next()) {
                ItemsVO itemsVO = new ItemsVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11), mensajero.getString(12));
                listaInstitucion.add(itemsVO);

            }
            conexionbd.cerrarConexion();
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return listaInstitucion;
    }

    public boolean validarPosicion(String estante, String profundidad, String nivel, String cufi) {
        ConexionDB conexionbd = new ConexionDB();

        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("call ConsultarPosicion('" + estante + "'," + profundidad + "," + nivel + "," + cufi + ");");
            if (mensajero.next()) {
                operacion = true;
            }
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return operacion;
    }

    public boolean motivo(String barras, String cantidad, String motivo,String tipo) {
        try {
            puente.executeUpdate("call crudEntradaSalida(" + barras + ", " + cantidad + ",'" + motivo + "','" + tipo + "');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operacion;
    }
}
