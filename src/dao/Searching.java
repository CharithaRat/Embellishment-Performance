package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import util.JDBCConnector;

public class Searching {

    public List getPrinterName(String pr_name) {

        List list = new ArrayList();
        String name = "";

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT Emb_Name FROM dbo.Printer WHERE Emb_Name LIKE'" + pr_name + "%'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                name = rs.getString("Emb_Name");
                list.add(name);
            }
        } catch (Exception ex) {
        }
        return list;
    }

    public List getAuditorName(String aud_name, String printer) {

        List list = new ArrayList();
        String audname = "";

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT Aud_Name FROM dbo.Auditor WHERE Aud_Name LIKE'" + aud_name + "%' and Aud_Plant = '" + printer + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                audname = rs.getString("Aud_Name");
                list.add(audname);
            }
        } catch (Exception ex) {
        }
        return list;
    }
    
    
}
