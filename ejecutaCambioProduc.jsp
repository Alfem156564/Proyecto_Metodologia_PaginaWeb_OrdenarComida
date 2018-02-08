<%-- 
   
--%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%@page import="clases.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! ArrayList <Producto> lista = new ArrayList();%>
            <%
            String consulta="select * from bd_comida.comida;";
            objConn.Consultar(consulta);
            int n=0;
            int i,j=0;
            String id_C, nombre_C, precio_C, existencia_C;
            if(objConn.rs!=null){
                try{
                    objConn.rs.last();
                    n=objConn.rs.getRow();
                    objConn.rs.first();
                }catch(Exception e){}
                for(i=0;i<n;i++){
                    try{
                        id_C=objConn.rs.getString(1);
                        nombre_C=objConn.rs.getString(2);
                        precio_C =objConn.rs.getString(3);
                        existencia_C =objConn.rs.getString(4);
                        lista.add(new Producto(Integer.parseInt(id_C),nombre_C, Integer.parseInt(precio_C), Integer.parseInt(existencia_C)));
                        objConn.rs.next();
                    }catch(Exception e){ }
                }
            }
        int suma;     
         String nombre,precio,existencia;
         nombre = (request.getParameter("Comida")).trim();
         precio = (request.getParameter("Precio")).trim();
         existencia = (request.getParameter("Existencia")).trim();
         /*for(i=0;i<lista.size();i++){
            if(nombre.equals(lista.get(i).getNombre())){
                j=i;
                i=lista.size();
            }
         }
         suma=lista.get(j).getExistencia()+Integer.parseInt(existencia);
         existencia=Integer.toString(suma);*/
         
         String modifica = "update bd_comida.comida set precio='"+precio+"' where nombre='"+nombre+"';";
         //out.println("*"+cuenta+"*<br>");
         //out.println("*"+password+"*<br>");
         //out.println("*"+modifica+"*<br>");
         objConn.Actualizar(modifica);
         modifica = "update bd_comida.comida set cantidad='"+existencia+"' where nombre='"+nombre+"';";
         //out.println("*"+cuenta+"*<br>");
         //out.println("*"+password+"*<br>");
         //out.println("*"+modifica+"*<br>");
         objConn.Actualizar(modifica);
         objConn.closeRsStmt();
         %>
          
         <jsp:forward page="Admin_Editar.jsp"/>
         
         
         
         
         
         
    </body>
</html>
