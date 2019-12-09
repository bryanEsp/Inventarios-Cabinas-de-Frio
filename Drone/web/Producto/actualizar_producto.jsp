<%-- 
    Document   : actualizar_producto
    Created on : 3/09/2019, 10:27:31 PM
    Author     : Usuario
--%>
<%@page import="ModeloDAO.ProveedorDAO"%>
<%@page import="ModeloVO.ProveedorVO"%>
<%@ include file="../plantilla.jsp" %>  
<%@page import="ModeloVO.ProductoVO"%>
<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="ModeloVO.CategoriaVO"%>
<%@page import="java.util.ArrayList"%>
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
            <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded">

                <form action="${pageContext.request.contextPath}/Productos" method="post">
                    <%ProductoVO provo = (ProductoVO) request.getAttribute("volleno");
                        if (provo != null) {%>
                    <input type="hidden" value="<%=provo.getCodigoPro()%>" name="CodigoPro">
                    <div class="card-header">
                        <h1 style="text-align: center;"><b>Actualizar Producto </b></h1><br>
                    </div>

                    <div class="card-body">

                        <!-- Nombre producto -->  
                        <label id="lb1" class="label" autofocus>Nombre Producto</label>
                        <input  autofocus="" id="nombre" onkeypress="return permite(event,'car')" type="text"  name="nombre" onkeyup="quitar2();"  placeholder="Digite el Nombre del Nuevo producto" class="form-control txt" value="<%=provo.getNombrePro()%>">
                        <div id="error3" class="errores  "> Digite el Nombre del Nuevo Productoo</div>
                        <div id="error33" class="errores  "> Solo se permiten letras</div><br><br>


                        <!-- Descripcion Producto -->     
                        <label id="lb2" class="label">Descripción</label>

                        <textarea onkeypress="return permite(event,'car')" id="descripcion" name="descripcion" onkeyup="quitar2();" class="form-control txt"  ><%=provo.getDescripcionPro()%></textarea>
                        <div id="error4" class="errores  "> Espacio Vacio Ingrese la Descripción </div><br><br>


                        <!-- Unidad Medida -->  
                        <label id="lb3" class="label">Unidad de Medida</label>

                        <select  name="UnidaddeMedida" id="txtTipo"  onclick="quitar2();" class="form-control txt">
                            <option><%=provo.getUnidadesdeMedidaPro()%></option>
                            <% if (provo.getUnidadesdeMedidaPro().equals("Mg")) {%>
                            <option>Gr</option>
                            <% } else {%>
                            <option>Mg</option>
                            <% }%>
                        </select>
                        <div id="error77" class="errores  "> Debe Seleccionar la unidad de Medida </div><br><br>


                        <!-- Peso -->     
                        <label id="lb4" class="label">Peso</label>
                        <input type="number" onkeypress="return permite(event,'num')" id="Peso" name="Peso" onkeyup="quitar2();"  placeholder="Digite el Peso del Producto" class="form-control txt" value="<%=provo.getPesoPro()%>">
                        <div id="errorPV" class="errores  "> Espacio Vacio Ingrese el Peso </div>
                        <div id="errorPN" class="errores  "> Solo se permiten Numeros</div><br><br>

                        <!-- Cantidad General --> 
                        <label id="lb5" class="label">Cantidad general</label>
                        <input type="number" onkeypress="return permite(event,'num')" id="CantidadGeneral" name="CantidadGeneral" onkeyup="quitar2();"  placeholder="Digite la Cantidad Existente del Mismo Producto" class="form-control txt" value="<%=provo.getCantidadgeneralPro()%>">
                        <div id="errorCGV" class="errores  "> Espacio Vacio Ingrese La Cantidad General </div>
                        <div id="errorCGN" class="errores  "> Solo se permiten letras</div><br><br>

                        <!-- Temperatura -->     
                        <label id="lb6" class="label">Temperatura</label>
                        <input type="number" onkeypress="return permite(event,'num')" id="Temperatura" name="Temperatura" onkeyup="quitar2();"  placeholder="Digite la Temperatura del Producto" class="form-control txt" value="<%=provo.getTemperaturaPro()%>"><label id="lb3" class="label">°</label>
                        <div id="errorTV" class="errores  "> Debe digitar la temperatura</div>
                        <div id="errorTN" class="errores  "> Solo se permiten Numeros</div><br><br>

                        <!-- Categoria-->     
                        <label id="lb7" class="label">Categoría</label>
                        <select name="Categoria"class="form-control txt" id="txtTipo2" value="<%=provo.getCategoriaPro()%>" onclick="quitar2();" >
                            <option><%=provo.getCategoriaPro()%></option>
                            <%
                                CategoriaVO catVO = new CategoriaVO();
                                CategoriaDAO catDAO = new CategoriaDAO();
                                ArrayList<CategoriaVO> listacategoria = catDAO.listarproductocategoria();

                                for (int i = 0; i < listacategoria.size(); i++) {

                                    catVO = listacategoria.get(i);
                            %>
                            <option value="<%= catVO.getIdCat()%>"> <%= catVO.getNombreCat()%> </option>
                            <%  }%>
                        </select>
                        <!-- <input type="textarea" id="" name="categoria" onkeyup="quitar();"  placeholder="Ingrese el Numero de la Categoria" class="form-control txt"> -->
                        <div id="error111" class="errores  "> Debe Seleccionar una Categoría </div><bR><br>
                        <br><br>
                        <label id="lb007" class="label">Proveedor</label>
                        <select name="proveedor"class="form-control txt" id="txtp"  onclick="quitar2();">
                            <option value="<%= provo.getProveedor() %>"><%= provo.getProveedor() %></option>
                            <%  ProveedorVO provo2 = new ProveedorVO();
                                ProveedorDAO proDAO = new ProveedorDAO();
                                ArrayList<ProveedorVO> listapro = proDAO.listaProveedor();

                                for (int i = 0; i < listapro.size(); i++) {

                                    provo2 = listapro.get(i);
                            %>
                            <option value="<%= provo2.getNIT()%>"> <%= provo2.getNombre()%> </option>
                            <%  }%>
                        </select>
                        <div id="error1111" class="errores  "> Debe Seleccionar un Proveedor </div><bR><br>
                        <br><br>
                    </div>

                    <div class="card-footer">
                        <input type="hidden" value="2" name="opcion" >
                        <input type="submit" id="registrar" class="btn btn-lg btn-dark" style="width: 100%;" value="Actualizar"> 
                    </div>
                    <%}%>
                </form>
            </div>
        </div>



        <script src="${pageContext.request.contextPath}/js/validarCamposProducto.js"></script>



