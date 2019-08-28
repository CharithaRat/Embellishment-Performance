package Reports;

import java.awt.Desktop;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.Timer;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.view.JasperViewer;
import util.JDBCConnector;

public class ReportViewer extends javax.swing.JFrame {

    static String counter;

    public ReportViewer() {
        initComponents();
        setDate();
        Time();
        setYear();
        setMonth();
        setWeek();
        setCustomer();
        setPrinter();
        setBondvilledetails();
        setBondvilleColordetails();
        setMasHsdetails();
// Set Wash required initial date 
        Date d = new Date();
        jDFromDate.setDate(d);
    }

    private void setDate() {
        Date d = new Date();
        DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
        String sdate = df.format(d);
        String targetDateStr = "";
        SimpleDateFormat sourceFormat = new SimpleDateFormat("MM/dd/yy");
        SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");
        String sourceDateStr = sdate;
        try {
            Date sourceDate = sourceFormat.parse(sourceDateStr);
            targetDateStr = targetFormat.format(sourceDate);
        } catch (Exception e) {
            e.printStackTrace();
        }
        this.sdate.setText(targetDateStr);
    }

    private void Time() {
        new Thread(new Runnable() {
            public void run() {
                while (true) {
                    try {
                        String s = new java.util.Date().toString().split(" ")[3];

                        stime.setText(s);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            }
        }).start();
    }

    private void setYear() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Ins_Year FROM dbo.InsGeneralDet";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String year = rs.getString("Ins_Year");
                co_year.addItem(year);
            }
        } catch (Exception ex) {
        }
    }

    private void setMonth() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Ins_Month FROM dbo.InsGeneralDet";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String month = rs.getString("Ins_Month");
                co_month.addItem(month);
            }
        } catch (Exception ex) {
        }
    }

    private void setWeek() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Ins_Week FROM dbo.InsGeneralDet";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String week = rs.getString("Ins_Week");
                co_week.addItem(week);
            }
        } catch (Exception ex) {
        }
    }

    private void setCustomer() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Ins_Customer FROM dbo.InsGeneralDet";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String cus = rs.getString("Ins_Customer");
                co_customer.addItem(cus);
            }
        } catch (Exception ex) {
        }
    }

    private void setPrinter() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Ins_Printer FROM dbo.InsGeneralDet";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String printer = rs.getString("Ins_Printer");
                co_printer.addItem(printer);
            }
        } catch (Exception ex) {
        }
    }
// set Bondville data to report purpose

    private void setBondvilledetails() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Year, Month, Style FROM dbo.Bondville_LaminationAudits";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String year = rs.getString("Year");
                co_byear.addItem(year);
                String month = rs.getString("Month");
                co_bmonth.addItem(month);
                String style = rs.getString("Style");
                co_bstyle.addItem(style);
            }
        } catch (Exception ex) {
        }
    }

    private void setBondvilleColordetails() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Color FROM dbo.Bondville_PeelbondTests";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String color = rs.getString("Color");
                co_bcolor.addItem(color);
            }
        } catch (Exception ex) {
        }
    }
