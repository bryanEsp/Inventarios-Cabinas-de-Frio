package ModeloDAO;

import ModeloVO.RolVO;
import ModeloVO.UsuarioVO;
import Util.CRUD;
import Util.ConexionDB;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UsuarioDAO extends ConexionDB implements CRUD {

    private Statement puente;
    private Connection conexion;
    private ResultSet mensajero;

    private String cedula = "";
    private String nombre = "";
    private String apellido = "";
    private String celular = "";
    private String direccion = "";
    private String cargo = "";
    private String correo = "";
    private String Fecha_Registro = "";
    private String clave = "";
    private String institucion = "";
    private String estado_usu = "";

    private boolean operaciones = false;

    public UsuarioDAO(UsuarioVO usuvo) {
        super();
        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            cedula = usuvo.getCedula();
            nombre = usuvo.getNombre();
            apellido = usuvo.getApellido();
            celular = usuvo.getCelular();
            direccion = usuvo.getDireccion();
            cargo = usuvo.getCargo();
            Fecha_Registro = usuvo.getFecha_Registro();
            correo = usuvo.getCorreo();
            clave = usuvo.getClave();
            institucion = usuvo.getInstitucion();
            estado_usu = usuvo.getEstado_usu();

        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
    }

    @Override
    public boolean Agregarregistro() {
        try {
            puente.executeUpdate("call crudUsuario (" + cedula + ",'" + nombre + "','" + apellido + "'," + celular + ",'" + direccion + "','" + cargo + "','" + correo + "',null,'" + clave + "'," + institucion + ",null,'insertar');");
            operaciones = true;
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return operaciones;

    }

    @Override
    public boolean ActualizarRegistro() {
        try {
            puente.executeUpdate("call crudUsuario (" + cedula + ",'" + nombre + "','" + apellido + "'," + celular + ",'" + direccion + "','" + cargo + "','" + correo + "',null,'" + clave + "'," + institucion + ",null,'actualizar');");
            operaciones = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operaciones;
    }

    @Override
    public boolean EliminarRegistro() {
        try {
            puente.executeUpdate("call crudUsuario (" + cedula + ",null,null,null,null,null,null,null,null,null,null,'eliminar');");
            operaciones = true;
        } catch (Exception e) {
            System.out.println("¡ERROR Actualizar!" + e.toString());

        }
        return operaciones;
    }

    public ArrayList<UsuarioVO> listarInstitucion() {
        ConexionDB conexionbd = new ConexionDB();
        ArrayList<UsuarioVO> listaUsuario = new ArrayList<>();
        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from Usuario where estado_usu='A';");

            while (mensajero.next()) {
                UsuarioVO usuvo = new UsuarioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11));
                listaUsuario.add(usuvo);

            }
        } catch (Exception e) {
            System.out.println("¡ERROR Consulta!" + e.toString());
        }
        return listaUsuario;
    }

    public boolean validarAcceso(String usuario, String password) {

        try {
            conexion = this.obtenerConexion();
            puente = conexion.createStatement();

            mensajero = puente.executeQuery("call validar('" + usuario + "','" + password + "');;");
            if (mensajero.next()) {
                operaciones = true;
            }
            this.cerrarConexion();
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return operaciones;
    }

    public static UsuarioVO consultarPorid(String id) {
        UsuarioVO usuvo = null;
        try {
            ConexionDB conexionbd = new ConexionDB();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery("call crudUsuario(" + id + ",null,null,null,null,null,null,null,null,null,null,'Consultar');");
            while (mensajero.next()) {

                usuvo = new UsuarioVO(id, mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11));

            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return usuvo;
    }

    public boolean validarCorTI(String valor, int opc) {
        ConexionDB conexionbd = new ConexionDB();

        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery(" call validarUsuario('" + valor + "'," + opc + ");");
            if (mensajero.next()) {
                System.out.println(" call validarUsuario('" + valor + "'," + opc + ");");
            } else {
                operaciones = true;
            }
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return operaciones;
    }

    public boolean validarCorTI2(String valor, int opc) {
        ConexionDB conexionbd = new ConexionDB();

        try {
            puente = conexionbd.obtenerConexion().createStatement();
            mensajero = puente.executeQuery(" call validarUsuario('" + valor + "'," + opc + ");");
            if (mensajero.next()) {
                System.out.println(" call validarUsuario('" + valor + "'," + opc + ");");
                operaciones = false;
            } else {
                operaciones = true;

            }
        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return operaciones;
    }

    public UsuarioDAO() {
    }
        public static UsuarioVO consultarPorCorreo(String correo) {
        UsuarioVO usuvo = null;
        try {
            ConexionDB conexionbd = new ConexionDB();
            Connection conexion = conexionbd.obtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery(" call validarUsuario('" + correo + "'," + 1 + ");");
            while (mensajero.next()) {

                usuvo = new UsuarioVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8), mensajero.getString(9), mensajero.getString(10), mensajero.getString(11));

            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("¡ERROR!" + e.toString());
        }
        return usuvo;
    }

}
