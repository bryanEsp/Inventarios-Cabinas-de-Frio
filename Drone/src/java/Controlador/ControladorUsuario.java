/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.Correo;
import ModeloDAO.RolDAO;
import ModeloDAO.UsuarioDAO;
import ModeloVO.CorreoVO;
import ModeloVO.RolVO;
import ModeloVO.UsuarioVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SEVEN
 */
@WebServlet(name = "ControladorUsuario", urlPatterns = {"/Usuario"})
public class ControladorUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String cedula_u = request.getParameter("Cedula");
        String nombre = request.getParameter("Nombre");
        String apellido = request.getParameter("Apellido");
        String celular = request.getParameter("Celular");
        String direccion = request.getParameter("Direccion");
        String cargo = request.getParameter("Cargo");
        String Fechar_registro = request.getParameter("Fecha");
        String correo = request.getParameter("Correo");
        String clave = request.getParameter("Clave");
        String insti = request.getParameter("Institu");
        String estado = request.getParameter("Estado_Usu");

        UsuarioVO usuvo = new UsuarioVO(cedula_u, nombre, apellido, celular, direccion, cargo, correo, Fechar_registro, clave, insti, estado);
        UsuarioDAO usuDAO = new UsuarioDAO(usuvo);

        RolVO rolvo = new RolVO();
        RolDAO roldao = new RolDAO();
        String ClaveR = "";

        switch (opcion) {
            case 1:
                String[] abecedario = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J",
                    "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
                    "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
                System.out.println(abecedario.length);
                for (int i = 0; i < 10; i++) {
                    int numRandon = (int) Math.round(Math.random() * 60);
                    ClaveR += abecedario[numRandon];

                }
                Correo co = new Correo();
                clave = ClaveR;
                usuvo.setClave(ClaveR);
                UsuarioDAO usuDAO2 = new UsuarioDAO(usuvo);
                if (usuDAO.validarCorTI(usuvo.getCedula(), 2)) {
                    if (usuDAO.validarCorTI2(usuvo.getCorreo(), 1)) {
                        if (usuDAO2.Agregarregistro()) {
                            CorreoVO cor = new CorreoVO("termiotpro@gmail.com", "rfmwagsxdlbzzyzc", "C:\\Users\\SEVEN\\Desktop\\Drone\\web\\logo.png", "Logo.png", correo, "Clave de Termiot", "Estimado Usuario, le damos la bienveida a Termiot, este correo es para solo informacion por favor no responderlo, su clave es:" + clave);
                            if (co.enviarCorreo(cor)) {
                                request.setAttribute("mensajeExito", "El usuario se registro correctamente");
                            } else {
                                request.setAttribute("mensajeError", "Error al enviar el correo");
                            }
                        } else {
                            request.setAttribute("mensajeError", "El usuario no pudo ser Registrado");
                        }
                    } else {
                        request.setAttribute("mensajeError", "El correo ya se encuentra registrado en la base de datos");
                    }
                } else {
                    request.setAttribute("mensajeError", "El Numero de Documento ya se encuentra registrado en la base de datos");
                }
                request.getRequestDispatcher("Usuarios/RegistrarUsuario.jsp").forward(request, response);
                break;
            case 2:

                UsuarioVO ususvo = UsuarioDAO.consultarPorid(cedula_u);

                if (ususvo != null) {

                    request.setAttribute("volleno", ususvo);
                    request.getRequestDispatcher("Usuarios/ActualizarUsuario.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El usuario NO existe");
                    request.getRequestDispatcher("Usuarios/ConsultarUsuario.jsp").forward(request, response);

                }
                break;
            case 3:
                if (usuDAO.ActualizarRegistro()) {
                    request.setAttribute("mensajeExito", "El usuario se actualizó correctamente");
                } else {
                    request.setAttribute("mensajeError", "El usuario no pudo ser actualizado");
                }
                request.getRequestDispatcher("Usuarios/ActualizarUsuario.jsp").forward(request, response);
                break;
            case 4:
                if (usuDAO.EliminarRegistro()) {
                    request.setAttribute("mensajeExito", "El usuario se Eliminado correctamente");
                } else {
                    request.setAttribute("mensajeError", "El usuario no pudo ser Eliminado");
                }
                request.getRequestDispatcher("Usuarios/ConsultarUsuario.jsp").forward(request, response);
                break;

            case 5:
                if (usuDAO.validarAcceso(correo, clave)) {
                    RolVO rolVO = RolDAO.consultarRol(correo);
                    if (rolVO != null) {
                        HttpSession session = request.getSession();
                        session.setAttribute("usuario", rolVO);
                        request.getRequestDispatcher("menu.jsp").forward(request, response);
                    } else {
                        request.setAttribute("mensajeError", "El usuario no tiene un cargo asignado");
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    }

                } else {
                    request.setAttribute("mensajeError", "El usuario y/o la contraseña son incorrectas");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

                break;
            case 6:
                UsuarioVO ususvo2 = UsuarioDAO.consultarPorid(cedula_u);

                if (ususvo2 != null) {

                    request.setAttribute("volleno", ususvo2);
                    request.getRequestDispatcher("Usuarios/Perfil.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El usuario NO existe");
                    request.getRequestDispatcher("menu.jsp").forward(request, response);

                }
                break;
            case 7:
                if (usuDAO.ActualizarRegistro()) {
                    request.setAttribute("mensajeExito", "El usuario se actualizó correctamente, vuelva a iniciar Sesión");
                    request.getRequestDispatcher("sesion").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El usuario no pudo ser actualizado");
                    request.getRequestDispatcher("Usuarios/Perfil.jsp").forward(request, response);

                }
                break;
            case 8:
                UsuarioVO ususvo3 = UsuarioDAO.consultarPorCorreo(correo);
                if (ususvo3 != null) {
                    Correo co2 = new Correo();
                    CorreoVO cor2 = new CorreoVO("termiotpro@gmail.com", "rfmwagsxdlbzzyzc", "C:\\Users\\SEVEN\\Desktop\\Drone\\web\\logo.png", "Logo.png", correo, "Clave de Termiot", "Estimado Usuario, usted a utilizado la opcion de recuperar contraseña la cual es: " + ususvo3.getClave() + ".");
                    if (co2.enviarCorreo(cor2)) {
                        request.setAttribute("mensajeExito", "El correo fue enviado");
                    } else {
                        request.setAttribute("mensajeError", "Error al enviar el correo, contactar con un administrador");
                    }

                } else {
                    request.setAttribute("mensajeError", "Este correo no se encuentra registrado en la base de datos");
                }
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
