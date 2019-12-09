<%-- 
    Document   : ActualizarUsuario
    Created on : 05-sep-2019, 1:46:51
    Author     : SEVEN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.InstitucionDAO"%>
<%@page import="ModeloVO.InstitucionVO"%>
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
        <!--  Parte de formulario para los campos  -->
        <div id="Registros" class="scroll"  >
            <center>
                <%if (request.getAttribute("mensajeExito") != null) {%>
                <div class="btn btn-success" style="width: 60%; margin: auto">
                    ${mensajeExito}
                </div>
                <%} else if (request.getAttribute("mensajeError") != null) {%>
                <div class="btn btn-danger" style="width: 60%; margin: auto">
                    ${mensajeError}
                </div>
                <%} else {
                    }%>
            </center>
            <br>

            <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded" >
                <form action="${pageContext.request.contextPath}/Usuario" method="post">
                    <%UsuarioVO usuvo = (UsuarioVO) request.getAttribute("volleno");
                        if (usuvo != null) {%>

                    <div class="card-header">
                        <h1 style="text-align: center;"><b> Actualizar Usuario </b></h1><br>
                    </div>


                    <div class="card-body"> 
                        <input id="txtDocumento" name="Cedula"value="<%= usuvo.getCedula()%>" type="hidden" onkeypress="return permite(event,'num')" minlength="8" name="text" onkeyup="quitar();" >
                        <div id="error1" class="errores  "> Debe digitar su Número de documento</div>
                        <div id="error11" class="errores  "> Solo se permiten números</div><br><br>
                        <!-- Nombre -->     
                        <label id="lb3" class="label">Nombre</label>
                        <input type="text" name="Nombre" onkeypress="return permite(event,'car')" value="<%= usuvo.getNombre()%>" id="txtNombre" name="text" onkeyup="quitar();"  placeholder="Digite su nombre" class="form-control txt">
                        <div id="error3" class="errores  "> Debe digitar su Nombre</div>
                        <div id="error33" class="errores  "> Solo se permiten letras</div><br><br>

                        <!-- Apellido -->     
                        <label id="lb4" class="label">Apellido</label>
                        <input type="text" name="Apellido" onkeypress="return permite(event,'car')" id="txtApellido" value="<%= usuvo.getApellido()%>" onkeyup="quitar();" placeholder="Digite su apellido" name="text"  class="form-control txt">
                        <div id="error4" class="errores  "> Debe digitar su Apellido</div>
                        <div id="error44" class="errores  "> Solo se permiten letras</div><br><br>

                        <!-- Celular -->     
                        <label id="lb5" class="label">Celular</label>
                        <input id="txtcelular" name="Celular" type="text" value="<%= usuvo.getCelular()%>" onkeypress="return permite(event,'num')" minlength="8" name="text" onkeyup="quitar();" placeholder="Digite su celular"  class="form-control txt">
                        <div id="error5" class="errores  "> Debe digitar su Celular</div>
                        <div id="error55" class="errores  "> Solo se permiten numeros</div><br><br>

                        <!-- Direccion -->
                        <label id="lb6" class="label">Dirección</label>
                        <input id="txtdireccion" name="Direccion" type="text" name="text" value="<%= usuvo.getDireccion()%>" class="form-control txt" onkeyup="quitar();" placeholder="Digite su dirección">
                        <div id="error6" class="errores "> Debe digitar su Dirección</div><br><br>

                        <!-- Correo -->
                        <label id="lb7" class="label">Correo</label>
                        <input type="text" name="Correo" value="<%= usuvo.getCorreo()%>" id="txtcorreo" onkeyup="quitar();" class="form-control txt" placeholder="Digite su correo">
                        <div id="error7" class="errores  "> Debe digitar su Correo electronico</div>
                        <div id="error77" class="errores  "> El correo no es valido, verificar</div><br><br>
                        <!-- Clave -->
                        <input id="txtclave" name="Clave" type="hidden" value="<%= usuvo.getClave()%>"><br><br>

                        <!-- Cargo -->
                        <label id="lb9" class="label">Cargo</label>
                        <select id="txtCargo" name="Cargo" onclick="quitar();"  class="form-control txt">
                            <% if (usuvo.getCargo().equals("Almacenista")) {%>
                            <option  value = "<%= usuvo.getCargo()%>" > <%= usuvo.getCargo()%></option>
                            <option value="Administrador">Administrador</option>
                            <% } else {%>
                            <option  value = "<%= usuvo.getCargo()%>" > <%= usuvo.getCargo()%></option>
                            <option value="Almacenista">Almacenista</option> 
                            <% }%>
                        </select> <br><br>
                        <div id="error9" class="errores  "> Debe seleccionar el cargo correspondiente</div>

                        <!-- Institucion -->
                        <label id="lb232" class="label">Institución</label>
                        <!-- Institucion -->
                        <select name="Institu" class="form-control txt" id="txtTipo" onclick="quitar()">
                            <option value = "<%= usuvo.getInstitucion()%>"><%= usuvo.getInstitucion()%></option>
                            <%
                                InstitucionVO instivo = new InstitucionVO();
                                InstitucionDAO instiDAO = new InstitucionDAO();
                                ArrayList<InstitucionVO> listaVehiculos = instiDAO.listarInstitucion();

                                for (int i = 0; i < listaVehiculos.size(); i++) {

                                    instivo = listaVehiculos.get(i);
                            %>
                            <option value="<%= instivo.getCod_insti()%>"  >  <%= instivo.getNombre()%></option>
                            <% }%>
                        </select>
                        <div id="error09" class="errores  "> Debe seleccionar la Institución correspondiente</div><br><br><br>
                    </div>

                    <input type="hidden" value="3" name="opcion" >
                    <div class="card-footer">
                        <input type="submit" id="registrar" class="btn btn-lg btn-dark" style="width: 100%;" value="Actualizar"> 
                    </div>
                    <%}%>
                </form>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/validarCamposR.js"></script>