<%-- 
    Document   : buscar_prod_venta
    Created on : 29/06/2015, 09:36:48 AM
    Author     : Toshiba
--%>
<%@page import="A.NET.ENTIDAD.Producto"%>
<%@page import="A.NET.DAO.IMPL.ProductoDaoImpl"%>
<%@page import="A.NET.DAO.ProductoDao"%>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
        <link rel="stylesheet" href="css/comun.css"/>
        <link rel="stylesheet" href="css/stylee.css"/>
        <title>JSP Page</title>
        <%!
            String id_venta, buscar;
        %>
        <%
            id_venta = request.getParameter("id_venta");
            if (id_venta == null) {
                id_venta = "";
            }
        %>
        <%
            buscar = request.getParameter("buscar");
            if (buscar == null) {
                buscar = "";
            }
        %>
    </head>
    <body bgcolor="#f5f5f5">
        <form name="buscar" method="post" action="buscar_prod_venta.jsp" autocomplete="off">
            <input type="hidden" name="id_venta" value="<%=id_venta%>"/>
            <table  cellpadding="1" cellspacing="1">
                <tr>
                <td>
                    Buscar producto: <input type="text" name="buscar" maxlength="30" value="<%=buscar%>" size="20" class="text4"/>
                </td>
                <td>
                    <input type="submit" name="opcion" class="boton" value="Buscar"/>
                </td>
                </tr>
            </table>
        </form>
        <table align="center" cellpadding="1" cellspacing="1">
            <tr bgcolor="#0B610B">
            <td height="22"><font color="white">Stock</font></td>
            <td align="center" width="200"><font color="white">Nombre producto</font></td>
            <td align="center" width="80"><font color="white">Marca</font></td>
            <td align="center" width="70"><font color="white">Precio S/.</font></td>
        </tr>
        <%
            String espacio = "  ";
            ProductoDao dao = new ProductoDaoImpl();
            for (Producto pro : dao.BuscarProductoVenta(buscar)) {
        %>
        <tr bgcolor="White"  onmouseover="this.style.backgroundColor = 'yellow';"
            onmouseout="this.style.backgroundColor = 'White';">     
        <td align="center" height="22"><%=pro.getStock()%></td> 
        <td align="left">
            <a href="venta.jsp?opcion=Nuevo&id_producto=<%=pro.getIdProducto()%>&id_venta=<%=id_venta%>" target="_parent" title="Seleccionar este producto"><%=pro.getDescripcion()%></a>
        </td>
        <td align="left"><%=pro.getMarcamodelo()%></td>
        <td align="right"><%=pro.getPrecioV()%></td>
    </tr>
    <%}%>
</table>
<script language="JavaScript">
    var obj = document.buscar.buscar;
    obj.focus();
    if (obj.value != "") {
        obj.value += "";
    }
</script>
</body>
</html>
