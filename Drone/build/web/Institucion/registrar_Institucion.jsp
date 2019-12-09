<%-- 
    Document   : RegistrarInstitucion
    Created on : 01-sep-2019, 19:20:42
    Author     : SEVEN
--%>

<%@page import="ModeloVO.RolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../plantilla.jsp" %>  
<!DOCTYPE html>


<div id="Registros" class="scroll"  >
    <center>
        <%if (request.getAttribute("mensajeExito") != null) {%>
        <a  href="${pageContext.request.contextPath}/Institucion/consulta_institucion.jsp"><div class="btn btn-success" style="width: 60%; margin: auto">
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

    <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded">
        <form action="${pageContext.request.contextPath}/Institucion" method="post">

            <div class="card-header">
                <h1 style="text-align: center;"><b> Registro Institución </b></h1><br>
            </div>


            <div class="card-body">
                <!-- Nombre -->     
                <label  autofocus="" id="lb3"   class="label">Nombre</label>
                <input type="text" id="txtNombre" name='Nombre' onkeypress="return permite(event, 'num_car');" onkeyup="quitar();"   class="form-control txt">
                <div id="error3" class="errores  "> Debe digitar su Nombre</div>
                <div id="error33" class="errores  "> Solo se permiten letras</div><br><br>


                <!-- Celular -->     
                <label id="lb5" class="label">Celular</label>
                <input id="txtcelular" onkeypress="return permite(event,'num')" name='Celular' type="text" minlength="8"  onkeyup="quitar();" onkeypress="return permite(event, 'num')"   class="form-control txt">
                <div id="error5" class="errores  "> Debe digitar su Celular</div>
                <div id="error55" class="errores  "> Solo se permiten numeros</div><br><br>

                <!-- Direccion -->
                <label id="lb6" class="label">Dirección</label>
                <input id="txtdireccion" type="text" name="Direccion" class="form-control txt" onkeypress="return permite(event, 'num_car')" onkeyup="quitar();" >
                <div id="error6" class="errores "> Debe digitar su Direccion</div><br><br>
                <input type="hidden" value="1" name="opcion" >
                <br>
            </div>

            <div class="card-footer">
                <input type="submit" id="registrar" class="btn btn-lg btn-dark" style="width: 100%;" value="Registrar"> 
            </div>
        </form>


    </div>
</div>

<script src="${pageContext.request.contextPath}/js/validarInstitucio.js"></script>
