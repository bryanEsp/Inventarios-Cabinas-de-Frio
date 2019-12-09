<%-- 
    Document   : Actualizar_Institucion
    Created on : 03-sep-2019, 6:50:48
    Author     : SEVEN
--%>
<%@page import="ModeloDAO.CuartoFrioDAO"%>
<%@page import="ModeloVO.CuartoFrioVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ProductoDAO"%>
<%@page import="ModeloVO.ProductoVO"%>
<%@ include file="../plantilla.jsp" %>  
<%@page import="ModeloVO.ItemsVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="${pageContext.request.contextPath}/js/EPNS.js"></script>

<script>
    var cuartoFrio = [];
    var estante = [];
    var nivel = [];
    var profundidad = [];
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script>
    var cuartoFrio = [];
    var estante = [];
    var nivel = [];
    var profundidad = [];
</script>

<div id="Registros" class="scroll"  >
    <center>
        <%if (request.getAttribute("mensajeExito") != null) {%>
        <a  href="${pageContext.request.contextPath}/Items/consulta_Items.jsp"><div class="btn btn-success" style="width: 60%; margin: auto">
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

    <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded"  >

        <form action="${pageContext.request.contextPath}/Items" method="post" id="from2" name="from2">   
            <%ItemsVO itemsvo = (ItemsVO) request.getAttribute("volleno");
                        if (itemsvo != null) {%>
            <div class="card-header">
                <h1 style="text-align: center;"><b> Actualizar Items </b></h1><br>
            </div>


            <div class="card-body">
                <input type="hidden" id="barras" name="Codigo_Barras" value="<%=itemsvo.getCodigo_barras()%>">
                <div id="error45" class="errores "> Debe digitar el codigo de barras</div><br><br>
                <div id="error445" class="errores  "> Solo se permiten numeros</div><br><br>

                <!-- Nombre -->     
                <label id="lb1"   class="label">Fecha Vencimiento</label>
                <input autofocus="" type="date" id="txtfecha" name='Fecha_Vencimiento' onkeyup="quitar();" value="<%= itemsvo.getFecha_vencimiento()%>"  class="form-control txt">
                <div id="error3" class="errores  "> Debe seleccionar una fecha</div><br><br>
                <div id="error" class="errores  "> Debe verificar que el campo de la fecha sea el mayor</div><br><br>



                <!-- Direccion -->
                <label id="lb5" class="label">cantidad</label>
                <input id="txtcantidad" onkeypress="return permite(event,'num')" type="text" name="Cantidad" class="form-control txt" value="<%= itemsvo.getcantidad()%>" onkeyup="quitar();" >
                <div id="error555" class="errores "> Debe digitar la cantidad del producto</div><br><br>
                <div id="error77" class="errores  "> Solo se permiten numeros</div><br><br>

                <!-- Direccion -->
                <label id="lb6" class="label">Observaciones</label>
                <input id="txtobservacion" type="text" name="Observacion" class="form-control txt" value="<%= itemsvo.getobservacion()%>" onkeyup="quitar();" >
                <div id="error8" class="errores "> Debe ingresar la observacion</div><br><br>

                <!-- Direccion -->
                <label id="lb7" class="label">Lote</label>
                <input id="txtlote" type="text" name="Lote" class="form-control txt" value="<%= itemsvo.getlote()%>" onkeyup="quitar();" >
                <div id="error9" class="errores "> Debe digitar el lote</div><br><br>
                <div id="error11" class="errores  "> Solo se permiten letras</div><br><br>

                <!-- Direccion -->
                <label id="lb9" class="label">Embalaje</label>
                <input id="txtembalaje"  onkeypress="return permite(event,'car')" type="text" name="Embalaje" class="form-control txt" value="<%= itemsvo.getembalaje()%>" onkeyup="quitar();" >
                <div id="error13" class="errores "> Debe ingresar el embalaje</div><br><br>

                <label id="lb10" class="label">Codigo del producto</label>
                <select name="Cod_Producto" id="txtproducto" class="form-control txt"  onclick="quitar();revo();">
                    <option value="<%= itemsvo.getcod_producto()%>"><%= itemsvo.getcod_producto()%></option>
                    <%
                        ProductoVO prodVO = new ProductoVO();
                        ProductoDAO produDAO = new ProductoDAO();
                        ArrayList<ProductoVO> listaproducto = produDAO.listarproductos();

                        for (int i = 0; i < listaproducto.size(); i++) {

                            prodVO = listaproducto.get(i);
                    %>
                    <option value="<%= prodVO.getCodigoPro()%>"> <%= prodVO.getCodigoPro()%> </option>
                    <%  }%>
                </select>
                <div id="error15" class="errores "> Debe seleccionar el codigo del producto</div><br><br>
                <div id="error16" class="errores  "> Solo se permiten numeros</div><br><br>
                <%  CuartoFrioVO cuartofriovo = new CuartoFrioVO();
                            CuartoFrioDAO cuartofrioDAO = new CuartoFrioDAO();%>
                <!-- Direccion -->
                <label id="lb11" class="label">Codigo del cuarto frio</label>                
                <select  name="Cuarto_Frio" id="txtcuartofrio" class="form-control txt" onclick="quitar();revo;" >
                    <option value="<%= itemsvo.getcuarto_frio()%>"><%= itemsvo.getcuarto_frio()%></option>
                    <%
                        CuartoFrioVO cuartoVO = new CuartoFrioVO();
                        CuartoFrioDAO cuartoDAO = new CuartoFrioDAO();
                        ArrayList<CuartoFrioVO> listacuarto = cuartoDAO.listarInstitucion();

                        for (int i = 0; i < listacuarto.size(); i++) {

                            cuartoVO = listacuarto.get(i);
                            if (itemsvo.getcuarto_frio() != cuartoVO.getCod_Cufi()) {
                    %>
                    <option value="<%= cuartoVO.getCod_Cufi()%>"> <%= cuartoVO.getCod_Cufi()%> </option>
                    <script>
                                cuartoFrio.push(<%= cuartoVO.getCod_Cufi()%>)
                                estante.push(<%= cuartoVO.getCant_es()%>)
                                nivel.push(<%= cuartoVO.getCant_nivel()%>)
                                profundidad.push(<%= cuartoVO.getCant_pro()%>)
                    </script>
                    <%  } else {
                            }
                        }
                    %>
                </select>
                <div id="error17" class="errores "> Debe seleccionar el cuarto frio</div><br><br>
                <div id="error18" class="errores  "> Solo se permiten numeros</div><br><br>

                <!-- Celular -->     
                <label id="lb2" class="label">Estante</label>
                <select id="txtestante" name='Estante'  onclick="quitar();"  onmouseover="esta();"     class="form-control txt">
                    <option value="<%= itemsvo.getestante()%>"><%= itemsvo.getestante()%></option>
                </select>
                <div id="error5" class="errores  "> Debe digitar el estante</div><br><br>
                <!-- Direccion -->
                <label id="lb3" class="label">Nivel</label>
                <select id="txtnivel" name="Nivel" class="form-control txt"  onclick="quitar();" onmouseover="esta2();"  >
                    <option value="<%= itemsvo.getnivel()%>"><%= itemsvo.getnivel()%></option>
                </select>
                <div id="error6" class="errores "> Debe digitar el nivel</div><br><br>

                <!-- Direccion -->
                <label id="lb4" class="label">Profundidad</label>
                <select id="txtprofundidad"  name="Profundidad" class="form-control txt"   onclick="quitar();" onmouseover="esta3();"   >
                    <option value="<%= itemsvo.getprofundidad()%>"><%= itemsvo.getprofundidad()%></option>
                </select>
                <div id="error4" class="errores "> Debe digitar la profundidad</div><br><br>
                                <br>
                <br>
            </div>


            <div class="card-footer">
                <input type="hidden" value="3" name="opcion" >
                <input type="submit" id="registrar"  class="btn btn-dark " style="width: 100%;" value="Actualizar"> 
            </div>

            <%}%>
        </form>


    </div>
</div>      
<script src="${pageContext.request.contextPath}/js/validarItems.js"></script>