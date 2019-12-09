<%-- 
    Document   : registrar_categoria
    Created on : 10/09/2019, 09:54:23 PM
    Author     : Usuario
--%>
<%@ include file="../plantilla.jsp" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.CategoriaDAO"%>
<%@page import="ModeloVO.CategoriaVO"%>
<!DOCTYPE html>
<!--  Parte de formulario para los campos  --> 

<div id="Registros" class="scroll"  >
    <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded">
        <form action="${pageContext.request.contextPath}/Categoria" method="post" > 

            <div class="card-header">
                <h1 style="text-align: center;"><b> Registro Producto </b></h1><br>
            </div>


            <div class="card-body">

                <!-- Nombre Categoria -->  
                <label id="lb1" class="label" autofocus>Nombre Categoría</label>
                <input type="text"  name="nombre" onkeyup="quitar();"  placeholder="Digite el Nombre de laNueva Categoria" class="form-control txt" >
                <div id="error3" class="errores  "> Digite el Nombre de la Nueva Categoria</div>
                <div id="error33" class="errores  "> Solo se permiten letras</div><br><br>


                <!-- Descripcion Categoria -->     
                <label id="lb2" class="label">Descripción</label>
                <!--<tetxtarea name="descripcion" type="text" maxlenght="150" placeholder="Digite una Pequeña Descripcion del Producto..."  onkeyup="quitar();" ></tetxtarea>-->
                <textarea name="descripcion" placeholder="Digite una Pequeña Descripcion de la categoria..." onkeyup="quitar();" class="form-control txt" maxlenght="5" ></textarea>
                <div id="error4" class="errores  "> Espacio Vacio Ingrese la Descripción </div><br><br><br>

            </div>
        </form>

    </div>
    <%if (request.getAttribute("mensajeExito") != null) {%>
    <div class="alert alert-success" style="width: 60%; margin: auto">
        ${mensajeExito}
    </div>
    <%} else if (request.getAttribute("mensajeError") != null) {%>
    <div class="alert alert-danger" style="width: 60%; margin: auto">
        ${mensajeError}
    </div>
    <%} else {
        }%>
