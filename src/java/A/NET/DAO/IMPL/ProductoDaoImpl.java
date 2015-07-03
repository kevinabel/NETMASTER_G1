/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO.IMPL;

import A.NET.CONEXION.Conexion;
import A.NET.DAO.ProductoDao;
import A.NET.ENTIDAD.Categoria;
import A.NET.ENTIDAD.Color;
import A.NET.ENTIDAD.Producto;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SILVER
 */
public class ProductoDaoImpl implements ProductoDao {

    public Connection conecta() {
        return Conexion.conectar();
    }

    @Override
    public List<Color> listarColor() {
        List<Color> lista = new ArrayList();
        Color color = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select * from color";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                color = new Color();
                color.setIdColor(rs.getString("id_color"));
                color.setColor(rs.getString("color"));
                lista.add(color);
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
    public List<Categoria> listarCategoria() {
        List<Categoria> lista = new ArrayList();
        Categoria categoria = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select * from categoria";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                categoria = new Categoria();
                categoria.setIdCategoria(rs.getString("id_categoria"));
                categoria.setNombre(rs.getString("nombre"));
                lista.add(categoria);
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
    public boolean DeleteProducto(String id_producto) {
        boolean estado = false;
        Statement st = null;
        String query = "delete from producto where id_producto='" + id_producto + "'";
        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            estado = true;

        } catch (Exception e) {
            e.printStackTrace();
            estado = false;
            try {
                conecta().rollback();
                conecta().close();
            } catch (Exception ex) {
            }
        }

        return estado;
    }

    @Override
    public boolean agregarProducto(Producto producto) {
        boolean estado = false;
        Statement st = null;
        String query = "insert into n.producto "
                + "(id_categoria, "
                + " id_color, "
                + " descripcion,"
                + " precio_v, "
                + " codigo, "
                + " stock,"
                + " stock_min,"
                + " marca_modelo) "
                + " values ('" + producto.getIdcategoria()
                + "','" + producto.getIdcolor()
                + "','" + producto.getDescripcion()
                + "','" + producto.getPrecioV()
                + "','" + producto.getCodigo()
                + "','" + producto.getStock()
                + "','" + producto.getStockMin()
                + "','" + producto.getMarcamodelo() + "')";

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
    public boolean UpdateProducto(Producto producto) {
        boolean estado = false;
        Statement st = null;
        String query = "update producto set "
                + " id_categoria='" + producto.getIdcategoria()
                + "',id_color='" + producto.getIdcolor()
                + "',descripcion='" + producto.getDescripcion()
                + "',precio_v='" + producto.getPrecioV()
                + "',codigo='" + producto.getCodigo()
                + "',stock='" + producto.getStock()
                + "',stock_min='" + producto.getStockMin()
                + "',marca_modelo='" + producto.getMarcamodelo()
                + "' where id_producto='" + producto.getIdProducto() + "'";

        try {
            st = conecta().createStatement();
            st.executeQuery(query);
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
    public List<Producto> ObtenerProducto(String id_producto) {
        Statement st = null;
        ResultSet rs = null;
        String query = "select * from producto where id_producto='" + id_producto + "'";
        Producto pr = null;
        List<Producto> lista = new ArrayList<Producto>();
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pr = new Producto();
                pr.setIdProducto(rs.getString("id_producto"));
                pr.setIdcategoria(rs.getString("id_categoria"));
                pr.setIdcolor(rs.getString("id_color"));
                pr.setDescripcion(rs.getString("descripcion"));
                pr.setPrecioV(rs.getString("precio_v"));
                pr.setCodigo(rs.getString("codigo"));
                pr.setStock(rs.getString("stock"));
                pr.setStockMin(rs.getString("stock_min"));
                pr.setMarcamodelo(rs.getString("marca_modelo"));
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

    public List<Producto> BuscarProducto(String Buscar) {

        List<Producto> lista = new ArrayList<Producto>();
        Statement st = null;
        ResultSet rs = null;
        Producto producto = null;
        String query = "select pr.id_producto,ca.NOMBRE as categoria,pr.marca_modelo,pr.DESCRIPCION as descripcion,co.COLOR as color,nvl(pr.CODIGO,'-_-')codigo,pr.STOCK "
                + "from producto pr,categoria ca,color co "
                + "where ca.ID_CATEGORIA=pr.ID_CATEGORIA and co.ID_COLOR=pr.ID_COLOR and "
                + "pr.marca_modelo like '%" + Buscar + "%'";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                producto = new Producto();
                producto.setIdProducto(rs.getString("id_producto"));
                producto.setIdcategoria(rs.getString("categoria"));
                producto.setMarcamodelo(rs.getString("marca_modelo"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setIdcolor(rs.getString("color"));
                producto.setCodigo(rs.getString("codigo"));
                producto.setStock(rs.getString("stock"));
                lista.add(producto);
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

    public List<Producto> BuscarProductoVenta(String Buscar) {

        List<Producto> lista = new ArrayList<Producto>();
        Statement st = null;
        ResultSet rs = null;
        Producto producto = null;
        String query = "select "
                + " pr.id_producto,"
                + " ca.NOMBRE as categoria, "
                + " nvl(pr.marca_modelo,'-') marca_modelo,  "
                + " pr.DESCRIPCION as descripcion,"
                + " co.COLOR as color, "
                + " pr.CODIGO, "
                + " pr.STOCK, "
                + " to_char(pr.PRECIO_V,'999,999.99') PRECIO_V "
                + " from "
                + " producto pr, "
                + " categoria ca, "
                + " color co "
                + " where ca.ID_CATEGORIA=pr.ID_CATEGORIA and "
                + " co.ID_COLOR=pr.ID_COLOR and "
                + " UPPER(pr.DESCRIPCION) like UPPER('%" + Buscar + "%') and "
                + " ROWNUM <8 "
                + " order by pr.descripcion";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                producto = new Producto();
                producto.setIdProducto(rs.getString("id_producto"));
                producto.setIdcategoria(rs.getString("categoria"));
                producto.setMarcamodelo(rs.getString("marca_modelo"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setIdcolor(rs.getString("color"));
                producto.setStock(rs.getString("stock"));
                producto.setPrecioV(rs.getString("PRECIO_V"));
                lista.add(producto);
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
    public List<Producto> ListarProducto() {
        List<Producto> lista = new ArrayList();
        Producto producto = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select pr.id_producto, pr.marca_modelo||'-'||pr.descripcion||'-'||co.color as producto "
                + "from PRODUCTO pr,color co "
                + "where co.id_color=pr.id_color";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                producto = new Producto();
                producto.setIdProducto(rs.getString("id_producto"));
                producto.setMarcamodelo(rs.getString("producto"));
                lista.add(producto);
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

    public Producto DatosProducto(String id_producto) {
        Producto producto = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select "
                + " pr.id_producto, "
                + " nvl(pr.marca_modelo,'-') marca_modelo, "
                + " pr.descripcion,"
                + " pr.stock,"
                + " pr.precio_v "
                + "from PRODUCTO pr  "
                + "where pr.id_producto='" + id_producto + "'";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                producto = new Producto();
                producto.setIdProducto(rs.getString("id_producto"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setMarcamodelo(rs.getString("marca_modelo"));
                producto.setStock(rs.getString("stock"));
                producto.setPrecioV(rs.getString("precio_v"));
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return producto;
    }

    @Override
    public List<Producto> BuscarProductoventaCliente(String Buscar) {
        List<Producto> lista = new ArrayList<Producto>();
        Statement st = null;
        ResultSet rs = null;
        Producto producto = null;
        String query = "select dv.id_detalle_venta,pe.NOMBRE||' '||pe.APELLIDO as nombre,pr.DESCRIPCION||' '||pr.MARCA_MODELO producto,dv.PRECIO_U,dv.CANTIDAD, " +
                        "dv.precio_u*dv.cantidad as total " +
                        "from venta_detalle dv,producto pr,venta ve,persona pe " +
                        "where pe.ID_PERSONA=ve.ID_CLIENTE and ve.ID_VENTA=dv.ID_VENTA and pr.ID_PRODUCTO=dv.ID_PRODUCTO  " +
                        "and pe.N_DOCUMENTO like'"+Buscar+"'";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                producto = new Producto();
                producto.setIdProducto(rs.getString("id_producto"));
                producto.setIdcategoria(rs.getString("categoria"));
                producto.setMarcamodelo(rs.getString("marca_modelo"));
                producto.setDescripcion(rs.getString("descripcion"));
                producto.setIdcolor(rs.getString("color"));
                producto.setCodigo(rs.getString("codigo"));
                producto.setStock(rs.getString("stock"));
                lista.add(producto);
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
