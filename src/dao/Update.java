package dao;

import java.sql.Connection;
import java.sql.Statement;
import util.JDBCConnector;

public class Update {

    public void updateWashResult(String nresult, float wid, String wcom) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE dbo.InsWash SET Wash_Result = '" + nresult + "', Wash_Comment = '" + wcom + "' WHERE Ins_Id = '" + wid + "'";
            stmt.execute(sql);
            if (con != null) {
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void updateProductionFeedbacks(float id, String prd_feedback, String prd_module) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE dbo.InsGeneralDet SET Ins_Prd_Feedback = '" + prd_feedback + "', Ins_Module = '" + prd_module + "' WHERE Ins_Id = '" + id + "'";
            stmt.execute(sql);
            if (con != null) {
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void updateHsWashResult(String nresult, float wid, String wcom) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE dbo.MAS_HS_WashR SET Result = '" + nresult + "', Wash_Comment = '" + wcom + "' WHERE Hs_Wash_Id = '" + wid + "'";
            stmt.execute(sql);
            if (con != null) {
                con.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
