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

            File reportfile2 = new File(application.getRealPath("Reporte/report2.jasper"));

            Map<String, Object> parameter2 = new HashMap<String, Object>();

            //String valor = request.getParameter("txtparametro");s
            //parameter.put("mar",new String(valor));
            byte[] bytes = JasperRunManager.runReportToPdf(reportfile2.getPath(), parameter2, conexion);

            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputstream = response.getOutputStream();
            outputstream.write(bytes, 0, bytes.length);

            outputstream.flush();
            outputstream.close();
        %>





    </body>
</html>
