/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.DAO;

import A.NET.ENTIDAD.Usuario;

/**
 *
 * @author Toshiba
 */
public interface UsuarioDao {
    
     public Usuario validarusuario (String usuario,String password);
     public Usuario ObtenerUsuario(String usuario,String password);
     public boolean agregar_usuario(Usuario usuario);
}
