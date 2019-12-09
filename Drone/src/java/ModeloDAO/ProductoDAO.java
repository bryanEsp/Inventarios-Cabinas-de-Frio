/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import ModeloVO.ProductoVO;
import Util.CRUD;
import Util.ConexionDB;

/**
 *
 * @author Usuario
 */
public class ProductoDAO extends ConexionDB implements CRUD {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    String CodigoPro = "";
    String NombrePro = "";
    String DescripcionPro = "";
    String UnidadesdeMedidaPro = "";
    String PesoPro = "";
    String CantidadgeneralPro = "";
    String TemperaturaPro = "";
    String EstadoPro = "";
    String CategoriaPro = "";
    String Proveedor = "";

    private boolean operaciones = false;

    public ProductoDAO(ProductoVO ProVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            CodigoPro = ProVO.getCodigoPro();
            NombrePro = ProVO.getNombrePro();
            DescripcionPro = ProVO.getDescripcionPro();
            UnidadesdeMedidaPro = ProVO.getUnidadesdeMedidaPro();
            PesoPro = ProVO.getPesoPro();
            CantidadgeneralPro = ProVO.getCantidadgeneralPro();
            TemperaturaPro = ProVO.getTemperaturaPro();
            EstadoPro = ProVO.getEstadoPro();
            CategoriaPro = ProVO.getCategoriaPro();
            Proveedor = ProVO.getProveedor();
            
        } catch (Exception e) {
        }

    }

    public ProductoDAO() {
    }

    @Override
    public boolean Agregarregistro() {
        try {

            puente.executeUpdate("call CrudProducto (null,'" + NombrePro + "','" + DescripcionPro + "','" + UnidadesdeMedidaPro + "','" + PesoPro + "','" + CantidadgeneralPro + "','" + TemperaturaPro + "',null," + "'" + CategoriaPro + "','" + Proveedor + "','insertar');");
            operaciones = true;

        } catch (Exception e) {

            System.out.println("¡Error ProductoDAO agregarRegistro!" + e.toString());
        }
        return operaciones;
    }

    @Override
    public boolean ActualizarRegistro() {
        try {

            puente.executeUpdate("call CrudProducto (" + CodigoPro + ",'" + NombrePro + "','" + DescripcionPro + "','" + UnidadesdeMedidaPro + "','" + PesoPro + "','" + CantidadgeneralPro + "','" + TemperaturaPro + "',null," + "'" + CategoriaPro + "','" + Proveedor + "','actualizar');");
            operaciones = true;

        } catch (Exception e) {

            System.out.println("¡Error ProductoDAO actualizarRegistro!" + e.toString());
        }
        return operaciones;
    }

    @Override
    public boolean EliminarRegistro() {
        try {
            puente.executeUpdate("call CrudProducto (" + CodigoPro + ",null,null,null,null,null,null,null,null,null,'eliminar');");
            operaciones = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar Estado ProductoDAO EliminarRegistro!" + e.toString());

        }
        return operaciones;
    }

    public ArrayList<ProductoVO> listarproductos() {
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<ProductoVO> listaProductos = new ArrayList<>();
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from producto where estado_Pro='A';");

            while (mensajero.next()) {
                ProductoVO ProVO = new ProductoVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9),mensajero.getString(10));
                listaProductos.add(ProVO);

            }
        } catch (Exception e) {
            System.out.println("¡ERROR ProductoDAO listarproductos!" + e.toString());
        }
        return listaProductos;
    }

    public static ProductoVO consultarPorid(String id) {
        ProductoVO productoVO = null;
        try {
            ConexionDB conexionbd = new ConexionDB();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery("call CrudProducto(" + id + ", null, null, null, null, null, null, null, null,null, 'consultar');");
            while (mensajero.next()) {

                productoVO = new ProductoVO(id, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10));

            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return productoVO;
    }

}
