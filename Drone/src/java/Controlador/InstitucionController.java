/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.InstitucionDAO;
import ModeloVO.InstitucionVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SEVEN
 */
@WebServlet(name = "InstitucionController", urlPatterns = {"/Institucion"})
public class InstitucionController extends HttpServlet {

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

        String Cod_insti = request.getParameter("cod_insti");
        String nombre = request.getParameter("Nombre");
        String celular = request.getParameter("Celular");
        String direccion = request.getParameter("Direccion");
        String estado_insti = request.getParameter("Estado_insti");

        InstitucionVO instivo = new InstitucionVO(Cod_insti, nombre, celular, direccion, estado_insti);
        InstitucionDAO instidao = new InstitucionDAO(instivo);

        switch (opcion) {
            case 1:
                if (instidao.Agregarregistro()) {
                    request.setAttribute("mensajeExito", "La Institucion se registro correctamente");
                } else {

                    request.setAttribute("mensajeError", "La Institucion no pudo ser registroda");
                }
                request.getRequestDispatcher("Institucion/registrar_Institucion.jsp").forward(request, response);

                break;
            case 2:
                InstitucionVO instituvo = InstitucionDAO.consultarPorid(Cod_insti);

                if (instituvo != null) {

                    request.setAttribute("volleno", instituvo);
                    request.getRequestDispatcher("Institucion/Actualizar_Institucion.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El vehiculo NO existe");
                    request.getRequestDispatcher("Institucion/consulta_institucion.jsp").forward(request, response);

                }
                break;
            case 3:
                if (instidao.ActualizarRegistro()) {
                    request.setAttribute("mensajeExito", "La Institucion se actualizó correctamente");
                } else {
                    request.setAttribute("mensajeError", "La Institucion no pudo ser actualizado");
                }
                request.getRequestDispatcher("Institucion/Actualizar_Institucion.jsp").forward(request, response);
                break;
            case 4:
                if (instidao.EliminarRegistro()) {
                    request.setAttribute("mensajeExito", "La Institucion se Eliminado correctamente");
                } else {
                    request.setAttribute("mensajeError", "La Institucion no pudo ser Eliminado");
                }
                request.getRequestDispatcher("Institucion/consulta_institucion.jsp").forward(request, response);
                break;
            case 5:
                if (instidao.EliminarRegistro()) {
                    request.setAttribute("mensajeExito", "La Institucion se Eliminado correctamente");
                } else {
                    request.setAttribute("mensajeError", "La Institucion no pudo ser Eliminado");
                }
                request.getRequestDispatcher("Institucion/consulta_institucion.jsp").forward(request, response);
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
