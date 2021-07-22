package asupermart;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class Konfig {
    
    Connection con;
    Statement stm;
    
    public void config(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/asupermart", "root", "");
            stm = (Statement) con.createStatement();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "koneksi gagal "+e.getMessage());
        }
    }
    private static java.sql.Connection MySQLConfig;
    public static java.sql.Connection configDB()throws SQLException{
        try {
            String url="jdbc:mysql://localhost:3306/asupermart"; //url database
            String user="root"; //user database
            String pass=""; //password database
            
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            MySQLConfig=DriverManager.getConnection(url, user, pass);
        } 
        catch (SQLException e) {
            System.out.println("Koneksi gagal "+e.getMessage()); //perintah menampilkan error pada koneksi
        }
        return MySQLConfig;
    }
}
