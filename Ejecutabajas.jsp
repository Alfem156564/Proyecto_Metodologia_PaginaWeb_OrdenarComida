<%-- 
    Document   : Ejecutabajas
    Created on : 8/11/2016, 09:30:24 AM
    Author     : Darci
--%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><%
        String producto;
         producto = (request.getParameter("producto")).trim();
         
         
         String query = "delete from bd_comida.comida where nombre='"+producto+"';";
         //out.println("*"+cuenta+"*<br>");
         //out.println("*"+password+"*<br>");
         //out.println("*"+modifica+"*<br>");
         objConn.Actualizar(query);
         objConn.closeRsStmt();
         %>
          
         <jsp:forward page="Admin_Eliminar.jsp"/>
         
         
         
         
         
         
    </body>
</html>
