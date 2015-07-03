/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO.IMPL;

import A.NET.CONEXION.Conexion;
import A.NET.DAO.VentaDetalleDao;
import A.NET.ENTIDAD.VentaDetalle;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SILVER
 */
public class VentaDetalleDaoImpl implements VentaDetalleDao {

    public Connection conecta() {
        return Conexion.conectar();
    }

    @Override
    public boolean agregarVentaDetalle(VentaDetalle ventadetalle) {
        boolean estado = false;
        Statement st = null;
        String query = "insert into n.venta_detalle "
                + "(id_venta,"
                + " id_producto,"
                + " cantidad,"
                + " precio_u,"
                + " descuento) "
                + "values ('" + ventadetalle.getId_venta()
                + "','" + ventadetalle.getId_producto()
                + "','" + ventadetalle.getCantidad()
                + "','" + ventadetalle.getPrecio_u()
                + "','" + ventadetalle.getDescuento() + "')";

        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();
                conecta().close();
                estado = false;
            } catch (Exception ex) {
            }
        }
        return estado;
    }

    public boolean RegistrarVentaDetalle(VentaDetalle vd) {
        boolean estado = false;
        Statement st = null;
        String query = "insert into VENTA_DETALLE "
                + "( ID_VENTA, "
                + "  ID_PRODUCTO, "
                + "  CANTIDAD, "
                + "  PRECIO_U, "
                + "  DESCUENTO) "
                + " values ('" + vd.getId_venta()+ "',"
                + " '" + vd.getId_producto() + "',"
                + " " + vd.getCantidad() + ","
                + " " + vd.getPrecio_u() + ","
                + " " + vd.getDescuento() + ")";

        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();
                conecta().close();
                estado = false;
            } catch (Exception ex) {
            }
        }
        return estado;
    }
    public boolean EliminarVentaDetalle(String id_detalle_venta) {
        boolean estado = false;
        Statement st = null;
        String query = "delete from VENTA_DETALLE "
                + " where id_detalle_venta='"+id_detalle_venta+"'";

        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();
                conecta().close();
                estado = false;
            } catch (Exception ex) {
            }
        }
        return estado;
    }
    public boolean ActualizarVentaDetalle(VentaDetalle vd) {
        boolean estado = false;
        Statement st = null;
        String query = "update venta_detalle"
                + " set cantidad="+vd.getCantidad()+", "
                + " precio_u="+vd.getPrecio_u()+", "
                + " descuento="+vd.getDescuento()+" "
                + " where id_detalle_venta='"+vd.getId_detalle_venta()+"'";

        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();
                conecta().close();
                estado = false;
            } catch (Exception ex) {
            }
        }
        return estado;
    }

    @Override
    public List<VentaDetalle> BuscarVentaDetalle(String Buscar) {
        Statement st = null;
        ResultSet rs = null;
        String query = "select vd.ID_DETALLE_VENTA,co.nombre as comprobante,pe.nombre||' '||pe.APELLIDO as cliente,ve.NRO_C,ve.FECHA,pr.DESCRIPCION||' '||pr.MARCA_MODELO as producto,vd.CANTIDAD,vd.PRECIO_U  "
                + "from venta ve, venta_detalle vd,producto pr, comprobante co, persona pe "
                + "where pe.ID_PERSONA=ve.ID_CLIENTE and co.ID_COMPROBANTE=ve.ID_COMPROBANTE and ve.ID_VENTA=vd.ID_VENTA and pr.ID_PRODUCTO=vd.ID_DETALLE_VENTA and "
                + "ve.NRO_C like '000001'";

        VentaDetalle pr = null;
        List<VentaDetalle> lista = new ArrayList<VentaDetalle>();
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pr = new VentaDetalle();
                pr.setId_producto(rs.getString("producto"));
                pr.setId_venta(rs.getString("nro_c"));
                pr.setId_detalle_venta(rs.getString("ID_DETALLE_VENTA"));
                pr.setPrecio_u(rs.getString("precio_u"));
                pr.setCantidad(rs.getString("cantidad"));
                lista.add(pr);
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
    public List<VentaDetalle> ListaProductosVenta(String id_venta) {
        List<VentaDetalle> lista = new ArrayList<VentaDetalle>();
        Statement st = null;
        ResultSet rs = null;
        String query = "select "
                + " det.id_detalle_venta,"
                + " (select descripcion from producto where id_producto=det.id_producto) descripcion, "
                + " det.cantidad,"
                + " to_char(det.precio_u,'999,999.99') precio_u, "
                + " to_char(det.descuento,'999,999.99') descuento, "
                + " to_char(det.cantidad*(det.precio_u-det.descuento),'9,999,999.99') total "
                + " from"
                + " venta_detalle det "
                + " where det.id_venta='"+id_venta+"' "
                + " order by det.id_detalle_venta";
        VentaDetalle pr = null;
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pr = new VentaDetalle();
                pr.setId_detalle_venta(rs.getString("id_detalle_venta"));
                pr.setId_producto(rs.getString("descripcion"));
                pr.setCantidad(rs.getString("cantidad"));
                pr.setPrecio_u(rs.getString("precio_u"));
                pr.setDescuento(rs.getString("descuento"));
                pr.setTotal(rs.getString("total"));
                lista.add(pr);
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
    public VentaDetalle DatosVentaDetalle(String id_detalle_venta) {
        Statement st = null;
        ResultSet rs = null;
        String query = "select "
                + " det.id_detalle_venta,"
                + " det.id_producto,"
                + " det.cantidad,"
                + " det.precio_u,"
                + " det.descuento "
                + " from"
                + " venta_detalle det "
                + " where det.id_detalle_venta='"+id_detalle_venta+"'";
        VentaDetalle pr = null;
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pr = new VentaDetalle();
                pr.setId_detalle_venta(rs.getString("id_detalle_venta"));
                pr.setId_producto(rs.getString("id_producto"));
                pr.setCantidad(rs.getString("cantidad"));
                pr.setPrecio_u(rs.getString("precio_u"));
                pr.setDescuento(rs.getString("descuento"));
                pr.setTotal(rs.getString("total"));
             }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return pr;
    }

}