//   set MAS h/S data to report purpose

    private void setMasHsdetails() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Year, Month, Customer, Style, Graphic, Combo FROM dbo.MAS_HS_Audits";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String year = rs.getString("Year");
                co_myear.addItem(year);
                String month = rs.getString("Month");
                co_mmonth.addItem(month);
                String customer = rs.getString("Customer");
                co_mcustomer.addItem(customer);
                String style = rs.getString("Style");
                co_mstyle.addItem(style);
                String graphic = rs.getString("Graphic");
                co_mgraphic.addItem(graphic);
                String combo = rs.getString("Combo");
                co_mcombo.addItem(combo);
            }
        } catch (Exception ex) {
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel2 = new javax.swing.JLabel();
        buttonGroup1 = new javax.swing.ButtonGroup();
        buttonGroup2 = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();
        co_month = new javax.swing.JComboBox<>();
        co_year = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        co_week = new javax.swing.JComboBox<>();
        jLabel8 = new javax.swing.JLabel();
        co_printer = new javax.swing.JComboBox<>();
        jLabel9 = new javax.swing.JLabel();
        co_year1 = new javax.swing.JComboBox<>();
        jLabel12 = new javax.swing.JLabel();
        jrb_detailr = new javax.swing.JRadioButton();
        jrb_ecar = new javax.swing.JRadioButton();
        jrb_sbqar = new javax.swing.JRadioButton();
        jrb_ihqar = new javax.swing.JRadioButton();
        jrb_allqar = new javax.swing.JRadioButton();
        jrb_washr = new javax.swing.JRadioButton();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jPanel3 = new javax.swing.JPanel();
        jLabel6 = new javax.swing.JLabel();
        jDFromDate = new com.toedter.calendar.JDateChooser();
        jPanel4 = new javax.swing.JPanel();
        jLabel7 = new javax.swing.JLabel();
        co_customer = new javax.swing.JComboBox<>();
        jLabel15 = new javax.swing.JLabel();
        reporttp = new javax.swing.JTextField();
        jPanel5 = new javax.swing.JPanel();
        jr_peelbond = new javax.swing.JRadioButton();
        jr_lamination = new javax.swing.JRadioButton();
        jLabel10 = new javax.swing.JLabel();
        reporttp1 = new javax.swing.JTextField();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jPanel7 = new javax.swing.JPanel();
        co_bcolor = new javax.swing.JComboBox<>();
        jLabel14 = new javax.swing.JLabel();
        jPanel8 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        co_byear = new javax.swing.JComboBox<>();
        jLabel4 = new javax.swing.JLabel();
        co_bmonth = new javax.swing.JComboBox<>();
        jLabel13 = new javax.swing.JLabel();
        co_bstyle = new javax.swing.JComboBox<>();
        jProgressBar1 = new javax.swing.JProgressBar();
        jLabel11 = new javax.swing.JLabel();
        sdate = new javax.swing.JLabel();
        stime = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jPanel6 = new javax.swing.JPanel();
        jLabel16 = new javax.swing.JLabel();
        co_myear = new javax.swing.JComboBox<>();
        jLabel17 = new javax.swing.JLabel();
        co_mmonth = new javax.swing.JComboBox<>();
        jLabel18 = new javax.swing.JLabel();
        co_mcustomer = new javax.swing.JComboBox<>();
        jLabel19 = new javax.swing.JLabel();
        co_mstyle = new javax.swing.JComboBox<>();
        jLabel20 = new javax.swing.JLabel();
        co_mgraphic = new javax.swing.JComboBox<>();
        jLabel21 = new javax.swing.JLabel();
        co_mcombo = new javax.swing.JComboBox<>();
        jLabel22 = new javax.swing.JLabel();
        reporttp2 = new javax.swing.JTextField();
        jButton5 = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();
        jr_hs_audit = new javax.swing.JRadioButton();
        jr_hs_wash = new javax.swing.JRadioButton();

        jLabel2.setText("jLabel2");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Reports Viewer");
        setResizable(false);
        getContentPane().setLayout(null);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(new javax.swing.border.SoftBevelBorder(javax.swing.border.BevelBorder.RAISED), "Printer-Wise Performance Reports", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 0, 12), new java.awt.Color(255, 0, 0))); // NOI18N
        jPanel1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel2.setBackground(new java.awt.Color(255, 255, 255));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Common Search Options", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 0, 12), new java.awt.Color(0, 0, 255))); // NOI18N
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        co_month.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_month.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT MONTH" }));
        jPanel2.add(co_month, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 30, 160, 29));

        co_year.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_year.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT YEAR" }));
        jPanel2.add(co_year, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 30, 120, 28));

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setText("Week");
        jPanel2.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(410, 30, 40, 28));

        co_week.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_week.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT WEEK" }));
        co_week.setPreferredSize(new java.awt.Dimension(100, 20));
        jPanel2.add(co_week, new org.netbeans.lib.awtextra.AbsoluteConstraints(460, 30, 140, 29));

        jLabel8.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel8.setText("Printer Name");
        jPanel2.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(630, 30, 80, 28));

        co_printer.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_printer.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT PRINTER" }));
        co_printer.setMinimumSize(new java.awt.Dimension(100, 20));
        co_printer.setPreferredSize(new java.awt.Dimension(100, 20));
        jPanel2.add(co_printer, new org.netbeans.lib.awtextra.AbsoluteConstraints(720, 30, 230, 30));

        jLabel9.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel9.setText("Year");
        jPanel2.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 30, 40, 28));

        co_year1.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_year1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT YEAR" }));
        jPanel2.add(co_year1, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 30, 120, 28));

        jLabel12.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel12.setText("Month");
        jPanel2.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 30, 40, 28));

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 30, 970, 80));

        buttonGroup1.add(jrb_detailr);
        jrb_detailr.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jrb_detailr.setText("CUSTOMER WISE DETAIL SUMMERY REPORT");
        jrb_detailr.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jrb_detailrActionPerformed(evt);
            }
        });
        jPanel1.add(jrb_detailr, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 230, 290, -1));

        buttonGroup1.add(jrb_ecar);
        jrb_ecar.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jrb_ecar.setText("ECA Performance");
        jrb_ecar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jrb_ecarActionPerformed(evt);
            }
        });
        jPanel1.add(jrb_ecar, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 200, 250, -1));

        buttonGroup1.add(jrb_sbqar);
        jrb_sbqar.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jrb_sbqar.setText("SUB QA Performance");
        jrb_sbqar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jrb_sbqarActionPerformed(evt);
            }
        });
        jPanel1.add(jrb_sbqar, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 230, 250, -1));

        buttonGroup1.add(jrb_ihqar);
        jrb_ihqar.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jrb_ihqar.setText("IN-HOUSE QA Performance");
        jrb_ihqar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jrb_ihqarActionPerformed(evt);
            }
        });
        jPanel1.add(jrb_ihqar, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 260, 250, -1));

        buttonGroup1.add(jrb_allqar);
        jrb_allqar.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jrb_allqar.setText("ALL QA Performance");
        jrb_allqar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jrb_allqarActionPerformed(evt);
            }
        });
        jPanel1.add(jrb_allqar, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 290, 250, -1));

        buttonGroup1.add(jrb_washr);
        jrb_washr.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jrb_washr.setText("WASH TEST Report");
        jrb_washr.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jrb_washrActionPerformed(evt);
            }
        });
        jPanel1.add(jrb_washr, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 200, 290, -1));

        jButton1.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Reports/buttonprint1.png"))); // NOI18N
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(860, 160, 110, 30));

        jButton2.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Reports/clean2.png"))); // NOI18N
        jButton2.setText("CLEAR ALL");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(740, 160, 110, 30));

        jPanel3.setBackground(new java.awt.Color(204, 204, 255));
        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "FOR WASH TEST REPORT", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 3, 12), new java.awt.Color(51, 0, 102))); // NOI18N
        jPanel3.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel6.setText("REQUIRED DATE");
        jPanel3.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 27, -1, 30));

        jDFromDate.setDateFormatString("yyyy-MM-dd");
        jPanel3.add(jDFromDate, new org.netbeans.lib.awtextra.AbsoluteConstraints(134, 27, 150, 30));

        jPanel1.add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 120, 290, 70));

        jPanel4.setBackground(new java.awt.Color(153, 153, 153));
        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "FOR WASH & DETAIL SUMMERY REPORTS", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 3, 12), new java.awt.Color(51, 0, 102))); // NOI18N
        jPanel4.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel7.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel7.setText("CUSTOMER");
        jPanel4.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 36, 80, 20));

        co_customer.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_customer.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT CUSTOMER" }));
        jPanel4.add(co_customer, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 30, 170, 29));

        jPanel1.add(jPanel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 120, 290, 70));

        jLabel15.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel15.setText("REPORT TYPE");
        jPanel1.add(jLabel15, new org.netbeans.lib.awtextra.AbsoluteConstraints(650, 120, -1, 29));

        reporttp.setEditable(false);
        reporttp.setBackground(new java.awt.Color(51, 255, 51));
        reporttp.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        reporttp.setForeground(new java.awt.Color(51, 0, 153));
        jPanel1.add(reporttp, new org.netbeans.lib.awtextra.AbsoluteConstraints(740, 120, 230, 29));

        getContentPane().add(jPanel1);
        jPanel1.setBounds(10, 28, 1000, 320);

        jPanel5.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED), "Bondville Performance Reports", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 12), new java.awt.Color(255, 0, 0))); // NOI18N

        buttonGroup2.add(jr_peelbond);
        jr_peelbond.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jr_peelbond.setText("PEELBOND Test Performance");
        jr_peelbond.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jr_peelbondActionPerformed(evt);
            }
        });

        buttonGroup2.add(jr_lamination);
        jr_lamination.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jr_lamination.setText("LAMINATION Audit Performance");
        jr_lamination.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jr_laminationActionPerformed(evt);
            }
        });

        jLabel10.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel10.setText("REPORT TYPE");

        reporttp1.setEditable(false);
        reporttp1.setBackground(new java.awt.Color(51, 255, 51));
        reporttp1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        reporttp1.setForeground(new java.awt.Color(51, 0, 153));

        jButton3.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jButton3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Reports/buttonprint1.png"))); // NOI18N
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jButton4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Reports/clean2.png"))); // NOI18N
        jButton4.setText("CLEAR ALL");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jPanel7.setBackground(new java.awt.Color(153, 153, 153));
        jPanel7.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "FOR PEELBOND TEST REPORT", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 3, 12), new java.awt.Color(51, 0, 102))); // NOI18N
        jPanel7.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        co_bcolor.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_bcolor.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT COLOR" }));
        jPanel7.add(co_bcolor, new org.netbeans.lib.awtextra.AbsoluteConstraints(111, 17, 157, 28));

        jLabel14.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel14.setText("COLOR");
        jPanel7.add(jLabel14, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 16, 52, 28));

        jPanel8.setBackground(new java.awt.Color(255, 255, 255));
        jPanel8.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Common Search Options", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 0, 12), new java.awt.Color(0, 0, 255))); // NOI18N
        jPanel8.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("Year");
        jPanel8.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(6, 16, 40, 30));

        co_byear.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_byear.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT YEAR" }));
        jPanel8.add(co_byear, new org.netbeans.lib.awtextra.AbsoluteConstraints(50, 18, 115, 29));

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setText("Month");
        jPanel8.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(175, 17, 40, 28));

        co_bmonth.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_bmonth.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT MONTH" }));
        jPanel8.add(co_bmonth, new org.netbeans.lib.awtextra.AbsoluteConstraints(219, 18, 131, 28));

        jLabel13.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel13.setText("Style No");
        jPanel8.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(360, 17, 58, 28));

        co_bstyle.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_bstyle.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT STYLE" }));
        jPanel8.add(co_bstyle, new org.netbeans.lib.awtextra.AbsoluteConstraints(422, 18, 159, 28));

        javax.swing.GroupLayout jPanel5Layout = new javax.swing.GroupLayout(jPanel5);
        jPanel5.setLayout(jPanel5Layout);
        jPanel5Layout.setHorizontalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel5Layout.createSequentialGroup()
                        .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jr_lamination, javax.swing.GroupLayout.PREFERRED_SIZE, 248, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jr_peelbond, javax.swing.GroupLayout.PREFERRED_SIZE, 248, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(61, 61, 61)
                        .addComponent(jPanel7, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(jPanel8, javax.swing.GroupLayout.PREFERRED_SIZE, 590, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(44, 44, 44)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel5Layout.createSequentialGroup()
                        .addComponent(jButton4)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 109, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel5Layout.createSequentialGroup()
                        .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 82, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(reporttp1, javax.swing.GroupLayout.PREFERRED_SIZE, 228, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(0, 30, Short.MAX_VALUE))
        );
        jPanel5Layout.setVerticalGroup(
            jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(reporttp1, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel10, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
            .addGroup(jPanel5Layout.createSequentialGroup()
                .addComponent(jPanel8, javax.swing.GroupLayout.PREFERRED_SIZE, 59, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel5Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel5Layout.createSequentialGroup()
                        .addComponent(jr_lamination)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jr_peelbond)
                        .addGap(27, 27, 27))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel5Layout.createSequentialGroup()
                        .addComponent(jPanel7, javax.swing.GroupLayout.PREFERRED_SIZE, 57, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(19, 19, 19))))
        );

        getContentPane().add(jPanel5);
        jPanel5.setBounds(10, 360, 1000, 160);

        jProgressBar1.setBackground(new java.awt.Color(255, 255, 153));
        jProgressBar1.setForeground(new java.awt.Color(0, 204, 0));
        getContentPane().add(jProgressBar1);
        jProgressBar1.setBounds(10, 680, 997, 14);

        jLabel11.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(51, 0, 204));
        jLabel11.setText("Report Status Pending......");
        getContentPane().add(jLabel11);
        jLabel11.setBounds(10, 698, 440, 13);

        sdate.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sdate.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        sdate.setText("DATE");
        getContentPane().add(sdate);
        sdate.setBounds(880, 10, 123, 17);

        stime.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        stime.setForeground(new java.awt.Color(0, 0, 153));
        stime.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        stime.setText("TIME");
        getContentPane().add(stime);
        stime.setBounds(730, 10, 123, 17);

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        jLabel1.setText("PERFORMANCE REPORT");
        getContentPane().add(jLabel1);
        jLabel1.setBounds(10, 0, 292, 22);

        jPanel6.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED), "MAS H/S Performance Reports", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 12), new java.awt.Color(255, 0, 0))); // NOI18N

        jLabel16.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel16.setText("Year");

        co_myear.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_myear.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT YEAR" }));

        jLabel17.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel17.setText("Month");

        co_mmonth.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_mmonth.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT MONTH" }));

        jLabel18.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel18.setText("Customer");

        co_mcustomer.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_mcustomer.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT CUSTOMER" }));

        jLabel19.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel19.setText("Style No");

        co_mstyle.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_mstyle.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT STYLE" }));

        jLabel20.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel20.setText("Graphic");

        co_mgraphic.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_mgraphic.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT GRAPHIC" }));

        jLabel21.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel21.setText("Combo");

        co_mcombo.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_mcombo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT COMBO" }));

        jLabel22.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel22.setText("REPORT TYPE");

        reporttp2.setEditable(false);
        reporttp2.setBackground(new java.awt.Color(51, 255, 51));
        reporttp2.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        reporttp2.setForeground(new java.awt.Color(51, 0, 153));

        jButton5.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jButton5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Reports/buttonprint1.png"))); // NOI18N
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });

        jButton6.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jButton6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Reports/clean2.png"))); // NOI18N
        jButton6.setText("CLEAR ALL");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });

        jr_hs_audit.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jr_hs_audit.setText("MAS H/S Audit Performance");
        jr_hs_audit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jr_hs_auditActionPerformed(evt);
            }
        });

        jr_hs_wash.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jr_hs_wash.setText("MAS H/S Wash Performance");

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addGap(24, 24, 24)
                        .addComponent(jr_hs_audit, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(0, 0, 0)
                        .addComponent(jr_hs_wash, javax.swing.GroupLayout.PREFERRED_SIZE, 190, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel6Layout.createSequentialGroup()
                                .addGap(10, 10, 10)
                                .addComponent(jLabel16, javax.swing.GroupLayout.PREFERRED_SIZE, 60, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(4, 4, 4)
                                .addComponent(co_myear, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addComponent(jLabel17, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addComponent(co_mmonth, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addComponent(jLabel18, javax.swing.GroupLayout.PREFERRED_SIZE, 66, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(4, 4, 4)
                                .addComponent(co_mcustomer, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(4, 4, 4)
                                .addComponent(jLabel22))
                            .addGroup(jPanel6Layout.createSequentialGroup()
                                .addGap(14, 14, 14)
                                .addComponent(jLabel19, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addComponent(co_mstyle, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addComponent(jLabel20, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, 0)
                                .addComponent(co_mgraphic, javax.swing.GroupLayout.PREFERRED_SIZE, 140, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addComponent(jLabel21, javax.swing.GroupLayout.PREFERRED_SIZE, 55, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(15, 15, 15)
                                .addComponent(co_mcombo, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addGap(3, 3, 3)
                        .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel6Layout.createSequentialGroup()
                                .addComponent(jButton6, javax.swing.GroupLayout.PREFERRED_SIZE, 111, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jButton5, javax.swing.GroupLayout.PREFERRED_SIZE, 109, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(reporttp2, javax.swing.GroupLayout.PREFERRED_SIZE, 230, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addContainerGap())
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addGap(6, 6, 6)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel16, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel6Layout.createSequentialGroup()
                        .addGap(3, 3, 3)
                        .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(co_myear, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel17, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(co_mmonth, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel18, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(co_mcustomer, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel22, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(reporttp2, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(11, 11, 11)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel19, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(co_mstyle, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel20, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(co_mgraphic, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel21, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(co_mcombo, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton6, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton5, javax.swing.GroupLayout.PREFERRED_SIZE, 31, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(9, 9, 9)
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jr_hs_audit)
                    .addComponent(jr_hs_wash)))
        );

        getContentPane().add(jPanel6);
        jPanel6.setBounds(10, 530, 997, 150);

        setSize(new java.awt.Dimension(1036, 754));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        try {
            String ryear = "";
            String rmonth = "";
            String rweekn = "";
            String rdate1 = "";
            String rdate2 = "";
            String rcustomer = "";
            String rprinter = "";
            String aud_type = "";
            String reportType = "";
            List para = new ArrayList();
//----------------------------------------------------------------------------------------->
            if (co_year.getSelectedIndex() != 0 && co_month.getSelectedIndex() != 0 && co_week.getSelectedIndex() != 0 && co_printer.getSelectedIndex() != 0) {
                if (co_year.getSelectedIndex() == 0) {
                    JOptionPane.showMessageDialog(null, "Please select valid year");
                } else {
                    ryear = co_year.getSelectedItem().toString();
//                    counter = "year";
                    para.add(ryear);
//                    System.out.println("counter = " + counter);
                    if (co_month.getSelectedIndex() == 0) {
                        JOptionPane.showMessageDialog(null, "Please select valid month");
                    } else {
                        rmonth = co_month.getSelectedItem().toString();
//                        counter = "year+month";
                        para.add(rmonth);
//                        System.out.println("counter = " + counter);
                        if (co_week.getSelectedIndex() == 0) {
                            JOptionPane.showMessageDialog(null, "Please select valid week");
                        } else {
                            rweekn = co_week.getSelectedItem().toString();
//                            counter = "year+month+week";
                            para.add(rweekn);
//                            System.out.println("counter = " + counter);
                            if (co_printer.getSelectedIndex() == 0) {
                                JOptionPane.showMessageDialog(null, "Please select valid printer");
                            } else {
                                rprinter = co_printer.getSelectedItem().toString();
//                                counter = "year+month+week+printer";
                                para.add(rprinter);
//                                System.out.println("counter = " + counter);
                            }
                        }
                    }
                }
            } else {
                JOptionPane.showMessageDialog(null, "Please select valid YEAR, MONTH, WEEK & PRINTER to search audit performance");
            }

//------------------------------------------------------------------------------------>
            if (!jrb_ecar.isSelected() && !jrb_sbqar.isSelected() && !jrb_ihqar.isSelected() && !jrb_allqar.isSelected() && !jrb_washr.isSelected() && !jrb_detailr.isSelected()) {
                JOptionPane.showMessageDialog(null, "Please select valid Report type");
            }

            if (jrb_ecar.isSelected()) {
                reportType = "ECA Performance";
            } else if (jrb_sbqar.isSelected()) {
                reportType = "SUB QA Performance";
            } else if (jrb_ihqar.isSelected()) {
                reportType = "IN-HOUSE QA Performance";
            } else if (jrb_allqar.isSelected()) {
                reportType = "ALL QA Performance";
            } else if (jrb_washr.isSelected()) {
                reportType = "WASH TEST Report";
//                para.clear();

                if (jDFromDate.getCalendar() != null) {
                    SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
                    rdate1 = dFormat.format(jDFromDate.getDate());
                    para.add(rdate1);
                } else {
                    JOptionPane.showMessageDialog(null, "Enter valid date to get wash report");
                }
                if (co_customer.getSelectedIndex() != 0) {
                    String cus = co_customer.getSelectedItem().toString();
                    para.add(cus);
                } else {
                    JOptionPane.showMessageDialog(null, "Enter valid customer to get wash report");
                }
            } else if (jrb_detailr.isSelected()) {
                reportType = "Detail Report";
            }

            int i = 0;
            while (i < para.size()) {
                System.out.println("List " + i + "=" + para.get(i));
                i++;
            }

            java.sql.Connection con = JDBCConnector.getConnection();
            System.out.println("connection = " + con);
            HashMap params = new HashMap();
            params.put("list", para);
//        System.out.println("params = " + params.get("PRINTER"));

            String reportSource = "";
            File f = null;

            try {

                if (reportType.equals("ECA Performance")) {
                    System.out.println("IN");
                    reportSource = "E:/Embellishment Performance Monitor/src/Reports/ECA_Performance.jrxml";
                    System.out.println("report source = " + reportSource);
                    net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);
                    System.out.println("jasper report = " + jasperReport);
                    net.sf.jasperreports.engine.JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, con);
//                    System.out.println("jasperprint = " + jasperPrint);
                    JasperViewer.viewReport(jasperPrint);
                    setProgress();
                    JasperExportManager.exportReportToPdfFile(jasperPrint, "E:/Reports/ECA_Performances.pdf");
                    f = new File("E:/Reports/ECA_Performances.pdf");
                } else if (reportType.equals("SUB QA Performance")) {
                    System.out.println("IN");
                    reportSource = "E:\\Embellishment Performance Monitor\\src\\Reports\\SUB_QA_Performance.jrxml";
                    System.out.println("report source = " + reportSource);
                    net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);
                    System.out.println("jasper report = " + jasperReport);
                    net.sf.jasperreports.engine.JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, con);
                    System.out.println("jasperprint = " + jasperPrint);
//                JasperViewer.viewReport(jasperPrint);
                    setProgress();
                    JasperExportManager.exportReportToPdfFile(jasperPrint, "E:/Reports/SUB_QA_Performance.pdf");
                    f = new File("E:/Reports/SUB_QA_Performance.pdf");
                } else if (reportType.equals("IN-HOUSE QA Performance")) {
                    System.out.println("IN");
                    reportSource = "E:\\Embellishment Performance Monitor\\src\\Reports\\IN-HOUSE_QA_Performance.jrxml";
                    System.out.println("report source = " + reportSource);
                    net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);
                    System.out.println("jasper report = " + jasperReport);
                    net.sf.jasperreports.engine.JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, con);
                    System.out.println("jasperprint = " + jasperPrint);
//                JasperViewer.viewReport(jasperPrint);
                    setProgress();
                    JasperExportManager.exportReportToPdfFile(jasperPrint, "E:/Reports/IN-HOUSE_QA_Performance.pdf");
                    f = new File("E:/Reports/IN-HOUSE_QA_Performance.pdf");
                } else if (reportType.equals("ALL QA Performance")) {
                    System.out.println("IN");
                    reportSource = "E:\\Embellishment Performance Monitor\\src\\Reports\\ALL_QA_AUDIT_Performance.jrxml";
                    System.out.println("report source = " + reportSource);
                    net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);
                    System.out.println("jasper report = " + jasperReport);
                    net.sf.jasperreports.engine.JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, con);
                    System.out.println("jasperprint = " + jasperPrint);
//                JasperViewer.viewReport(jasperPrint);
                    setProgress();
                    JasperExportManager.exportReportToPdfFile(jasperPrint, "E:/Reports/ALL_QA_AUDIT_Performance.pdf");
                    f = new File("E:/Reports/ALL_QA_AUDIT_Performance.pdf");
                } else if (reportType.equals("WASH TEST Report")) {
                    System.out.println("IN");
                    reportSource = "E:\\Embellishment Performance Monitor\\src\\Reports\\Wash_Result_Report.jrxml";
                    System.out.println("report source = " + reportSource);
                    net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);
                    System.out.println("jasper report = " + jasperReport);
                    net.sf.jasperreports.engine.JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, con);
                    System.out.println("jasperprint = " + jasperPrint);
//                    JasperViewer.viewReport(jasperPrint);
                    setProgress();
                    JasperExportManager.exportReportToPdfFile(jasperPrint, "E:/Reports/Wash_Result_Report.pdf");
                    f = new File("E:/Reports/Wash_Result_Report.pdf");
                }
                try {
                    Desktop.getDesktop().open(f);
                    clearPrinterReport();
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, "Report Save Error");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "Report Create Error");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ReportViewer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
//        this.dispose();
        clearPrinterReport();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jrb_ecarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jrb_ecarActionPerformed
        reporttp.setText("ECA Performance");
    }//GEN-LAST:event_jrb_ecarActionPerformed

    private void jrb_sbqarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jrb_sbqarActionPerformed
        reporttp.setText("SUB QA Performance");
    }//GEN-LAST:event_jrb_sbqarActionPerformed

    private void jrb_ihqarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jrb_ihqarActionPerformed
        reporttp.setText("IN-HOUSE QA Performance");
    }//GEN-LAST:event_jrb_ihqarActionPerformed

    private void jrb_allqarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jrb_allqarActionPerformed
        reporttp.setText("ALL QA Performance");
    }//GEN-LAST:event_jrb_allqarActionPerformed

    private void jrb_washrActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jrb_washrActionPerformed
        reporttp.setText("WASH TEST Report");
    }//GEN-LAST:event_jrb_washrActionPerformed

    private void jrb_detailrActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jrb_detailrActionPerformed
        reporttp.setText("Detail Report");
    }//GEN-LAST:event_jrb_detailrActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        try {
            String year = "";
            String month = "";
            String style = "";
            String color = "";
            String reportType = "";
            List para = new ArrayList();
            if (co_byear.getSelectedIndex() != 0 && co_bmonth.getSelectedIndex() != 0 && co_bstyle.getSelectedIndex() != 0) {
                if (co_byear.getSelectedIndex() == 0) {
                    JOptionPane.showMessageDialog(null, "Select valid year");
                } else {
                    year = co_byear.getSelectedItem().toString();
                    para.add(year);
                    if (co_bmonth.getSelectedIndex() == 0) {
                        JOptionPane.showMessageDialog(null, "Select valid month");
                    } else {
                        month = co_bmonth.getSelectedItem().toString();
                        para.add(month);
                        if (co_bstyle.getSelectedIndex() == 0) {
                            JOptionPane.showMessageDialog(null, "Select valid style");
                        } else {
                            style = co_bstyle.getSelectedItem().toString();
                            para.add(style);
                        }
                    }
                }

            } else {
                JOptionPane.showMessageDialog(null, "Please select valid YEAR, MONTH & STYLE to search audit performance");
            }

            if (!jr_peelbond.isSelected() && !jr_lamination.isSelected()) {
                JOptionPane.showMessageDialog(null, "Please select valid Report type");
            } else if (jr_peelbond.isSelected()) {
                if (co_bcolor.getSelectedIndex() == 0) {
                    JOptionPane.showMessageDialog(null, "Select valid color");
                } else {
                    color = co_bcolor.getSelectedItem().toString();
                    para.add(color);
                    reportType = "Peelbond Test Performance";
                }

            } else if (jr_lamination.isSelected()) {
                reportType = "Lamination Audit Performance";
            }

            java.sql.Connection con = JDBCConnector.getConnection();
            HashMap params = new HashMap();
            params.put("list", para);

            String reportSource = "";
            File f = null;

            try {

                if (reportType.equals("Peelbond Test Performance")) {
                    System.out.println("IN");
                    reportSource = "D:\\Embellishment Performance Monitor\\src\\Reports\\Bondville_Peelbond_Performance.jrxml";
                    System.out.println("report source = " + reportSource);
                    net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);
                    System.out.println("jasper report = " + jasperReport);
                    net.sf.jasperreports.engine.JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, con);
                    System.out.println("jasperprint = " + jasperPrint);
//                JasperViewer.viewReport(jasperPrint);
                    setProgress();
                    JasperExportManager.exportReportToPdfFile(jasperPrint, "D:/Reports/Bondville_Peelbond_Performance.pdf");
                    f = new File("D:/Reports/Bondville_Peelbond_Performance.pdf");
                } else if (reportType.equals("Lamination Audit Performance")) {
                    System.out.println("IN");
                    reportSource = "D:\\Embellishment Performance Monitor\\src\\Reports\\Bondville_Audit_Performance.jrxml";
                    System.out.println("report source = " + reportSource);
                    net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);
                    System.out.println("jasper report = " + jasperReport);
                    net.sf.jasperreports.engine.JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, con);
                    System.out.println("jasperprint = " + jasperPrint);
