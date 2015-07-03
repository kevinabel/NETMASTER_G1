/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO;

import A.NET.ENTIDAD.Categoria;
import A.NET.ENTIDAD.Color;
import A.NET.ENTIDAD.Producto;
import java.util.List;



/**
 *
 * @author SILVER
 */
public interface ProductoDao {
    public List<Color> listarColor();
    public List<Categoria> listarCategoria();
    public boolean UpdateProducto(Producto producto);
    public boolean agregarProducto(Producto producto);
    public boolean DeleteProducto(String id);
    public List<Producto> ObtenerProducto(String id);
    public List<Producto> BuscarProducto(String Buscar);
    public List<Producto> BuscarProductoVenta(String Buscar);
    public List<Producto> ListarProducto();
    public Producto DatosProducto(String id_producto);
    public List<Producto> BuscarProductoventaCliente(String Buscar);
}
