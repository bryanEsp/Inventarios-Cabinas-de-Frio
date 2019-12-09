<%-- 
    Document   : Ubicacion.jsp
    Created on : 05-nov-2019, 21:38:18
    Author     : SEVEN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ItemsDAO"%>
<%@page import="ModeloVO.ItemsVO"%>
<%@page import="ModeloVO.UbicacionVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../plantilla.jsp" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <%!  ItemsVO itemsvo = new ItemsVO();
            ItemsDAO itemsDAO = new ItemsDAO(); %>
        <div id="Registros" class="scroll" >
            <%! int cont1 = 1;
                int cont2 = 0;%>

            <% UbicacionVO ubiVo = (UbicacionVO) request.getAttribute("volleno2");
                String[] abecedario = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
                int estante = Integer.parseInt(ubiVo.getEstante());
                int nivel = ubiVo.getNivel();
                int profundidad = ubiVo.getProfundidad();
                int cufi = ubiVo.getCod_cu(); %>

            <%  for (int l = 0; l < estante; l++) {%>
            <div  id="formularioCliente<%=l%>" class="shadow-lg p-3 mb-5 bg-white rounded table-responsive"style="width: 90%;height: 800px;  ">
                <a onclick="javascript:window.imprimirDIV('formularioCliente<%=l%>');" class="btn btn-dark" style="float: right;color:white">Ver Plano </a>

                <%
                    if (ubiVo != null) {%>
                <h5><b> Cuarto Frio:</b>     <%= cufi%>   
                    <b> Estante:</b>   <%= abecedario[l]%>
                    <b> Total Niveles:</b>    <%= nivel%>
                    <b> Total Profundidad:</b>     <%= profundidad%>
                </h5><br><br>   
                <table id="datos2" class="table " >
                    <%for (int i = 1; i < nivel + 1; i++) {%>

                    <%
                        for (int j = 1; j < profundidad + 1; j++) {

                            ArrayList<ItemsVO> listaitem = itemsDAO.listarInstitucionUbi(abecedario[l], j, i, cufi);
                            String po = abecedario[l] + Integer.toString(i) + Integer.toString(j);
                            if (listaitem.size() != 0) {
                                itemsvo = listaitem.get(0);
                    %>

                    <td  style="width: 200px;height: 200px;"><center>
                        <form action="${pageContext.request.contextPath}/Items" method="post">
                            <button style="background: #ffeeba">
                                <img style="width: 100px;height: 100px;" src="img/Caja.jpg" >
                                <h5><b>Posición:</b> <%= po%></h5>
                                <h5><b>Código Barras:</b> <%= itemsvo.getCodigo_barras()%></h5>
                                <h5><b>Fecha Vencimiento:</b> <br> <%= itemsvo.getFecha_vencimiento()%></h5>
                                <h5><b>Cantidad:</b> <%= itemsvo.getcantidad()%></h5>
                                <h5><b>Producto:</b> <%= itemsvo.getcod_producto()%></h5>
                                <input type="hidden" name="Codigo_Barras" value="<%=itemsvo.getCodigo_barras()%>">
                                <input type="hidden" name="opcion" value="2">
                            </button>
                        </form>
                    </center>
                    </td>

                    <% } else {%>
                    <td style="width: 400px;height: 300px;"><center>
                        <form action="${pageContext.request.contextPath}/Items" method="post">
                            <button style="width: 100px;height: 200px;">
                                <h3>Vacio</h3><br>
                                <h5>Posicion: <%= po%></h5>
                                <input type="hidden" name="Cuarto_Frio" value="<%= cufi%>">
                                <input type="hidden" name="Estante" value="<%= abecedario[l]%>">
                                <input type="hidden" name="Nivel" value="<%=Integer.toString(i)%>">
                                <input type="hidden" name="Profundidad" value="<%=Integer.toString(j)%>">
                                <input type="hidden" name="opcion" value="6">
                            </button>
                        </form>
                    </center>
                    </td>

                    <%     }
                        }
                        cont1++; %>
                    <tr></tr>        
                    <%
                        }

                    %>

                </table>
                <% }%> 
            </div>
            <% }%>
            <br>
        </div>
        <script>
            function imprimirDIV(contenido) {
                var ficha = document.getElementById(contenido);
                var ventanaImpresion = window.open(' ', 'popUp');
                ventanaImpresion.document.write(ficha.innerHTML);
                ventanaImpresion.document.close();
                ventanaImpresion.print();
                ventanaImpresion.close();
            }
        </script>
        <script src="${pageContext.request.contextPath}/js/ubi.js"></script>
