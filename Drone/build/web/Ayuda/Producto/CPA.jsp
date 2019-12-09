<%@ include file="../../plantilla.jsp" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/EstiloAyuda.css">
<link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!DOCTYPE html>
<div class="slidesshow" id="CU" >

    <ul class="slider">

        <li >

            <div class="overlay" id="o1">
                <div class="modal" id="v1" tabindex="-1" role="dialog">
                    <div class="modal-style"  role="document">
                        <center> <h1 >Paso 1</h1> </center>
                        <div class="modal-content" >

                            <div class="modal-header">
                                <i class="icono izquierda fas fa-boxes" style="width: 50px;height: 0px; font-size: 30px;"></i><h3 class="titulo"> ¿Como Consultar Un Producto? </h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('CU').style.display = 'none';window.history.back();">
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
                                <i class="icono izquierda fas fa-boxes"  style="width: 50px;height: 0px; font-size: 30px;"></i><h3 class="titulo"> ¿Como Consultar Un Producto? </h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('CU').style.display = 'none';window.history.back();">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <!-- Nombre Categoria --> 
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/img/Producto(1).png">
                                </div> 
                                <section class="caption">
                                    <label id="lb01" class="label" autofocus>Seleccioné la opción “Productos” en el menú lateral izquierdo como lo señala la imagen </label>
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
                                <i class="icono izquierda fas fa-boxes"  style="width: 50px;height: 0px; font-size: 30px;"></i><h3 class="titulo"> ¿Como Consultar Un Producto? </h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('CU').style.display = 'none';window.history.back();">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <!-- Nombre Categoria --> 
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/img/CPA(1).PNG">
                                </div> 
                                <section class="caption">
                                    <label id="lb01" class="label" autofocus>Se desplegaran dos opciones relacionadas con el usuario seleccione la opción “Consultar Producto” como lo señala la imagen.</label>
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
                                <i class="icono izquierda fas fa-boxes" style="width: 50px;height: 0px; font-size: 30px;"></i><h3 class="titulo"> ¿Como Consultar Un Producto? </h3>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('CU').style.display = 'none';window.history.back();">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <!-- Nombre Categoria --> 
                                <div class="imagen">
                                    <img src="${pageContext.request.contextPath}/img/CPA(2).PNG">
                                </div> 
                                <section class="caption">
                                    <label id="lb01" class="label" autofocus>Se desplegara una tabla que le permitira visualizar los productos excistentes .</label>
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