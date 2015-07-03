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
 * @author SILVER
 */
public interface VentaDetalleDao {
public boolean agregarVentaDetalle(VentaDetalle ventadetalle);
public List<VentaDetalle> BuscarVentaDetalle (String Buscar);
public List<VentaDetalle> ListaProductosVenta (String id_venta);
public VentaDetalle DatosVentaDetalle (String id_detalle_venta);
public boolean ActualizarVentaDetalle(VentaDetalle vd);
}
