<%@page import="A.NET.DAO.IMPL.VentaDetalleDaoImpl"%>
<%@page import="A.NET.DAO.VentaDetalleDao"%>
<%@page import="A.NET.ENTIDAD.VentaDetalle"%>
<%@page import="A.NET.DAO.IMPL.ProductoDaoImpl"%>
<%@page import="A.NET.ENTIDAD.Producto"%>
<%@page import="A.NET.DAO.IMPL.ProductoDaoImpl"%>
<%@page import="A.NET.DAO.ProductoDao"%>
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
        String id_detalle_venta = request.getParameter("id_detalle_venta"); id_detalle_venta = id_detalle_venta == null ? "" : id_detalle_venta;
        String id_venta = request.getParameter("id_venta"); id_venta = id_venta == null ? "" : id_venta;
        String id_producto = request.getParameter("id_producto");id_producto = id_producto == null ? "" : id_producto;
        
        String cantidad = request.getParameter("cantidad"); cantidad = cantidad == null ? "" : cantidad;
        String precio_u = request.getParameter("precio_u"); precio_u = precio_u == null ? "" : precio_u;
        String descuento = request.getParameter("descuento"); descuento = descuento == null ? "" : descuento;
        
        String opcion = request.getParameter("opcion");opcion = opcion == null ? "Enviar" : opcion;

        String mensaje="";
        
        String espacio="  ";
        
        String buscar = request.getParameter("buscar");buscar = buscar==null?"": buscar;
        String buscar1 = request.getParameter("buscar1");buscar1 = buscar1==null?"": buscar1;
        if(opcion.equals("Enviar")){
            
            
            
        if(!id_producto.equals("")){
            
            VentaDetalle ventadetalle=new VentaDetalle();
            VentaDetalleDao pd=new VentaDetalleDaoImpl();
            
            ventadetalle.setId_venta(id_venta);
            ventadetalle.setId_producto(id_producto);
            ventadetalle.setCantidad(cantidad);
            ventadetalle.setPrecio_u(precio_u);
            ventadetalle.setDescuento(descuento);

            if(opcion.equals("Enviar")){
                if(pd.agregarVentaDetalle(ventadetalle))
                {
                    //opcion="run";
                    mensaje = "Se añadió correctamente";

 
                }else{
                    mensaje="No se pudo agregar";
                }
            }
        }
    }
    if(opcion.equals("Obtener")){
        if(!id_venta.equals("")){
                
                VentaDao ven=new VentaDaoImpl();

                for(Venta venta :ven.ObtenerVenta(id_venta)){
                    id_venta=venta.getIdVenta();id_venta=id_venta==null?"": id_venta;
                //nombre=persona.getNombre();nombre=nombre==null?"":nombre;
                
                //out.println("codigo:"+codigo);
                
                opcion="Enviar";
            }
        }
            
    
    }  
    VentaDao as = new VentaDaoImpl();
        
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
      
        <% if(opcion.equals("Enviar") ){%>
        <div class="row">
            <div class="container">

</div>
            <div class="form0">
            <div class="col-md-2">     
            </div>
            <div class="col-md-8 well">
                <div class="titleform1">
                   
                <h2>Formulario de Registro de Ventas</h2>
                
                <h6>Campos Obligatorios (**)</h6>
                
                </div>
                
                <br>
                <div class="form2">
                    
                    
                    <form class="form-horizontal" action="agregar_venta_detalle.jsp">
                    
                            
                    <input type="text" class="form-control" placeholder="id_venta" name="id_venta" value="<%=id_venta%>">
                    <div class="form-group">
                        <label class="control-label col-xs-3" >Selecione Producto</label>
                        <div class="col-xs-9">
                            <select class="form-control" name="id_producto" type="text" <%if(id_producto.equals("")){%> selected<%}%>><option type="text"></option>                 
                            <%
                                
                                ProductoDao pdao = new ProductoDaoImpl();
                                for(Producto producto: pdao.ListarProducto()){
                                    
                            %>
                            <option value="<%=producto.getIdProducto()%>" <%if(id_producto.equals(producto.getIdProducto())){%> selected<%}%>> <%=producto.getMarcamodelo()%></option>   
                             <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Cantidad:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="Cantidad" name="cantidad" value="<%=cantidad%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" >Precio Unitario:</label>
                        <div class="col-xs-8">
                            <input type="text" class="form-control" placeholder="Precio Unitario" name="precio_u" value="<%=precio_u%>">
                        </div> 
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" >Descuento</label>
                        <div class="col-xs-8">
                            <input type="text" class="form-control" placeholder="Descuento" name="descuento" value="<%=descuento%>">
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