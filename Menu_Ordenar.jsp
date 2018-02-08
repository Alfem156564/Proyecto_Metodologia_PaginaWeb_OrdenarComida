<%--
    Document   : Menu_Ordenar
    Created on : 15/11/2017, 07:13:37 AM
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
        <meta charset="UTF-8">
	<title>Comida Rapida Literalmente</title>
        <link href="Estilos.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="iconic.css" media="screen" rel="stylesheet" type="text/css" />
    </head>
    <body>
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
								<li><a href="Menu_Inicio.html" class="Tam"><span class="iconic home"></span> Pagina Principal</a></li>
								<li><a href="Menu_Pasos.html" class="Tam"><span class="iconic info"></span> Como funciona</a></li>
								<li><a href="Menu_Ordenar.jsp" class="Tam"><span class="iconic calendar-alt"></span> Ordenar</a></li>
								<li><a href="Menu_Secion.jsp" class="Tam"><span class="iconic user"></span> Iniciar seción</a></li>
							</ul>
							<div class="clearfix"></div>
						</nav>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
		
	</header>
	<section>
            <br><br><br><br><br><br><br><br><br>
		<p>
		<center><h2>Ordenar</h2></center><br>
                <form action="Ordenar.jsp" method="post">
                    <%! ArrayList <Producto> lista = new ArrayList();%>
                    <%
                        lista.clear();
                    String consulta="select * from bd_comida.comida;";
                    objConn.Consultar(consulta);
                    int n=0;
                    int i,j;
                    if(objConn.rs!=null){
                        try{
                            objConn.rs.last();
                            n=objConn.rs.getRow();
                            objConn.rs.first();
                        }catch(Exception e){}
                        //String[][] datos=new String[n][4];
                        //datos=new String[n][4];
                        String id, nombre, precio, existencia;
                        for(i=0;i<n;i++){

                                try{
                                    id=objConn.rs.getString(1);
                                    //out.println(idUsuario+ "<br>");
                                    nombre=objConn.rs.getString(2);
                                    //out.println(nombre+ "<br>");
                                    precio =objConn.rs.getString(3);
                                    //out.println(cuenta+ "<br>");
                                    existencia =objConn.rs.getString(4);
                                    //out.println(password+ "<br>");
                                    lista.add(new Producto(Integer.parseInt(id),nombre, Integer.parseInt(precio), Integer.parseInt(existencia)));
                                    objConn.rs.next();
                                }catch(Exception e){ }


                        }%>
                    <table>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><h3>Comida:</h3><br></td>
                            <td></td>
                            <td></td>
                            <td> </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>Clave:</td>
                            <td>Contiene:</td>
                            <td>Precio:</td>
                            <td> Existencia:</td>
                            <td>Cuantos quieres:</td>
                        </tr>
                    <%
                        int id_C,precio_C,existencia_C;
                        String nombre_C;
                        for(i=0;i<lista.size();i++){
                            id_C=lista.get(i).getId();
                            nombre_C=lista.get(i).getNombre();
                            precio_C=lista.get(i).getPrecio();
                            existencia_C=lista.get(i).getExistencia();
                            if(existencia_C!=0){%>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><%=id_C%></td>
                            <td><%=nombre_C%></td>
                            <td>$<%=precio_C%></td>
                            <td> <%=existencia_C%></td>
                            <td><input type="number" name="Comida<%=Integer.toHexString(i)%>" value="0" min="0" max="<%=existencia_C%>" step="1" required ></td>
                        </tr>
                    <%      }
                        }
                     }%>
                    </table> <br><br>
                    <table>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><h3>Nombre de comprador:</h3></td>
                            <td><input type="text" name="Comprador" required ><br><br></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><h3>Lugar de entrega:</h3></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>Edificio:</td>
                            <td><select name="Edificio" required>
                                <option value="1">1</option>
                                <!--<option value="1-A">1-A</option>-->
                                <!--<option value="1-B">1-B</option>-->
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <!--<option value="6-A">6-A</option>-->
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <!--<option value="8-A">8-A</option>-->
                                <%
                                for(i=9;i<63;i++){
                                   out.println("<option value=\""+i+"\">"+i+""+"</option>");
                                }%>
                                <option value="101">101</option>
                                <!--<option value="101-A">101-A</option>-->
                                <option value="102">102</option>
                                <option value="103">103</option>
                                <option value="104">104</option>
                                <option value="105">105</option>
                                <option value="106">106</option>
                                <option value="107">107</option>
                                <!--<option value="107-A">107-A</option>-->
                                <!--<option value="107-B">107-B</option>-->
                                <option value="108">108</option>
                                <!--<option value="108-B">108-B</option>-->
                                <!--<option value="108-C">108-C</option>-->
                                <%
                                for(i=109;i<122;i++){
                                   out.println("<option value=\""+i+"\">"+i+""+"</option>");
                                }

                                %>
                                <option value="125">125</option>
                                <option value="126">126</option>
                                <option value="127">127</option>
                                <option value="131">131</option>
                                <option value="132">132</option>
                                <option value="133">133</option>
                                <option value="202">202</option>
                                <option value="203">203</option>
                                <option value="204">204</option>
                                <option value="205">205</option>
                                <option value="206">206</option>
                                <option value="207">207</option>
                                <option value="209">209</option>
                                <option value="210">210</option>
                                <option value="211">211</option>
                                <option value="212">212</option>
                                <option value="213">213</option>
                                <option value="219">219</option>
                                <option value="220">220</option>
                                <option value="221">221</option>
                                <option value="222">222</option>
                                <option value="223">223</option>
                            </select><br><br><br></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td>Salón:</td>
                            <td><select name="Salon" required>
                                <option value="A">A</option>
                                <option value="B">B</option>
                                <option value="C">C</option>
                                <option value="D">D</option>
                                <option value="E">E</option>
                                <option value="F">F</option>
                            </select><br><br><br></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><h3>(OPCIONAL)Horario de entrega:</h3></td>
                            <td><input type="text" name="Horario"  ><br><br></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td><h3>(OPCIONAL)Con cuanto vas a pagar:</h3></td>
                            <td><input type="text" name="Dinero"><br><br></td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td></td>
                            <td><input type="submit" value="Ordenar"> </td>
                        </tr>
                    </table><br> <br> <br> 
                    </p> 
                </form>
                <%lista.clear();%>
	</section>
    </body>
</html>
