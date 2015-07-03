<%@page import="A.NET.ENTIDAD.VentaDetalle"%>
<%@page import="A.NET.DAO.IMPL.VentaClienteDaoImpl"%>
<%@page import="A.NET.DAO.VentaClienteDao"%>
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
    
    /*if(opcion.equals("eliminar")){
        
        if(!id_producto.equals("")){
            ProductoDao dao = new ProductoDaoImpl();
            if(dao.DeleteProducto(id_producto)){
                mensaje="Se eliminó correctamente.";
            }
        }
    }*/

%>
<br><br>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form class="form-horizontal" action="reporte_venta_cliente.jsp" method="post">              
                <div class="form-group">
                    <label class="control-label col-xs-3">Buscar por DNI: </label>
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
                            <td width="1%" bgcolor="#FFEFCE"><strong>CANT</strong></td>
                            <td width="30%" bgcolor="#FFEFCE"><strong>PRODUCTO</strong></td>
                            <td width="4%" bgcolor="#FFEFCE"><strong>PRECIO UNITARIO</strong></td>
                            
                            </tr>
                        
                    </thead>
                    <tbody>
                        <%
                        String espacio="  ";
                        int count=0;
                        VentaClienteDao dao = new VentaClienteDaoImpl();
                        for(VentaDetalle venta :dao.BuscarProductoventaCliente(buscar)){
                             count++;
                        %>
                        <tr>     
                            <input type="hidden" name="id_producto"  value="<%=venta.getId_detalle_venta()%>" size="10">
                            <td align="center"><%=venta.getCantidad()%></td>
                            <td><%=venta.getId_producto()%></td>
                            <td align="center"><%=venta.getPrecio_u()%></td>
                            
                            </tr>
                        <%}%>
                    </tbody>
                    
                </table>
                    <table align="right" width="27%" >
                    <tbody bgcolor="#FFEFCE">
                        <%
                        //String espacio="  ";
                        //int count=0;
                        //VentaClienteDao dao = new VentaClienteDaoImpl();
                        for(VentaDetalle ven :dao.BuscarMontoCompraCliente(buscar)){
                             count++;
                        %>
                        <tr>
                            <td align="center" height="22"  colspan="4">Total S/:</td> 
                            <td align="center" width="50%"><%=ven.getPrecio_u()%></td>
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