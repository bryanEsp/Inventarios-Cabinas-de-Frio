<%-- 
    Document   : RegistrarInstitucion
    Created on : 01-sep-2019, 19:20:42
    Author     : SEVEN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloVO.InstitucionVO"%>
<%@page import="ModeloDAO.InstitucionDAO"%>
<%@page import="ModeloVO.RolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../plantilla.jsp" %> 
<!DOCTYPE html>




<div id="Registros" class="scroll"  >
    <center>
        <%if (request.getAttribute("mensajeExito") != null) {%>
        <a  href="${pageContext.request.contextPath}/Cuarto_Frio/consulta_Cuarto_Frio.jsp"><div class="btn btn-success" style="width: 60%; margin: auto">
                ${mensajeExito}
            </div></a>
            <%} else if (request.getAttribute("mensajeError") != null) {%>
        <div class="btn btn-danger" style="width: 60%; margin: auto">
            ${mensajeError}
        </div>
        <%} else {
            }%>
    </center>
    <br>

    <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded" >
        <form action="${pageContext.request.contextPath}/Cuarto_Frio" method="post">

            <div class="card-header">
                <h1 style="text-align: center;"><b> Registro Cuarto Frio </b></h1><br>
            </div>


            <div class="card-body">
                <!-- longitud -->     
                <label id="lb3"   class="label">Longitud</label>
                <input  autofocus="" onkeypress="return permite(event,'num')" type="text" id="txtlongitud" name='Longitud' onkeyup="quitar();"   class="form-control txt">
                <div id="error3" class="errores  "> Debe digitar la longitud</div>
                <div id="error11" class="errores  "> Solo se permiten números</div><br><br>


                <!-- altitud -->     
                <label id="lb4" class="label">Altitud</label>
                <input id="txtaltitud" onkeypress="return permite(event,'num')" name='Altura' type="text"   onkeyup="quitar();"   class="form-control txt">
                <div id="error7" class="errores  "> Debe digitar la altitud</div>
                <div id="error9" class="errores  "> Solo se permiten números</div><br><br>

                <!-- temperatura -->
                <label id="lb5" class="label">Temperatura</label>
                <input id="txttemperatura" onkeypress="return permite(event,'num')" type="text" name="Temperatura" class="form-control txt" onkeyup="quitar();" >
                <div id="error8" class="errores "> Debe digitar la temperatura</div>
                <div id="error33" class="errores  "> Solo se permiten números</div><br><br>
                <input type="hidden" value="1" name="opcion" >

                <!-- estado -->     
                <input id="txtestado" name='estado' value="A" type="hidden"  onkeyup="quitar();"   class="form-control txt">
                <div id="error4" class="errores  "> Debe digitar el estado del cuarto frio</div>
                <div id="error44" class="errores  "> Solo se permiten letras</div><br><br>

                <!-- Estantes -->
                <label id="lb8" class="label">Cantidad total estantes</label>
                <input id="txte" onkeypress="return permite(event,'num')" type="number" name="Cant_ET" class="form-control txt" max="26" onkeyup="quitar();" >
                <div id="error01" class="errores "> Debe digitar la cantidad de estantes</div>
                <div id="error02" class="errores  "> Solo se permiten números</div>
                <div id="error07" class="errores  "> El maximo de caracteres es 26</div><br><br>
                <input type="hidden" value="1" name="opcion" >

                <!-- Profundidad -->
                <label id="lb9" class="label">Cantidad total profundidad por estante</label>
                <input id="txtp" onkeypress="return permite(event,'num')" type="number" name="Cant_Pro" class="form-control txt" onkeyup="quitar();" >
                <div id="error03" class="errores "> Debe digitar la cantidad de profundidad por estante</div>
                <div id="error04" class="errores  "> Solo se permiten números</div><br><br>
                <input type="hidden" value="1" name="opcion" >

                <!-- Nivel -->
                <label id="lb10" class="label">Cantidad Total Nivel por Estante</label>
                <input id="txtn" onkeypress="return permite(event,'num')" type="number" name="Cant_Ni" class="form-control txt" onkeyup="quitar();" >
                <div id="error05" class="errores "> Debe digitar la cantidad de niveles por estante</div>
                <div id="error06" class="errores  "> Solo se permiten numeros</div><br><br>
                <input type="hidden" value="1" name="opcion" >


                <!-- institucion -->     
                <label id="lb232" class="label">Institución</label>
                <!-- Institucion -->
                <select name="Institu" class="form-control txt" id="txtTipo" onclick="quitar()">
                    <option></option>
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
                <br>
                <br>
                <br>

            </div>
            <div class="card-footer">
                <input type="submit" id="registrar" class="btn btn-dark" style="width: 100%;" value="Registrar"> 
            </div>
        </form>


    </div>
</div>
<script src="${pageContext.request.contextPath}/js/validarCuartoFrios.js"></script>
