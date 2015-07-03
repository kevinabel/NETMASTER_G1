/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO.IMPL;

import A.NET.CONEXION.Conexion;
import A.NET.DAO.EmpresaDao;
import A.NET.ENTIDAD.Persona;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Toshiba
 */
public class EmpresaDaoImpl implements EmpresaDao{
    
    public Connection conecta() {
        return Conexion.conectar();
    }

    @Override
    public List<Persona> BuscarPersona() {
        List<Persona> lista = new ArrayList<Persona>();
        Statement st = null;
        ResultSet rs = null;
        Persona persona = null;
        String query = "select pe.id_persona,c.ID_EMPRESA,pe.nombre as EMPRESA,pe.TELEFONO as TELF_E,c.ID_CONTACTO,p.nombre||' '||p.apellido as CONTACTO,p.TELEFONO as TELF_C "+
                        "from persona pe,CONTACTO c,PERSONA p "+
                        "where pe.ID_PERSONA=c.ID_EMPRESA and p.ID_PERSONA=c.ID_CONTACTO";
                
        try {
            st = conecta().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) { 
                persona = new Persona();
                persona.setIdPersona(rs.getString("id_persona"));
                persona.setIdEmpresa(rs.getString("ID_EMPRESA"));
                persona.setNombre(rs.getString("EMPRESA"));
                persona.setTelefono(rs.getString("TELF_E"));
                persona.setIdContacto(rs.getString("ID_CONTACTO"));
                persona.setNombre1(rs.getString("CONTACTO"));
                persona.setTelefono1(rs.getString("TELF_C"));
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
    public boolean DeleteEmpresa(String id_empresa) {
        boolean estado = false;
        Statement st=null;
        String query="delete from contacto where id_empresa='"+id_empresa+"'";  
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
    public boolean DeleteContacto(String id_contacto) {
        boolean estado = false;
        Statement st=null;
        String query="delete from contacto where id_contacto='"+id_contacto+"'";  
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
    public boolean agregarPersona(Persona persona) {
        boolean estado = false;
        Statement st = null;
        String query = "insert into persona "
                + "(id_tipo_persona, "
                + " nombre, "
                + " ruc, "
                + " telefono,"
                + " direccion) "
                + " values ('"+persona.getIdtipoPersona()
                +"','" +persona.getNombre()
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
                +" id_tipo_persona='"+persona.getIdtipoPersona()
                +"',nombre='"+persona.getNombre()
                +"',ruc='"+persona.getRuc()
                +"',telefono='"+persona.getTelefono()
                +"',direccion='"+persona.getDireccion()
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
   
}
