/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import ModeloDAO.ItemsDAO;
import ModeloDAO.MotivoDAO;
import ModeloVO.ItemsVO;
import ModeloVO.Motivo;
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
@WebServlet(name = "ItemsController", urlPatterns = {"/Items"})
public class ItemsController extends HttpServlet {

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

        String Codigo_barras = request.getParameter("Codigo_Barras");
        String Fecha_vencimiento = request.getParameter("Fecha_Vencimiento");
        String estante = request.getParameter("Estante");
        String nivel = request.getParameter("Nivel");
        String profundidad = request.getParameter("Profundidad");
        String cantidad = request.getParameter("Cantidad");
        String observacion = request.getParameter("Observacion");
        String lote = request.getParameter("Lote");
        String fecha_ingreso = request.getParameter("Ingresofechahor");
        String embalaje = request.getParameter("Embalaje");
        String cod_producto = request.getParameter("Cod_Producto");
        String cuarto_frio = request.getParameter("Cuarto_Frio");

        ItemsVO itemvo = new ItemsVO(Codigo_barras, Fecha_vencimiento, estante, nivel, profundidad, cantidad, observacion, lote, fecha_ingreso, embalaje, cod_producto, cuarto_frio);
        ItemsDAO itemsdao = new ItemsDAO(itemvo);

        switch (opcion) {
            case 1:
                if (itemsdao.validarPosicion(estante, profundidad, nivel, cuarto_frio)) {
                    request.setAttribute("mensajeError", "Ya hay un item en la posiciòn: " + estante + profundidad + nivel + " En el cuarto frio Nª: " + cuarto_frio);
                } else if (itemsdao.Agregarregistro()) {
                    request.setAttribute("mensajeExito", "Los items se registraron correctamente");
                } else {

                    request.setAttribute("mensajeError", "Los items no pudieron ser registrado");
                }
                request.getRequestDispatcher("Items/registrar_Items.jsp").forward(request, response);

                break;
            case 2:
                ItemsVO itemsvo = ItemsDAO.consultarPorid(Codigo_barras);
                //Codigo_barras
                if (itemsvo != null) {

                    request.setAttribute("volleno", itemsvo);
                    request.getRequestDispatcher("Items/Actualizar_Items.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "El item no existe");
                    request.getRequestDispatcher("Items/consulta_Items.jsp").forward(request, response);

                }
                break;
            case 3:
                if (itemsdao.ActualizarRegistro()) {
                    request.setAttribute("mensajeExito", "El item se actualizó correctamente");
                } else {
                    request.setAttribute("mensajeError", "El item no pudo ser actualizado");
                }
                request.getRequestDispatcher("Items/Actualizar_Items.jsp").forward(request, response);
                break;
            case 4:
                if (itemsdao.EliminarRegistro()) {
                    request.setAttribute("mensajeExito", "El item se Elimino correctamente");
                } else {
                    request.setAttribute("mensajeError", "El item no pudo ser Eliminado");
                }
                request.getRequestDispatcher("Items/consulta_Items.jsp").forward(request, response);
                break;
            case 5:
                String nombre[] = request.getParameterValues("Nombre");
                String cantida[] = request.getParameterValues("Cantidad");
                String motivo[] = request.getParameterValues("Motivo");
                String tipo[] = request.getParameterValues("Tipo");
                MotivoDAO modao = new MotivoDAO();
                for (int i = 0; i < cantida.length; i++) {
                    Motivo vo = new Motivo(nombre[i], cantida[i], motivo[i], "", tipo[i]);
                    if (itemsdao.motivo(nombre[i], cantida[i], motivo[i], tipo[i])) {
                        if (tipo[i].equals("I")) {
                            if (itemsdao.ActualizarCantidad(nombre[i], cantida[i])) {
                                request.setAttribute("mensajeExito", "El item se Actualizo correctamente");
                            } else {
                                request.setAttribute("mensajeError", "El item no pudo ser Actualizado");
                            }
                        } else if (tipo[i].equals("R")) {
                            if (itemsdao.RestarCantidad(nombre[i], cantida[i])) {
                                request.setAttribute("mensajeExito", "El item se Actualizo correctamente");
                            } else {
                                request.setAttribute("mensajeError", "El item no pudo ser Actualizado");
                            }
                        }
                    } else {
                        request.setAttribute("mensajeExito", "Hubo un problema a registrar los motivos en la base de datos");
                    }
                }
                request.getRequestDispatcher("Items/consulta_Items.jsp").forward(request, response);
                break;

            case 6:
                ItemsVO itemsvo2 = new ItemsVO(Codigo_barras, Fecha_vencimiento, estante, nivel, profundidad, cantidad, observacion, lote, fecha_ingreso, embalaje, cod_producto, cuarto_frio);
                request.setAttribute("volleno", itemsvo2);
                request.getRequestDispatcher("Items/registrar_Items.jsp").forward(request, response);
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
