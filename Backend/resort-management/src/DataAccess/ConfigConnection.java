package DataAccess;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConfigConnection {
    private String host = null;
    private String user = null;
    private String pass = null;

    public Connection getCon(){
        Connection cn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.host = "jdbc:mysql://localhost:3306/DBSysLab";
            this.user = "root";
            this.pass = "quangkhanh2022a";
            cn = DriverManager.getConnection(host, user, pass);
        }
        catch (Exception e){
            System.out.println("Error: " + e.getMessage());
        }
        return cn;
    }
}
