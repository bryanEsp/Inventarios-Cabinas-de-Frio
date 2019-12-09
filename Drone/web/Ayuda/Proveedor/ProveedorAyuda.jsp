<%-- 
    Document   : ProductoAyuda
    Created on : 29/11/2019, 06:06:42 AM
    Author     : Usuario
--%>

<%-- 
    Document   : RegistrarUsuario
    Created on : 17/11/2019, 10:42:56 AM
    Author     : Usuario
--%>
<%@ include file="../../plantilla.jsp" %>    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/EstiloAyuda.css">
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!DOCTYPE html>
<div class="slidesshow" id="RPV">

    <ul class="slider">

        <li >

            <div class="overlay" id="o1">
                <div class="modal" id="v1" tabindex="-1" role="dialog">
                    <div class="modal-style"  role="document">
                        <center> <h1 >Paso 1</h1> </center>
                        <div class="modal-content" >

                            <div class="modal-header">
                                <i class="icono izquierda fas fa-truck" style="width: 50px;height: 0px; font-size: 30px;"></i><h3 class="titulo"> ¿Como Registrar Un Producto? </h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('RPV').style.display = 'none';window.history.back();">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <!-- Nombre Categoria --> 
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/img/Usuario(1).PNG">
                                </div> 
                                <section class="caption">
                                    <label id="lb01" class="label" autofocus>Céntrese en el menú principal en caso de encontrarse en otra sección seleccione la opción "Principal" en el menú de opciones como lo señala la imagen</label>
                                </section>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </li>
        <li >

            <div class="overlay" id="o1">
                <div class="modal" id="v1" tabindex="-1" role="dialog">
                    <div class="modal-style"  role="document">
                        <h1>Paso 2</h1>
                        <div class="modal-content" >

                            <div class="modal-header">
                                <i class="icono izquierda fas fa-truck" style="width: 50px;height: 0px; font-size: 30px;"></i><h3 class="titulo"> ¿Como Registrar Un Producto? </h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('RPV').style.display = 'none';window.history.back();">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <!-- Nombre Categoria --> 
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/img/Proveedor(1).PNG">
                                </div> 
                                <section class="caption">
                                    <label id="lb01" class="label" autofocus>Seleccioné la opción “Proveedor” en el menú lateral izquierdo como lo señala la imagen </label>
                                </section>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </li>
        <li >

            <div class="overlay" id="o1">
                <div class="modal" id="v1" tabindex="-1" role="dialog">
                    <div class="modal-style"  role="document">
                        <h1>Paso 3</h1>
                        <div class="modal-content" >

                            <div class="modal-header">
                                <i class="icono izquierda fas fa-truck" style="width: 50px;height: 0px; font-size: 30px;"></i><h3 class="titulo"> ¿Como Registrar Un Proveedor? </h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('RPV').style.display = 'none';window.history.back();">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <!-- Nombre Categoria --> 
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/img/Proveedor(2).PNG">
                                </div> 
                                <section class="caption">
                                    <label id="lb01" class="label" autofocus>Se desplegaran dos opciones relacionadas con el proveedor seleccione la opción “Registrar Proveedor” como lo señala la imagen.</label>
                                </section>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </li>	
        <li >

            <div class="overlay" id="o1">
                <div class="modal" id="v1" tabindex="-1" role="dialog">
                    <div class="modal-style"  role="document">
                        <h1>Paso 4</h1>
                        <div class="modal-content" >

                            <div class="modal-header">
                                <i class="icono izquierda fas fa-truck" style="width: 50px;height: 0px; font-size: 30px;"></i><h3 class="titulo"> ¿Como Registrar Un Proveedor? </h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('RPV').style.display = 'none';window.history.back();">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <!-- Nombre Categoria --> 
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/img/Proveedor(3).PNG">
                                </div> 
                                <section class="caption">
                                    <label id="lb01" class="label" autofocus>Se desplegaran un formulario con los campos necesarios para registrar un nuevo proveedor complete la información correspondiente en cada uno de los campos del nuevo proveedor como lo señala la imagen.</label>
                                </section>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </li>
        <li>
            <div class="overlay" id="o1">
                <div class="modal" id="v1" tabindex="-1" role="dialog">
                    <div class="modal-style"  role="document">
                        <h1>Paso 5</h1>
                        <div class="modal-content" >

                            <div class="modal-header">
                                <i class="icono izquierda fas fa-truck" style="width: 50px;height: 0px; font-size: 30px;"></i><h3 class="titulo"> ¿Como Registrar Un Proveedor? </h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('RPV').style.display = 'none';window.history.back();">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <!-- Nombre Categoria --> 
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/img/Proveedor(4).PNG">
                                </div> 
                                <section class="caption">
                                    <label id="lb01" class="label" autofocus>Luego de haber completado la información de todos los campos de manera correcta en caso contrario la página le mostrara el error correspondiente. Seleccionar la opción registrar como lo señala la imagen.</label>
                                </section>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </li>
        <li >

            <div class="overlay" id="o1">
                <div class="modal" id="v1" tabindex="-1" role="dialog">
                    <div class="modal-style"  role="document">
                        <h1>Paso 6</h1>
                        <div class="modal-content" >

                            <div class="modal-header">
                                <i class="icono izquierda fas fa-truck" style="width: 50px;height: 0px; font-size: 30px;"></i><h3 class="titulo">¿Como Registrar Un Proveedor?</h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('RPV').style.display = 'none';window.history.back();">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <!-- Nombre Categoria --> 
                                <div class="imagenlado">
                                    <img src="${pageContext.request.contextPath}/img/Proveedor(5).PNG">
                                </div> 
                                <div class="imagenlado">
                                    <img src="${pageContext.request.contextPath}/img/Proveedor(6).PNG">
                                </div> 
                                <section class="caption">
                                    <label id="lb01" class="label" autofocus>Una manera de consultar el proveedor luego de su registro es seleccionando la alerta como lo señala la imagen que evidencia el correcto registro del proveedor y la pagina lo re direccionara al formulario de consulta.</label>
                                </section>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </li>
        

    </ul>
    <ol class="pagination">
    </ol>
    <div class="left">
        <span class="fas fa-chevron-left "></span>
    </div>
    <div class="right">
        <span class="fas fa-chevron-right "></span>
    </div>

</div>


<script src="${pageContext.request.contextPath}/js/Ayuda.js"></script>

