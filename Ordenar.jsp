<%-- 
    Document   : Ordenar
    Created on : 17/11/2017, 09:47:47 AM
    Author     : Alfem
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<%@page import="clases.Pedido"%>
<%@page import="clases.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recibo</title>
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
                int id_,precio_,existencia_,NuevaExist,Total=0;
                String cantidad="0",Comidas="";
                for(i=0;i<lista.size();i++){
                    id_=lista.get(i).getId();
                    nombre_C=lista.get(i).getNombre();
                    precio_=lista.get(i).getPrecio();
                    existencia_=lista.get(i).getExistencia();
                    if(existencia_!=0){
                        cantidad = (request.getParameter("Comida"+Integer.toString(i))).trim();
                    }
                    if(Integer.parseInt(cantidad)!=0){
                        NuevaExist=existencia_-Integer.parseInt(cantidad);
                        Comidas=Comidas+cantidad+" "+nombre_C+",  ";
                        Total=Total+(Integer.parseInt(cantidad)*precio_);
                        String modifica = "update bd_comida.comida set cantidad='"+NuevaExist+"' where nombre='"+nombre_C+"';";
                        objConn.Actualizar(modifica);
                    }
                %>

        <%
                }
                int suma;
                String Cliente_,Edificio_,Salon_,Hora_,APagar_="0";
                Cliente_= (request.getParameter("Comprador")).trim();
                Edificio_= (request.getParameter("Edificio")).trim();
                Salon_= (request.getParameter("Salon")).trim();
                Hora_= (request.getParameter("Horario")).trim();
                APagar_= (request.getParameter("Dinero")).trim();
               %>


                <%! ArrayList <Pedido> listaP = new ArrayList();%> 
                <%
                consulta="select * from bd_comida.pedidos;";
                objConn.Consultar(consulta);
                if(objConn.rs!=null){
                    try{
                        objConn.rs.last();
                        n=objConn.rs.getRow();
                        objConn.rs.first();
                    }catch(Exception e){}
                    //String[][] datos=new String[n][4];
                    //datos=new String[n][4];
                    String id, nombre, pedido, precioTotal,Edificio,Salon,Hora,pago,estado;
                    int id_p=0,precioTotal_p,pago_p,estado_p,cambio;
                    String nombre_p,pedido_p,edificio_p,salon_p,hora_p;
                                    for(i=0;i<n;i++){

                                            try{
                                                id=objConn.rs.getString(1);
                                                //out.println(idUsuario+ "<br>");
                                                nombre=objConn.rs.getString(2);
                                                //out.println(nombre+ "<br>");
                                                pedido =objConn.rs.getString(3);
                                                //out.println(cuenta+ "<br>");
                                                precioTotal =objConn.rs.getString(4);
                                                //out.println(password+ "<br>");
                                                Edificio =objConn.rs.getString(5);
                                                Salon =objConn.rs.getString(6);
                                                Hora =objConn.rs.getString(7);
                                                pago =objConn.rs.getString(8);
                                                estado =objConn.rs.getString(9);
                                                listaP.add(new Pedido(Integer.parseInt(id), nombre, pedido, Integer.parseInt(precioTotal),Edificio,Salon,Hora,Integer.parseInt(pago),Integer.parseInt(estado)));
                                                objConn.rs.next();
                                                id_p=i+2;
                                            }catch(Exception e){ }


                                 }
                                    if(APagar_.equals("")){
                                        APagar_="0";
                                    }
                                    //Calendar calendario = Calendar.getInstance();
                                    Calendar calendario = new GregorianCalendar();
                                    int hora, minutos, segundos;
                                    hora =calendario.get(Calendar.HOUR_OF_DAY);
                                    minutos = calendario.get(Calendar.MINUTE);
                                    segundos = calendario.get(Calendar.SECOND);
                                    if(Hora_.equals("")){
                                        minutos=minutos+15;
                                        if(minutos>=60){
                                            hora=hora+1;
                                            minutos=minutos-60;
                                        }
                                        Hora_=hora+":"+minutos+":"+segundos;
                                    }
                                    cambio=Integer.parseInt(APagar_)-Total;
                                    
                                 listaP.clear();%>
                                 <p>Recibo:<br>
                    Pedido: <br>
                    Numero de pedido: <%=id_p%><br> 
                    Orden total: <%=Comidas%><br> 
                    Total a pagar: $<%=Total%><br> 
                    se recibira a nombe de <%=Cliente_%><br> 
                    Se entrega en el edificio: <%=Edificio_%>, Salon: <%=Salon_%><br> 
                    debes estar a la hora: <%=Hora_%><br> 
                    Pagaras con $<%=APagar_%><br>
                    <%if(cambio<0){
                        cambio=cambio*-1;
                    %>
                        Te faltarían  $<%=cambio%> <br><br>     
                    <%}else{%>
                        Tu cambio sera de $<%=cambio%> <br><br>
                     <%}%>
                     
                    Se recomienda gardar esta informacion por si llega a pasar algo
                </p>                        
                                        <%
                if(APagar_==null){
                    APagar_="0";
                }
                String alta,parte1, parte2;
                parte1 = "insert into bd_comida.pedidos (id_orden,nombre,pedido,precioTotal,edificio,salon,horario,pago,estado) ";
                parte2 = "values ('"+ id_p +"','"+ Cliente_ +"','"+Comidas+ "','"+Total+"','"+Edificio_+"','"+Salon_+"','"+Hora_+"','"+APagar_+"','1');";
                alta = parte1 +parte2;
                objConn.Actualizar(alta);
             }
             objConn.closeRsStmt();
             %>


             <%lista.clear(); %>
             <button><a href="Menu_Inicio.html"> Regresar a menu Principal</a></button>
             <!--Agregar el regresar a pagina-->
        </section>
        </body>
</html>
