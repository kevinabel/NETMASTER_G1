package A.NET.ENTIDAD;
// Generated 04-jun-2015 21:38:01 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Comprobante generated by hbm2java
 */
public class Comprobante  implements java.io.Serializable {


     private String idComprobante;
     private String nombre;
     private String serie;
     private String numSerie;
     private Set compras = new HashSet(0);
     private Set ventas = new HashSet(0);

    public Comprobante() {
    }

	
    public Comprobante(String idComprobante) {
        this.idComprobante = idComprobante;
    }
    public Comprobante(String idComprobante, String nombre, String serie, String numSerie, Set compras, Set ventas) {
       this.idComprobante = idComprobante;
       this.nombre = nombre;
       this.serie = serie;
       this.numSerie = numSerie;
       this.compras = compras;
       this.ventas = ventas;
    }
   
    public String getIdComprobante() {
        return this.idComprobante;
    }
    
    public void setIdComprobante(String idComprobante) {
        this.idComprobante = idComprobante;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getSerie() {
        return this.serie;
    }
    
    public void setSerie(String serie) {
        this.serie = serie;
    }
    public String getNumSerie() {
        return this.numSerie;
    }
    
    public void setNumSerie(String numSerie) {
        this.numSerie = numSerie;
    }
    public Set getCompras() {
        return this.compras;
    }
    
    public void setCompras(Set compras) {
        this.compras = compras;
    }
    public Set getVentas() {
        return this.ventas;
    }
    
    public void setVentas(Set ventas) {
        this.ventas = ventas;
    }




}