//                JasperViewer.viewReport(jasperPrint);
                    setProgress();
                    JasperExportManager.exportReportToPdfFile(jasperPrint, "D:/Reports/Bondville_Audit_Performance.pdf");
                    f = new File("D:/Reports/Bondville_Audit_Performance.pdf");
                }
                try {
                    Desktop.getDesktop().open(f);
                    clearBondvilleReport();
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, "Report Save Error");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "Report Create Error");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ReportViewer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        clearBondvilleReport();
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jr_peelbondActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jr_peelbondActionPerformed
        reporttp1.setText("Peel Bond Test Performance");
    }//GEN-LAST:event_jr_peelbondActionPerformed

    private void jr_laminationActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jr_laminationActionPerformed
        reporttp1.setText("Lamination Audit Performance");
    }//GEN-LAST:event_jr_laminationActionPerformed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        clearMasHSReport();
    }//GEN-LAST:event_jButton6ActionPerformed

    private void jr_hs_auditActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jr_hs_auditActionPerformed
        reporttp2.setText("Mas H/S Audit Performance");
    }//GEN-LAST:event_jr_hs_auditActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        try {
            String year = "";
            String month = "";
            String customer = "";
            String style = "";
            String graphic = "";
            String combo = "";
            String reportType = "";
            List para = new ArrayList();

            if (co_myear.getSelectedIndex() != 0 && co_mmonth.getSelectedIndex() != 0 && co_mcustomer.getSelectedIndex() != 0 && co_mstyle.getSelectedIndex() != 0 && co_mgraphic.getSelectedIndex() != 0 && co_mcombo.getSelectedIndex() != 0) {
                if (co_myear.getSelectedIndex() == 0) {
                    JOptionPane.showMessageDialog(null, "Select valid year");
                } else {
                    year = co_myear.getSelectedItem().toString();
                    para.add(year);
                    if (co_mmonth.getSelectedIndex() == 0) {
                        JOptionPane.showMessageDialog(null, "Select valid month");
                    } else {
                        month = co_mmonth.getSelectedItem().toString();
                        para.add(month);
                        if (co_mcustomer.getSelectedIndex() == 0) {
                            JOptionPane.showMessageDialog(null, "Select valid customer");
                        } else {
                            customer = co_mcustomer.getSelectedItem().toString();
                            para.add(customer);
                            if (co_mstyle.getSelectedIndex() == 0) {
                                JOptionPane.showMessageDialog(null, "Select valid style");
                            } else {
                                style = co_mstyle.getSelectedItem().toString();
                                para.add(style);
                                if (co_mgraphic.getSelectedIndex() == 0) {
                                    JOptionPane.showMessageDialog(null, "Select valid graphic");
                                } else {
                                    graphic = co_mgraphic.getSelectedItem().toString();
                                    para.add(graphic);
                                    if (co_mcombo.getSelectedIndex() == 0) {
                                        JOptionPane.showMessageDialog(null, "Select valid combo");
                                    } else {
                                        combo = co_mcombo.getSelectedItem().toString();
                                        para.add(combo);
                                    }
                                }
                            }
                        }
                    }
                }

            } else {
                JOptionPane.showMessageDialog(null, "Please select valid YEAR, MONTH, CUSTOMER, STYLE, GRAPHIC & COMBO to search audit performance");
            }
            if (!jr_hs_audit.isSelected() && !jr_hs_wash.isSelected()) {
                JOptionPane.showMessageDialog(null, "Please select valid Report type");
            } else if (jr_hs_audit.isSelected()) {
                reportType = "Mas H/S Audit Performance";
            } else if (jr_hs_wash.isSelected()) {
                reportType = "Mas H/S Wash Performance";
            }

            java.sql.Connection con = JDBCConnector.getConnection();
            HashMap params = new HashMap();
            params.put("list", para);

            String reportSource = "";
            File f = null;

            try {

                if (reportType.equals("Mas H/S Audit Performance")) {
                    System.out.println("IN");
                    reportSource = "D:\\Embellishment Performance Monitor\\src\\Reports\\MAS_HS_Audit_Performance.jrxml";
                    System.out.println("report source = " + reportSource);
                    net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);
                    System.out.println("jasper report = " + jasperReport);
                    net.sf.jasperreports.engine.JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, con);
                    System.out.println("jasperprint = " + jasperPrint);
