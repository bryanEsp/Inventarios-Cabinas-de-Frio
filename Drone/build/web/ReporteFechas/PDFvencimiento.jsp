<%-- 
    Document   : ReporteParametrizado
    Created on : 20-oct-2019, 19:41:09
    Author     : SEVEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="net.sf.jasperreports.engine.*" %>
<%@page import="net.sf.jasperreports.view.JRDesignViewer" %>

<%@page import="javax.servlet.ServletResponse" %>
<%@page import="Util.ConexionDB" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conexion;
            ConexionDB conect = new ConexionDB();
            conexion = conect.obtenerConexion();

            File repoerFile = new File(application.getRealPath("ReporteFechas/report1.jasper"));
            Map<String, Object> parameter = new HashMap<String, Object>();
            
            String valor = request.getParameter("txtParametro");
            parameter.put("P1", new String(valor));
            
            byte[] bytes = JasperRunManager.runReportToPdf(repoerFile.getPath(), parameter, conexion);

            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(bytes, 0, bytes.length);

            outputStream.flush();
            outputStream.close();
        %>



    </body>
</html>
