<%@page import="A.NET.ENTIDAD.Producto"%>
<%@page import="A.NET.DAO.IMPL.ProductoDaoImpl"%>
<%@page import="A.NET.DAO.ProductoDao"%>
<%@include file="WEB-INF/jspf/top.jsp"%>

<div class="container">

<%
    //String buscar_por = request.getParameter("buscar_por");buscar_por = buscar_por==null?"nombre": buscar_por;
    String buscar = request.getParameter("buscar");buscar = buscar==null?"": buscar;
    String opcion = request.getParameter("opcion");opcion = opcion == null ? "" : opcion;
    String id_producto = request.getParameter("id_producto");id_producto = id_producto == null ? "" : id_producto;
    String mensaje="";
    
    if(opcion.equals("eliminar")){
        
        if(!id_producto.equals("")){
            ProductoDao dao = new ProductoDaoImpl();
            if(dao.DeleteProducto(id_producto)){
                mensaje="Se eliminó correctamente.";
            }
        }
    }

%>
<br><br>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form class="form-horizontal" action="reporte_producto.jsp" method="post">              
                <div class="form-group">
                    <label class="control-label col-xs-3">Buscar Por Marca o Modelo: </label>
                    <div class="col-xs-5">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Realiza la b&uacute;squeda aqu&iacute;" name="buscar">
                            <span class="input-group-btn">
                              <button type="submit" class="btn btn-primary">Buscar</button>
                            </span>
                        </div><!-- /input-group -->
                    </div>  
                </div>
            </form>
        </div>
        <div class="col-md-1"></div>
    </div>
<br>
<div class="row">
    <div class="col-md-1"></div>
        <div class="col-md-10" id="aler">
            <br>
            <%
                if(!mensaje.equals("")){
            %>
            <div class="alert alert-danger"><%=mensaje%></div> 
            <%}%>
        </div>
    <div class="col-md-1"></div>
</div>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10 well">
            <div class="tab-pane">
                <table class="table table-hover table-striped table-bordered">
                    <thead>
                        <tr>
                            <td width="5%" bgcolor="#FFEFCE"><strong>#</strong></td>
                            <td width="15%" bgcolor="#FFEFCE"><strong>CATEGORIA</strong></td>
                            <td width="10%" bgcolor="#FFEFCE"><strong>MARCA Y MODELO</strong></td>
                            <td width="30%" bgcolor="#FFEFCE"><strong>DESCRIPCION</strong></td>
                            <td width="10%" bgcolor="#FFEFCE"><strong>COLOR</strong></td>
                            <td width="10%" bgcolor="#FFEFCE"><strong>CODIGO</strong></td>
                            <td width="5%" align="center" bgcolor="#FFEFCE"><strong>STOCK</strong></td>
                            <td width="18%" align="center" bgcolor="#FFEFCE"><strong>Opciones</strong></th>
                        </tr>
                        
                    </thead>
                    <tbody>
                        <%
                        String espacio="  ";
                        int count=0;
                        ProductoDao dao = new ProductoDaoImpl();
                        for(Producto producto :dao.BuscarProducto( buscar)){
                             count++;
                        %>
          
                        <tr>     
                            <input type="hidden" name="id_producto"  value="<%=producto.getIdProducto()%>" size="10">
                            <td><%=count%>.-</td> 
                            <td><%=producto.getIdcategoria()%></td>
                            <td align="center"><%=producto.getMarcamodelo()%></td>
                            <td align="center"><%=producto.getDescripcion()%></td>
                            <td align="center"><%=producto.getIdcolor()%></td> 
                            <td align="center"><%=producto.getCodigo()%></td>
                            <td align="center"><%=producto.getStock()%></td>
                            <td>
                                <a href="agregar_producto.jsp?opcion=Actualizar&id_producto=<%=producto.getIdProducto()%>">[Actualizar]<%=espacio%></a>
                                <a href="reporte_producto.jsp?opcion=eliminar&id_producto=<%=producto.getIdProducto()%>">[Eliminar]</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
<%@include file="WEB-INF/jspf/bottom.jsp"%>

