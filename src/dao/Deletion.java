package dao;

import java.sql.Connection;
import java.sql.Statement;
import util.JDBCConnector;

public class Deletion {

    public void deleteGeneralAuditData(float insid) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "DELETE FROM dbo.InsGeneralDet WHERE Ins_Id = '" + insid + "'";
            stmt.execute(sql);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void deleteEcaAuditData(float insid) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "DELETE FROM dbo.InsEcaDet WHERE Ins_Id = '" + insid + "'";
            stmt.execute(sql);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void deleteSubQAAuditData(float insid) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "DELETE FROM dbo.InsSbqaDet WHERE Ins_Id = '" + insid + "'";
            stmt.execute(sql);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void deleteInhouseQAAuditData(float insid) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "DELETE FROM dbo.InsIhqaDet WHERE Ins_Id = '" + insid + "'";
            stmt.execute(sql);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void deleteWashData(float insid) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "DELETE FROM dbo.InsWash WHERE Ins_Id = '" + insid + "'";
            stmt.execute(sql);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
