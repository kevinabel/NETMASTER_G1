<%@page import="A.NET.ENTIDAD.Color"%>
<%@page import="A.NET.ENTIDAD.Categoria"%>
<%@page import="A.NET.ENTIDAD.Producto"%>
<%@page import="A.NET.DAO.IMPL.ProductoDaoImpl"%>
<%@page import="A.NET.DAO.ProductoDao"%>
<%@include file="WEB-INF/jspf/top.jsp" %>
<div class="container">
    
    <%
        String id_producto = request.getParameter("id_producto");id_producto = id_producto == null ? "" : id_producto;
        String id_categoria = request.getParameter("id_categoria"); id_categoria = id_categoria == null ? "" : id_categoria;
        String marca_modelo = request.getParameter("marca_modelo");marca_modelo = marca_modelo == null ? "" : marca_modelo;
        String id_color = request.getParameter("id_color");id_color = id_color == null ? "" : id_color;
        String descripcion = request.getParameter("descripcion");descripcion = descripcion == null ? "" : descripcion;
        String precio_v = request.getParameter("precio_v");precio_v = precio_v == null ? "" : precio_v;
        String codigo = request.getParameter("codigo");codigo = codigo == null ? "" : codigo;
        String stock = request.getParameter("stock");stock = stock == null ? "" : stock;
        String stock_min = request.getParameter("stock_min");stock_min = stock_min == null ? "" : stock_min;

        String opcion = request.getParameter("opcion");opcion = opcion == null ? "Enviar" : opcion;

        String mensaje="";
        if(opcion.equals("Enviar")||opcion.equals("Actualizando")){
        if(!id_categoria.equals("") && !id_color.equals("") && !descripcion.equals("")
        && !precio_v.equals("") && !stock.equals("") && !stock_min.equals("")){
            
            //out.println("opcion="+opcion);
            Producto producto=new Producto();
            ProductoDao pd=new ProductoDaoImpl();
            
            producto.setIdcategoria(id_categoria);
            producto.setIdcolor(id_color);
            producto.setDescripcion(descripcion);
            producto.setPrecioV(precio_v);
            producto.setCodigo(codigo);
            producto.setStock(stock);
            producto.setStockMin(stock_min);
            producto.setMarcamodelo(marca_modelo);
            
            
            if(opcion.equals("Enviar")){
                if(pd.agregarProducto(producto))
                {
                    //opcion="run";
                    mensaje = "Se añadió correctamente el producto... <a href='agregar_producto.jsp'>[Seguir Añadiendo] </a><a href='reporte_producto.jsp'> [Terminar] </a>";


                }else{
                    mensaje="No se pudo agregar";
                }
            }
            if(opcion.equals("Actualizando")){
                producto.setIdProducto(id_producto);

                if(pd.UpdateProducto(producto)){
                    mensaje = "Se actualizó corerctamente...<a href='reporte_producto.jsp'>[Reportes] </a>";
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
            if(!id_producto.equals("")){
                
                ProductoDao pd=new ProductoDaoImpl();

                for(Producto producto :pd.ObtenerProducto(id_producto)){
                    
                id_categoria=producto.getIdcategoria();id_categoria=id_categoria==null?"":id_categoria;
                marca_modelo=producto.getMarcamodelo();marca_modelo=marca_modelo==null?"":marca_modelo;
                id_color=producto.getIdcolor();id_color=id_color==null?"":id_color;
                descripcion=producto.getDescripcion();descripcion=descripcion==null?"":descripcion;
                precio_v=producto.getPrecioV();precio_v=precio_v==null?"":precio_v;
                codigo=producto.getCodigo();codigo = codigo==null?"":codigo;
                stock=producto.getStock();stock=stock==null?"":stock;
                stock_min=producto.getStockMin();stock_min=stock_min==null?"":stock_min;
                
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
                <h2>Formulario de Registro de Productos</h2>
                <h6>Campos Obligatorios (**)</h6>
                </div>
                <br>
                <div class="form2">
                    <form class="form-horizontal" action="agregar_producto.jsp">
                    <input type="hidden" name="opcion"  value="<%=opcion%>" size="10">
                    <input type="hidden" name="id_producto"  value="<%=id_producto%>" size="10">
                    <div class="form-group">
                        <label class="control-label col-xs-3" >Categor&iacute;a:</label>
                        <div class="col-xs-9">
                            <select class="form-control" name="id_categoria" selected="selected" <%if(id_categoria.equals("")){%> selected<%}%>><option>Selecciona</option>                 
                            <%
                                ProductoDao categoriaDao = new ProductoDaoImpl();
                                
                                for(Categoria ca: categoriaDao.listarCategoria()){
                                    
                            %>
                             <option value="<%=ca.getIdCategoria()%>" <%if(id_categoria.equals(ca.getIdCategoria())){%> selected<%}%>> <%=ca.getNombre()%></option>   
                             <%}%>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Marca y Modelo:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="Marca y Modelo" name="marca_modelo" value="<%=marca_modelo%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3" >Color:</label>
                        <div class="col-xs-9">
                            <select class="form-control" name="id_color" selected="selected" <%if(id_color.equals("")){%> selected<%}%>><option>Selecciona</option>                 
                            <%
                                ProductoDao color = new ProductoDaoImpl();
                                
                                for(Color ca: color.listarColor()){
                                    
                            %>
                             <option value="<%=ca.getIdColor()%>" <%if(id_color.equals(ca.getIdColor())){%> selected<%}%>> <%=ca.getColor()%></option>   
                             <%}%>
                            </select>
                        </div>
                    </div>        
                    <div class="form-group">
                        <label class="control-label col-xs-3" >Descripcion:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="Descripcion del producto" name="descripcion" value="<%=descripcion%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Precio Venta:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="precio de venta del producto" name="precio_v" value="<%=precio_v%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">C&oacute;digo del producto:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="código del producto" name="codigo" value="<%=codigo%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Stock:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="Stock del producto" name="stock" value="<%=stock%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-3">Stock minimo:</label>
                        <div class="col-xs-9">
                            <input type="text" class="form-control" placeholder="Stock minimo del Producto" name="stock_min" value="<%=stock_min%>">
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