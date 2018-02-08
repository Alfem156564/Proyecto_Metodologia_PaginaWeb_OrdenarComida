<%-- 
    Document   : Menu_Secion
    Created on : 15/11/2017, 07:16:16 AM
    Author     : Alfem
--%>

<%@page import="java.util.Random"%>
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
	<aside id="izq">
	</aside>
	<section>
            <br><br><br><br><br><br><br><br><br>
            <%
            int captcha = (int)( (new Random()).nextDouble()*4 + 0);
            String[] respuestas = {"GRACiAS","adios", "CHEESE", "hola"};
            application.setAttribute("CAP",respuestas[captcha]);
                                %>
            <center><h2>Seción de Administrador</h2></center><br>
            <center>
            <form action="checklog.jsp" method="post">
                Usuario:<br>
                <input type="text" name="usuario" value=""><br><br>
                Contraseña:<br>
                <input type="password" name="clave" value=""> <br><br>
                <img src="imagenes/captcha<%=captcha%>.jpg"><br>
                <p>Ingresa el CAPTCHA</p><br>
                <input type="text" name="captcha" size="20"><br><br>
                <input type="submit" value="entrar"> <br> <br>
            </form>
            </center>
	</section>
    </body>
</html>
