<%-- 
    Document   : Admin_Nuevo
    Created on : 15/11/2017, 07:09:32 AM
    Author     : Alfem
--%>

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
				<td></td>
			</tr>
		</table>
		
	</header>
	<aside id="izq">
	</aside>
	<section>
            <br><br><br><br><br><br><br><br><br>
		<center><h2>Nuevo Producto</h2></center><br>
                <form action="executeInsertProduc.jsp" method="post">
                    <pre>
                    Nombre: <input type="text" name="nombre" value="" />

                    Precio: <input type="text" name="precio" value="" />

                    Existencia:<input type="text" name="existencia" value="" />

                    <input type="submit" value="Agregar" />


                    </pre>
                </form>
	</section>
    </body>
</html>
