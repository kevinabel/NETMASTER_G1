<%-- 
    Document   : venta_resul
    Created on : 29/06/2015, 10:44:17 AM
    Author     : Toshiba
--%>


<%@page import="java.lang.String"%>
<%@page import="A.NET.DAO.IMPL.VentaDaoImpl"%>
<%@page import="A.NET.DAO.VentaDao"%>
<%@page import="A.NET.ENTIDAD.Venta"%>
<%@page import="A.NET.DAO.IMPL.VentaDetalleDaoImpl"%>
<%@page import="A.NET.DAO.VentaDetalleDao"%>
<%@page import="A.NET.ENTIDAD.VentaDetalle"%>
<%@include file="WEB-INF/jspf/top.jsp" %>
<%!
    String id_venta, opcion, resultado, id_producto, cantidad,
            precio_u, descuento, id_detalle_venta;

    ;
%>
<%
    id_venta = request.getParameter("id_venta");
    if (id_venta == null) {
        id_venta = "";
    }
    opcion = request.getParameter("opcion");
    if (opcion == null) {
        opcion = "";
    }
    resultado = request.getParameter("resultado");
    if (resultado == null) {
        resultado = "";
    }
    id_producto = request.getParameter("id_producto");
    if (id_producto == null) {
        id_producto = "";
    }
    cantidad = request.getParameter("cantidad");
    if (cantidad == null) {
        cantidad = "";
    }
    precio_u = request.getParameter("precio_u");
    if (precio_u == null) {
        precio_u = "";
    }
    descuento = request.getParameter("descuento");
    if (descuento == null) {
        descuento = "";
    }
    id_detalle_venta = request.getParameter("id_detalle_venta");
    if (id_detalle_venta == null) {
        id_detalle_venta = "";
    }
%>
<%
    if (opcion.equals("Registrar")) {
        if (id_venta.equals("")) {
            Venta venta = new Venta();
            VentaDao obj = new VentaDaoImpl();
            venta.setIdUsuario("00000007");
            if (obj.registrarVenta(venta)) {
                id_venta = obj.VentaMaxima();
                resultado = "<font size='3' color='green'>Venta registrada correctamente</font>";
                VentaDetalleDaoImpl objVend = new VentaDetalleDaoImpl();
                VentaDetalle vend = new VentaDetalle();
                vend.setId_venta(id_venta);
                vend.setId_producto(id_producto);
                vend.setCantidad(cantidad);
                vend.setPrecio_u(precio_u);
                vend.setDescuento(descuento);
                if (objVend.RegistrarVentaDetalle(vend)) {
                    resultado = "<font size='3' color='green'>Producto añadido correctamente</font>";
                } else {
                    resultado = "<font size='3' color='red'>No se pudo añadir el producto</font>";
                }
            } else {
                resultado = "<font size='3' color='red'>No se pudo registrar</font>";
            }
        } else {
            VentaDetalleDaoImpl objVend = new VentaDetalleDaoImpl();
            VentaDetalle vend = new VentaDetalle();
            vend.setId_venta(id_venta);
            vend.setId_producto(id_producto);
            vend.setCantidad(cantidad);
            vend.setPrecio_u(precio_u);
            vend.setDescuento(descuento);
            if (objVend.RegistrarVentaDetalle(vend)) {
                resultado = "<font size='3' color='green'>Producto añadido correctamente</font>";
            } else {
                resultado = "<font size='3' color='red'>No se pudo añadir el producto</font>";
            }
        }
    }
    if (opcion.equals("Eliminar_detalle")) {
         VentaDetalleDaoImpl objVend = new VentaDetalleDaoImpl();
            if (objVend.EliminarVentaDetalle(id_detalle_venta)) {
                resultado = "<font size='3' color='green'>Producto eliminado de la lista.</font>";
            } else {
                resultado = "<font size='3' color='red'>No se pudo eliminar el producto</font>";
            }
    }
    if (opcion.equals("Eliminar_todo")) {
         VentaDaoImpl objVen = new VentaDaoImpl();
            if (objVen.eliminarToda_venta(id_venta)) {
                resultado = "<font size='3' color='green'>La venta ha sido eliminada.</font>";
                id_venta="";
            } else {
                resultado = "<font size='3' color='red'>No se pudo eliminar la venta.</font>";
            }
    }
    if (opcion.equals("Actualizar")) {
         VentaDetalleDaoImpl objVend = new VentaDetalleDaoImpl();
         VentaDetalle vd=new VentaDetalle();
         vd.setCantidad(cantidad);
         vd.setDescuento(descuento);
         vd.setPrecio_u(precio_u);
         vd.setId_detalle_venta(id_detalle_venta);
            if (objVend.ActualizarVentaDetalle(vd)) {
                resultado = "<font size='3' color='green'>Datos actualizados correctamente.</font>";
            } else {
                resultado = "<font size='3' color='red'>No se pudo actualizar los datos.</font>";
            }
    }
%>
<META HTTP-EQUIV="Refresh" CONTENT="1;URL=venta.jsp?id_venta=<%=id_venta%>"/>
<br>
<br>
<table align="center">
    <tr>
    <td align="center">
        <div class="correcto"><b><font size="3"><%=resultado%></font></b></div>
    </td>
</tr>
</table>
