package dao;

import java.sql.Connection;
import java.sql.Statement;
import util.JDBCConnector;

public class Creation {

    public void userCreate(String username, String password, String usercatagary) {
        try {

            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String ucreate = "INSERT INTO dbo.logindata VALUES('" + username + "','" + password + "','" + usercatagary + "')";
            stmt.execute(ucreate);
        } catch (Exception ex) {
        }
    }

    public void printerCreate(long emb_id, String emb_ct, String emb_name, String emb_add1, String emb_add2, String emb_add3, String emb_tel, String emb_email, String emb_jdate) {
        try {

            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String ucreate = "INSERT INTO dbo.Printer VALUES('" + emb_id + "','" + emb_ct + "','" + emb_name + "','" + emb_add1 + "','" + emb_add2 + "','" + emb_add3 + "','" + emb_tel + "','" + emb_email + "','" + emb_jdate + "')";
            stmt.execute(ucreate);

        } catch (Exception ex) {
        }
    }
    
    public void auditorCreate(long aud_id, String aud_type, String aud_name, String aud_plant, String aud_tel, String aud_email) {
        try {

            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String ucreate = "INSERT INTO dbo.Auditor VALUES('" + aud_id + "','" + aud_type + "','" + aud_name + "','" + aud_plant + "','" + aud_tel + "','" + aud_email + "')";
            stmt.execute(ucreate);

        } catch (Exception ex) {
        }
    }
    
    public void customerCreate(int cusid, String name, String date) {
        try {

            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String cuscreate = "INSERT INTO dbo.Customer VALUES('" + cusid + "','" + name + "','" + date + "')";
            stmt.execute(cuscreate);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
