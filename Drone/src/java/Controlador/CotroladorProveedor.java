/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ProveedorDAO;
import ModeloVO.ProveedorVO;
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
@WebServlet(name = "CotroladorProducto", urlPatterns = {"/Proveer"})
public class CotroladorProveedor extends HttpServlet {

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

        String NIT = request.getParameter("NIT");
        String nombre = request.getParameter("Nombre");
        String celular = request.getParameter("Celular");
        String direccion = request.getParameter("Direccion");
        String correo = request.getParameter("Correo");
        String estado_Proveedor = request.getParameter("estado_Proveedor");

        ProveedorVO proveevo = new ProveedorVO(NIT, nombre, celular, direccion, correo, estado_Proveedor);
        ProveedorDAO proveedao = new ProveedorDAO(proveevo);

        switch (opcion) {
            case 1:
                if (proveedao.Agregarregistro()) {
                    request.setAttribute("mensajeExito", "El proveedor se registro correctamente");
                } else {

                    request.setAttribute("mensajeError", "El proveedor no pudo ser registrado");
                }
                request.getRequestDispatcher("Proveedor/registrar_Proveedor.jsp").forward(request, response);

                break;
            case 2:
                ProveedorVO proveedorvo = ProveedorDAO.consultarPorid(NIT);

                if (proveedorvo != null) {

                    request.setAttribute("volleno", proveedorvo);
                    request.getRequestDispatcher("Proveedor/Actualizar_Proveedor.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El Proveedor NO existe");
                    request.getRequestDispatcher("Proveedor/consulta_Proveedor.jsp").forward(request, response);

                }
                break;
            case 3:
                if (proveedao.ActualizarRegistro()) {
                    request.setAttribute("mensajeExito", "El Proveedor se actualizó correctamente");
                } else {
                    request.setAttribute("mensajeError", "El Proveedor no pudo ser actualizado");
                }
                request.getRequestDispatcher("Proveedor/Actualizar_Proveedor.jsp").forward(request, response);
                break;
            case 4:
                if (proveedao.EliminarRegistro()) {
                    request.setAttribute("mensajeExito", "El Proveedor se Eliminado correctamente");
                } else {
                    request.setAttribute("mensajeError", "El Proveedor no pudo ser Eliminado");
                }
                request.getRequestDispatcher("Proveedor/consulta_Proveedor.jsp").forward(request, response);
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
