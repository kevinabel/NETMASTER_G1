<%@page import="A.NET.DAO.IMPL.EmpresaDaoImpl"%>
<%@page import="A.NET.DAO.EmpresaDao"%>
<%@page import="A.NET.ENTIDAD.Persona"%>
<%@page import="A.NET.DAO.IMPL.PersonaDaoImpl"%>
<%@page import="A.NET.DAO.PersonaDao"%>
<%@include file="WEB-INF/jspf/top.jsp" %>

<%
    //String buscar_por = request.getParameter("buscar_por");buscar_por = buscar_por==null?"nombre": buscar_por;
    String buscar = request.getParameter("buscar");buscar = buscar==null?"": buscar;
    String opcion = request.getParameter("opcion");opcion = opcion == null ? "" : opcion;
    String id_persona = request.getParameter("id_persona");id_persona = id_persona == null ? "" : id_persona;
    String id_empresa = request.getParameter("id_empresa");id_empresa = id_empresa == null ? "" : id_empresa;
    String id_contacto = request.getParameter("id_contacto");id_contacto = id_contacto == null ? "" : id_contacto;
    String mensaje="";
    
    if(opcion.equals("eliminar2")){
        
        if(!id_contacto.equals("")){
            EmpresaDao dao = new EmpresaDaoImpl();
            if(dao.DeleteContacto(id_contacto)){
                mensaje="Se eliminó correctamente.";
            }
        }
    }

%>
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
<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10 well">
            <div class="tab-pane">
                <table class="table table-hover table-striped table-bordered">
                    <thead>
                        <tr>
                            <td width="12%" bgcolor="#FFEFCE"><strong>EMPRESA</strong></td>
                            <td width="12%" bgcolor="#FFEFCE"><strong>TELEFONO EMPRESA</strong></td>
                            <td width="25%" bgcolor="#FFEFCE"><strong>CONTACTO</strong></td>
                            <td width="12%" bgcolor="#FFEFCE"><strong>TELEFONO CONTACTO</strong></td>
                            <td width="10%" align="center" bgcolor="#FFEFCE"><strong>Opciones Empresa</strong></th>
                                <td width="18%" align="center" bgcolor="#FFEFCE"><strong>Opciones Contacto</strong></th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        String espacio="  ";
                        EmpresaDao dao = new EmpresaDaoImpl();
                        for(Persona persona:dao.BuscarPersona()){
                        %>
          
                        <tr>     
                            <input type="hidden" name="id_empresa"  value="<%=persona.getIdEmpresa()%>" size="10">
                            <td><%=persona.getNombre()%></td>
                            <td align="center"><%=persona.getTelefono()%></td>
                            <input type="hidden" name="id_contacto"  value="<%=persona.getIdContacto()%>" size="10">
                            <td align="center"><%=persona.getNombre1()%></td>
                            <td align="center"><%=persona.getTelefono1()%></td>
                            <td>
                                <a href="agregar_empresa.jsp?opcion=Actualizar&id_empresa=<%=persona.getIdEmpresa()%>">[Actualizar]<%=espacio%></a>
                            <td>
                                <a href="agregar_persona.jsp?opcion=Actualizar&id_contacto=<%=persona.getIdContacto()%>">[Actualizar]<%=espacio%></a>
                                <a href="reporte_empresa_contacto.jsp?opcion=eliminar2&id_contacto=<%=persona.getIdContacto()%>">[Eliminar]</a></td>
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