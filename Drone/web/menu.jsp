<%-- 
    Document   : menu
    Created on : 01-sep-2019, 0:15:59
    Author     : SEVEN
--%>

<%@page import="ModeloVO.RolVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="plantilla.jsp" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/StyleSlide.css">

<!DOCTYPE html>

        <br>

        <div id="Registros" class="scroll"   >
            <div  id="formularioCliente" style="heigth:900px;width: 900px;" >
                <center>
                    <div class="slides" id="Principal" >
                    <h1 style="color:rgb(49,147,154);font-size:80px;"><b>Bienvenido</h1><br>
                    
                        <ul class="slide">
                            <li>
                                <img src="${pageContext.request.contextPath}/img/22.jpg" class="d-block w-100" alt="...">
                            </li>
                            <li>
                                <img src="${pageContext.request.contextPath}/img/img1.svg" class="d-block w-100" alt="...">
                            </li>
                            <li>
                                <img src="${pageContext.request.contextPath}/img/fondo.jpg" class="d-block w-100" alt="...">
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
                </center>

            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/Slide.js"></script>

