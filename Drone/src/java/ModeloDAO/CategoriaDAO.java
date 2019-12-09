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
import ModeloVO.CategoriaVO;
import Util.CRUD;
import Util.ConexionDB;

/**
 *
 * @author Usuario
 */
public class CategoriaDAO extends ConexionDB implements CRUD {

    private Connection conexion = null;
    private Statement puente = null;
    private ResultSet mensajero = null;

    String idCat = "";
    String NombreCat = "";
    String DescripcionCat = "";
    String EstadoCat = "";
    private boolean operaciones = false;

    public CategoriaDAO(CategoriaVO CatVO) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            idCat = CatVO.getIdCat();
            NombreCat = CatVO.getNombreCat();
            DescripcionCat = CatVO.getDescripcionCat();
            EstadoCat = CatVO.getEstadoCat();

        } catch (Exception e) {
        }
    }

    public CategoriaDAO() {
    }
    

    @Override
    public boolean Agregarregistro() {
                try {

            puente.executeUpdate("call crudCategoria (null,'" + NombreCat+ "','" + DescripcionCat + "'," + "null"+",'insertar');");
            operaciones = true;

        } catch (Exception e) {

            System.out.println("¡Error ProductoDAO agregarRegistro!" + e.toString());
        }
        return operaciones;
    }

    @Override
    public boolean ActualizarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ArrayList<CategoriaVO> listarproductocategoria() {
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<CategoriaVO> listaCategorias = new ArrayList<>();
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from Categoria ");
            while (mensajero.next()) {

                CategoriaVO vehVO = new CategoriaVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4));
                listaCategorias.add(vehVO);

            }
        } catch (Exception e) {
            System.out.println("¡ERROR CategoriaDAO listarproductocategoria!" + e.toString());
        }
        return listaCategorias;
    }

    @Override
    public boolean EliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


}
