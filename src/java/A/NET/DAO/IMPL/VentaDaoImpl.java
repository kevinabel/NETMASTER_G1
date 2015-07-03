/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO.IMPL;

import A.NET.CONEXION.Conexion;
import A.NET.DAO.VentaDao;
import A.NET.ENTIDAD.Comprobante;
import A.NET.ENTIDAD.Persona;
import A.NET.ENTIDAD.Usuario;
import A.NET.ENTIDAD.Venta;
import A.NET.UTIL.HibernateUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Toshiba
 */
public class VentaDaoImpl implements VentaDao {

    public Connection conecta() {
        return Conexion.conectar();
    }

    @Override
    public List<Usuario> listarUsuario() {
        List<Usuario> lista = new ArrayList();
        Usuario usuario = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select u.id_usuario,p.NOMBRE "
                + "from persona p, usuario u "
                + "where p.ID_PERSONA=u.ID_USUARIO";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                usuario = new Usuario();
                usuario.setIdUsuario(rs.getString("id_usuario"));
                usuario.setUsuario(rs.getString("NOMBRE"));
                lista.add(usuario);
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

    public String VentaMaxima() {
        String id_venta = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select max(id_venta) id_venta from venta";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            rs.next();
            id_venta = rs.getString("id_venta");

            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return id_venta;
    }

    @Override
    public List<Comprobante> listarComprobante() {
        List<Comprobante> lista = new ArrayList();
        Comprobante comprobante = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select id_comprobante,nombre from comprobante";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                comprobante = new Comprobante();
                comprobante.setIdComprobante(rs.getString("id_comprobante"));
                comprobante.setNombre(rs.getString("nombre"));
                lista.add(comprobante);
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

    public Venta DatosVenta(String id_venta) {
        Venta ve = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select "
                + " ve.id_venta, "
                + " (select nombre||' '||apellido from persona where id_persona=ve.id_usuario) id_usuario, "
                + " nvl((select nombre||' '||apellido from persona where id_persona=ve.id_cliente),'Varios') id_cliente, "
                + " (select nombre from comprobante where id_comprobante=ve.id_comprobante) id_comprobante, "
                + " ve.nro_c,"
                + " to_char(ve.fecha,'dd/mm/yyyy hh:mi pm') fecha, "
                + " ve.estado,"
                + " nvl((select to_char(sum(cantidad*(precio_u-descuento)),'9,999,999.99') from venta_detalle where"
                + " id_venta=ve.id_venta),'0.00') total "
                + " from venta ve"
                + " where id_venta='" + id_venta + "'";
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                ve = new Venta();
                ve.setIdComprobante(rs.getString("id_comprobante"));
                ve.setNroC(rs.getString("nro_c"));
                ve.setFecha(rs.getString("fecha"));
                ve.setIdCliente(rs.getString("id_cliente"));
                ve.setIdUsuario(rs.getString("id_usuario"));
                ve.setTotal(rs.getString("total"));
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
        return ve;
    }

    @Override
    public boolean agregarVenta(Venta venta) {
        boolean estado = false;
        Statement st = null;
        String query = "insert into venta "
                + "(id_usuario,"
                + "id_cliente,"
                + "id_comprobante,"
                + "nro_c,"
                + "fecha) "
                + "values ('" + venta.getIdUsuario()
                + "','" + venta.getIdCliente()
                + "','" + venta.getIdComprobante()
                + "','" + venta.getNroC()
                + "', sysdate)";

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

    public boolean registrarVenta(Venta venta) {
        boolean estado = false;
        Statement st = null;
        String query = "insert into venta "
                + "(id_usuario, id_comprobante, fecha) "
                + "values ('" + venta.getIdUsuario() + "','00000001', sysdate)";

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

    public boolean eliminarToda_venta(String id_venta) {
        boolean estado = false;
        Statement st = null;
        Statement st2 = null;
        String query = "delete from venta_detalle "
                + " where id_venta='" + id_venta + "'";
        String query2 = "delete from venta "
                + " where id_venta='" + id_venta + "'";

        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            st2 = conecta().createStatement();
            st2.executeUpdate(query2);
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
    public boolean UpdateVenta(Venta venta) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Persona> ObtenerPersona(String n_documento) {
        Statement st = null;
        ResultSet rs = null;
        String query = "select id_persona, nombre "
                + "from persona "
                + "where upper(n_documento)like upper('" + n_documento + "')";
        Persona pr = null;
        List<Persona> lista = new ArrayList<Persona>();
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pr = new Persona();
                pr.setIdPersona(rs.getString("id_persona"));
                pr.setNombre(rs.getString("nombre"));
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

    @Override
    public Persona buscarPersona(String dni) {
        Persona persona = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            Query query = session.createQuery("from Persona where nro_d='" + dni + "'");
            persona = (Persona) query.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return persona;
    }

    @Override
    public List<Venta> ObtenerVenta(String id_venta) {
        Statement st = null;
        ResultSet rs = null;
        String query = "select * from venta where id_venta='" + id_venta + "'";
        Venta pr = null;
        List<Venta> lista = new ArrayList<Venta>();
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pr = new Venta();
                pr.setIdVenta(rs.getString("id_venta"));
                pr.setIdUsuario(rs.getString("id_usuario"));
                pr.setIdCliente(rs.getString("id_cliente"));
                pr.setIdComprobante(rs.getString("id_comprobante"));
                pr.setNroC(rs.getString("nro_c"));
                pr.setFecha(rs.getString("fecha"));
                pr.setEstado(rs.getInt("estado"));
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

    @Override
    public List<Venta> BuscarVenta(String Buscar) {
        Statement st = null;
        ResultSet rs = null;
        String query = "select ve.id_venta,ve.nro_c,pe.nombre||' '||pe.apellido as persona "
                + "from venta ve, persona pe "
                + "where pe.id_persona=ve.id_cliente and "
                + "ve.nro_c like '%" + Buscar + "%'";

        Venta pr = null;
        List<Venta> lista = new ArrayList<Venta>();
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pr = new Venta();
                pr.setIdVenta(rs.getString("id_venta"));
                pr.setIdCliente(rs.getString("persona"));
                pr.setNroC(rs.getString("nro_c"));

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

}
