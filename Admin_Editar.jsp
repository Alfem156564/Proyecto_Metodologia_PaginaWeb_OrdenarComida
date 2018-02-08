<%-- 
    Document   : Admin_Editar
    Created on : 15/11/2017, 07:04:25 AM
    Author     : Alfem
--%>

<%@page import="clases.Producto"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comida Rapida Literalmente</title>
        <link href="Estilos.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%! ArrayList <Producto> lista = new ArrayList();%>
                <%
                    
            String consulta="select * from bd_comida.comida;";
            objConn.Consultar(consulta);
            int n=0,i;
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
            objConn.closeRsStmt();%>
        <header> 
		<table FRAME="void" RULES="rows" id="Menu">
			<tr>
				<td>
					<!--Logo-->
					<img class="logo_pag" src="./Img/logo.png" width="120" height="60" align="left">  
				</td>
			</tr>
			<tr>
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="wrap">
						<nav>
							<ul class="menu">
								<li><a href="Admin_Pedidios.jsp" class="Tam"><span class="iconic book-alt"></span> Pedidos</a></li>
								<li><a href="Admin_Editar.jsp" class="Tam"><span class="iconic pencil"></span> Editar Producto</a></li>
								<li><a href="Admin_Nuevo.jsp" class="Tam"><span class="iconic plus"></span> Nuevo Producto</a></li>
								<li><a href="Admin_Eliminar.jsp" class="Tam"><span class="iconic x"></span> Eliminar Producto</a></li>
                                                                <li><a href="Menu_Inicio.html" class="Tam"><span class="iconic arrow-left"></span> Salir</a></li>
							</ul>
							<div class="clearfix"></div>
						</nav>
					</div>
				</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
                        <tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
                        <tr>
                            <td>
                                 <form action="ejecutaCambioProduc.jsp" method="post">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Comida: <select name="Comida">
                                        <%
                                           for(i=0;i<lista.size();i++){
                                              out.println("<option value=\""+lista.get(i).getNombre()+"\">"+lista.get(i).getNombre()+"");
                                           }

                                        %>
                                        </select><br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Precio Nuevo: <input type="text" name="Precio" size=10 value=""><br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nueva Existencia:<input type="text" name="Existencia" size=10 value=""><br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="enviar"><br><br><br><br>

                                </form>
                            </td>
			</tr>
		</table>
		
	</header>
	
	<section>
            <br><br><br><br><br><br><br><br><br>
                
		<center><h2>Editar inventario</h2></center><br>
               
                <table>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td>Clave:</td>
                            <td>Contiene:</td>
                            <td>Precio:</td>
                            <td> Existencia:</td>
                        </tr>
                    <%
                        int _id_C,_precio_C,_existencia_C;
                        String _nombre_C;
                        for(i=0;i<lista.size();i++){
                            _id_C=lista.get(i).getId();
                            _nombre_C=lista.get(i).getNombre();
                            _precio_C=lista.get(i).getPrecio();
                            _existencia_C=lista.get(i).getExistencia();
                            if(_existencia_C!=0){%>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td><%=_id_C%></td>
                            <td><%=_nombre_C%></td>
                            <td>$<%=_precio_C%></td>
                            <td> <%=_existencia_C%></td>
                        </tr>
                    <%      }
                        }lista.clear();;
                    

                    %>
                    </table>
	</section>
    </body>
</html>
