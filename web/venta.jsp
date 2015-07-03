<%-- 
    Document   : venta
    Created on : 29/06/2015, 09:23:07 AM
    Author     : Toshiba
--%>

<%@page import="java.lang.String"%>
<%@page import="A.NET.ENTIDAD.Producto"%>
<%@page import="A.NET.DAO.IMPL.ProductoDaoImpl"%>
<%@page import="A.NET.DAO.ProductoDao"%>
<%@page import="A.NET.DAO.IMPL.VentaDaoImpl"%>
<%@page import="A.NET.DAO.VentaDao"%>
<%@page import="A.NET.ENTIDAD.Venta"%>
<%@page import="A.NET.DAO.IMPL.VentaDetalleDaoImpl"%>
<%@page import="A.NET.DAO.VentaDetalleDao"%>
<%@page import="A.NET.ENTIDAD.VentaDetalle"%>
<%@include file="WEB-INF/jspf/top.jsp" %>


<%!
    String id_venta, id_producto, opcion, id_detalle_venta;
%>
<%
    id_venta = request.getParameter("id_venta");
    if (id_venta == null) {
        id_venta = "";
    }
    id_producto = request.getParameter("id_producto");
    if (id_producto == null) {
        id_producto = "";
    }
    opcion = request.getParameter("opcion");
    if (opcion == null) {
        opcion = "";
    }
    id_detalle_venta = request.getParameter("id_detalle_venta");
    if (id_detalle_venta == null) {
        id_detalle_venta = "";
    }
