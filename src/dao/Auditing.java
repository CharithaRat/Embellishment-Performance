package dao;

import java.sql.Connection;
import java.sql.Statement;
import util.JDBCConnector;

public class Auditing {

    public void setAuditGeneralData(float insid, String year, String month, String weekno, String date, String printer, String customer, String style, String so, String li, int gpqty, String grpno, String cono, String time, String user, String Prd_Feed, String Prd_Module) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO dbo.InsGeneralDet VALUES('" + insid + "','" + year + "','" + month + "','" + weekno + "','" + date + "','" + printer + "','" + customer + "','" + style + "','" + so + "','" + li + "','" + gpqty + "','" + grpno + "','" + cono + "', '" + time + "', '" + user + "','" + Prd_Feed + "','" + Prd_Module + "')";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    public void setAuditECAData(float insid, String ename, int eno_audit, int ep_audit, float ep_pt, int ef_audit, float ef_pt, int elots, int esamsi, int edef, float edef_pt, String ecomment, String ecarep_st) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO dbo.InsEcaDet VALUES('" + insid + "','" + ename + "','" + eno_audit + "','" + ep_audit + "','" + ep_pt + "','" + ef_audit + "','" + ef_pt + "','" + elots + "','" + esamsi + "','" + edef + "','" + edef_pt + "','" + ecomment + "','" + ecarep_st + "')";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    public void setAuditSBQAData(float insid, String sbname, int sbno_audit, int sbp_audit, float sbp_pt, int sbf_audit, float sbf_pt, int sblots, int sbsamsi, int sbdef, float sbdef_pt, String sbcomment, String sbqarep_st) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO dbo.InsSbqaDet VALUES('" + insid + "','" + sbname + "','" + sbno_audit + "','" + sbp_audit + "','" + sbp_pt + "','" + sbf_audit + "','" + sbf_pt + "','" + sblots + "','" + sbsamsi + "','" + sbdef + "','" + sbdef_pt + "','" + sbcomment + "','" + sbqarep_st + "')";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    public void setAuditIHQAData(float insid, String ihname, int ihno_audit, int ihp_audit, float ihp_pt, int ihf_audit, float ihf_pt, int ihlots, int ihsamsi, int ihdef, float ihdef_pt, String ihcomment) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO dbo.InsIhqaDet VALUES('" + insid + "','" + ihname + "','" + ihno_audit + "','" + ihp_audit + "','" + ihp_pt + "','" + ihf_audit + "','" + ihf_pt + "','" + ihlots + "','" + ihsamsi + "','" + ihdef + "','" + ihdef_pt + "','" + ihcomment + "')";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    public void setAuditWashData(float insid, String status, String result, String wcomment, String ref_No) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO dbo.InsWash VALUES('" + insid + "','" + status + "','" + result + "','" + wcomment + "', '" + ref_No + "')";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    public void setBondvillePeelBondData(String year, String month, String date, String time, String auditor, String style, String rollno, String batchno, String color, String req_st, String act_st, String speci, String status) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO dbo.Bondville_PeelbondTests VALUES('" + year + "','" + month + "','" + date + "','" + time + "','" + auditor + "','" + style + "','" + rollno + "','" + batchno + "','" + color + "','" + req_st + "','" + act_st + "','" + speci + "','" + status + "')";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    public void setBondvilleLaminationAuditData(String year, String month, String date, String shift, String time, String auditor, String style, String color, float lots, float sams, float def_QTY, float def_Pec) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO dbo.Bondville_LaminationAudits VALUES('" + year + "','" + month + "','" + date + "','" + shift + "','" + time + "','" + auditor + "','" + style + "','" + color + "','" + lots + "','" + sams + "','" + def_QTY + "','" + def_Pec + "')";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    public void setMAS_HS_Audits(String year, String month, String date, String time, String shift, String auditor, String cus, String style, String graphic, String combo, float lots, float sams, float def_QTY, String def_type, float def_Pec, String comment) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO dbo.MAS_HS_Audits VALUES('" + year + "','" + month + "','" + date + "','" + time + "','" + shift + "','" + auditor + "','" + cus + "','" + style + "','" + graphic + "','" + combo + "','" + lots + "','" + sams + "','" + def_QTY + "','" + def_type + "','" + def_Pec + "','" + comment + "')";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    public void setMAS_HS_Wash(float wid, String year, String month, String date, String time, String shift, String auditor, String cus, String style, String graphic, String combo, String machine, String subm, String result, String refno, String comment) {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "INSERT INTO dbo.MAS_HS_WashR VALUES('" + wid + "','" + year + "','" + month + "','" + date + "','" + time + "','" + shift + "','" + auditor + "','" + cus + "','" + style + "','" + graphic + "','" + combo + "','" + machine + "','" + subm + "','" + result + "','" + refno + "', '" + comment + "')";
            stmt.execute(sql);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
