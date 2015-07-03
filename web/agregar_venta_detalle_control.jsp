<%@page import="A.NET.ENTIDAD.VentaDetalle"%>
<%@page import="A.NET.DAO.VentaDetalleDao"%>
<%@page import="A.NET.DAO.IMPL.VentaDetalleDaoImpl"%>
<%@page import="A.NET.ENTIDAD.Venta"%>
<%@page import="A.NET.DAO.IMPL.VentaDaoImpl"%>
<%@page import="A.NET.DAO.VentaDao"%>
<%@include file="WEB-INF/jspf/top.jsp" %>
<div class="container">

<%
    //String buscar_por = request.getParameter("buscar_por");buscar_por = buscar_por==null?"nombre": buscar_por;
    String buscar = request.getParameter("buscar");buscar = buscar==null?"": buscar;
    String opcion = request.getParameter("opcion");opcion = opcion == null ? "" : opcion;
    String id_persona = request.getParameter("id_persona");id_persona = id_persona == null ? "" : id_persona;
    String mensaje="";
    /*
    if(opcion.equals("eliminar")){
        
        if(!id_persona.equals("")){
            PersonaDao dao = new PersonaDaoImpl();
            if(dao.DeletePersona(id_persona)){
                mensaje="Se eliminó correctamente.";
            }
        }
    }
*/
%>
<br><br>
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <form class="form-horizontal" action="reporte_persona.jsp" method="post">              
                <div class="form-group">
                    <label class="control-label col-xs-3">Buscar Por DNI:</label>
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
                            <td width="30%" bgcolor="#FFEFCE"><strong>PRODUCTO</strong></td>
                            <td width="5%" bgcolor="#FFEFCE"><strong>CANTIDAD</strong></td>
                            <td width="5%" bgcolor="#FFEFCE"><strong>PRECIO</strong></td>
                            <td width="5%" align="center" bgcolor="#FFEFCE"><strong>Opciones</strong></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        String espacio="  ";
                        VentaDetalleDao vena = new VentaDetalleDaoImpl();
                        for(VentaDetalle venta:vena.BuscarVentaDetalle(buscar)){
                        %>
          
                        <tr>     
                            <input type="hidden" name="id_detalle_venta"  value="<%=venta.getId_detalle_venta()%>" size="10">
                            <td align="center"><%=venta.getId_producto()%></td>
                            <td align="center"><%=venta.getCantidad()%></td>
                            <td align="center"><%=venta.getPrecio_u()%></td>
                            <td>
                                <a href="agregar_venta_detalle.jsp?opcion=Obtener&id_venta=<%=venta.getId_detalle_venta()%>">[Venta]<%=espacio%></a>

                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-md-1"></div>
    </div>
</div>
                    
<%@include file="WEB-INF/jspf/bottom.jsp" %>