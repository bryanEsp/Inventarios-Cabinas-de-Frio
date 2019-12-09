
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page import="ModeloVO.ProveedorVO"%>
<%@include file="../plantilla.jsp" %>
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
                    <input type="text" placeholder="Busqueda.."   name="busca" id="busca" autofocus=""     onkeyup="search()"   class="form-control">
                    <br>
                    <br>
                    <table id="datos" class="table  table-responsive-md table-hover table-light " style="width: 100%;">
                        <thead class="thead-dark">
                            <tr id="encabezado" >
                                <th scope="col">Nombre</th>
                                <th scope="col">NIT</th>
                                <th scope="col">Celular</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Actualización</th>
                                 <%    if (rol.getRolID().equals("Admin")) { %>
                                <th scope="col">Eliminación</th>             
                                <% } %>
                            </tr>
                        </thead>
                        <tbody  >
                            <%
                                ProveedorVO proveevo = new ProveedorVO();
                                ProveedorDAO proveeDAO = new ProveedorDAO();
                                ArrayList<ProveedorVO> listaProveedores = proveeDAO.listaProveedor();

                                for (int i = 0; i < listaProveedores.size(); i++) {
                                    proveevo = listaProveedores.get(i);
                            %>
                            <tr>

                                <td ><%= proveevo.getNIT()%></td>
                                <td><%= proveevo.getNombre()%></td>
                                <td><%= proveevo.getCelular()%></td>
                                <td><%= proveevo.getDireccion()%></td>
                                <td><%= proveevo.getcorreo()%></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Proveer" method="post">
                                        <button class="btn btn-lg btn-primary">Editar</button>
                                        <input type="hidden" name="NIT" value="<%=proveevo.getNombre()%>">
                                        <input type="hidden" name="opcion" value="2">
                                    </form>
                                </td>
                                 <%    if (rol.getRolID().equals("Admin")) { %>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Proveer" method="post">
                                        <button class="btn btn-lg btn-danger">Eliminar</button>
                                        <input type="hidden" name="NIT" value="<%= proveevo.getNombre()%>">
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
