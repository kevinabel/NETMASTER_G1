/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO.IMPL;

import A.NET.CONEXION.Conexion;
import A.NET.DAO.VentaClienteDao;
import A.NET.ENTIDAD.Producto;
import A.NET.ENTIDAD.VentaDetalle;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SILVER-PC
 */
public class VentaClienteDaoImpl implements VentaClienteDao{
    
    public Connection conecta() {
        return Conexion.conectar();
    }

    @Override
    public List<VentaDetalle> BuscarProductoventaCliente(String Buscar) {
        List<VentaDetalle> lista = new ArrayList<VentaDetalle>();
        Statement st = null;
        ResultSet rs = null;
        VentaDetalle ventadetalle = null;
        String query = "select distinct pe.NOMBRE||' '||pe.APELLIDO as nombre,dv.id_detalle_venta,pr.DESCRIPCION||' '||pr.MARCA_MODELO producto,dv.PRECIO_U,dv.CANTIDAD, " +
                        "dv.precio_u*dv.cantidad as total " +
                        "from venta_detalle dv,producto pr,venta ve,persona pe " +
                        "where pe.ID_PERSONA=ve.ID_CLIENTE and ve.ID_VENTA=dv.ID_VENTA and pr.ID_PRODUCTO=dv.ID_PRODUCTO  " +
                        "and pe.N_DOCUMENTO like'"+Buscar+"'";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                ventadetalle = new VentaDetalle();
                ventadetalle.setId_detalle_venta(rs.getString("id_detalle_venta"));
                ventadetalle.setId_venta(rs.getString("nombre"));
                ventadetalle.setId_producto(rs.getString("producto"));
                ventadetalle.setPrecio_u(rs.getString("precio_u"));
                ventadetalle.setCantidad(rs.getString("cantidad"));
                lista.add(ventadetalle);
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }

        return lista;
    }

    @Override
    public List<VentaDetalle> BuscarMontoCompraCliente(String Buscar) {
        List<VentaDetalle> lista = new ArrayList<VentaDetalle>();
        Statement st = null;
        ResultSet rs = null;
        VentaDetalle ventadetalle = null;
        String query = "select pe.NOMBRE,sum(dv.precio_u*dv.CANTIDAD) as total " +
                        "from VENTA_DETALLE dv, persona pe, venta ve " +
                        "where pe.ID_PERSONA=ve.ID_CLIENTE and ve.ID_VENTA=dv.ID_VENTA " +
                        "and pe.N_DOCUMENTO like '"+Buscar+"' GROUP by pe.NOMBRE";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                ventadetalle = new VentaDetalle();
                ventadetalle.setPrecio_u(rs.getString("total"));
                lista.add(ventadetalle);
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }

        return lista;
    }
    
    
    
}
