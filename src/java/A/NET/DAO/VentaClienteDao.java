/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO;

import A.NET.ENTIDAD.VentaDetalle;
import java.util.List;

/**
 *
 * @author SILVER-PC
 */
public interface VentaClienteDao {
    public List<VentaDetalle> BuscarProductoventaCliente(String Buscar);
    public List<VentaDetalle> BuscarMontoCompraCliente(String Buscar);
}
