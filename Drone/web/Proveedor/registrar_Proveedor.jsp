<%@include file="../plantilla.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div id="Registros" class="scroll"  >
    <center>
        <%if (request.getAttribute("mensajeExito") != null) {%>
        <a  href="${pageContext.request.contextPath}/Proveedor/consulta_Proveedor.jsp"><div class="btn btn-success" style="width: 60%; margin: auto">
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

        <form action="${pageContext.request.contextPath}/Proveer" method="post">

            <div class="card-header">
                <h1 style="text-align: center;"><b> Registro Proveedor </b></h1><br>
            </div>


            <div class="card-body">
                <!-- Nombre -->     
                <label id="lb3"   class="label">Nombre</label>
                <input  autofocus="" onkeypress="return permite(event,'car')" type="text" id="txtnombre" name='Nombre' onkeyup="quitar();"   class="form-control txt">
                <div id="error3" class="errores  "> Debe digitar su nombre</div>
                <div id="error33" class="errores  "> Solo se permiten letras</div><br><br>
                <!-- NIT -->     
                <label id="lb4"   class="label">NIT</label>
                <input type="text" onkeypress="return permite(event,'num')" id="txtnit" name='NIT' onkeyup="quitar();"    class="form-control txt">
                <div id="error4" class="errores  "> Debe digitar su nombre</div>
                <div id="error44" class="errores  "> Solo se permiten números</div><br><br>

                <!-- Celular -->     
                <label id="lb5" class="label">Celular</label>
                <input id="txtcelular" onkeypress="return permite(event,'num')" name='Celular' type="number" min="6" maxlength="7"   onkeyup="quitar();"   class="form-control txt">
                <div id="error5" class="errores  "> Debe digitar su celular</div>
                <div id="error55" class="errores  "> Solo se permiten números</div><br><br>

                <!-- Direccion -->
                <label id="lb6" class="label">Dirección</label>
                <input id="txtdireccion" type="text" name="Direccion" class="form-control txt"  onkeyup="quitar();" >
                <div id="error6" class="errores "> Debe digitar su dirección</div><br><br>
                <input type="hidden" value="1" name="opcion" >

                <!-- Correo -->     
                <label id="lb5" class="label">Correo</label>
                <input id="txtcorreo" name='Correo' type="email" minlength="8"  onkeyup="quitar();"   class="form-control txt">
                <div id="error7" class="errores  "> Debe digitar su correo</div>
                <div id="error77" class="errores  "> Formato de correo incorrecto, verificar</div>
                <br>                <br>   
                <br>
            </div>

            <div class="card-footer">
                <input type="submit" id="registrar" class="btn btn-lg btn-dark" style="width: 100%;" value="Registrar"> 
            </div>
        </form>

        <script src="${pageContext.request.contextPath}/js/validarproveedor.js"></script>  
    </div>
</div>

