<%-- 
    Document   : Actualizar_Institucion
    Created on : 03-sep-2019, 6:50:48
    Author     : SEVEN
--%>
<%@ include file="../plantilla.jsp" %>  
<%@page import="ModeloVO.InstitucionVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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

            <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded" >

                <form action="${pageContext.request.contextPath}/Institucion" method="post">
                    <%InstitucionVO instivo = (InstitucionVO) request.getAttribute("volleno");
                        if (instivo != null) {%>
                    <div class="card-header">
                        <h1 style="text-align: center;"><b> Actualizar Institución </b></h1><br>
                    </div>


                    <div class="card-body">
                        <input type="hidden" name="cod_insti" value="<%=instivo.getCod_insti()%>">

                        <!-- Nombre -->     
                        <label id="lb3"   class="label">Nombre</label>
                        <input  autofocus="" type="text" id="txtNombre" name='Nombre' onkeyup="quitar();" value="<%= instivo.getNombre()%>"  class="form-control txt">
                        <div id="error3" class="errores  "> Debe digitar su Nombre</div>
                        <div id="error33" class="errores  "> Solo se permiten letras</div><br><br>


                        <!-- Celular -->     
                        <label id="lb5" class="label">Celular</label>
                        <input id="txtcelular" onkeypress="return permite(event,'num')" name='Celular' type="text" minlength="8" value="<%= instivo.getCelular()%>"  onkeyup="quitar();"   class="form-control txt">
                        <div id="error5" class="errores  "> Debe digitar su Celular</div>
                        <div id="error55" class="errores  "> Solo se permiten numeros</div><br><br>

                        <!-- Direccion -->
                        <label id="lb6" class="label">Dirección</label>
                        <input id="txtdireccion" type="text" name="Direccion" class="form-control txt" value="<%= instivo.getDireccion()%>" onkeyup="quitar();" >
                        <div id="error6" class="errores "> Debe digitar su Direccion</div><br><br>

                    </div>
                <br>

                    <div class="card-footer">
                        <input type="hidden" value="3" name="opcion" >
                        <input type="submit" id="registrar" class="btn btn-dark" style="width: 100%;" value="Actualizar"> 
                    </div>
                    <%}%>
                </form>

            </div>
        </div>      
        <script src="${pageContext.request.contextPath}/js/validarInstitucio.js"></script>  
    </body>
</html>