//                JasperViewer.viewReport(jasperPrint);
                    setProgress();
                    JasperExportManager.exportReportToPdfFile(jasperPrint, "D:/Reports/MAS_HS_Audit_Performance.pdf");
                    f = new File("D:/Reports/MAS_HS_Audit_Performance.pdf");
                }
//                else if (reportType.equals("Lamination Audit Performance")) {
//                    System.out.println("IN");
//                    reportSource = "D:\\New Java Projects\\Projects\\Embellishment Performance Monitor\\src\\Reports\\Bondville_Audit_Performance.jrxml";
//                    System.out.println("report source = " + reportSource);
//                    net.sf.jasperreports.engine.JasperReport jasperReport = JasperCompileManager.compileReport(reportSource);
//                    System.out.println("jasper report = " + jasperReport);
//                    net.sf.jasperreports.engine.JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, con);
//                    System.out.println("jasperprint = " + jasperPrint);
////                JasperViewer.viewReport(jasperPrint);
//                    setProgress();
//                    JasperExportManager.exportReportToPdfFile(jasperPrint, "D:/Reports/Bondville_Audit_Performance.pdf");
//                    f = new File("D:/Reports/Bondville_Audit_Performance.pdf");
//                }
                try {
                    Desktop.getDesktop().open(f);
                    clearMasHSReport();
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, "Report Save Error");
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "Report Create Error");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ReportViewer.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_jButton5ActionPerformed

    private void clearBondvilleReport() {
        co_byear.setSelectedIndex(0);
        co_bmonth.setSelectedIndex(0);
        co_bstyle.setSelectedIndex(0);
        co_bcolor.setSelectedIndex(0);
    }

    private void clearPrinterReport() {
        co_year.setSelectedIndex(0);
        co_month.setSelectedIndex(0);
        co_week.setSelectedIndex(0);
        co_printer.setSelectedIndex(0);
        co_customer.setSelectedIndex(0);
        Date d = new Date();
        jDFromDate.setDate(d);
    }

    private void clearMasHSReport() {
        co_myear.setSelectedIndex(0);
        co_mmonth.setSelectedIndex(0);
        co_mcustomer.setSelectedIndex(0);
        co_mstyle.setSelectedIndex(0);
        co_mgraphic.setSelectedIndex(0);
        co_mcombo.setSelectedIndex(0);
    }

    public void setProgress() {

        Timer t1 = new Timer(50, new ActionListener() {
            int i = 0;

            @Override
            public void actionPerformed(ActionEvent evt) {

                jProgressBar1.setValue(i);
                i = i + 5;

                if (i == 1) {
                    jLabel11.setText("Loading...");
                } else if (i == 5) {
                    jLabel11.setText("Laoding......");
                } else if (i == 10) {
                    jLabel11.setText("Loading..........");
                } else if (i == 20) {
                    jLabel11.setText("Initializing Report Data........");
                    try {
                        jProgressBar1.wait(i);
                    } catch (Exception e) {
                    }
                } else if (i == 30) {
                    jLabel11.setText("Creating Report........");
                } else if (i == 40) {
                    jLabel11.setText("Generateing Report.........");
                } else if (i == 50) {
                    jLabel11.setText("Processing...........");
//                    ReportViewer.this.setVisible(false);
//                    new LogIn().setVisible(true);
                }

            }
        });
//        new LogIn().setVisible(true);
        t1.start();
    }

    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(ReportViewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ReportViewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ReportViewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ReportViewer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ReportViewer().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.ButtonGroup buttonGroup2;
    private javax.swing.JComboBox<String> co_bcolor;
    private javax.swing.JComboBox<String> co_bmonth;
    private javax.swing.JComboBox<String> co_bstyle;
    private javax.swing.JComboBox<String> co_byear;
    private javax.swing.JComboBox<String> co_customer;
    private javax.swing.JComboBox<String> co_mcombo;
    private javax.swing.JComboBox<String> co_mcustomer;
    private javax.swing.JComboBox<String> co_mgraphic;
    private javax.swing.JComboBox<String> co_mmonth;
    private javax.swing.JComboBox<String> co_month;
    private javax.swing.JComboBox<String> co_mstyle;
    private javax.swing.JComboBox<String> co_myear;
    private javax.swing.JComboBox<String> co_printer;
    private javax.swing.JComboBox<String> co_week;
    private javax.swing.JComboBox<String> co_year;
    private javax.swing.JComboBox<String> co_year1;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private com.toedter.calendar.JDateChooser jDFromDate;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel18;
    private javax.swing.JLabel jLabel19;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JPanel jPanel7;
    private javax.swing.JPanel jPanel8;
    private javax.swing.JProgressBar jProgressBar1;
    private javax.swing.JRadioButton jr_hs_audit;
    private javax.swing.JRadioButton jr_hs_wash;
    private javax.swing.JRadioButton jr_lamination;
    private javax.swing.JRadioButton jr_peelbond;
    private javax.swing.JRadioButton jrb_allqar;
    private javax.swing.JRadioButton jrb_detailr;
    private javax.swing.JRadioButton jrb_ecar;
    private javax.swing.JRadioButton jrb_ihqar;
    private javax.swing.JRadioButton jrb_sbqar;
    private javax.swing.JRadioButton jrb_washr;
    private javax.swing.JTextField reporttp;
    private javax.swing.JTextField reporttp1;
    private javax.swing.JTextField reporttp2;
    private javax.swing.JLabel sdate;
    private javax.swing.JLabel stime;
    // End of variables declaration//GEN-END:variables
}
