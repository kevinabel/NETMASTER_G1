
<%@page import="A.NET.ENTIDAD.TipoDocumento"%>
<%@page import="A.NET.ENTIDAD.TipoPersona"%>
<%@page import="A.NET.ENTIDAD.Persona"%>
<%@page import="A.NET.DAO.IMPL.PersonaDaoImpl"%>
<%@page import="A.NET.DAO.PersonaDao"%>
<%@include file="WEB-INF/jspf/top.jsp" %>
<div class="container">
    <%
        String id_persona = request.getParameter("id_persona");
        id_persona = id_persona == null ? "" : id_persona;
        String id_tipo_persona = request.getParameter("id_tipo_persona");
        id_tipo_persona = id_tipo_persona == null ? "" : id_tipo_persona;
        String nombre = request.getParameter("nombre");
        nombre = nombre == null ? "" : nombre;
        String apellido = request.getParameter("apellido");
        apellido = apellido == null ? "" : apellido;
        String id_tipo_documento = request.getParameter("id_tipo_documento");
        id_tipo_documento = id_tipo_documento == null ? "" : id_tipo_documento;
        String n_documento = request.getParameter("n_documento");
        n_documento = n_documento == null ? "" : n_documento;
        String ruc = request.getParameter("ruc");
        ruc = ruc == null ? "" : ruc;
        String telefono = request.getParameter("telefono");
        telefono = telefono == null ? "" : telefono;
        String direccion = request.getParameter("direccion");
        direccion = direccion == null ? "" : direccion;

        String opcion = request.getParameter("opcion");
        opcion = opcion == null ? "Enviar" : opcion;
        

        String mensaje = "";
        if (opcion.equals("Enviar") || opcion.equals("Actualizando")) {
            if (!nombre.equals("") && !id_tipo_documento.equals("") && (!n_documento.equals("") || !ruc.equals(""))) {

                Persona persona = new Persona();
                PersonaDao pd = new PersonaDaoImpl();

                persona.setNombre(nombre);
                persona.setIdtipoPersona(id_tipo_persona);
                persona.setApellido(apellido);
                persona.setIdtipoDocumento(id_tipo_documento);
                persona.setNDocumento(n_documento);
                persona.setRuc(ruc);
                persona.setTelefono(telefono);
                persona.setDireccion(direccion);

                if (opcion.equals("Enviar")) {
                    if (pd.agregarPersona(persona)) {
                        //opcion="run";
                        mensaje = "Se añadió correctamente el producto... <a href='agregar_persona.jsp'>[Seguir Añadiendo] </a><a href='bienvenido.jsp'> [Terminar] </a>";

                    } else {
                        mensaje = "No se pudo agregar";
                    }
                }
                if (opcion.equals("Actualizando")) {
                    persona.setIdPersona(id_persona);

                    if (pd.UpdatePersona(persona)) {
                        mensaje = "Se actualizó corerctamente...<a href='reporte_persona.jsp'>[Reportes] </a>";
                    } else {
                        mensaje = "No se pudo actualizar";
                    }

                }
            }
        }

        if (opcion.equals("Actualizar")) {
            //out.println("Id_producto:"+id_producto); 
            if (!id_persona.equals("")) {

                PersonaDao pd = new PersonaDaoImpl();

                for (Persona persona : pd.ObtenerPersona(id_persona)) {

                    id_tipo_persona = persona.getIdtipoPersona();
                    id_tipo_persona = id_tipo_persona == null ? "" : id_tipo_persona;
                    nombre = persona.getNombre();
                    nombre = nombre == null ? "" : nombre;
                    apellido = persona.getApellido();
                    apellido = apellido == null ? "" : apellido;
                    id_tipo_documento = persona.getIdtipoDocumento();
                    id_tipo_documento = id_tipo_documento == null ? "" : id_tipo_documento;
                    n_documento = persona.getNDocumento();
                    n_documento = n_documento == null ? "" : n_documento;
                    ruc = persona.getRuc();
                    ruc = ruc == null ? "" : ruc;
                    telefono = persona.getTelefono();
                    telefono = telefono == null ? "" : telefono;
                    direccion = persona.getDireccion();
                    direccion = direccion == null ? "" : direccion;

                    //out.println("codigo:"+codigo);
                    opcion = "Actualizando";
                }
            }

        }

    %>

    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6" id="aler">
            <br>
            <%            if (!mensaje.equals("")) {
            %>
            <div class="alert alert-danger"><%=mensaje%></div> 
            <%}%>
        </div>
        <div class="col-md-3"></div>

    </div>

    <% if (opcion.equals("Enviar") || opcion.equals("Actualizar") || opcion.equals("Actualizando")) {%>
    <div class="row"> 
        <div class="form0">
            <div class="col-md-2">     
            </div>
            <div class="col-md-8 well">
                <div class="titleform1">
                    <h2>Formulario de Registro de Persona</h2>
                    <h6>Campos Obligatorios (**)</h6>
                </div>
                <br>
                <div class="form2">
                    <form class="form-horizontal" action="agregar_persona.jsp">
                        <input type="hidden" name="opcion"  value="<%=opcion%>" size="10">
                        <input type="hidden" name="id_producto"  value="<%=id_persona%>" size="10">
                        <div class="form-group">
                            <label class="control-label col-xs-3" >Tipo Persona:</label>
                            <div class="col-xs-9">
                                <select class="form-control" name="id_tipo_persona" selected="selected" <%if (id_tipo_persona.equals("")) {%> selected<%}%>><option>Selecciona</option>                 
                                    <%
                                        PersonaDao tp = new PersonaDaoImpl();

                                        for (TipoPersona ca : tp.listarTipoPersona()) {

                                    %>
                                    <option value="<%=ca.getIdTipoPersona()%>" <%if (id_tipo_persona.equals(ca.getIdTipoPersona())) {%> selected<%}%>> <%=ca.getNombre()%></option>   
                                    <%}%>
                                </select>
                            </div>
                        </div>      
                        <div class="form-group">
                            <label class="control-label col-xs-3" >Nombre:</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" placeholder="Nombre" name="nombre" value="<%=nombre%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-3">Apellido:</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" placeholder="Apellido" name="apellido" value="<%=apellido%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-3" >Tipo Documento:</label>
                            <div class="col-xs-9">
                                <select class="form-control" name="id_tipo_documento" selected="selected" <%if (id_tipo_documento.equals("")) {%> selected<%}%>><option>Selecciona</option>                 
                                    <%
                                        PersonaDao td = new PersonaDaoImpl();

                                        for (TipoDocumento ca : td.listarTipoDocumento()) {

                                    %>
                                    <option value="<%=ca.getIdTipoDocumento()%>" <%if (id_tipo_documento.equals(ca.getIdTipoDocumento())) {%> selected<%}%>> <%=ca.getNombre()%></option>   
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-3">N° Documento:</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" placeholder="N° documento" name="n_documento" value="<%=n_documento%>">
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