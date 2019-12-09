/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ProductoDAO;
import ModeloVO.ProductoVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SEVEN
 */
@WebServlet(name = "ControladorProductos", urlPatterns = {"/Productos"})
public class ControladorProductos extends HttpServlet {

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

        String CodigoPro = request.getParameter("CodigoPro");
        String NombrePro = request.getParameter("nombre");
        String DescripcionPro = request.getParameter("descripcion");
        String UnidadesdeMedidaPro = request.getParameter("UnidaddeMedida");
        String PesoPro = request.getParameter("Peso");
        String CantidadgeneralPro = request.getParameter("CantidadGeneral");
        String TemperaturaPro = request.getParameter("Temperatura");
        String EstadoPro = request.getParameter("EstadoPro");
        String CategoriaPro = request.getParameter("Categoria");
        String proveedor = request.getParameter("proveedor");

        ProductoVO ProVO = new ProductoVO(CodigoPro, NombrePro, DescripcionPro, UnidadesdeMedidaPro, PesoPro, CantidadgeneralPro, TemperaturaPro, EstadoPro, CategoriaPro,proveedor);
        ProductoDAO ProDAO = new ProductoDAO(ProVO);

        switch (opcion) {
            case 1://Agregar registro
                if (ProDAO.Agregarregistro()) {
                    request.setAttribute("mensajeExito", "El Producto se registró correctamente");
                } else {
                    request.setAttribute("mensajeError", "El Producto no pudo ser registrado");
                }
                request.getRequestDispatcher("Producto/registrar_producto.jsp").forward(request, response);
                break;
            case 2://Actualizar
                if (ProDAO.ActualizarRegistro()) {
                    request.setAttribute("mensajeExito", "El Producto se ha actualizado con éxito");
                } else {
                    request.setAttribute("mensajeError", "El Producto no pudo se pudo actualizar");
                }
                request.getRequestDispatcher("Producto/actualizar_producto.jsp").forward(request, response);
                break;
            case 3://Eliminar
                if (ProDAO.EliminarRegistro()) {
                    request.setAttribute("mensajeExito", "El Producto se ha eliminado con éxito");
                } else {
                    request.setAttribute("mensajeError", "El Producto no pudo se pudo eliminado");
                }
                request.getRequestDispatcher("Producto/consultar_producto.jsp").forward(request, response);
                break;
            case 4:
                ProductoVO ProductoVO = ProductoDAO.consultarPorid(CodigoPro);
                if (ProductoVO != null) {
                    request.setAttribute("volleno", ProductoVO);
                    request.getRequestDispatcher("Producto/actualizar_producto.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "El Producto NO EXISTE");
                    request.getRequestDispatcher("Producto/consultar_producto.jsp").forward(request, response);

                }
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
