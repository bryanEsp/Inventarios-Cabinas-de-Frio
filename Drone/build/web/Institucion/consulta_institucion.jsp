<%-- 
    Document   : consulta_institucion.jsp
    Created on : 03-sep-2019, 5:19:49
    Author     : SEVEN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.InstitucionDAO"%>
<%@page import="ModeloVO.InstitucionVO"%>
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
                <br>
                <center>
                    <input type="text" placeholder="Busqueda.."   name="busca" id="busca" autofocus   onkeyup="search()"   class="form-control">
                    <br>
                    <br>
                    <table id="datos" class="table  table-responsive-md table-hover table-light " style="width: 100%;">
                        <thead class="thead-dark">
                            <tr id="encabezado" >
                                <th scope="col">Código</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Celular</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Actualización</th>
                                    <%    if (rol.getRolID().equals("Admin")) { %>
                                <th scope="col">Eliminación</th>     
                                    <% } %>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                InstitucionVO instivo = new InstitucionVO();
                                InstitucionDAO instiDAO = new InstitucionDAO();
                                ArrayList<InstitucionVO> listaVehiculos = instiDAO.listarInstitucion();

                                for (int i = 0; i < listaVehiculos.size(); i++) {

                                    instivo = listaVehiculos.get(i);
                            %>
                            <tr>
                                <td ><%= instivo.getCod_insti()%></td>
                                <td><%= instivo.getNombre()%></td>
                                <td><%= instivo.getCelular()%></td>
                                <td><%= instivo.getDireccion()%></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Institucion" method="post">
                                        <button class="btn btn-lg btn-primary">Editar</button>
                                        <input type="hidden" name="cod_insti" value="<%=instivo.getCod_insti()%>">
                                        <input type="hidden" name="opcion" value="2">
                                    </form>
                                </td>
                                <%    if (rol.getRolID().equals("Admin")) {%>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Institucion" method="post">
                                        <button class="btn btn-lg btn-danger">Eliminar</button>
                                        <input type="hidden" name="cod_insti" value="<%= instivo.getCod_insti()%>">
                                        <input type="hidden" name="opcion" value="4">
                                    </form>
                                </td>
                                <% } %>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </center>
            </div>
        </div>
    </body>
</html>
