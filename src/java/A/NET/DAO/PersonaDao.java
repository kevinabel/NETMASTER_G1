/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO;

import A.NET.ENTIDAD.Persona;
import A.NET.ENTIDAD.TipoDocumento;
import A.NET.ENTIDAD.TipoPersona;
import java.util.List;

/**
 *
 * @author SILVER
 */
public interface PersonaDao {
    public List<TipoPersona> listarTipoPersona();
    public List<TipoDocumento> listarTipoDocumento();
    public boolean agregarPersona(Persona persona);
    public boolean UpdatePersona(Persona persona);
    public boolean DeletePersona(String id);
    public List<Persona> ObtenerPersona(String id);
    public List<Persona> BuscarPersona(String Buscar);
}
