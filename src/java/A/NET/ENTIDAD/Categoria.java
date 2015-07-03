package A.NET.ENTIDAD;
// Generated 04-jun-2015 21:38:01 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Categoria generated by hbm2java
 */
public class Categoria  implements java.io.Serializable {


     private String idCategoria;
     private String nombre;
     private Set productos = new HashSet(0);

    public Categoria() {
    }

	
    public Categoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }
    public Categoria(String idCategoria, String nombre, Set productos) {
       this.idCategoria = idCategoria;
       this.nombre = nombre;
       this.productos = productos;
    }
   
    public String getIdCategoria() {
        return this.idCategoria;
    }
    
    public void setIdCategoria(String idCategoria) {
        this.idCategoria = idCategoria;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public Set getProductos() {
        return this.productos;
    }
    
    public void setProductos(Set productos) {
        this.productos = productos;
    }




}


