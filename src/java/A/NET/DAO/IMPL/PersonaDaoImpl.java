/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO.IMPL;

import A.NET.CONEXION.Conexion;
import A.NET.DAO.PersonaDao;
import A.NET.ENTIDAD.Persona;
import A.NET.ENTIDAD.TipoDocumento;
import A.NET.ENTIDAD.TipoPersona;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author SILVER
 */
public class PersonaDaoImpl implements PersonaDao{
    
    public Connection conecta() {
        return Conexion.conectar();
    }

    @Override
    public List<TipoPersona> listarTipoPersona() {
        List<TipoPersona> lista =new ArrayList();
        TipoPersona persona= null;
        Statement st = null;
        ResultSet rs= null;
        String query="select * from tipo_persona";
         try {
            st=conecta().createStatement();
            rs=st.executeQuery(query);
            while(rs.next()){
                persona = new TipoPersona();
                persona.setIdTipoPersona(rs.getString("id_tipo_persona"));
                persona.setNombre(rs.getString("nombre"));
                lista.add(persona);            
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
    public List<TipoDocumento> listarTipoDocumento() {
        List<TipoDocumento> lista =new ArrayList();
        TipoDocumento documento= null;
        Statement st = null;
        ResultSet rs= null;
        String query="select * from tipo_documento";
         try {
            st=conecta().createStatement();
            rs=st.executeQuery(query);
            while(rs.next()){
                documento = new TipoDocumento();
                documento.setIdTipoDocumento(rs.getString("id_tipo_documento"));
                documento.setNombre(rs.getString("nombre"));
                lista.add(documento);            
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
    public boolean agregarPersona(Persona persona) {
        boolean estado = false;
        Statement st = null;
        String query = "insert into persona "
                + "(id_tipo_persona, "
                + " nombre, "
                + " apellido, "
                + " id_tipo_documento,"
                + " n_documento, "
                + " ruc, "
                + " telefono,"
                + " direccion) "
                + " values ('"+persona.getIdtipoPersona()
                +"','" +persona.getNombre()
                +"','" +persona.getApellido()
                +"','" +persona.getIdtipoDocumento()
                +"','" +persona.getNDocumento()
                +"','" +persona.getRuc()
                +"','" +persona.getTelefono()
                +"','" +persona.getDireccion()+"')";

        try {
            st = conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            estado=true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();
                conecta().close();
                estado=false;
            } catch (Exception ex) {
            }
        }
        return estado;
    }

    @Override
    public boolean UpdatePersona(Persona persona) {
        boolean estado = false;
        Statement st = null;
        String query = "update persona set "
                +"id_tipo_persona='"+persona.getIdtipoPersona()
                +"', nombre='"+persona.getNombre()
                +"', apellido='"+persona.getApellido()
                +"', id_tipo_documento='"+persona.getIdtipoDocumento()
                +"', n_documento='"+persona.getNDocumento()
                +"', ruc='"+persona.getRuc()
                +"', telefono='"+persona.getTelefono()
                +"', direccion='"+persona.getDireccion()
                +"' where id_persona='"+persona.getIdPersona()+"'";
       
        try {
            st = conecta().createStatement();
            st.executeQuery(query);
            conecta().commit();
            conecta().close();
            estado=true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                conecta().rollback();
                conecta().close();
                estado=false;
            } catch (Exception ex) {
            }
        }
        
        return estado;
    }

    @Override
    public boolean DeletePersona(String id_persona) {
        boolean estado = false;
        Statement st=null;
        String query="delete from persona where id_persona='"+id_persona+"'";  
        try {
            st= conecta().createStatement();
            st.executeUpdate(query);
            conecta().commit();
            conecta().close();
            estado=true;
            
        } catch (Exception e) {
            e.printStackTrace();
            estado=false;
       try {
                conecta().rollback();
                conecta().close();                  
            } catch (Exception ex) {
            }
        }
        
        return estado;
    }

    @Override
    public List<Persona> ObtenerPersona(String id_persona) {
        Statement st = null;
        ResultSet rs= null;
        String query = "select * from persona where id_persona='"+id_persona+"'";
        Persona pr = null;
        List<Persona> lista = new ArrayList<Persona>();
        try {
            st = conecta().createStatement();
            rs=st.executeQuery(query);          
            while (rs.next()) {
                pr= new Persona();
                pr.setIdPersona(rs.getString("id_persona"));
                pr.setIdtipoPersona(rs.getString("id_tipo_persona"));
                pr.setNombre(rs.getString("nombre"));
                pr.setApellido(rs.getString("apellido"));
                pr.setIdtipoDocumento(rs.getString("id_tipo_documento"));
                pr.setNDocumento(rs.getString("n_documento"));
                pr.setRuc(rs.getString("ruc"));
                pr.setTelefono(rs.getString("telefono"));
                pr.setDireccion(rs.getString("direccion"));
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
   
    public List<Persona> BuscarPersona(String Buscar) {
        
        List<Persona> lista = new ArrayList<Persona>();
        Statement st = null;
        ResultSet rs = null;
        Persona persona = null;
        String query = "select p.id_persona,tp.nombre as tipo_persona,p.nombre||' '||p.apellido as nombre_apellido,td.nombre as tipo_documento ,p.n_documento,nvl(p.ruc,'-') ruc,nvl(p.telefono,'-') telefono " +
                        "from persona p,tipo_persona tp, tipo_documento td " +
                        "where tp.ID_TIPO_PERSONA=p.ID_TIPO_PERSONA and td.ID_TIPO_DOCUMENTO=p.ID_TIPO_DOCUMENTO " +
                        "and p.N_DOCUMENTO like'%"+Buscar+"%'";
                
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) { 
                persona = new Persona();
                persona.setIdPersona(rs.getString("id_persona"));
                persona.setIdtipoPersona(rs.getString("tipo_persona"));
                persona.setNombre(rs.getString("nombre_apellido"));
                persona.setIdtipoDocumento(rs.getString("tipo_documento"));
                persona.setNDocumento(rs.getString("n_documento"));
                persona.setRuc(rs.getString("ruc"));
                persona.setTelefono(rs.getString("telefono"));
                lista.add(persona);      
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
