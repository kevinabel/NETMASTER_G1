<%-- 
    Document   : venta_imp
    Created on : 29/06/2015, 12:58:05 PM
    Author     : Toshiba
--%>

<%@page import="A.NET.DAO.IMPL.VentaDaoImpl"%>
<%@page import="A.NET.DAO.VentaDao"%>
<%@page import="A.NET.ENTIDAD.Venta"%>
<%@page import="A.NET.DAO.IMPL.VentaDetalleDaoImpl"%>
<%@page import="A.NET.DAO.VentaDetalleDao"%>
<%@page import="A.NET.ENTIDAD.VentaDetalle"%>
<link rel="stylesheet" href="css/impresion.css"/>
<%!
    String id_venta, id_producto, opcion;
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
%>
<p>Datos de la venta</p>
<hr>
<%if (!id_venta.equals("")) {
        VentaDaoImpl objVen = new VentaDaoImpl();
        Venta ven = objVen.DatosVenta(id_venta);
%>
<table cellpadding="2" cellspacing="1" align="center">
    <tr>
    <td>&bull; Cliente: <b><%=ven.getIdCliente()%></b></td>
    <td>&bull; Fecha y hora: <b><%=ven.getFecha()%></b></td>
</tr>
<tr>
<td>&bull; Comprobante: <b><%=ven.getIdComprobante()%></b></td>
<td>&bull; Vendedor(a): <b><%=ven.getIdUsuario()%></b></td>
</tr>
</table>
<table cellpadding="2" cellspacing="1" align="center">
    <tr bgcolor="black">
    <td height="22"><font color="white">Cant</font></td>
    <td align="center" width="200"><font color="white">Nombre producto</font></td>
    <td align="center" width="60"><font color="white">Precio</font></td>
    <td align="center" width="50"><font color="white">Desc</font></td>
    <td align="center" width="60"><font color="white">Total</font></td>
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
</tr>
<%}%>
<tr bgcolor="White"  onmouseover="this.style.backgroundColor = 'yellow';"
    onmouseout="this.style.backgroundColor = 'White';">     
<td align="right" height="22" colspan="4">Total S/:</td> 
<td align="right"><b><%=ven.getTotal()%></b></td>
<td align="right" height="22" colspan="2"></td>
</table>
<%}%>
<br>