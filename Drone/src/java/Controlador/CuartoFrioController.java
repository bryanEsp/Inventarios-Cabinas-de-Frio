/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.CuartoFrioDAO;
import ModeloVO.CuartoFrioVO;
import ModeloVO.UbicacionVO;
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
@WebServlet(name = "CuartoFrioController", urlPatterns = {"/Cuarto_Frio"})
public class CuartoFrioController extends HttpServlet {

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

        String Cod_Cufi = request.getParameter("cod_Cufi");
        String longitud = request.getParameter("Longitud");
        String altura = request.getParameter("Altura");
        String temperatura = request.getParameter("Temperatura");
        String estado_cuartofrio = request.getParameter("Estado_cuartofrio");
        String cantET = request.getParameter("Cant_ET");
        String cantPro = request.getParameter("Cant_Pro");
        String cantNi = request.getParameter("Cant_Ni");
        String institucion = request.getParameter("Institu");

        CuartoFrioVO cuartofriovo = new CuartoFrioVO(Cod_Cufi, longitud, altura, temperatura, estado_cuartofrio, cantET, cantPro, cantNi, institucion);
        CuartoFrioDAO cuartofriodao = new CuartoFrioDAO(cuartofriovo);

        switch (opcion) {
            case 1:
                if (cuartofriodao.Agregarregistro()) {
                    request.setAttribute("mensajeExito", "El Cuarto Frio se actualizó correctamente");
                } else {

                    request.setAttribute("mensajeError", "El Cuarto Frio no pudo ser actualizado");
                }
                request.getRequestDispatcher("Cuarto_Frio/registrar_Cuarto_Frio.jsp").forward(request, response);

                break;
            case 2:
                CuartoFrioVO cuartofrivo = CuartoFrioDAO.consultarPorid(Cod_Cufi);

                if (cuartofrivo != null) {

                    request.setAttribute("volleno", cuartofrivo);
                    request.getRequestDispatcher("Cuarto_Frio/Actualizar_Cuarto_Frio.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El cuarto frio NO existe");
                    request.getRequestDispatcher("Cuarto_Frio/consulta_Cuarto_Frio.jsp").forward(request, response);

                }
                break;
            case 3:
                if (cuartofriodao.ActualizarRegistro()) {
                    request.setAttribute("mensajeExito", "El cuarto frio se actualizó correctamente");
                } else {
                    request.setAttribute("mensajeError", "El cuarto frio no pudo ser actualizado");
                }
                request.getRequestDispatcher("Cuarto_Frio/consulta_Cuarto_Frio.jsp").forward(request, response);
                break;
            case 4:
                if (cuartofriodao.EliminarRegistro()) {
                    request.setAttribute("mensajeExito", "El cuarto frio se Eliminado correctamente");
                } else {
                    request.setAttribute("mensajeError", "El cuarto frio no pudo ser Eliminado");
                }
                request.getRequestDispatcher("Cuarto_Frio/consulta_Cuarto_Frio.jsp").forward(request, response);
                break;
            case 5:
                CuartoFrioVO cuartofrivo2 = CuartoFrioDAO.consultarPorid(Cod_Cufi);

                if (cuartofrivo2 != null) {
                    request.setAttribute("volleno2", cuartofrivo2);
                    request.getRequestDispatcher("Cuarto_Frio/consulta_Cuarto_Frio.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El cuarto frio NO existe");
                    request.getRequestDispatcher("Cuarto_Frio/consulta_Cuarto_Frio.jsp").forward(request, response);
                }
                break;
            case 6:
                String cantET2 = request.getParameter("Cant_ET2");
                int cantPro2 = Integer.parseInt(request.getParameter("Cant_Pro2"));
                int cantNi2 = Integer.parseInt(request.getParameter("Cant_Ni2"));
                int Cod_Cufi2 = Integer.parseInt(request.getParameter("cufi"));
                UbicacionVO ubvo = new UbicacionVO(cantNi2, cantPro2, Cod_Cufi2, cantET2);
                request.setAttribute("volleno2", ubvo);
                request.getRequestDispatcher("Cuarto_Frio/Ubicacion.jsp").forward(request, response);
                break;
            case 7:
                String cantET3 = request.getParameter("Cant_ET2");
                int cantPro3 = Integer.parseInt(request.getParameter("Cant_Pro2"));
                int cantNi3 = Integer.parseInt(request.getParameter("Cant_Ni2"));
                int Cod_Cufi3 = Integer.parseInt(request.getParameter("cufi"));
                UbicacionVO ubvo2 = new UbicacionVO(cantNi3, cantPro3, Cod_Cufi3, cantET3);
                request.setAttribute("volleno2", ubvo2);
                request.getRequestDispatcher("Cuarto_Frio/GeneraUbi.jsp").forward(request, response);
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
