
<%@ include file="../plantilla.jsp" %>     
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="ModeloVO.CategoriaVO"%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page import="ModeloVO.ProveedorVO"%>
<!DOCTYPE html>

<!--  Parte de formulario para los campos  --> 
<div id="1" style="background-color: rgba(0,0,5,0.5);width: 100%;height: 100%;position: fixed;z-index: 9998;display: none"></div>

<div id="Registros" class="scroll"  >

    <center>
        <%if (request.getAttribute("mensajeExito") != null) {%>
        <a  href="${pageContext.request.contextPath}/Producto/consultar_producto.jsp"><div class="btn btn-success" style="width: 60%; margin: auto">
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
    <div class="modal" id="v" tabindex="-1" role="dialog" style="display: none;transition: 1s;z-index: 9999;">
        <div style="width: 40%;margin: 70px 180px 0px auto; height: 700px;transition: 1s;"  role="document">
            <div class="modal-content" >
                <div class="modal-header">
                    <h3> Registro  Categoría </h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('v').style.display = 'none';document.getElementById('1').style.display = 'none'">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="${pageContext.request.contextPath}/Categoria" method="post" > 

                    <div class="modal-body">
                        <!-- Nombre Categoria -->  
                        <label id="lb01" class="label" autofocus>Nombre Categoría</label>
                        <input type="text" onkeypress="return permite(event, 'car')"  name="nombre" id="txtnomvre" onkeyup="quitar();"  placeholder="Digite el Nombre de laNueva Categoria" class="form-control txt" >
                        <div id="error23" class="errores  "> Digite el Nombre de la Nueva Categoría</div>
                        <div id="error133" class="errores  "> Solo se permiten letras</div><br><br>


                        <!-- Descripcion Categoria -->     
                        <label id="lb02" class="label">Descripción</label>
                        <!--<tetxtarea name="descripcion" type="text" maxlenght="150" placeholder="Digite una Pequeña Descripcion del Producto..."  onkeyup="quitar();" ></tetxtarea>-->
                        <textarea name="descripcion" onkeypress="return permite(event, 'car')" id="txtde" placeholder="Digite una Pequeña Descripción de la categoria..." onkeyup="quitar();" class="form-control txt" maxlenght="5" ></textarea>
                        <div id="error04" class="errores  "> Espacio Vacio Ingrese la Descripción </div><br><br><br>
                        <input type="hidden" name="opcion" value="1">


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="ocultar();return false;">Cerrar</button>
                        <input type="submit" class="btn btn-primary" id="cate" data-dismiss="modal" value="Registrar">

                    </div>
                </form>

            </div>
        </div>
    </div>

    <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded">
        <form action="${pageContext.request.contextPath}/Productos" method="post" id="from2" name="from2" > 

            <div class="card-header">
                <h1 style="text-align: center;"><b> Registro Producto </b></h1><br>
            </div>


            <div class="card-body">


                <!-- Nombre producto -->  
                <label  id="lb1" class="label" autofocus>Nombre Producto</label>
                <input  autofocus="" onkeypress="return permite(event, 'car')" id="nombre" type="text"  name="nombre" onkeyup="quitar2();"  placeholder="Digite el Nombre del Nuevo producto" class="form-control txt" >
                <div id="error3" class="errores  "> Digite el Nombre del Nuevo Productoo</div>
                <div id="error33" class="errores  "> Solo se permiten letras</div><br><br>


                <!-- Descripcion Producto -->     
                <label id="lb2" class="label">Descripción</label>
                <!--<tetxtarea name="descripcion" type="text" maxlenght="150" placeholder="Digite una Pequeña Descripcion del Producto..."  onkeyup="quitar();" ></tetxtarea>-->
                <textarea id="descripcion" onkeypress="return permite(event, 'car')" name="descripcion" placeholder="Digite una Pequeña Descripción del Producto..." onkeyup="quitar2();" class="form-control txt" maxlenght="5" ></textarea>
                <div id="error4" class="errores  "> Espacio Vacio Ingrese la Descripcion </div><br><br><br>


                <!-- Unidad Medida -->  
                <label id="lb3" class="label">Unidad de Medida</label>

                <select name="UnidaddeMedida" id="txtTipo"  onclick="quitar2();" class="form-control txt">
                    <option>Unidad de Medida</option>
                    <option>Mg</option>
                    <option>Gr</option>
                </select>
                <div id="error77" class="errores  "> Debe Seleccionar la unidad de Medida </div><br><br>


                <!-- Peso -->     
                <label id="lb4" class="label">Peso</label>
                <input type="number" onkeypress="return permite(event, 'num')" id="Peso" name="Peso" onkeyup="quitar2();"  placeholder="Digite el Peso del Producto" class="form-control txt" >
                <div id="errorPV" class="errores  "> Espacio Vacio Ingrese el Peso </div>
                <div id="errorPN" class="errores  "> Solo se permiten Numeros</div><br><br>

                <!-- Cantidad General --> 
                <label id="lb5" class="label">Cantidad general</label>
                <input type="number" onkeypress="return permite(event, 'num')" id="CantidadGeneral" name="CantidadGeneral" onkeyup="quitar2();"  placeholder="Digite la Cantidad Existente del Mismo Producto" class="form-control txt" >
                <div id="errorCGV" class="errores  "> Espacio Vacio Ingrese La Cantidad General </div>
                <div id="errorCGN" class="errores  "> Solo se permiten Numeros</div><br><br>

                <!-- Temperatura -->     
                <label id="lb6" class="label">Temperatura</label>
                <input type="number" onkeypress="return permite(event, 'num')" id="Temperatura" name="Temperatura" onkeyup="quitar2();"  placeholder="Digite la Temperatura del Producto" class="form-control txt" ><label id="lb3" class="label">°</label>
                <div id="errorTV" class="errores  "> Debe digitar la temperatura</div>
                <div id="errorTN" class="errores  "> Solo se permiten Numeros</div><br><br>

                <!-- Categoria-->     
                <label id="lb7" class="label">Categoría</label>
                <button id="nuevac" value="Registrar Categoría" style="width: 40%;margin-left: 10px;height: 30px;" class=" btn-outline-dark" onclick="document.getElementById('v').style.display = 'block';document.getElementById('1').style.display = 'block';return false" >Nueva</button>

                <select name="Categoria"class="form-control txt" id="txtTipo2"  onclick="quitar2();">
                    <option value="Seleccione Categoria">Seleccione Categoria</option>
                    <%  CategoriaVO catVO = new CategoriaVO();
                        CategoriaDAO catDAO = new CategoriaDAO();
                        ArrayList<CategoriaVO> listacategoria = catDAO.listarproductocategoria();

                        for (int i = 0; i < listacategoria.size(); i++) {

                            catVO = listacategoria.get(i);
                    %>
                    <option value="<%= catVO.getIdCat()%>"> <%= catVO.getNombreCat()%> </option>
                    <%  }%>
                </select>
                <div id="error111" class="errores  "> Debe Seleccionar una Categoria </div><bR><br>

                <label id="lb007" class="label">Proveedor</label>
                <select name="proveedor" class="form-control txt" id="txtp"  onclick="quitar2();">
                    <option value="Seleccione Proveedor">Seleccione Proveedor</option>
                    <%  ProveedorVO prosvo = new ProveedorVO();
                        ProveedorDAO prosDAO = new ProveedorDAO();
                        ArrayList<ProveedorVO> listaprove = prosDAO.listaProveedor();

                        for (int i = 0; i < listaprove.size(); i++) {

                            prosvo = listaprove.get(i);
                    %>
                    <option value="<%= prosvo.getNombre()%>"> <%= prosvo.getNIT()%> </option>
                    <%  }%>
                </select>
                <div id="error1111" class="errores  "> Debe Seleccionar un proveedor </div><bR><br>


                <!-- <input type="textarea" id="" name="categoria" onkeyup="quitar();"  placeholder="Ingrese el Numero de la Categoria" class="form-control txt"> -->
                <div id="error3" class="errores  "> Debe Seleccionar una Categoría </div>


            </div>

            <br><br>

            <div class="card-footer">
                <input type="submit" id="registrar" class="btn btn-lg btn-dark" style="width: 100%;"value="Registrar">
                <input type="hidden" name="opcion" value="1">
            </div>
        </form>

    </div>

</div>

<script src="${pageContext.request.contextPath}/js/validarCamposProducto.js"></script>
<script src="${pageContext.request.contextPath}/js/validarCategory.js"></script>

<script>
                    $('#myModal').on('shown.bs.modal', function () {
                        $('#myInput').trigger('focus')
                    })
                    function  ocultar() {
                        document.getElementById('1').style.display = "none";
                        document.getElementById('v').style.display = "none";
                    }

</script>     