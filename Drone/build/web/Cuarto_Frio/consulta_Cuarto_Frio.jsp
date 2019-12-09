<%-- 
    Document   : consulta_institucion.jsp
    Created on : 03-sep-2019, 5:19:49
    Author     : SEVEN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.CuartoFrioDAO"%>
<%@page import="ModeloVO.CuartoFrioVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../plantilla.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% CuartoFrioVO cuartofriovo2 = (CuartoFrioVO) request.getAttribute("volleno2");

            if (cuartofriovo2 != null) {%>%>
        <div id="1" style="background-color: rgba(0,0,5,0.5);width: 100%;height: 100%;position: fixed;z-index: 9998;"></div>

        <div class="modal" id="v" tabindex="-1" role="dialog" style="display: block;transition-duration:  15s;z-index: 9999;">
            <div style="width: 60%;margin: 70px 150px 0px auto; height: 700px;"  role="document">
                <div class="modal-content" >
                    <div class="modal-header">
                        <h5 class="modal-title">Estantes del cuarto frío Nª <%= cuartofriovo2.getCod_Cufi()%> </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('v').style.display = 'none';document.getElementById('1').style.display = 'none';">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" style="overflow: scroll">
                        <h3> Cantidad Estantes:  <%= cuartofriovo2.getCant_es()%> </h3>
                        <center>
                            <form action="${pageContext.request.contextPath}/Cuarto_Frio" method="post">
                                <button type="submit" class="btn badge-dark" style="width: 80%;float: left;height: 30px;margin: 0px 100px; "  >Todos</button>
                                <input type="hidden" value="<%=cuartofriovo2.getCant_es()%>" name="Cant_ET2">
                                <input type="hidden" value="<%= cuartofriovo2.getCant_pro()%>" name="Cant_Pro2">
                                <input type="hidden" value="<%= cuartofriovo2.getCant_nivel()%>" name="Cant_Ni2">
                                <input type="hidden" value="<%= cuartofriovo2.getCod_Cufi()%>" name="cufi">
                                <input type="hidden" name="opcion" value="7">
                            </form><br><br>
                        </center>
                        <table style="width: 100%;">
                            <%
                                int cont = 0;
                                int e = Integer.parseInt(cuartofriovo2.getCant_es());
                                String[] abecedario = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
                                for (int i = 0; i < e; i++) {
                                    if (cont == 7) {
                            %> 
                            <tr style="height: 10px;"></tr>    
                            <%      cont = 0;
                                }
                            %>
                            <form action="${pageContext.request.contextPath}/Cuarto_Frio" method="post">
                                <td >
                                    <button type="submit" style="width: 80%;float: left;height: 80px;font-size: 20px;" class="btn btn-outline-dark"  ><%=abecedario[i]%></button>
                                    <input type="hidden" value="<%=abecedario[i]%>" name="Cant_ET2">
                                    <input type="hidden" value="<%= cuartofriovo2.getCant_pro()%>" name="Cant_Pro2">
                                    <input type="hidden" value="<%= cuartofriovo2.getCant_nivel()%>" name="Cant_Ni2">
                                    <input type="hidden" value="<%= cuartofriovo2.getCod_Cufi()%>" name="cufi">
                                    <input type="hidden" name="opcion" value="6">
                                </td>
                            </form>
                            <%
                                    cont++;
                                }
                            %>
                        </table><center>

                        </center>   
                    </div>
                </div>
            </div>
        </div>
        <% } else {
            } %>

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
                    <input type="text" placeholder="Busqueda.."  name="busca" id="busca"  autofocus=""    onkeyup="search()"   class="form-control">
                    <br>
                    <br>
                    <table id="datos" class="table  table-responsive-md table-hover table-light " style="width: 100%;height: 100px;">
                        <thead class="thead-dark">
                            <tr id="encabezado" >
                                <th scope="col">Código</th>
                                <th scope="col">longitud</th>
                                <th scope="col"> altitud</th>
                                <th scope="col">temperatura</th>
                                <th scope="col">estado</th>
                                <th scope="col">Cantidad Estantes</th>
                                <th scope="col">Cantidad Profundidad Estante</th>
                                <th scope="col">Cantidad Nivel Estante</th>
                                <th scope="col">institución</th>                                
                                <th scope="col">Editar</th> 
                                    <%    if (rol.getRolID().equals("Admin")) { %>
                                <th scope="col">Eliminar</th>    
                                    <% } %>
                                <th scope="col">Plano</th>    
                            </tr>
                        </thead>
                        <tbody  >
                            <%
                                CuartoFrioVO cuartofriovo = new CuartoFrioVO();
                                CuartoFrioDAO cuartofrioDAO = new CuartoFrioDAO();
                                ArrayList<CuartoFrioVO> listaVehiculos = cuartofrioDAO.listarInstitucion();

                                for (int i = 0; i < listaVehiculos.size(); i++) {

                                    cuartofriovo = listaVehiculos.get(i);
                            %>
                            <tr>

                                <td ><%= cuartofriovo.getCod_Cufi()%></td>
                                <td><%= cuartofriovo.getLongitud()%></td>
                                <td><%= cuartofriovo.getAltura()%></td>
                                <td><%= cuartofriovo.getTemperatura()%></td>
                                <td><%= cuartofriovo.getEstado_cuartofrio()%></td>
                                <td><%= cuartofriovo.getCant_es()%> </td>
                                <td><%= cuartofriovo.getCant_pro()%></td>
                                <td><%= cuartofriovo.getCant_nivel()%></td>

                                <td><%= cuartofriovo.getInstitucion()%></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Cuarto_Frio" method="post">
                                        <button class="btn btn-lg btn-primary">Editar</button>
                                        <input type="hidden" name="cod_Cufi" value="<%=cuartofriovo.getCod_Cufi()%>">
                                        <input type="hidden" name="opcion" value="2">
                                    </form>
                                </td>
                                <%    if (rol.getRolID().equals("Admin")) {%>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Cuarto_Frio" method="post">
                                        <button class="btn btn-lg btn-danger">Eliminar</button>
                                        <input type="hidden" name="cod_Cufi" value="<%= cuartofriovo.getCod_Cufi()%>">
                                        <input type="hidden" name="opcion" value="4">
                                    </form>
                                </td>
                                <% }%>
                                <td>
                                    <form action="${pageContext.request.contextPath}/Cuarto_Frio" method="post">
                                        <button class="btn btn-lg btn-primary">Mostrar Plano</button>
                                        <input type="hidden" name="cod_Cufi" value="<%=cuartofriovo.getCod_Cufi()%>">
                                        <input type="hidden" name="opcion" value="5">
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