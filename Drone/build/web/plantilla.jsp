<%@page import="ModeloVO.RolVO"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Menu </title>
        <meta charset="utf-8">
        <meta http-equiv="Expires" content="0">
        <meta http-equiv="Last-Modified" content="0">
        <link rel="icon" type="icon/jpg" href="img/logo.png">
        <meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
        <meta http-equiv="Pragma" content="no-cache">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/EstiloFina.css">
        <link href="${pageContext.request.contextPath}css/prompt.css" rel="stylesheet" type="text/css"/>
    </head>
    <body   class="scroll" >

        <%

            response.setHeader("Pragma", "no-cache");
            response.addHeader("Cache-control", "must-revalidate");
            response.addHeader("Cache-control", "no-cache");
            response.addHeader("Cache-control", "no-store");
            response.setDateHeader("Expires", 0);

            try {
                if (session.getAttribute("usuario") == null) {

                    request.getRequestDispatcher("index.jsp").forward(request, response);

                }

            } catch (Exception e) {

                request.getRequestDispatcher("index.jsp").forward(request, response);

            }

        %>
        <%            HttpSession miSession = (HttpSession) request.getSession();
            RolVO rol = (RolVO) miSession.getAttribute("usuario");
            if (rol.getRolID().equals("Admin")) {
        %>
        <div class="modal" id="VEAyudamodal" tabindex="-1" role="dialog" style="display: none">
            <div class="modal-style" id="VEAyudaStyle"  role="document">
                <div class="modal-content" id="VEAyudaContent">
                    <div class="modal-header" id="VEAyudaHeader">
                        <br>
                        <div class="debajo">
                            <h3 class="titulo" id="titulo"> Ayuda </h3>
                        </div>
                        <br>
                        <button  type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('VEAyudamodal').style.display = 'none';">
                            <span aria-hidden="true" id="cerrar">&times;</span>
                        </button>

                    </div>

                    <div class="modal-body" id="VEAyudaBody"> 

                        <ul >
                            <div class="scroll" style="overflow: auto">
                                <li>
                                    <i class="icono izquierda fas fa-users"></i><h1>Usuario</h1>
                                    <ul > 
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Usuario/UsuarioMiPerfilAyuda.jsp" onclick="cerraryabrir();" > ¿Como Modificar Mi Perfil? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Usuario/UsuarioAyuda.jsp" onclick="cerraryabrir();" > ¿Como Registrar Un Usuario? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Usuario/UsuarioConsultarAyuda.jsp" onclick="cerraryabrir();" > ¿Como Consultar Un Usuario? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Usuario/UsuarioActualizarAyuda.jsp" onclick="cerraryabrir();" > ¿Como Actualizar Informacion de otros Usuarios? </a></li>
                                    </ul>
                                </li>
                                <li>
                                    <i class="icono izquierda fas fa-boxes"></i><h1>Producto</h1>
                                    <ul > 
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Producto/ProductoAyuda.jsp" onclick="cerraryabrir();" > ¿Como Registrar Un Producto? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Producto/CPA.jsp" onclick="cerraryabrir();" > ¿Como Consultar Un Producto? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Producto/APA.jsp" onclick="cerraryabrir();" > ¿Como Actualizar Un Producto? </a></li>
                                    </ul>
                                </li>
                                <li>
                                    <i class="icono izquierda fas fa-truck"></i><h1>Proveedor</h1>
                                    <ul > 
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Proveedor/ProveedorAyuda.jsp" onclick="cerraryabrir();" > ¿Como Registrar Un Proveedor? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Proveedor/CP.jsp" onclick="cerraryabrir();" > ¿Como Consultar Un Proveedor? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Proveedor/AP.jsp" onclick="cerraryabrir();" > ¿Como Actualizar Un Proveedor? </a></li>
                                    </ul>
                                </li>
                                <li>
                                    <i class="icono izquierda fas fa-boxes"></i><h1>Item</h1>
                                    <ul > 
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Item/ItemAyuda.jsp" onclick="cerraryabrir();" > ¿Como Registrar Un Item? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Item/CIT.jsp" onclick="cerraryabrir();" > ¿Como Consultar Un Item? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Item/AIT.jsp" onclick="cerraryabrir();" > ¿Como Actualizar Un Item? </a></li>
                                    </ul>
                                </li>
                                <li>
                                    <i class="icono izquierda fas fa-building"></i><h1>Institución</h1>
                                    <ul > 
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Institucion/InstitucionAyuda.jsp" onclick="cerraryabrir();" > ¿Como Registrar Una Institución? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Institucion/CI.jsp" onclick="cerraryabrir();" > ¿Como Consultar Una Institución? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/Institucion/AIT.jsp" onclick="cerraryabrir();" > ¿Como Actualizar Una Institución? </a></li>
                                    </ul>
                                </li>
                                <li>
                                    <i class="icono izquierda fab fa-codepen"></i><h1>Cuarto frio</h1>
                                    <ul > 
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/CuartoFrioAyuda.jsp" onclick="cerraryabrir();" > ¿Como Registrar Un Cuarto Frio? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/CuartoFrio/CCF.jsp" onclick="cerraryabrir();" > ¿Como Consultar Un Cuarto Frio? </a></li>
                                        <li><a class="text-left" href="${pageContext.request.contextPath}/Ayuda/CuartoFrio/ACF.jsp" onclick="cerraryabrir();" > ¿Como Actualizar Un Cuarto Frio? </a></li>
                                    </ul>
                                </li>
                            </div>
                        </ul>

                    </div>

                </div>
            </div>
        </div> 
        <script>
            function cerraryabrir() {
                $('#VEAyudamodal #VEAyudaStyle').hide();
            }
        </script> 
        <header>
            <div id="nav" class="navbar-light" style="z-index: 95;">
                <button class="btn-menu" style="cursor: pointer;float: left;background-color:transparent;color:rgb(49,147,154)"><i class="fas fa-bars"></i></button>
                <a href="${pageContext.request.contextPath}/menu.jsp"><img style="cursor: pointer;padding: 20px;width: 15%;float:left;margin-top: -10px;" src="${pageContext.request.contextPath}/img/reporte.png" class="img-fluid" id="img" alt="Responsive image"></a><br>
                <button style="width: 18%;float: left;visibility: hidden;"></button>
                <ul id="menu-nav"  style="float: left;width: 70%;">
                    <li style="margin:0px 0 0 100px"><a >Institución</a>
                        <ul class="Sub-menu"> 
                            <li><a href="${pageContext.request.contextPath}/Institucion/registrar_Institucion.jsp">Registrar </a></li>
                            <li><a href="${pageContext.request.contextPath}/Institucion/consulta_institucion.jsp">Consultar </a></li>

                        </ul>
                    </li>
                    <li><a >Cuarto Frío</a>
                        <ul class="Sub-menu"> 
                            <li><a href="${pageContext.request.contextPath}/Cuarto_Frio/registrar_Cuarto_Frio.jsp">Registrar </a></li>
                            <li><a href="${pageContext.request.contextPath}/Cuarto_Frio/consulta_Cuarto_Frio.jsp">Consultar </a></li>

                        </ul>
                    </li>
                    
                    <li style="float: right;width: 10%;color:rgb(49,147,154);"><a ><i  class="fas fa-cog"></i> </a>
                        <ul  class="Sub-menu"> 
                            <li> 
                                <a onclick="document.getElementById('VEAyudamodal').style.display = 'block';return false">Ayuda</a>
                            </li>
                            <li> <form action="${pageContext.request.contextPath}/Usuario" method="post" id="form2">
                                    <a onclick="document.getElementById('form2').submit()" >Mi perfil</a>
                                    <input type="hidden" name="Cedula" value="<%= rol.getUsuID()%>">
                                    <input type="hidden" name="opcion" value="6">
                                </form>
                            </li>
                            <li>

                                <form id="myform" method ="post" action="${pageContext.request.contextPath}/sesion">
                                    <a  onclick="document.getElementById('myform').submit()" type="submit" class="btn" style="background-color: rgb(49,147,154)">Cerrar Sesión </a>
                                </form>
                            </li>
                        </ul>
                    </li>
                    
                    <h5 style="color:rgb(129, 128, 128);float:right;margin-top: 18px;margin-left: 15px; margin-right: 15px;   font-family: sans-serif;background: white;font-size: 18px; ">    <b>  <%= rol.getNombre()%></b> </h5>
                </ul>
            </div>
        </header>

        <!--  Menu lateral Izquierdo  -->


        <div class="contenedor scroll shadow-lg p-3 mb-5 " style="z-index: 90;">
            <center>
                <br>
                <br><br>
                <h4 style="color:rgb(129, 128, 128);font-family: sans-serif;font-size: 50px;"><%= rol.getRolID()%></h4><br><br><br><br><br><br>    

                <input type="hidden"  value="<%= rol.getUsuID()%>">
            </center>
            <br><br>
            <ul class="Menu " id="lista" >
                <h5>
                    <li ><a href="${pageContext.request.contextPath}/menu.jsp"><i class="icono izquierda fas fa-home"></i><b> Principal</b> </i></a></li>
                    <li ><a href="#"><i class="icono izquierda fas fa-users"></i><b> Usuarios</b> </i></a>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/Usuarios/RegistrarUsuario.jsp">Registrar Usuario</a> </li>
                            <li><a href="${pageContext.request.contextPath}/Usuarios/ConsultarUsuario.jsp">Consultar Usuario</a> </li>
                        </ul>
                    </li>
                    <li ><a href="#"><i class="icono izquierda fas fa-boxes"></i><b> Productos</b> </i></a> 
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/Producto/registrar_producto.jsp">Registrar Producto</a> </li>
                            <li><a href="${pageContext.request.contextPath}/Producto/consultar_producto.jsp">Consultar Producto</a> </li>

                        </ul>
                    </li>
                    <li><a href="#"><i class="icono izquierda fas fa-truck "></i> <b> Proveedores </b></i></a> 
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/Proveedor/registrar_Proveedor.jsp">Registrar Proveedor</a> </li>
                            <li><a href="${pageContext.request.contextPath}/Proveedor/consulta_Proveedor.jsp">Consultar Proveedor</a> </li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="icono izquierda fas fa-boxes "></i><b>  Items </b></i></a> 
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/Items/registrar_Items.jsp">Registrar Items</a> </li>
                            <li><a href="${pageContext.request.contextPath}/Items/consulta_Items.jsp">Consultar Items</a> </li>
                            <li><a href="${pageContext.request.contextPath}/Items/ActualizacionItemsMax.jsp">Actualizar Items</a> </li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="icono izquierda fab fa-wpforms"></i><b>  Reportes</b> </i></a>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/ReporteStock/PDFStock.jsp" target="black">Stock</a> </li>
                            <li><a href="${pageContext.request.contextPath}/ReporteFechas/ReporteE.jsp" >Fechas Vencimiento</a> </li>
                        </ul> 
                    </li>
                    <li style="visibility: hidden;">esta es la lista es invisible para generar espacio</li><li></li><li></li>
                </h5>  
            </ul>
        </div>
        <% } else if (rol.getRolID().equals("Almacenista")) {
        %>


        <!--  MenÃº superior -->

        <div id="nav" class="navbar-light" style="z-index: 50;">
            <button class="btn-menu" style="float: left;background-color:transparent;color:rgb(49,147,154)"><i class="fas fa-bars"></i></button>
            <img style="padding: 20px;width: 15%;float:left;margin-top: -10px;" src="${pageContext.request.contextPath}/img/reporte.png" class="img-fluid" id="img" alt="Responsive image"><br>
            <button style="width: 18%;float: left;visibility: hidden;"></button>
            <ul id="menu-nav"  style="float: left;width: 70%;">

                <li style="margin:0px 0 0 100px"><a href="">Cuarto Frío</a>
                    <ul class="Sub-menu"> 
                        <li><a href="${pageContext.request.contextPath}/Cuarto_Frio/registrar_Cuarto_Frio.jsp">Registrar </a></li>
                        <li><a href="${pageContext.request.contextPath}/Cuarto_Frio/consulta_Cuarto_Frio.jsp">Consultar </a></li>

                    </ul>
                </li>
                <h5 style="color:rgb(49,147,154);float:right;margin-top: 18px;margin-left: 15px;  font-family: sans-serif;background: white;font-size: 18px;  ">  <b>    <%= rol.getNombre()%> </b></h5>
                <li style="float: right;width: 10%;color:rgb(49,147,154);"><a ><i  class="fas fa-cog"></i> </a>
                    <ul  class="Sub-menu"> 
                        <li> <form action="${pageContext.request.contextPath}/Usuario" method="post" id="form2">
                                <a onclick="document.getElementById('form2').submit()" >Mi perfil</a>
                                <input type="hidden" name="Cedula" value="<%= rol.getUsuID()%>">
                                <input type="hidden" name="opcion" value="6">
                            </form>
                        </li>
                        <li>
                            <form id="myform" method ="post" action="${pageContext.request.contextPath}/sesion">
                                <a  onclick="document.getElementById('myform').submit()" type="submit" class="btn" style="background-color: rgb(49,147,154)">Cerrar Sesión </a>
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

        <!--  Menu lateral Izquierdo  -->


        <div class="contenedor scroll shadow-lg p-3 mb-5 " >
            <center>
                <br><br><br>
                <h3 style="color:rgb(49,147,154);font-family: sans-serif;font-size: 50px;"><%= rol.getRolID()%></h3><br><br><br><br><br><br>   
                <input type="hidden"  value="<%= rol.getUsuID()%>">
            </center>
            <br><br>
            <ul class="Menu " id="lista" >
                <h5>

                    <li ><a href="${pageContext.request.contextPath}/menu.jsp"><i class="icono izquierda fas fa-home"></i> <b>  Principal </b> </i></a></li>

                    <li ><a href="#"><i class="icono izquierda fas fa-boxes"></i>  <b> Productos </b> </i></a> 
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/Producto/registrar_producto.jsp">Registrar Producto</a> </li>
                            <li><a href="${pageContext.request.contextPath}/Producto/consultar_producto.jsp">Consultar Producto</a> </li>
                        </ul>
                    </li>

                    <li><a href="#"><i class="icono izquierda fas fa-truck "></i>  <b> Proveedores </b> </i></a> 
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/Proveedor/registrar_Proveedor.jsp">Registrar Proveedor</a> </li>
                            <li><a href="${pageContext.request.contextPath}/Proveedor/consulta_Proveedor.jsp">Consultar Proveedor</a> </li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="icono izquierda fas fa-boxes "></i>  <b> Items </b> </i></a> 
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/Items/registrar_Items.jsp">Registrar Items</a> </li>
                            <li><a href="${pageContext.request.contextPath}/Items/consulta_Items.jsp">Consultar Items</a> </li>
                            <li><a href="${pageContext.request.contextPath}/Items/ActualizacionItemsMax.jsp">Actualizar Items</a> </li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="icono izquierda fab fa-wpforms"></i> <b>  Reportes</b> </i></a>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/ReporteStock/PDFStock.jsp" target="black">Stock</a> </li>
                            <li><a href="${pageContext.request.contextPath}/ReporteFechas/ReporteE.jsp">Fechas Vencimiento</a> </li>
                        </ul> 
                    </li>
                    <li style="visibility: hidden;">esta es la lista es invisible para generar espacio</li><li></li><li></li>
                </h5>  
            </ul>
        </div>
        <% }
        %>





        <!--Archivos de javascript -->
        <!--Jquery -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script> 

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/Prompt.js" type="text/javascript"></script>
        <script src="js/Eliminar.js" type="text/javascript"></script>
        <!--Archivos de javascript-->
        <!--Archivos de javascript el cual permite colocar los iconos al lado del boton mediante fontawsome-->
        <script src="${pageContext.request.contextPath}/js/busquedaajax.js"></script>
        <script src="${pageContext.request.contextPath}/js/Fs.js"></script>
        <script src="${pageContext.request.contextPath}/js/validacionesTecla.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/Animacion.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery-1.7.1.min.js"></script>
    </body>
</html>
