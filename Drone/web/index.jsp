<%-- 
    Document   : index
    Created on : 31-ago-2019, 23:47:05
    Author     : SEVEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Inicio Sesion</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/Styles.css">
         <link rel="icon" type="icon/jpg" href="img/logo.png">
    </head>
    <body>
        <div class="Contenedor">
            <div class="d-flex justify-content-center h-100">
                <div class="Campos">
                    <center>
                        <div class="card-header">
                             <img style="//border-radius:50%;padding: 20px;" src="${pageContext.request.contextPath}/img/reporte.png" class="img-fluid" id="img" alt="Responsive image"><br>
                                                         <h3>Inicio Sesion</h3>

                        </div>
                    </center>
                    <div id="1" class="card-body">
                        <form action="Usuario" method="post">
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" id="itMail" name="Correo"  class="form-control" placeholder="Correo">
                            </div>
                            <div id="error2" class="errores"> Digite su correo</div>
                            <div id="error22" class="errores"> Correo no valido, vuelva a intentar</div>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key" ></i></span>
                                </div>
                                <input type="password" name="Clave" id="itpassword" class="form-control" placeholder="Clave" minlength="1" required>
                            </div>
                            <div id="error1" class="errores"> Digite su Password</div>

                            <div class="row align-items-center remember">
                                <input id="chb1" type="checkbox" >Visualizar contraseña
                            </div>

                            <div class="form-group">
                                <input type="submit"  id="bEnviar" value="Entrar" class="btn float-right login_btn">
                            </div>
                                                        <br><br>

                            <input type="hidden" name="opcion" value="5">
                        </form>
                    </div>
                    <div id="2" class="card-body" style="display: none;">
                        <form action="Usuario" method="post">
                            <h5 style="">Digite su correo para recuperar su contraseña</h5>
                            <div class="input-group form-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" id="itMail2" name="Correo"  class="form-control" placeholder="correo">
                            </div>
                            <div id="error03" class="errores"> Digite su correo</div>
                            <div id="error04" class="errores"> Correo no valido, vuelva a intentar</div>
                            <div class="form-group">
                                <input type="submit" style="width: 100%;"  id="bEnviar2" value="Recuperar" class="btn float-right login_btn">
                            </div><br><br>
                            <input type="hidden" name="opcion" value="8">
                        </form>
                    </div>
                    <div id="3" class="card-footer">
                        <div  class="d-flex justify-content-center links">
                            Problemas con su cuenta?<a href="#" onclick="Mostrar();">Click aqui</a>
                        </div>

                    </div>
                    <div  id="4" class="card-footer" style="display: none">
                        <div   class="d-flex justify-content-center links" >
                            Ya no quiere realizar esta acción<a id="3" href="#" onclick="ocultar();">Cancelar</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <%if (request.getAttribute("mensajeError") != null) {%>
        <div class="alert alert-danger" style="width: 60%; margin: auto;top:-150px">
            ${mensajeError}
        </div>
        <%} else if (request.getAttribute("mensajeExito") != null) {%>
        <div class="alert alert-success" style="width: 60%; margin: auto;top:-150px">
            ${mensajeExito}
        </div>
        <%} else {%>
        <% }%>
        <script >
            var expr = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
            $(document).ready(function () {
                $("#bEnviar").click(function () {
                    var correo = $("#itMail").val();
                    var password = $("#itpassword").val();
                    if (correo == "") {
                        $("#error22 ").fadeOut();
                        $("#error2").fadeIn("slow");
                        return false;
                    } else {
                        $("#error2").fadeOut();

                        if (!expr.test(correo)) {
                            $("#error22").fadeIn("slow");
                            return false;
                        } else {
                            $("#error22").fadeOut();

                            if (password == "") {
                                $("#error1").fadeIn("slow");
                                return false;
                            } else {
                                $("#error1").fadeOut();
                            }
                        }
                    }
                });
            });

            $(document).ready(function () {
                $("#bEnviar2").click(function () {
                    var correo = $("#itMail2").val();

                    if (correo == "") {
                        $("#error04 ").fadeOut();
                        $("#error03").fadeIn("slow");
                        return false;
                    } else {
                        $("#error03").fadeOut();
                        if (!expr.test(correo)) {
                            $("#error04").fadeIn("slow");
                            return false;
                        } else {
                            $("#error22").fadeOut();
                        }
                    }
                });
            });

            $('#chb1').on('change', function (event) {
                if ($('#chb1').is(':checked')) {
                    $('#itpassword').get(0).type = 'text';
                } else {
                    $('#itpassword').get(0).type = 'password';
                }
            });

            function  ocultar() {
                document.getElementById('1').style.display = "block";
                document.getElementById('2').style.display = "none";
                document.getElementById('4').style.display = "none";
                document.getElementById('3').style.display = "block";
            }
            function  Mostrar() {
                document.getElementById('1').style.display = "none";
                document.getElementById('2').style.display = "block";
                document.getElementById('4').style.display = "block";
                document.getElementById('3').style.display = "none";
            }
        </script>
    </body>
</html>
