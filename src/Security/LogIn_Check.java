package Security;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import util.JDBCConnector;

public class LogIn_Check {

    EncapData ep = new EncapData();
    String name = ep.getUname();

    public String getPassword() {
        String password = "";

        try {
            Connection con = JDBCConnector.getConnection();
            System.out.println(con);
            //System.out.println("WWWWW");
            Statement stmt = con.createStatement();
            String sql = "SELECT password FROM dbo.logindata WHERE username='" + name + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                password = rs.getString("password");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return password;
    }

    public String getUserType() {
        String uType = "";
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT type FROM dbo.logindata WHERE username='" + name + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                uType = rs.getString("type");
            }
        } catch (Exception ex) {
        }
        return uType;
    }
}
