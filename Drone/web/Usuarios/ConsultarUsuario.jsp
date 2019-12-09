<%-- 
    Document   : ConsultarUsuario
    Created on : 05-sep-2019, 1:28:02
    Author     : SEVEN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.UsuarioDAO"%>
<%@page import="ModeloVO.UsuarioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../plantilla.jsp" %>
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
                    <input type="text" placeholder="Busqueda.."   name="busca" id="busca"  autofocus=""    onkeyup="search()"   class="form-control">
                    <br>
                    <br>
                    <table id="datos" class="table  table-responsive-md table-hover table-light " style="width: 80%;">
                        <thead class="thead-dark">
                            <tr id="encabezado" >
                                <th scope="col">Código</th>
                                <th scope="col">Nombre</th>
                                <th scope="col"> Celular</th>
                                <th scope="col">Dirección</th>
                                <th scope="col">Correo</th>
                                <th scope="col"> Fecha registro</th>
                                <th scope="col">Cargo</th>
                                <th scope="col">Institución</th>
                                <th scope="col">Actualización</th>
                                <th scope="col">Eliminación</th>                                
                            </tr>
                        </thead>
                        <tbody  >
                            <%
                                UsuarioVO usuvo = new UsuarioVO();
                                UsuarioDAO usuDAO = new UsuarioDAO();
                                ArrayList<UsuarioVO> listausuarios = usuDAO.listarInstitucion();

                                for (int i = 0; i < listausuarios.size(); i++) {

                                    usuvo = listausuarios.get(i);
                            %>
                            <tr>

                                <td ><%= usuvo.getCedula()%></td>
                                <td><%= usuvo.getNombre()%></td>
                                <td><%= usuvo.getCelular()%></td>
                                <td><%= usuvo.getDireccion()%></td>
                                <td><%= usuvo.getCorreo()%></td>
                                <td><%= usuvo.getFecha_Registro()%></td>
                                <td><%= usuvo.getCargo()%></td>
                                <td><%= usuvo.getInstitucion()%></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Usuario" method="post">
                                        <button class="btn btn-lg btn-primary">Editar</button>
                                        <input type="hidden" name="Cedula" value="<%=usuvo.getCedula()%>">
                                        <input type="hidden" name="opcion" value="2">
                                    </form>
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Usuario" method="post">
                                        <button class="btn btn-lg btn-danger">Eliminar</button>
                                        <input type="hidden" name="Cedula" value="<%= usuvo.getCedula()%>">
                                        <input type="hidden" name="opcion" value="4">
                                    </form>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </center>
            </div>
        </div>
    </body>
</html>