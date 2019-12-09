/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import ModeloVO.ProveedorVO;
import Util.CRUD;
import Util.ConexionDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ProveedorDAO extends ConexionDB implements CRUD {
    
    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    private String NIT = "";
    private String nombre = "";
    private String celular = "";
    private String direccion = "";
    private String correo = "";
    private String estado_Proveedor = "";
    
    private boolean operacion = false;
    
    public ProveedorDAO(ProveedorVO proveevo) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            NIT = proveevo.getNIT();
            nombre = proveevo.getNombre();
            celular = proveevo.getCelular();
            direccion = proveevo.getDireccion();
            correo = proveevo.getcorreo();
            estado_Proveedor = proveevo.getestado_Proveedor();

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
    }
    
    @Override
    public boolean Agregarregistro() {
        try {
            puente.executeUpdate("call crudProveedor ('" + nombre + "',"+ NIT +"," + celular + ",'" + direccion + "','" + correo + "',null,'insertar');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());

        }
        return operacion;
    }

    @Override
    public boolean ActualizarRegistro() {
        try {
            puente.executeUpdate("call crudProveedor ('" + nombre + "'," + NIT + "," + celular + ",'" + direccion + "','" + correo + "',null,'actualizar');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operacion;
    }

    @Override
    public boolean EliminarRegistro() {
        try {
            puente.executeUpdate("call crudProveedor (null," + NIT + ",null,null,null,null,'Eliminar');");
            operacion = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operacion;
    }
     public ArrayList<ProveedorVO> listaProveedor() {
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<ProveedorVO> listaProveedor = new ArrayList<>();
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from Proveedor where estado_Proveedor='A';");

            while (mensajero.next()) {
                ProveedorVO proveeVO = new ProveedorVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6));
                listaProveedor.add(proveeVO);

            }
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return listaProveedor;
        
    }
     public ProveedorDAO() {
    }

    public static ProveedorVO consultarPorid(String NIT) {
        ProveedorVO proveevo = null;
        try {
            ConexionDB conexionbd = new ConexionDB();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery("call crudProveedor (null," + NIT + ",null,null,null,null,'consultar');");
            while (mensajero.next()) {

                proveevo = new ProveedorVO(NIT, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6));

            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return proveevo;
    }
}
