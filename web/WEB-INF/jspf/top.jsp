<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>NETMASTER</title>
<link rel="shortcut icon" type="image/x-icon" href="recursos/img/favicon.ico"/>
<link rel="stylesheet" href="css/estilo1.css">
<link rel="stylesheet" href="css/animate.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="boostrap/css/bootstrap.css">
</head>

<body>
<header> 
            <%
HttpSession session1 = request.getSession();
String id=(String)session1.getAttribute("id_usuario");
if(id==null){
    response.sendRedirect("login.jsp");     
}
%>

<div class="container">
<div class="fondo">
<div class="row">          
<div class="col-md-3">
<div class="logo">
<a href="bienvenido.jsp"><img src="recursos/img/lo.png" class="img-responsive" alt="Imagen responsive"></a>

</div>
</div>

<div class="container">
<div class="row">           
<div class="col-md-12">
<nav class="navbar navbar-inverse">
<div class="navbar-header">
<button type="button" class="navbar-toggle dropdown-header" data-toggle="collapse" data-target=".navbar-collapse">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
</div>
<div class="navbar-collapse collapse">
<ul class="nav navbar-nav">
<li><a href="bienvenido.jsp">
        <span class="glyphicon glyphicon-qrcode " aria-hidden="true"></span>Inicio
    </a>
</li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
<span class="glyphicon glyphicon-fire" aria-hidden="true"></span> Reportes <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu">
<li><a href="reporte_producto.jsp">Reporte de Productos</a></li>
<li><a href="reporte_persona.jsp">Reporte de Personas</a></li>
<li><a href="reporte_empresa_contacto.jsp">Reporte Empresa_Contacto</a></li>
<li><a href="reporte_venta_cliente.jsp">Reporte Ventas a Clientes</a></li>
</ul>
</li>
<li class="dropdown">
<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-retweet" aria-hidden="true">
</span>Procesos Inmediatos <span class="caret"></span></a>
<ul class="dropdown-menu" role="menu">
<li><a href="agregar_producto.jsp">Agregar Producto</a></li>    
<li><a href="venta.jsp">Ventas</a></li>
<li><a href="agregar_venta.jsp">Registrar Ventas</a></li> 
</ul>
</li>
<li><a href="agregar_usuario.jsp">
<span class="glyphicon glyphicon-qrcode " aria-hidden="true"></span>Registrar Usuarios
</a>
</li>
<li><a href="login.jsp">
<span class="glyphicon glyphicon-qrcode " aria-hidden="true"></span>Salir
</a>
</li>


</ul>
</div><!--/.nav-collapse -->  
</nav>
</div>
</div>
</div>       


</div>
<br>
</div>        
</div>

</header>
