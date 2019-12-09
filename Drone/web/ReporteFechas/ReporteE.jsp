<%@include file="../plantilla.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="Registros" class="scroll"  >
            <div  id="formularioCliente" class="shadow-lg p-3 mb-5 bg-white rounded table-responsive"style="width: 40%;height: 200px;  ">
                <form  action="PDFvencimiento.jsp" method="post" target="black">
                    <center>
                        <h3>Digite la fecha de vencimiento</h3>
                        <input class="form-control" type="date"  size="10" name="txtParametro"/><br>
                        <button class="btn btn-primary" style="width: 50%;font-size: 20px;">Generar</button>
                    </center>
                </form>
            </div>
        </div>
    </body>
</html>
