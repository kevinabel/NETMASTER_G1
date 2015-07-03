<%@page import="A.NET.ENTIDAD.Persona"%>
<%@page import="A.NET.DAO.IMPL.PersonaDaoImpl"%>
<%@page import="A.NET.DAO.PersonaDao"%>
<%@include file="WEB-INF/jspf/top.jsp" %>
<div class="container">

<%
    //String buscar_por = request.getParameter("buscar_por");buscar_por = buscar_por==null?"nombre": buscar_por;
    String buscar = request.getParameter("buscar");buscar = buscar==null?"": buscar;
    String opcion = request.getParameter("opcion");opcion = opcion == null ? "" : opcion;
    String id_persona = request.getParameter("id_persona");id_persona = id_persona == null ? "" : id_persona;
    String mensaje="";
    
    if(opcion.equals("eliminar")){
        
        if(!id_persona.equals("")){
            PersonaDao dao = new PersonaDaoImpl();
            if(dao.DeletePersona(id_persona)){
                mensaje="Se eliminó correctamente.";
            }
        }
    }

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
                            <td width="15%" bgcolor="#FFEFCE"><strong>TIPO PERSONA</strong></td>
                            <td width="20%" bgcolor="#FFEFCE"><strong>NOMBRE Y APELLIDO</strong></td>
                            <td width="15%" bgcolor="#FFEFCE"><strong>TIPO DOCUMENTO</strong></td>
                            <td width="10%" bgcolor="#FFEFCE"><strong>N° DOCUMENTO</strong></td>
                            <td width="10%" bgcolor="#FFEFCE"><strong>RUC</strong></td>
                            <td width="5%"  bgcolor="#FFEFCE"><strong>TELEFONO</strong></td>
                            <td width="18%" align="center" bgcolor="#FFEFCE"><strong>Opciones</strong></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        String espacio="  ";
                        PersonaDao dao = new PersonaDaoImpl();
                        for(Persona persona :dao.BuscarPersona(buscar)){
                        %>
          
                        <tr>     
                            <input type="hidden" name="id_persona"  value="<%=persona.getIdPersona()%>" size="10">
                            <td align="center"><%=persona.getIdtipoPersona()%></td>
                            <td align="center"><%=persona.getNombre()%></td>
                            <td align="center"><%=persona.getIdtipoDocumento()%></td>
                            <td align="center"><%=persona.getNDocumento()%></td> 
                            <td align="center"><%=persona.getRuc()%></td>
                            <td align="center"><%=persona.getTelefono()%></td>
                            <td>
                                <a href="agregar_persona.jsp?opcion=Actualizar&id_persona=<%=persona.getIdPersona()%>">[Actualizar]<%=espacio%></a>
                                <a href="agregar_venta.jsp?opcion=Obtener&id_cliente=<%=persona.getIdPersona()%>">[Venta]<%=espacio%></a>
                                <a href="reporte_persona.jsp?opcion=eliminar&id_persona=<%=persona.getIdPersona()%>">[Eliminar]</a></td>
                        
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