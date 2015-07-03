/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO;

import A.NET.ENTIDAD.Persona;
import java.util.List;

/**
 *
 * @author Toshiba
 */
public interface ContactoDao {
    public boolean agregarPersona(Persona persona);
    public boolean UpdatePersona(Persona persona);
    public List<Persona> ObtenerPersona(String id);
    
}
