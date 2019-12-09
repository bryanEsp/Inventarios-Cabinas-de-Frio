<%-- 
    Document   : Perfil
    Created on : 05-sep-2019, 4:07:44
    Author     : SEVEN
--%>

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

            <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded" style="height: 700px;">
                <form action="${pageContext.request.contextPath}/Usuario" method="post">
                    <%UsuarioVO usuvo = (UsuarioVO) request.getAttribute("volleno");
                        if (usuvo != null) {%>

                    <div class="card-header">
                        <h1 style="text-align: center;"><b> Actualizar Perfil </b></h1><br>
                    </div>


                    <div class="card-body"> 

                        <input type="hidden" name="Cedula" value="<%= usuvo.getCedula()%>">
                        <!-- Nombre -->     
                        <label id="lb3" class="label">Nombre</label>
                        <input type="text" name="Nombre" value="<%= usuvo.getNombre()%>" id="txtNombre" name="text" onkeyup="quitar();"  placeholder="Digite su nombre" class="form-control txt">
                        <div id="error3" class="errores  "> Debe digitar su Nombre</div>
                        <div id="error33" class="errores  "> Solo se permiten letras</div><br><br>

                        <!-- Apellido -->     
                        <label id="lb4" class="label">Apellido</label>
                        <input type="text" name="Apellido" id="txtApellido" value="<%= usuvo.getApellido()%>" onkeyup="quitar();" placeholder="Digite su apellido" name="text"  class="form-control txt">
                        <div id="error4" class="errores  "> Debe digitar su Apellido</div>
                        <div id="error44" class="errores  "> Solo se permiten letras</div><br><br>

                        <!-- Celular -->     
                        <label id="lb5" class="label">Celular</label>
                        <input id="txtcelular" name="Celular" type="text" value="<%= usuvo.getCelular()%>" minlength="8" name="text" onkeyup="quitar();" placeholder="Digite su celular"  class="form-control txt">
                        <div id="error5" class="errores  "> Debe digitar su Celular</div>
                        <div id="error55" class="errores  "> Solo se permiten numeros</div><br><br>

                        <!-- Direccion -->
                        <label id="lb6" class="label">Dirección</label>
                        <input id="txtdireccion" name="Direccion" type="text" name="text" value="<%= usuvo.getDireccion()%>" class="form-control txt" onkeyup="quitar();" placeholder="Digite su direccion">
                        <div id="error6" class="errores "> Debe digitar su Dirección</div><br><br>

                        <!-- Correo -->
                        <label id="lb7" class="label">Correo</label>
                        <input type="text" name="Correo" value="<%= usuvo.getCorreo()%>" id="txtcorreo" onkeyup="quitar();" class="form-control txt" placeholder="Digite su correo">
                        <div id="error7" class="errores  "> Debe digitar su Correo electronico</div>
                        <div id="error77" class="errores  "> El correo no es valido, verificar</div><br><br>
                        <!-- Clave -->
                        <label  id="lb8" class="label">Clave</label>
                        <input id="txtclave" name="Clave" type="password" name="text" minlength="8" onkeyup="quitar();" value="<%= usuvo.getClave()%>" class="form-control txt" placeholder="Digite su clave"><br><br>
                        <div id="error8" class="errores  "> Debe digitar su Contraseña</div>
                        <div id="error02" class="errores  "> Debe ser mayor a 8 digitos</div>

                        <!-- Cargo -->

                        <input type="hidden" name="Cargo" id="txt" value="<%= usuvo.getCargo()%>" class="form-control txt"><br><br>
                        <!-- Institucion -->

                        <input type="hidden" name="Institu" id="txt" value="<%= usuvo.getInstitucion()%>" class="form-control txt"><br><br>
                    </div>

                    <input type="hidden" value="7" name="opcion" >
                    <div class="card-footer">
                        <input type="submit" id="registrar" class="btn btn-lg btn-dark" style="width: 100%;" value="Actualizar"> 
                    </div>
                    <%}%>
                </form>
            </div>
        </div>

        <script src="${pageContext.request.contextPath}/js/perfil.js"></script>
    </body>
</html>
