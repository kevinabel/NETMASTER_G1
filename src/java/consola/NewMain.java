/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consola;

import A.NET.DAO.IMPL.UsuarioDaoImpl;
import A.NET.DAO.UsuarioDao;
import A.NET.ENTIDAD.Usuario;

/**
 *
 * @author SILVER-PC
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
       NewMain main = new NewMain();
       main.obtenerusuario();
    }
        public void obtenerusuario(){
            UsuarioDao usuario = new UsuarioDaoImpl();
            Usuario user = new Usuario();
            user=usuario.validarusuario("kevin","abc");
//            user=usuario.ObtenerUsuario("1","1");
            
            System.out.println("usuario="+user.getUsuario());
            System.out.println("idusuario="+user.getIdUsuario());
        }
    
}