%>
<div class="container">
    <div class="row">
        <div class="container">
            <div class="col-md-6 well">
                <p>Datos de la venta</p>
                <%if (!id_venta.equals("")) {
                        VentaDaoImpl objVen = new VentaDaoImpl();
                        Venta ven = objVen.DatosVenta(id_venta);
                %>
                <table cellpadding="2" cellspacing="1">
                    <tr>
                    <td>&bull; Cliente: <b><%=ven.getIdCliente()%></b></td>
                    <td>&bull; Fecha y hora: <b><%=ven.getFecha()%></b></td>
                    </tr>
                    <tr>
                    <td>&bull; Comprobante: <b><%=ven.getIdComprobante()%></b></td>
                    <td>&bull; Vendedor(a): <b><%=ven.getIdUsuario()%></b></td>
                    </tr>
                    <td colspan="3" align="right" height="45">
                        <a href="venta.jsp?id_venta=<%=id_venta%>">Editar</a>
                        <a href="venta_resul.jsp?id_venta=<%=id_venta%>&opcion=Eliminar_todo">Eliminar</a>
                    </td>
                </table>
                <table cellpadding="2" cellspacing="1">
                    <tr bgcolor="#0B610B">
                    <td height="22"><font color="white">Cant</font></td>
                    <td align="center" width="200"><font color="white">Nombre producto</font></td>
                    <td align="center" width="60"><font color="white">Precio</font></td>
                    <td align="center" width="50"><font color="white">Desc</font></td>
                    <td align="center" width="60"><font color="white">Total</font></td>
                    <td align="center" width="90" colspan="2"><font color="white">Opciones</font></td>
                    </tr>
                    <%
                        VentaDetalleDaoImpl Objvend = new VentaDetalleDaoImpl();
                        for (VentaDetalle vend : Objvend.ListaProductosVenta(id_venta)) {
                    %>
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor = 'yellow';"
                        onmouseout="this.style.backgroundColor = 'White';">     
                    <td align="center" height="22"><%=vend.getCantidad()%></td> 
                    <td align="left"><%=vend.getId_producto()%></td>
                    <td align="right"><%=vend.getPrecio_u()%></td>
                    <td align="right"><%=vend.getDescuento()%></td>
                    <td align="right"><%=vend.getTotal()%></td>
                    <td align="center"><a href="venta.jsp?id_detalle_venta=<%=vend.getId_detalle_venta()%>&id_venta=<%=id_venta%>&opcion=Editar">Editar</a></td>
                    <td align="center"><a href="venta_resul.jsp?id_detalle_venta=<%=vend.getId_detalle_venta()%>&id_venta=<%=id_venta%>&opcion=Eliminar_detalle">Borrar</a></td>
                    </tr>
                    <%}%>
                    <tr bgcolor="White"  onmouseover="this.style.backgroundColor = 'yellow';"
                        onmouseout="this.style.backgroundColor = 'White';">     
                    <td align="right" height="22" colspan="4">Total S/:</td> 
                    <td align="right"><b><%=ven.getTotal()%></b></td>
                    <td align="right" height="22" colspan="2"></td>
                </table>
                <%}%>
                <%if (opcion.equals("Nuevo")) {
                        ProductoDaoImpl objProd = new ProductoDaoImpl();
                        Producto pro = objProd.DatosProducto(id_producto);
                %>
                <hr>
                <form name="form" method="post" action="venta_resul.jsp" autocomplete="off">
                    <input type="hidden" name="id_venta" value="<%=id_venta%>"/>
                    <input type="hidden" name="id_producto" value="<%=id_producto%>"/>
                    <table align="center">
                        <tr>
                        <td colspan="3">Producto: <b><%=pro.getDescripcion()%></b> <%=pro.getMarcamodelo()%> - Stock: <b><%=pro.getStock()%></b></td>
                        </tr>
                        <tr>
                        <td  height="34">Cantidad: <input type="text" class="form-control" name="cantidad" value="1" maxlength="8" size="4"/></td>
                        <td>Precio: <input type="text"  name="precio_u" class="form-control" value="<%=pro.getPrecioV()%>" maxlength="10" size="4"/></td>
                        <td>Desc: <input type="text" name="descuento" class="form-control" value="0.00" maxlength="10" size="4"/></td>
                        </tr>
                        <tr>
                        <td colspan="3" align="center" height="45">
                            <input type="submit" name="opcion" value="Registrar" class="btn btn-primary"/>
                            <a href="venta.jsp?id_venta=<%=id_venta%>" class="btn btn-default">Cancelar</a>
                        </td>
                        </tr>
                    </table>
                </form>
                <%}%>
                <%if (opcion.equals("Editar")) {
                        VentaDetalleDaoImpl ObjVend = new VentaDetalleDaoImpl();
                        VentaDetalle vend = ObjVend.DatosVentaDetalle(id_detalle_venta);
                        ProductoDaoImpl objProd = new ProductoDaoImpl();
                        Producto pro = objProd.DatosProducto(vend.getId_producto());
                %>
                <hr>
                <form name="form" method="post" action="venta_resul.jsp" autocomplete="off">
                    <input type="hidden" name="id_venta" value="<%=id_venta%>"/>
                    <input type="hidden" name="id_detalle_venta" value="<%=id_detalle_venta%>"/>
                    <table align="center">
                        <tr>
                        <td colspan="3">Producto: <b><%=pro.getDescripcion()%></b> <%=pro.getMarcamodelo()%> - Stock: <b><%=pro.getStock()%></b></td>
                        </tr>
                        <tr>
                        <td  height="34">Cantidad: <input type="text" class="form-control" name="cantidad" value="<%=vend.getCantidad()%>" maxlength="8" size="4"/></td>
                        <td>Precio: <input type="text"  name="precio_u" class="form-control" value="<%=vend.getPrecio_u()%>" maxlength="10" size="4"/></td>
                        <td>Desc: <input type="text" name="descuento" class="form-control" value="<%=vend.getDescuento()%>" maxlength="10" size="4"/></td>
                        </tr>
                        <tr>
                        <td colspan="3" align="center" height="45">
                            <input type="submit" name="opcion" value="Actualizar" class="btn btn-primary"/>
                            <a href="venta.jsp?id_venta=<%=id_venta%>" class="btn btn-default">Cancelar</a>
                        </td>
                        </tr>
                    </table>
                </form>
                <%}%>
                <%if (!opcion.equals("Nuevo") && !id_venta.equals("") && !opcion.equals("Editar")) {
                %>
                <br>
                <table align="center">
                    <tr>
                    <td>
                        <a href="#" class="btn btn-default" onclick="VistaPrevia('venta_imp.jsp?id_venta=<%=id_venta%>', '200', '150')">Vista previa</a>
                        <a href="reporte_venta_cliente.jsp" class="btn btn-primary">Terminar venta</a>
                    </td>
                    </tr>
                </table>

                <%}%>
            </div>

            <div class="col-md-6 well">
                <p>Búsqueda de productos</p>
                <iframe src="buscar_prod_venta.jsp?id_venta=<%=id_venta%>" width="99%" height="250"frameborder="0" marginwidth="0"
                        marginheight="0"></iframe>
            </div>
        </div>
    </div>
</div>
<script language="JavaScript">
    function VistaPrevia(url, ventana, width, heigh)
    {
        newwindow = window.open(url, ventana, 'directories=no, location=no, menubar=no, tittlebar=no, statusbar=no, scrollbars=no, resizable=no, height=400, width=450');
        if (window.focus) {
            newwindow.focus();
        }
    }
</script>
<%@include file="WEB-INF/jspf/bottom.jsp" %>
