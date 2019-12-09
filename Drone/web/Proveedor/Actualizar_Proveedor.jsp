
<%@page import="ModeloVO.ProveedorVO"%>
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
            <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded" >
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
                    <form action="${pageContext.request.contextPath}/Proveer" method="post">
                    <%ProveedorVO proveevo = (ProveedorVO) request.getAttribute("volleno");
                        if (proveevo != null) {%>
                    <div class="card-header">
                        <h1 style="text-align: center;"><b> Actualizar Proveedor </b></h1><br>
                    </div>


                    <div class="card-body">
                        <input type="hidden" name="NIT" value="<%=proveevo.getNIT()%>">

                        <!-- Nombre -->     
                        <label id="lb3"   class="label">Nombre</label>
                        <input  autofocus="" onkeypress="return permite(event,'car')" type="text" id="txtnombre" name='Nombre' onkeyup="quitar();" value="<%= proveevo.getNombre()%>"  class="form-control txt">
                        <div id="error3" class="errores  "> Debe digitar su nombre</div>
                        <div id="error33" class="errores  "> Solo se permiten letras</div><br><br>

                        <input type="hidden" id="txtnit" name='NIT' onkeyup="quitar();"   value="<%= proveevo.getNIT()%>"   class="form-control txt">
                        <div id="error4" class="errores  "> Debe digitar su nombre</div>
                        <div id="error44" class="errores  "> Solo se permiten números</div><br><br>
                        <!-- Celular -->     
                        <label id="lb5" class="label">Celular</label>
                        <input id="txtcelular" onkeypress="return permite(event,'num')" name='Celular' type="text" minlength="8" value="<%= proveevo.getCelular()%>"  onkeyup="quitar();"   class="form-control txt">
                        <div id="error5" class="errores  "> Debe digitar su celular</div>
                        <div id="error55" class="errores  "> Solo se permiten números</div><br><br>

                        <!-- Direccion -->
                        <label id="lb6" class="label">Dirección</label>
                        <input id="txtdireccion" type="text" name="Direccion" class="form-control txt" value="<%= proveevo.getDireccion()%>" onkeyup="quitar();" >
                        <div id="error6" class="errores "> Debe digitar su dirección</div><br><br>

                        <!-- Correo -->
                        <label id="lb6" class="label">Correo</label>
                        <input id="txtcorreo" type="email" name="Correo" class="form-control txt" value="<%= proveevo.getcorreo()%>" class="form-control txt" >
                        <div id="error7" class="errores  "> Debe digitar su correo</div>
                        <div id="error77" class="errores  "> Formato de correo incorrecto, verificar</div>
                                        <br>
                    <br>
                    <br>

                    </div>

                    <div class="card-footer">
                        <input type="hidden" value="3" name="opcion" >
                        <input type="submit" id="registrar" class="btn btn-lg btn-dark" style="width: 100%;" value="Actualizar"> 
                    </div>
                    <%}%>
                </form>
            </div>


        </div>

        <script src="${pageContext.request.contextPath}/js/validarproveedor.js"></script>     
        <script>
                            $('#myModal').on('shown.bs.modal', function () {
                                $('#myInput').trigger('focus')
                            })
                            function  ocultar() {
                                document.getElementById('esta').style.display = "none";
                            }
                            function  mostrar() {
                                window.location = "Proveedor/consulta_Proveedor.jsp";
                            }

        </script>     
    </body>
</html>
