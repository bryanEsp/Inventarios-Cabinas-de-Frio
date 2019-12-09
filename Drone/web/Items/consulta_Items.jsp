<%-- 
    Document   : consulta_institucion.jsp
    Created on : 03-sep-2019, 5:19:49
    Author     : SEVEN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ItemsDAO"%>
<%@page import="ModeloVO.ItemsVO"%>
<%@ include file="../plantilla.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
                <input type="text" placeholder="Busqueda.."  name="busca" id="busca" autofocus=""     onkeyup="search()"   class="form-control">
                <br>
                <br>
                <center>
                    <table id="datos" class="table  table-responsive-md table-hover table-light " style="width: 100%;">
                        <thead class="thead-dark">
                            <tr id="encabezado" >
                                <th scope="col">Código</th>
                                <th scope="col">Fecha Vencimiento</th>
                                <th scope="col">Estante</th>
                                <th scope="col">Nivel</th>
                                <th scope="col">Profundidad</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Observación</th>
                                <th scope="col">Lote</th>
                                <th scope="col">Ingreso fecha/hora</th>
                                <th scope="col">Embalaje</th>
                                <th scope="col">Producto</th>
                                <th scope="col">Cuarto Frio</th>
                                <th scope="col">Actualización</th>
                                    <%    if (rol.getRolID().equals("Admin")) { %>
                                <th scope="col">Eliminación</th>     
                                    <% } %>                             
                            </tr>
                        </thead>
                        <tbody  >
                            <%
                                ItemsVO itemsvo = new ItemsVO();
                                ItemsDAO itemsDAO = new ItemsDAO();
                                ArrayList<ItemsVO> listaVehiculos = itemsDAO.listarInstitucion();

                                for (int i = 0; i < listaVehiculos.size(); i++) {

                                    itemsvo = listaVehiculos.get(i);
                            %>
                            <tr>

                                <td ><%= itemsvo.getCodigo_barras()%></td>
                                <td><%= itemsvo.getFecha_vencimiento()%></td>
                                <td><%= itemsvo.getestante()%></td>
                                <td><%= itemsvo.getnivel()%></td>
                                <td><%= itemsvo.getprofundidad()%></td>
                                <td><%= itemsvo.getcantidad()%></td>
                                <td><%= itemsvo.getobservacion()%></td>
                                <td><%= itemsvo.getlote()%></td>
                                <td><%= itemsvo.getfecha_ingreso()%></td>
                                <td><%= itemsvo.getembalaje()%></td>
                                <td><%= itemsvo.getcod_producto()%></td>
                                <td><%= itemsvo.getcuarto_frio()%></td>

                                <td>
                                    <form action="${pageContext.request.contextPath}/Items" method="post">
                                        <button class="btn btn-lg btn-primary">Editar</button>
                                        <input type="hidden" name="Codigo_Barras" value="<%=itemsvo.getCodigo_barras()%>">
                                        <input type="hidden" name="opcion" value="2">
                                    </form>
                                </td>
                                <%    if (rol.getRolID().equals("Admin")) {%>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Items" method="post">
                                        <button class="btn btn-lg btn-danger">Eliminar</button>
                                        <input type="hidden" name="Codigo_Barras" value="<%= itemsvo.getCodigo_barras()%>">
                                        <input type="hidden" name="opcion" value="4">
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
