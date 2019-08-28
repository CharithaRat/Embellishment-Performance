package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCConnector {

    static Connection con;

    public static Connection getConnection() {
        try {
//            Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("cccc");
//            con = DriverManager.getConnection("jdbc:microsoft:sqlserver://CHARITHAR-PC\\SA:1433;DatabaseName=EMB_PFMC", "sa", "sa@123");
//            con = DriverManager.getConnection("jdbc:sqlserver://CHARITHAR-PC\\SA:1433;DatabaseName=EMB_PFMC", "sa", "sa@123");
            con = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-QLLBC2V\\SA:1433;DatabaseName=EMB_PFMC", "sa", "sa@123");
            System.out.println("ddddd");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return con;
    }
}
