/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO;

import A.NET.ENTIDAD.Comprobante;
import A.NET.ENTIDAD.Persona;
import A.NET.ENTIDAD.Usuario;
import A.NET.ENTIDAD.Venta;
import java.util.List;

/**
 *
 * @author Toshiba
 */
public interface VentaDao {
    public List<Usuario> listarUsuario();
    public List<Comprobante> listarComprobante();
    public boolean agregarVenta(Venta venta);
     public boolean registrarVenta(Venta venta);
    public boolean UpdateVenta(Venta venta);
    public List<Persona> ObtenerPersona(String id);
    public Persona buscarPersona(String dni);
    public List<Venta> ObtenerVenta(String id);
    public List<Venta> BuscarVenta(String Buscar);
    public Venta DatosVenta(String id_venta);
    public String VentaMaxima();
}
