<%@page import="A.NET.DAO.IMPL.UsuarioDaoImpl"%>
<%@page import="A.NET.DAO.UsuarioDao"%>
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
        
        String id_usuario = request.getParameter("id_usuario");
        id_usuario = id_usuario == null ? "" : id_usuario;
        String usuario = request.getParameter("usuario");
        usuario = usuario == null ? "" : usuario;
        String password = request.getParameter("password");
        password = password == null ? "" : password;
        String estado = request.getParameter("estado");
        estado = estado == null ? "" : estado;
        
        String id_persona = request.getParameter("id_persona");
        id_persona = id_persona == null ? "" : id_persona;
        
        String id_venta = request.getParameter("id_venta");
        id_venta = id_venta == null ? "" : id_venta;
        //String id_usuario = request.getParameter("id_usuario");
        //id_usuario = id_usuario == null ? "" : id_usuario;
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

            if (!usuario.equals("")) {
                
                Usuario usuarios = new Usuario();
                UsuarioDao dao = new UsuarioDaoImpl();
                usuarios.setIdUsuario(id_persona);
                usuarios.setUsuario(usuario);
                usuarios.setPassword(password);
                usuarios.setEstado(1);
                

                if (opcion.equals("Enviar")) {
                    if (dao.agregar_usuario(usuarios)) {
                        response.sendRedirect("bienvenido.jsp");
                    } else {
                        mensaje = "No se pudo agregar";
                    }
                }
            }
        }
        if (opcion.equals("Obtener")) {
            //out.println("Id_producto:"+id_producto); 
            if (!id_persona.equals("")) {

                PersonaDao pd = new PersonaDaoImpl();

                for (Persona persona : pd.ObtenerPersona(id_persona)) {
                    id_persona = persona.getIdPersona();
                    id_persona = id_persona == null ? "" : id_persona;
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
                                //String id_persona = request.getParameter("id_persona");
                                //id_persona = id_persona == null ? "" : id_persona;

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
                                                <td width="15%" bgcolor="skyblue"><strong>TIPO PERSONA</strong></td>
                                                <td width="20%" bgcolor="skyblue"><strong>NOMBRE Y APELLIDO</strong></td>
                                                <td width="5%" bgcolor="skyblue"><strong>TIPO DOCUMENTO</strong></td>
                                                <td width="10%" bgcolor="skyblue"><strong>N° DOCUMENTO</strong></td>
                                                <td width="10%" bgcolor="skyblue"><strong>RUC</strong></td>
                                                <td width="5%"  bgcolor="skyblue"><strong>TELEFONO</strong></td>
                                                <td width="5%" align="center" bgcolor="skyblue"><strong>Opciones</strong></th>
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
                                                    <a href="agregar_usuario.jsp?opcion=Obtener&id_persona=<%=persona.getIdPersona()%>">[Venta]<%=espacio%></a>
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
                            <button type="button" class="btn btn-default" ><a href="agregar_persona.jsp">REGISTRAR PERSONA AQUI</a></button> 
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <h2>Formulario de Registro de Ventas</h2>

            <h6>Campos Obligatorios (**)</h6>

        </div>

        <br>
        <div class="form2">


            <form class="form-horizontal" action="agregar_usuario.jsp">
                <input type="hidden" class="form-control" placeholder="Id_Persona" name="id_persona" value="<%=id_persona%>">
                <div class="form-group">
                    <label class="control-label col-xs-3">Usuario:</label>
                    <div class="col-xs-9">
                        <input type="text" class="form-control" placeholder="Usuario" name="usuario" value="<%=usuario%>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-xs-3">Password</label>
                    <div class="col-xs-9">
                        <input type="password" class="form-control" placeholder="Password" name="password" value="<%=password%>">
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-2">           
                    </div>
                    <div class="col-md-7">  
                        <div class="form-group">
                            <div class="col-xs-offset-3 col-xs-9">
                                <input type="submit" class="btn btn-primary" value="Enviar">
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