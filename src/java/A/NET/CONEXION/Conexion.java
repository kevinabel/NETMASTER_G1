/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package A.NET.CONEXION;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author SILVER
 */
public class Conexion {
    public  static Connection conectar()
    {
        Connection conn = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "n", "n");
        } catch (Exception e) {
            e.printStackTrace();
        }        
        
        return conn;
    }
}
