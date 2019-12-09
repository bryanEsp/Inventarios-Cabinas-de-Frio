package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {

    private String bd, url, drive, usu, pass;
    public Connection conexion;

    public ConexionDB() {
        bd = "drone2";
        pass = "root";
        usu = "root";
        drive = "com.mysql.jdbc.Driver";
        url = "jdbc:mysql://localhost:3306/" + bd + "?autoReconnect=true&useSSL=false";
        try {
            Class.forName(drive).newInstance();
            conexion = DriverManager.getConnection(url, usu, pass);
            System.out.println("Conexion Ok!");
        } catch (Exception e) {
            System.out.println("Error al conectar con BD" + e.toString());
        }
    }

    public Connection obtenerConexion() {
        return conexion;
    }

    public Connection cerrarConexion() throws SQLException {
        conexion.close();
        conexion = null;
        return conexion;
    }

    public static void main(String[] args) {
        new ConexionDB();
    }

}
