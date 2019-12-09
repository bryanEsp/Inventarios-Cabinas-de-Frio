<%-- 
    Document   : ActualizacionItemsMax
    Created on : 20-oct-2019, 23:35:12
    Author     : SEVEN
--%>

<%@page import="ModeloDAO.MotivoDAO"%>
<%@page import="ModeloVO.Motivo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ModeloDAO.ItemsDAO"%>
<%@page import="ModeloVO.ItemsVO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="../plantilla.jsp" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        #Contenedor{
            width: 80%;
            height: 750px;
            border: solid black 2px;
            margin: auto;
            background-color: white;
        }
        .lb{
            height:50px;
            width:100%;
            font-family: 'Source Sans Pro';
            font-size: 20px;
            float: left;
        }
        #lb2{
            height:50px;
            width:100%;
            font-family: 'Source Sans Pro';
            font-size: 20px;
            margin-top: -100px;
        }
        .txt{
            height:50px;
            width:60%;
            font-size: 16pt;
            font-family: 'Source Sans Pro';
            float: right;
        }
        #Campos{
            width: 30%;
            margin: auto;
            background-color: white;
            float: left;
        }

        #ContTabla{
            width: 69%;
            height: 620px;
            margin: auto;
            background-color: white;
            float: right;
        }
        /*     #tablaprueba{
                 font-size: 25pt;
                 font-family: sans-serif;
                 float: left;
             } */ 
        #txtNom{
            width: 100%;
            height: 30px;
            border: 0;
        }
        #txtNom2{
            width: 100%;
            height: 30px;
            border: 0;
        }
        #btF{
            width: 70%;
            height: 50px;
            text-align: center;
            font-size: 20pt;
            font-family: 'Source Sans Pro';
            float: right;
        }
        #bt1{
            width: 100%;
            height: 50px;
            font-size: 20pt;
            font-family: 'Source Sans Pro';
            text-align: center;
            float: left;
        }
        #bt1:hover{
            background-color: coral;
        }
        #btF:hover{
            background-color: coral;
        }
        #C1{
            width: 30px;
            height: 30px;
        }
    </style>
    <%! String e;%>
    <div id="1" style="background-color: rgba(0,0,5,0.5);width: 100%;height: 100%;position: fixed;z-index: 9998;display: none"></div>
    <div class="modal " id="v" tabindex="-1" role="dialog" style="display: none;transition-duration:  15s;z-index: 9999">
        <div style="width: 60%;margin: 70px 150px 0px auto; height: 700px;"  role="document">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="document.getElementById('v').style.display = 'none';document.getElementById('1').style.display = 'none';">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body table-responsive" style="overflow: auto;height: 600px">
                    <input autofocus type="text" placeholder="Busqueda.."  name="busca" id="busca" autofocus   onkeyup="search()"   class="form-control">
                    <br>
                    <br>
                    <table id="datos" class="table  table-responsive-md table-hover table-light " style="width: 100%;height: 100px;">
                        <thead class="thead-dark">
                            <tr id="encabezado" >
                                <th scope="col">Código</th>
                                <th scope="col">Código Item</th>
                                <th scope="col">Fecha de registro</th>
                                <th scope="col">Cantidad </th>
                                <th scope="col">Tipo de acción </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  Motivo instivo = new Motivo();
                                MotivoDAO instiDAO = new MotivoDAO();
                                ArrayList<Motivo> listaVehiculos2 = instiDAO.listarInstitucion();

                                for (int i = 0; i < listaVehiculos2.size(); i++) {

                                    instivo = listaVehiculos2.get(i);
                            %>
                            <tr>
                                <td ><%= instivo.getCodigoBarras()%></td>
                                <td><%= instivo.getCantidad()%></td>
                                <td><%= instivo.getFecha()%></td>
                                <td><%= instivo.getMotivo()%></td>
                                <% if (instivo.getTipo().equals("I")) { %>
                                <td>Ingreso</td>
                                <% } else { %>
                                <td>Retiro</td>
                                <% }%>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <body>
        <div id="Registros" class="scroll"  >
            <div  id="formularioCliente"  style="width: 90%;height:850px;">
                <form  method="post" action="${pageContext.request.contextPath}/Items">

                    <label class="lb" style="width: 100%;"><b> Actualizar Cantidades</b> </label><br><br>
                    <div id="Campos"  ><br><br><br><br><br><br>
                        <label id="lb2" class="lb"> Código  Items 
                            <select id="txt1" class="txt form-control" style="width: 100%" onclick="quitar()" >
                                <option >Código Barras</option>
                                <%                                ItemsVO itemsvo = new ItemsVO();
                                    ItemsDAO itemsDAO = new ItemsDAO();
                                    ArrayList<ItemsVO> listaVehiculos = itemsDAO.listarInstitucion();
                                    for (int i = 0; i < listaVehiculos.size(); i++) {

                                        itemsvo = listaVehiculos.get(i);
                                %>
                                <option value="<%= itemsvo.getCodigo_barras()%>"  ><%= itemsvo.getCodigo_barras()%></option>
                                <%}%>
                            </select></label> 
                        <div id="error33" class="errores  "> Debe selecionar el código del Item</div>

                        <input type="hidden" id="txtNom">

                        <label id="lb1" class="lb"> Cantidad <input type="number" id="txt2" onkeypress="return permite(event, 'num')" class="txt form-control" style="width: 100%" onkeyup="quitar()"></label>
                        <br><br><br><br><br><div id="error3" class="errores  " style="margin-top:50px" > Debe digitar la cantidad</div>
                        <div id="error333" class="errores " style="margin-top:50px"> No se permiten letras</div>
                        <label id="lb3" class="lb"> Descripción de ingreso o retiro <textarea  id="txt3"  class="txt form-control" style="width: 100%" onkeyup="quitar()"></textarea></label>
                        <div id="error01" class="errores  " style="margin-top:80px"> Debe digitar el motivo de ingreso o salida del item</div><br><br><br><br>

                        <br><br><br>
                        <label id="lb4" class="lb"> Tipo de acción </label>
                        <select id="txt4" class="txt form-control" style="width: 100%" onclick="quitar()" >
                            <option >Tipo</option>
                            <option value="I">Ingresar</option>
                            <option value="R">Retirar</option>
                        </select>
                        <div id="error03" class="errores  " style="margin-top:10px"> Debe seleccionar el tipo de acción que desea realizar</div><br><br><br><br>
                        <div style="margin-top: 100px">
                            <button type="button" id="bt1"  onclick="agregarFila(this.form)" class="btn btn-dark ">Agregar Fila</button>
                            <br><br><br><br>
                            <button type="button" id="bt1"  onclick="eliminarFila()" class="btn btn-dark ">Eliminar Fila</button>
                        </div>
                    </div>
                    <div id="ContTabla" class="shadow-lg p-3 mb-5 bg-white rounded" style="overflow: auto">
                        <button id="nuevac" value="Registrar Categoria" style="width: 100%;margin: 10px auto;height: 30px;" class=" btn-dark" onclick="document.getElementById('v').style.display = 'block';document.getElementById('1').style.display = 'block';return false" >Historial registros</button>
                        <div id="error3333" class="errores  " style="width: 90%;float: right"> Tabla Vacia</div><br>
                        <table border="1" id="tablaprueba" class="table" style="width: 100%;float: right">
                            <tr>
                                <th style="width: 200px;">Código de Barras</th>
                                <th style="width: 90px;">Cantidad</th>
                                <th>Motivo</th>
                                <th style="width: 20px;">Tipo de acción</th>
                            </tr>
                            <tbody></tbody>
                        </table>
                    </div>
                    <script src="${pageContext.request.contextPath}/js/TablaDetalle.js"></script><br><br>
                    <input type="submit"  value="Actualizar" name="Recibir" id="btF"  class="btn btn-dark ">
                    <input type="hidden" value="5" name="opcion">
                </form>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/js/validarDetalles.js"></script>
    </body>
</html>
