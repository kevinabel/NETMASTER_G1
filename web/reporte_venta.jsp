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
            <form class="form-horizontal" action="reporte_venta.jsp" method="post">              
                <div class="form-group">
                    <label class="control-label col-xs-3">Buscar Por N° De Comprobante:</label>
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
                            <td width="15%" bgcolor="#FFEFCE"><strong>PERSONA</strong></td>
                            <td width="15%" bgcolor="#FFEFCE"><strong>N° COMPROBANTE</strong></td>
                            <td width="5%" align="center" bgcolor="#FFEFCE"><strong>Opciones</strong></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        String espacio="  ";
                        VentaDao vena = new VentaDaoImpl();
                        for(Venta venta:vena.BuscarVenta(buscar)){
                        %>
          
                        <tr>     
                            <input type="hidden" name="id_venta"  value="<%=venta.getIdVenta()%>" size="10">
                            <td align="center"><%=venta.getIdCliente()%></td>
                            <td align="center"><%=venta.getNroC()%></td>
                            <td>
                                <a href="venta.jsp?opcion=Obtener&id_venta=<%=venta.getIdVenta()%>">[Venta]<%=espacio%></a>

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