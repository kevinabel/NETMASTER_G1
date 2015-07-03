<%@page import="java.lang.String"%>
<%@page import="A.NET.ENTIDAD.Persona"%>
<%@page import="A.NET.DAO.IMPL.PersonaDaoImpl"%>
<%@page import="A.NET.DAO.PersonaDao"%>
<%@page import="A.NET.ENTIDAD.Comprobante"%>
<%@page import="A.NET.ENTIDAD.Usuario"%>
<%@page import="A.NET.DAO.IMPL.VentaDaoImpl"%>
<%@page import="A.NET.DAO.VentaDao"%>
<%@page import="A.NET.ENTIDAD.Venta"%>
<%@include file="WEB-INF/jspf/top.jsp" %>


<div class="container">
    <%
        String id_venta = request.getParameter("id_venta");
        id_venta = id_venta == null ? "" : id_venta;
        String id_usuario = request.getParameter("id_usuario");
        id_usuario = id_usuario == null ? "" : id_usuario;
        String id_cliente = request.getParameter("id_cliente");
        id_cliente = id_cliente == null ? "" : id_cliente;
        String id_comprobante = request.getParameter("id_comprobante");
        id_comprobante = id_comprobante == null ? "" : id_comprobante;
        String nro_c = request.getParameter("nro_c");
        nro_c = nro_c == null ? "" : nro_c;
        String fecha = request.getParameter("fecha");
        fecha = fecha == null ? "" : fecha;

        //String id_venta = request.getParameter("id_venta"); id_venta = id_venta == null ? "" : id_venta;
        //String id_persona = request.getParameter("id_persona"); id_persona = id_persona == null ? "" : id_persona;
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
        if (opcion.equals("Enviar")) {

            if (!id_usuario.equals("")) {

                Venta venta = new Venta();
                VentaDao pd = new VentaDaoImpl();
                venta.setIdUsuario(id_usuario);
                venta.setIdCliente(id_cliente);
                venta.setIdComprobante(id_comprobante);
                venta.setNroC(nro_c);
                venta.setFecha(fecha);

                if (opcion.equals("Enviar")) {
                    if (pd.agregarVenta(venta)) {
                        //opcion="run";
                        mensaje = "Se añadió correctamente el producto... <a href='agregar_venta_detalle.jsp'>agregar venta detallada</a>";

                    } else {
                        mensaje = "No se pudo agregar";
                    }
                }
            }
        }
        if (opcion.equals("Obtener")) {
            //out.println("Id_producto:"+id_producto); 
            if (!id_cliente.equals("")) {

                PersonaDao pd = new PersonaDaoImpl();

                for (Persona persona : pd.ObtenerPersona(id_cliente)) {
                    id_cliente = persona.getIdPersona();
                    id_cliente = id_cliente == null ? "" : id_cliente;
                    //nombre=persona.getNombre();nombre=nombre==null?"":nombre;

                    //out.println("codigo:"+codigo);
                    opcion = "Enviar";
                }
            }

        }
        VentaDao as = new VentaDaoImpl();

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

    <% if (opcion.equals("Enviar")) {%>
    <div class="row">
        <div class="container">

        </div>
        <div class="form0">
            <div class="col-md-2">     
            </div>
            <div class="col-md-8 well">
                <div class="titleform1">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Buscar Cliente</button>


                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="container">
                                    <%
                                        //String buscar_por = request.getParameter("buscar_por");buscar_por = buscar_por==null?"nombre": buscar_por;
                                        String buscar = request.getParameter("buscar");
                                        buscar = buscar == null ? "" : buscar;
                                        //String opcion = request.getParameter("opcion");opcion = opcion == null ? "" : opcion;
                                        String id_persona = request.getParameter("id_persona");
                                        id_persona = id_persona == null ? "" : id_persona;

                                    %>
                                    <br><br>
                                    <div class="row">
                                        <div class="col-md-1"></div>
                                        <div class="col-md-10">
                                            <form class="form-horizontal" method="post">              
                                                <div class="form-group">
                                                    <label class="control-label col-xs-3">Buscar Por DNI:</label>
                                                    <div class="col-xs-5">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" placeholder="Realiza la b&uacute;squeda aqu&iacute;" name="buscar">
                                                            <span class="input-group-btn">
                                                                <button  type="submit" class="btn btn-primary">Buscar</button>
                                                            </span>
                                                        </div><!-- /input-group -->
                                                    </div>  
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-md-1"></div>
                                    </div>
                                    <br>
                                </div>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="tab-pane">
                                                <table class="table table-hover table-striped table-bordered">
                                                    <thead>
                                                        <tr>
                                                        <td width="15%" bgcolor="#FFEFCE"><strong>TIPO PERSONA</strong></td>
                                                        <td width="20%" bgcolor="#FFEFCE"><strong>NOMBRE Y APELLIDO</strong></td>
                                                        <td width="5%" bgcolor="#FFEFCE"><strong>TIPO DOCUMENTO</strong></td>
                                                        <td width="10%" bgcolor="#FFEFCE"><strong>N° DOCUMENTO</strong></td>
                                                        <td width="10%" bgcolor="#FFEFCE"><strong>RUC</strong></td>
                                                        <td width="5%"  bgcolor="#FFEFCE"><strong>TELEFONO</strong></td>
                                                        <td width="5%" align="center" bgcolor="#FFEFCE"><strong>Opciones</strong></th>
                                                            </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%                            String espacio = "  ";
                                                            PersonaDao dao = new PersonaDaoImpl();
                                                            for (Persona persona : dao.BuscarPersona(buscar)) {
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
                                                            <a href="agregar_venta.jsp?opcion=Obtener&id_cliente=<%=persona.getIdPersona()%>">[Venta]<%=espacio%></a>
                                                            </tr>
                                                            <%}%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="col-md-1"></div>
                                    </div>
                                </div>        

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h2>Formulario de Registro de Ventas</h2>

                    <h6>Campos Obligatorios (**)</h6>

                </div>

                <br>
                <div class="form2">


                    <form class="form-horizontal" action="agregar_venta.jsp">
                        <div class="form-group">
                            <label class="control-label col-xs-3" >Selecione Usuario</label>
                            <div class="col-xs-9">
                                <select class="form-control" name="id_usuario" selected="selected" <%if (id_usuario.equals("")) {%> selected<%}%>><option>Selecciona</option>                 
                                    <%

                                        for (Usuario ca : as.listarUsuario()) {

                                    %>
                                    <option value="<%=ca.getIdUsuario()%>" <%if (id_usuario.equals(ca.getIdUsuario())) {%> selected<%}%>> <%=ca.getUsuario()%></option>   
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-3" >Proveedor</label>
                            <div class="col-xs-8">
                                <input type="date" class="form-control" placeholder="Fecha de la venta" name="fecha" value="<%=fecha%>">
                            </div> 
                        </div>

                        <input type="hidden" class="form-control" placeholder="Nombre Persona" name="id_cliente" value="<%=id_cliente%>">      
                        <div class="form-group">
                            <label class="control-label col-xs-3" >Selecione Comprobante</label>
                            <div class="col-xs-9">
                                <select class="form-control" name="id_comprobante" selected="selected" <%if (id_comprobante.equals("")) {%> selected<%}%>><option>Selecciona</option>                 
                                    <%

                                        for (Comprobante co : as.listarComprobante()) {

                                    %>
                                    <option value="<%=co.getIdComprobante()%>" <%if (id_comprobante.equals(co.getIdComprobante())) {%> selected<%}%>> <%=co.getNombre()%></option>   
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-3">N° Comprobante:</label>
                            <div class="col-xs-9">
                                <input type="text" class="form-control" placeholder="N° Comprobante" name="nro_c" value="<%=nro_c%>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-3" >Fecha de la venta</label>
                            <div class="col-xs-8">
                                <input type="date" class="form-control" placeholder="Fecha de la venta" name="fecha" value="<%=fecha%>">
                            </div> 
                        </div>

                        <br>
                        <div class="row">
                            <div class="col-md-2">           
                            </div>
                            <div class="col-md-7">  
                                <div class="form-group">
                                    <div class="col-xs-offset-3 col-xs-9">
                                        <a type="submit" class="btn btn-primary" value="" href="" ></a>
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
