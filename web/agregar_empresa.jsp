
<%@page import="A.NET.DAO.IMPL.EmpresaDaoImpl"%>
<%@page import="A.NET.DAO.EmpresaDao"%>
<%@page import="A.NET.ENTIDAD.TipoDocumento"%>
<%@page import="A.NET.ENTIDAD.TipoPersona"%>
<%@page import="A.NET.ENTIDAD.Persona"%>
<%@page import="A.NET.DAO.IMPL.PersonaDaoImpl"%>
<%@page import="A.NET.DAO.PersonaDao"%>
<%@include file="WEB-INF/jspf/top.jsp" %>
<div class="container">
<%
        String id_persona = request.getParameter("id_persona"); id_persona = id_persona == null ? "" : id_persona;
        String id_empresa = request.getParameter("id_empresa"); id_empresa = id_empresa == null ? "" : id_empresa;
        String id_tipo_persona = request.getParameter("id_tipo_persona");id_tipo_persona = id_tipo_persona == null ? "" : id_tipo_persona;
        String nombre = request.getParameter("nombre");nombre = nombre == null ? "" : nombre;
        String ruc = request.getParameter("ruc");ruc = ruc == null ? "" : ruc;
        String telefono = request.getParameter("telefono");telefono = telefono == null ? "" : telefono;
        String direccion = request.getParameter("direccion");direccion = direccion == null ? "" : direccion;
        
        String opcion = request.getParameter("opcion");opcion = opcion == null ? "Enviar" : opcion;

        String mensaje="";
        if(opcion.equals("Enviar")||opcion.equals("Actualizando")){
        if(!nombre.equals("") && !ruc.equals("")){
            

            Persona persona=new Persona();
            EmpresaDao pd=new EmpresaDaoImpl();
            persona.setIdtipoPersona(id_tipo_persona);
            persona.setNombre(nombre);
            persona.setRuc(ruc);
            persona.setTelefono(telefono);
            persona.setDireccion(direccion);

            if(opcion.equals("Enviar")){
                if(pd.agregarPersona(persona))
                {
                    //opcion="run";
                    mensaje = "Se añadió correctamente el producto... <a href='agregar_empresa.jsp'>[Seguir Añadiendo] </a><a href='reporte_empresa_contacto.jsp'> [Terminar] </a>";


                }else{
                    mensaje="No se pudo agregar";
                }
            }
            if(opcion.equals("Actualizando")){
                persona.setIdPersona(id_persona);

                if(pd.UpdatePersona(persona)){
                    mensaje = "Se actualizó corerctamente...<a href='reporte_empresa_contacto.jsp'>[Reportes] </a>";
                }
                else{
                    mensaje = "No se pudo actualizar";
                }
            
            }
        }
    }
    
    if(opcion.equals("Actualizar"))
    {      
        //out.println("Id_producto:"+id_producto); 
            if(!id_empresa.equals("")){
                
                EmpresaDao pd=new EmpresaDaoImpl();

                for(Persona persona :pd.ObtenerPersona(id_empresa)){
                id_tipo_persona=persona.getIdtipoPersona();id_tipo_persona=id_tipo_persona==null?"":id_tipo_persona;    
                nombre=persona.getNombre();nombre=nombre==null?"":nombre;
                ruc=persona.getRuc();ruc = ruc==null?"":ruc;
                telefono=persona.getTelefono();telefono=telefono==null?"":telefono;
                direccion=persona.getDireccion();direccion=direccion==null?"":direccion;
                
                //out.println("codigo:"+codigo);
                
                opcion="Actualizando";
            }
        }
            
}
        
%>

<div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6" id="aler">
        <br>
        <%
            if(!mensaje.equals("")){
        %>
        <div class="alert alert-danger"><%=mensaje%></div> 
        <%}%>
    </div>
    <div class="col-md-3"></div>
    
</div>
      
        <% if(opcion.equals("Enviar") ||opcion.equals("Actualizar") || opcion.equals("Actualizando")){%>
        <div class="row"> 
            <div class="form0">
            <div class="col-md-2">     
            </div>
            <div class="col-md-8 well">
                <div class="titleform1">
                <h2>Formulario de Registro de Empresa</h2>
                <h6>Campos Obligatorios (**)</h6>
                </div>
                <br>
                <div class="form2">
                    <form class="form-horizontal" action="agregar_empresa.jsp">
                    <input type="hidden" name="opcion"  value="<%=opcion%>" size="10">
                    <input type="hidden" name="id_empresa"  value="<%=id_empresa%>" size="10">
                    <div class="form-group">
                        <label class="control-label col-xs-3" >Tipo Persona:</label>
                        <div class="col-xs-9">
                            <select class="form-control" name="id_tipo_persona" selected="selected" <%if(id_tipo_persona.equals("")){%> selected<%}%>><option>Selecciona</option>                 
                            <%
                                PersonaDao tp = new PersonaDaoImpl();
                                
                                for(TipoPersona ca: tp.listarTipoPersona()){
                                    
                            %>
                            <option value="<%=ca.getIdTipoPersona()%>" <%if(id_tipo_persona.equals(ca.getIdTipoPersona())){%> selected<%}%>> <%=ca.getNombre()%></option>   
                             <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" >Nombre Empresa:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="Nombre" name="nombre" value="<%=nombre%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Ruc:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="Ruc" name="ruc" value="<%=ruc%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Telefono:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="Telefono" name="telefono" value="<%=telefono%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Direccion</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="Direccion" name="direccion" value="<%=direccion%>">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                    <div class="col-md-2">           
                    </div>
                    <div class="col-md-7">  
                    <div class="form-group">
                        <div class="col-xs-offset-3 col-xs-9">
                            <input type="submit" class="btn btn-primary" value="<%=opcion%>">
                            <input type="reset" class="btn btn-default" value="Limpiar">
                        </div>
                        <br><br><br>
                    </div></div>
                    <div class="col-md-3">           
                    </div>
                    </div>
                </form>
                </div>       
            </div>  
            <div class="col-md-2">           
            </div>
        </div>
    </div>
    <%}%>
</div>
<%@include file="WEB-INF/jspf/bottom.jsp" %>