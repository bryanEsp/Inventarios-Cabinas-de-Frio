/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.CategoriaDAO;
import ModeloVO.CategoriaVO;
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
@WebServlet(name = "ControladorCategoria", urlPatterns = {"/Categoria"})
public class ControladorCategoria extends HttpServlet {

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

        String idCat = request.getParameter("idCat");
        String NombreCat = request.getParameter("nombre");
        String DescripcionCat = request.getParameter("descripcion");
        String EstadoCat = request.getParameter("EstadoCat");

        CategoriaVO CatVO = new CategoriaVO(idCat, NombreCat, DescripcionCat, EstadoCat);
        CategoriaDAO CatDAO = new CategoriaDAO(CatVO);

        switch (opcion) {
            case 1://Agregar registro
                if (CatDAO.Agregarregistro()) {
                    request.setAttribute("mensajeExito", "La Categoria se registró correctamente");
                } else {
                    request.setAttribute("mensajeError", "La Categoria no pudo ser registrada");
                }
                request.getRequestDispatcher("Producto/registrar_producto.jsp").forward(request, response);
                break;
            case 2://Actualizar
                if (CatDAO.ActualizarRegistro()) {
                    request.setAttribute("mensajeExito", "El Producto se ha actualizado con éxito");
                } else {
                    request.setAttribute("mensajeError", "El Producto no pudo se pudo actualizar");
                }
                request.getRequestDispatcher("Producto/actualizar_producto.jsp").forward(request, response);
                break;
            case 3://Eliminar
                if (CatDAO.EliminarRegistro()) {
                    request.setAttribute("mensajeExito", "El Producto se Eliminado correctamente");
                } else {
                    request.setAttribute("mensajeError", "El Producto no pudo ser Eliminado");
                }
                request.getRequestDispatcher("Producto/consultar_producto.jsp").forward(request, response);
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
