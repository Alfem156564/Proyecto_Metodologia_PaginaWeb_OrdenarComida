<%-- 
    Document   : checklog
    Created on : 12/12/2016, 02:01:45 PM
    Author     : Darci
--%>

<%@page import="clases.Cuentas"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysql.MySqlConexion"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page session = "true" %>
        <%! ArrayList <Cuentas> lista = new ArrayList();%>
        <%
        String consulta="select * from bd_comida.admin;";
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
            String idUsuario, nombre, cuenta, password;
            for(i=0;i<n;i++){
                
                    try{
                        idUsuario=objConn.rs.getString(1);
                        //out.println(idUsuario+ "<br>");
                        nombre=objConn.rs.getString(2);
                        //out.println(nombre+ "<br>");
                        cuenta =objConn.rs.getString(3);
                        //out.println(cuenta+ "<br>");
                        password =objConn.rs.getString(4);
                        //out.println(password+ "<br>");
                        lista.add(new Cuentas(Integer.parseInt(idUsuario),nombre, cuenta, password));
                        objConn.rs.next();
                    }catch(Exception e){ }
                
            }
         }//out.println("n="+n+" "+lista);
            //String usr[]={"q","alan","kike","spiderman"};
            //String pass[]={"q","6330","game","librojsp"};
            String usuario = "";
            String nombre ="";
            String clave = "";
            String captcha ="";
            String user = "z";
            String password = "z";
            if (request.getParameter("usuario") != null) {
                usuario = request.getParameter("usuario");
            }
            if (request.getParameter("clave") != null) {
                clave = request.getParameter("clave");
            }
            if (request.getParameter("captcha") != null ) {
                captcha = request.getParameter("captcha");
            }
            String cap = (String)(application.getAttribute("CAP"));
            for(i=0;i<lista.size();i++){
                if (usuario.equals(lista.get(i).getCuenta())){
                    if(clave.equals(lista.get(i).getPassword())){
                        user=lista.get(i).getCuenta();
                        password=lista.get(i).getPassword();
                        nombre=lista.get(i).getNombre();
                        i=lista.size();
                    }
                }
            }
            if( captcha.equals(cap) ){
                if (usuario.equals(user) && clave.equals(password)) {
                        HttpSession sesionOk = request.getSession();                                  //hacer modificaciones sobre la tabla con la que inicializaste
                        objConn.closeRsStmt();
            %>
                        <jsp:forward page="Admin_Pedidios.jsp" />

            <%  }else { 
                        objConn.closeRsStmt();%>
                        <jsp:forward page="Menu_Secion.jsp">
                        <jsp:param name="error" value="Usuario y/o clave
                            incorrectos.<br>Vuelve a intentarlo."/>
                        </jsp:forward>
    <%          }
                
            }else{
                objConn.closeRsStmt();%>
                <jsp:forward page="Menu_Secion.jsp">
                <jsp:param name="error" value="Capcha incorrecto"/>
                </jsp:forward><%
            }
            %>
        
    </body>
</html>
