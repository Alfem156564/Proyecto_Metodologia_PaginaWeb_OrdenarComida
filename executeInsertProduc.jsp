<%-- 
    Document   : executeInsertProduc
    Created on : 14/11/2016, 07:37:48 PM
    Author     : Darci
--%>

<%@page import="clases.Producto"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%! ArrayList <Producto> lista = new ArrayList();%>
<%
    
String articulo=request.getParameter("nombre");
Integer precio=Integer.parseInt(request.getParameter("precio"));
int existencia=Integer.parseInt(request.getParameter("existencia"));

String consulta="select * from bd_comida.comida;";
objConn.Consultar(consulta);
int n=0;
                int i,j;
                String id_C="0", nombre_C, precio_C, existencia_C;
                if(objConn.rs!=null){
                    try{
                        objConn.rs.last();
                        n=objConn.rs.getRow();
                        objConn.rs.first();
                    }catch(Exception e){}
                    //String[][] datos=new String[n][4];
                    //datos=new String[n][4];
                    for(i=0;i<n;i++){

                            try{
                                id_C=objConn.rs.getString(1);
                                //out.println(idUsuario+ "<br>");
                                nombre_C=objConn.rs.getString(2);
                                //out.println(nombre+ "<br>");
                                precio_C =objConn.rs.getString(3);
                                //out.println(cuenta+ "<br>");
                                existencia_C =objConn.rs.getString(4);
                                //out.println(password+ "<br>");
                                lista.add(new Producto(Integer.parseInt(id_C),nombre_C, Integer.parseInt(precio_C), Integer.parseInt(existencia_C)));
                                objConn.rs.next();
                                j=Integer.parseInt(id_C)+1;
                                id_C=Integer.toString(j);
                            }catch(Exception e){ }


                    }
                }


String alta,parte1, parte2;
parte1 = "insert into bd_comida.comida (id_Comi,nombre,precio,cantidad) ";
parte2 = "values ('"+ id_C +"','"+ articulo +"','"+precio+ "','"+existencia+"');";
alta = parte1 +parte2;
objConn.Actualizar(alta);
objConn.closeRsStmt();
%>
<jsp:forward page="Admin_Nuevo.jsp"></jsp:forward>
<html>
    <head>
    <title></title>
    </head>
    <body>
    </body>
</html>