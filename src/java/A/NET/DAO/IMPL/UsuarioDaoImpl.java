/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO.IMPL;

import A.NET.CONEXION.Conexion;
import A.NET.DAO.UsuarioDao;
import A.NET.ENTIDAD.Usuario;
import A.NET.UTIL.HibernateUtil;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Toshiba
 */
public class UsuarioDaoImpl implements UsuarioDao{
    
     public Connection conecta() {
        return Conexion.conectar();
    }

    @Override
    public Usuario validarusuario(String usuario, String password) {
        Usuario user=null;
        Session session=null;
        SessionFactory sf=null;
        
        try {
            sf=HibernateUtil.getSessionFactory();
            session=sf.openSession();
            Query query=session.createQuery("from Usuario where usuario='"+usuario+"' and password='"+password+"' and estado='1'");
            user=(Usuario)query.uniqueResult();
            session.close();
        } catch (Exception e) {
            System.out.println("Error!!!!!:"+e.getMessage());
            e.printStackTrace();
            session.close();
        }
        
        return user;
    }

    @Override
    public Usuario ObtenerUsuario(String usuario, String password) {
         Statement st = null;
        ResultSet rs= null;
        String query = "select * from usuario where usuario='"+usuario+"' and password='"+password+"' and estado='1'";
        Usuario u = null;
        
        try {
            st = conecta().createStatement();
            rs=st.executeQuery(query);          
            while (rs.next()) {
                u= new Usuario();
                u.setIdUsuario(rs.getString("id_usuario"));
                u.setUsuario(rs.getString("usuario"));
                u.setPassword(rs.getString("password"));             
                
            }
            conecta().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().close();
            } catch (Exception ex) {
            }
        }
    return u;
    }

    @Override
    public boolean agregar_usuario(Usuario usuario) {
        boolean estado = false;
        Statement st = null;
        String query = "insert into usuario values ('"+usuario.getIdUsuario()+"','"+usuario.getUsuario()+"','"+usuario.getPassword()+"',1)";

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
    
}
