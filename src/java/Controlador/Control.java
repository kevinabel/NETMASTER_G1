/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import A.NET.DAO.IMPL.UsuarioDaoImpl;
import A.NET.DAO.UsuarioDao;
import A.NET.ENTIDAD.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SILVER-PC
 */
public class Control extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id_usuario="";
        String usuario=request.getParameter("usuario");
        String password=request.getParameter("password");
        
      
        
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 3.2 Final//EN\">");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet Control</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet Control at " + request.getContextPath() + "</h1>");
//            out.println("Usuario: "+usuario+"<br>");
//            out.println("Password: "+password+"<br>");
//            out.println("</body>");
//            out.println("</html>");
//        }
        
//         HttpSession session1 = request.getSession();
//        String id=(String)session1.getAttribute("id_usuario");
        
        String mensaje;
        Usuario u = new Usuario();
        UsuarioDao dao = new UsuarioDaoImpl();
        
        if (dao.ObtenerUsuario(usuario, password)!=null) {
            u=dao.ObtenerUsuario(usuario, password);
            
           
            HttpSession session = request.getSession();
            session.setAttribute("id_usuario", u.getIdUsuario());
            
            
                request.getRequestDispatcher("bienvenido.jsp").forward(request, response);
        } else {
            mensaje="Usuario o password incorrecto...";
            request.setAttribute("mensaje", mensaje);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
