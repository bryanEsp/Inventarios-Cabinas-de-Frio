<%-- 
    Document   : consultar_producto
    Created on : 3/09/2019, 10:24:58 PM
    Author     : Usuario
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@ include file="../plantilla.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto Consultar</title>
    </head>

    <body class="scroll" background="img/seleccionameesta.jpg">
        <div id="Registros" class="scroll"  >
            <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded table-responsive"style="width: 90%;height: 800px;  ">
                <%if (request.getAttribute("mensajeExito") != null) {%>
                <div class="alert alert-success" style="width: 60%; margin: auto">
                    ${mensajeExito}
                </div>
                <%} else if (request.getAttribute("mensajeError") != null) {%>
                <div class="alert alert-danger" style="width: 60%; margin: auto">
                    ${mensajeError}
                </div>
                <%} else {
                    }%>
                <br>
                <input type="text" placeholder="Busqueda.."   name="busca" id="busca" autofocus=""   onkeyup="search()"   class="form-control">
                <br>
                <br>
                <center>
                    <table id="datos" class="table  table-responsive-md table-hover table-light " style="width: 100%;">
                        <thead class="thead-dark">
                            <tr id="encabezado" >
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Descripción</th>
                                <th scope="col">Unidad de Medida</th>
                                <th scope="col">Peso</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Temperatura</th>
                                <th scope="col">Categoría</th>
                                <th scope="col">Estado</th>
                                <th scope="col">Actualización</th>
                                    <%    if (rol.getRolID().equals("Admin")) { %>
                                <th scope="col">Eliminación</th>       
                                    <% } %>
                            </tr>
                        </thead>
                        <tbody  >
                            <%
                                ProductoVO instivo = new ProductoVO();
                                ProductoDAO ProDAO = new ProductoDAO();
                                ArrayList<ProductoVO> listaProductos = ProDAO.listarproductos();

                                for (int i = 0; i < listaProductos.size(); i++) {

                                    instivo = listaProductos.get(i);
                            %>
                            <tr>

                                <td ><%= instivo.getCodigoPro()%></td>
                                <td><%= instivo.getNombrePro()%></td>
                                <td><%= instivo.getDescripcionPro()%></td>
                                <td><%= instivo.getUnidadesdeMedidaPro()%></td>
                                <td><%= instivo.getPesoPro()%></td>
                                <td><%= instivo.getCantidadgeneralPro()%></td>
                                <td><%= instivo.getTemperaturaPro()%></td>
                                <td><%= instivo.getCategoriaPro()%></td>
                                <td><%= instivo.getEstadoPro()%></td>

                                <td>
                                    <form action="${pageContext.request.contextPath}/Productos" method="post">
                                        <button class="btn btn-lg btn-primary">Editar</button>
                                        <input type="hidden" name="CodigoPro" value="<%=instivo.getCodigoPro()%>">
                                        <input type="hidden" name="opcion" value="4">
                                    </form>
                                </td>
                                <%    if (rol.getRolID().equals("Admin")) {%>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Productos" method="post">
                                        <button class="btn btn-lg btn-danger">Eliminar</button>
                                        <input type="hidden" name="CodigoPro" value="<%= instivo.getCodigoPro()%>">
                                        <input type="hidden" name="opcion" value="3">
                                    </form>
                                </td>
                                <% } %>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </center>
            </div>
        </div>
    </body>
</html>
