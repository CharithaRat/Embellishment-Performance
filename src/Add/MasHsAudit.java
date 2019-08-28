/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Add;

import Calculations.Calculation;
import FormatFactory.Converter;
import dao.Auditing;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import util.JDBCConnector;

/**
 *
 * @author windows
 */
public class MasHsAudit extends javax.swing.JFrame {

    private long last_insid;

    public MasHsAudit() {
        initComponents();
        washid.setText(Converter.getStringLongValue(getWashId()));
        setDate();
        Time();
        setAuditor();
        setCustomer();
        clearTextFields();
        clearTextFieldsWash();
        JTable table1 = jTable1;
        table1.getTableHeader().setReorderingAllowed(false);
        JTable table2 = jTable2;
        table2.getTableHeader().setReorderingAllowed(false);
    }

    public long getWashId() {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT Last_Hs_Wash_Id FROM dbo.LastHsWashId WHERE Status = 'last'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                last_insid = rs.getLong("Last_Hs_Wash_Id");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return last_insid;
    }

    public void setNewWashId() {

        long newlastinsid = last_insid + 1;

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE dbo.LastHsWashId SET Last_Hs_Wash_Id = '" + newlastinsid + "' WHERE Status = 'last'";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
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

                        timel.setText(s);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            }
        }).start();
    }

    private void setAuditor() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Aud_Name FROM dbo.Auditor WHERE Aud_Plant = 'MAS-IH'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String name1 = rs.getString("Aud_Name");
                co_auditor1.addItem(name1);
                co_auditor2.addItem(name1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void setCustomer() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Cus_Name FROM dbo.Customer";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String name1 = rs.getString("Cus_Name");
                co_customer.addItem(name1);
                co_customer1.addItem(name1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private String getPercentage(float small, float large) {

        float pec;
        String roval;

        System.out.println("small " + small + "large " + large + " = " + (small / large));
        pec = (small / large) * 100;
        roval = roundValue(pec);
        roval = Calculation.roundValues(pec);
        return roval;
    }

    private String roundValue(float a) {
        String rvalue;

        DecimalFormat df = new DecimalFormat("#.##");
        rvalue = df.format(a);
        System.out.println("rounded=" + rvalue);
        return rvalue;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        sdate = new javax.swing.JLabel();
        timel = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jYearChooser1 = new com.toedter.calendar.JYearChooser();
        jLabel4 = new javax.swing.JLabel();
        co_month = new javax.swing.JComboBox<>();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jLabel6 = new javax.swing.JLabel();
        co_shift = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        co_auditor1 = new javax.swing.JComboBox<>();
        jLabel18 = new javax.swing.JLabel();
        co_customer = new javax.swing.JComboBox<>();
        jLabel8 = new javax.swing.JLabel();
        txt_style = new javax.swing.JTextField();
        jLabel9 = new javax.swing.JLabel();
        txt_graphic = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        txt_combo = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        txt_sam = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        txt_lot = new javax.swing.JTextField();
        jLabel13 = new javax.swing.JLabel();
        txt_defect = new javax.swing.JTextField();
        jLabel14 = new javax.swing.JLabel();
        co_deftype = new javax.swing.JComboBox<>();
        jLabel15 = new javax.swing.JLabel();
        txt_def_pec = new javax.swing.JTextField();
        jLabel16 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jLabel17 = new javax.swing.JLabel();
        jYearChooser2 = new com.toedter.calendar.JYearChooser();
        jLabel19 = new javax.swing.JLabel();
        co_month1 = new javax.swing.JComboBox<>();
        jLabel20 = new javax.swing.JLabel();
        jDateChooser2 = new com.toedter.calendar.JDateChooser();
        jLabel21 = new javax.swing.JLabel();
        co_shift1 = new javax.swing.JComboBox<>();
        jLabel22 = new javax.swing.JLabel();
        co_auditor2 = new javax.swing.JComboBox<>();
        jLabel23 = new javax.swing.JLabel();
        co_customer1 = new javax.swing.JComboBox<>();
        jLabel24 = new javax.swing.JLabel();
        txt_style1 = new javax.swing.JTextField();
        jLabel25 = new javax.swing.JLabel();
        txt_graphic1 = new javax.swing.JTextField();
        jLabel26 = new javax.swing.JLabel();
        txt_machine = new javax.swing.JTextField();
        jLabel27 = new javax.swing.JLabel();
        txt_combo2 = new javax.swing.JTextField();
        jLabel28 = new javax.swing.JLabel();
        co_submission = new javax.swing.JComboBox<>();
        jLabel29 = new javax.swing.JLabel();
        co_result = new javax.swing.JComboBox<>();
        jLabel30 = new javax.swing.JLabel();
        txt_ref_no = new javax.swing.JTextField();
        jScrollPane3 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        jLabel31 = new javax.swing.JLabel();
        jScrollPane4 = new javax.swing.JScrollPane();
        jTextArea2 = new javax.swing.JTextArea();
        washid = new javax.swing.JLabel();
        jButton7 = new javax.swing.JButton();
        jButton8 = new javax.swing.JButton();
        jButton5 = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();
        jLabel5 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("MAS HEAT TRANSFER PERFORMANCE");
        setResizable(false);

        jPanel1.setPreferredSize(new java.awt.Dimension(1350, 886));
        jPanel1.setLayout(null);

        sdate.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sdate.setForeground(new java.awt.Color(0, 0, 153));
        sdate.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        sdate.setText("DATE");
        jPanel1.add(sdate);
        sdate.setBounds(1202, 12, 130, 24);

        timel.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        timel.setForeground(new java.awt.Color(255, 0, 0));
        timel.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        timel.setText("TIME");
        jPanel1.add(timel);
        timel.setBounds(1056, 12, 128, 24);

        jLabel2.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        jLabel2.setText("PERFORMANCE OF MAS HEAT TRANSFERS");
        jPanel1.add(jLabel2);
        jLabel2.setBounds(20, 11, 435, 24);

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("YEAR");
        jPanel1.add(jLabel3);
        jLabel3.setBounds(20, 45, 40, 31);
        jPanel1.add(jYearChooser1);
        jYearChooser1.setBounds(62, 45, 60, 31);

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setText("MONTH");
        jPanel1.add(jLabel4);
        jLabel4.setBounds(126, 46, 60, 30);

        co_month.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_month.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT MONTH-", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }));
        jPanel1.add(co_month);
        co_month.setBounds(204, 47, 129, 30);

        jDateChooser1.setDateFormatString("yyyy-MM-dd");
        jDateChooser1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jPanel1.add(jDateChooser1);
        jDateChooser1.setBounds(448, 46, 150, 31);

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel6.setText("SHIFT");
        jPanel1.add(jLabel6);
        jLabel6.setBounds(614, 45, 50, 30);

        co_shift.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_shift.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT SHIFT-", "A", "B", "GENERAL" }));
        jPanel1.add(co_shift);
        co_shift.setBounds(714, 46, 118, 31);

        jLabel7.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel7.setText("CUSTOMER");
        jPanel1.add(jLabel7);
        jLabel7.setBounds(1079, 47, 84, 27);

        co_auditor1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_auditor1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT AUDITOR-" }));
        jPanel1.add(co_auditor1);
        co_auditor1.setBounds(924, 47, 137, 29);

        jLabel18.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel18.setText("AUDITOR");
        jLabel18.setPreferredSize(new java.awt.Dimension(61, 20));
        jPanel1.add(jLabel18);
        jLabel18.setBounds(850, 46, 70, 29);

        co_customer.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_customer.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT CUSTOMER-" }));
        jPanel1.add(co_customer);
        co_customer.setBounds(1181, 47, 160, 29);

        jLabel8.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel8.setText("STYLE NO");
        jPanel1.add(jLabel8);
        jLabel8.setBounds(125, 90, 75, 27);

        txt_style.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_style.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_style.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_styleActionPerformed(evt);
            }
        });
        jPanel1.add(txt_style);
        txt_style.setBounds(204, 90, 129, 27);

        jLabel9.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel9.setText("GRAPHIC NO");
        jPanel1.add(jLabel9);
        jLabel9.setBounds(337, 92, 93, 23);

        txt_graphic.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_graphic.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_graphic.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_graphicActionPerformed(evt);
            }
        });
        jPanel1.add(txt_graphic);
        txt_graphic.setBounds(448, 88, 150, 27);

        jLabel10.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel10.setText("COMBO NO");
        jPanel1.add(jLabel10);
        jLabel10.setBounds(614, 88, 87, 27);

        txt_combo.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_combo.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_combo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_comboActionPerformed(evt);
            }
        });
        jPanel1.add(txt_combo);
        txt_combo.setBounds(714, 88, 118, 27);

        jLabel11.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel11.setText("LOT SIZE");
        jPanel1.add(jLabel11);
        jLabel11.setBounds(850, 88, 68, 27);

        txt_sam.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_sam.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_sam.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_samActionPerformed(evt);
            }
        });
        jPanel1.add(txt_sam);
        txt_sam.setBounds(1181, 88, 160, 27);

        jLabel12.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel12.setText("SAMPLE SIZE");
        jPanel1.add(jLabel12);
        jLabel12.setBounds(1079, 88, 98, 27);

        txt_lot.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_lot.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_lot.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_lotActionPerformed(evt);
            }
        });
        jPanel1.add(txt_lot);
        txt_lot.setBounds(922, 88, 139, 27);

        jLabel13.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel13.setText("DEFECT QTY");
        jPanel1.add(jLabel13);
        jLabel13.setBounds(125, 130, 75, 27);

        txt_defect.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_defect.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_defect.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_defectActionPerformed(evt);
            }
        });
        jPanel1.add(txt_defect);
        txt_defect.setBounds(204, 129, 129, 27);

        jLabel14.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel14.setText("DEFECT TYPE");
        jPanel1.add(jLabel14);
        jLabel14.setBounds(338, 127, 90, 30);

        co_deftype.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_deftype.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT DEF.TYPE", "Peel Off", "Color Change", "Shine Marks", "Bed Marks", "Moyer Marks", "Dirty Marks", "Color Patch", "Other" }));
        jPanel1.add(co_deftype);
        co_deftype.setBounds(447, 128, 150, 27);

        jLabel15.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel15.setText("DEFECT(%)");
        jPanel1.add(jLabel15);
        jLabel15.setBounds(614, 127, 96, 27);

        txt_def_pec.setEditable(false);
        txt_def_pec.setBackground(new java.awt.Color(204, 204, 255));
        txt_def_pec.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_def_pec.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel1.add(txt_def_pec);
        txt_def_pec.setBounds(714, 128, 118, 25);

        jLabel16.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel16.setText("AUDITOR COMMENTS");
        jPanel1.add(jLabel16);
        jLabel16.setBounds(850, 132, 210, 20);

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jTextArea1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTextArea1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTextArea1);

        jPanel1.add(jScrollPane1);
        jScrollPane1.setBounds(1078, 126, 260, 50);

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Year", "Month", "Date", "Time", "Shift", "Auditor", "Customer", "Style", "Graphic No", "Combo No", "Lot Size", "Sample Size", "Defect QTY", "Defect Type", "Defect (%)", "Auditor Comments"
            }
        ));
        jScrollPane2.setViewportView(jTable1);

        jPanel1.add(jScrollPane2);
        jScrollPane2.setBounds(10, 180, 1330, 130);

        jButton1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/add1.png"))); // NOI18N
        jButton1.setText("ADD TABLE");
        jButton1.setPreferredSize(new java.awt.Dimension(119, 27));
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1);
        jButton1.setBounds(170, 320, 140, 30);

        jButton2.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/clean1.png"))); // NOI18N
        jButton2.setText("CLEAR ALL");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2);
        jButton2.setBounds(10, 320, 150, 30);

        jButton3.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/save1.png"))); // NOI18N
        jButton3.setText("ADD DB");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton3);
        jButton3.setBounds(1190, 320, 150, 30);

        jButton4.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/remove1.png"))); // NOI18N
        jButton4.setText("REMOVE ROW");
        jButton4.setPreferredSize(new java.awt.Dimension(135, 27));
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton4);
        jButton4.setBounds(1040, 320, 140, 30);

        jPanel2.setBackground(java.awt.SystemColor.activeCaption);
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "HEAT TRANSFER WASH RESULT", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 12))); // NOI18N
        jPanel2.setLayout(null);

        jLabel17.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel17.setText("YEAR");
        jPanel2.add(jLabel17);
        jLabel17.setBounds(25, 84, 60, 31);
        jPanel2.add(jYearChooser2);
        jYearChooser2.setBounds(88, 84, 60, 31);

        jLabel19.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel19.setText("MONTH");
        jPanel2.add(jLabel19);
        jLabel19.setBounds(152, 85, 60, 30);

        co_month1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_month1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT MONTH-", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }));
        jPanel2.add(co_month1);
        co_month1.setBounds(233, 85, 129, 30);

        jLabel20.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel20.setText("DATE");
        jPanel2.add(jLabel20);
        jLabel20.setBounds(366, 82, 44, 30);

        jDateChooser2.setDateFormatString("yyyy-MM-dd");
        jDateChooser2.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jPanel2.add(jDateChooser2);
        jDateChooser2.setBounds(471, 82, 142, 31);

        jLabel21.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel21.setText("SHIFT");
        jPanel2.add(jLabel21);
        jLabel21.setBounds(617, 85, 56, 30);

        co_shift1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_shift1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT SHIFT-", "A", "B", "GENERAL" }));
        jPanel2.add(co_shift1);
        co_shift1.setBounds(692, 86, 118, 31);

        jLabel22.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel22.setText("AUDITOR");
        jLabel22.setPreferredSize(new java.awt.Dimension(61, 20));
        jPanel2.add(jLabel22);
        jLabel22.setBounds(814, 86, 72, 29);

        co_auditor2.setFont(new java.awt.Font("Times New Roman", 1, 11)); // NOI18N
        co_auditor2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT AUDITOR-" }));
        jPanel2.add(co_auditor2);
        co_auditor2.setBounds(896, 86, 136, 29);

        jLabel23.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel23.setText("CUSTOMER");
        jPanel2.add(jLabel23);
        jLabel23.setBounds(1042, 86, 84, 27);

        co_customer1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_customer1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT CUSTOMER-" }));
        jPanel2.add(co_customer1);
        co_customer1.setBounds(1130, 90, 161, 29);

        jLabel24.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel24.setText("STYLE NO");
        jPanel2.add(jLabel24);
        jLabel24.setBounds(156, 129, 75, 27);

        txt_style1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_style1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_style1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_style1ActionPerformed(evt);
            }
        });
        jPanel2.add(txt_style1);
        txt_style1.setBounds(235, 129, 129, 27);

        jLabel25.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel25.setText("GRAPHIC NO");
        jPanel2.add(jLabel25);
        jLabel25.setBounds(368, 131, 93, 23);

        txt_graphic1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_graphic1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_graphic1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_graphic1ActionPerformed(evt);
            }
        });
        jPanel2.add(txt_graphic1);
        txt_graphic1.setBounds(471, 127, 142, 27);

        jLabel26.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel26.setText("COMBO NO");
        jPanel2.add(jLabel26);
        jLabel26.setBounds(617, 127, 73, 27);

        txt_machine.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_machine.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_machine.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_machineActionPerformed(evt);
            }
        });
        jPanel2.add(txt_machine);
        txt_machine.setBounds(895, 127, 138, 27);

        jLabel27.setFont(new java.awt.Font("Times New Roman", 0, 11)); // NOI18N
        jLabel27.setText("MACHINE No.");
        jLabel27.setPreferredSize(new java.awt.Dimension(61, 20));
        jPanel2.add(jLabel27);
        jLabel27.setBounds(816, 127, 75, 29);

        txt_combo2.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_combo2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_combo2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_combo2ActionPerformed(evt);
            }
        });
        jPanel2.add(txt_combo2);
        txt_combo2.setBounds(694, 127, 118, 27);

        jLabel28.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel28.setText("SUBMISSION");
        jPanel2.add(jLabel28);
        jLabel28.setBounds(1043, 128, 84, 27);

        co_submission.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_submission.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT STATUS-", "YES", "NO" }));
        jPanel2.add(co_submission);
        co_submission.setBounds(1131, 127, 161, 31);

        jLabel29.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel29.setText("RESULT");
        jPanel2.add(jLabel29);
        jLabel29.setBounds(1044, 170, 84, 27);

        co_result.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_result.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT RESULT-", "YES", "NO", "PENDING" }));
        jPanel2.add(co_result);
        co_result.setBounds(1132, 169, 160, 31);

        jLabel30.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel30.setText("Wash Ref No.");
        jLabel30.setPreferredSize(new java.awt.Dimension(61, 20));
        jPanel2.add(jLabel30);
        jLabel30.setBounds(1044, 208, 84, 29);

        txt_ref_no.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_ref_no.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel2.add(txt_ref_no);
        txt_ref_no.setBounds(1132, 208, 160, 27);

        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Wash ID", "Year", "Month", "Date", "Time", "Shift", "Auditor", "Customer", "Style", "Graphic No", "Combo No", "Machine No", "Submission", "Result", "Ref. No", "Wash_Comments"
            }
        ));
        jTable2.setSelectionForeground(new java.awt.Color(255, 255, 204));
        jScrollPane3.setViewportView(jTable2);

        jPanel2.add(jScrollPane3);
        jScrollPane3.setBounds(25, 169, 1009, 131);

        jLabel31.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel31.setText("Wash Comments");
        jLabel31.setPreferredSize(new java.awt.Dimension(61, 20));
        jPanel2.add(jLabel31);
        jLabel31.setBounds(1044, 248, 84, 29);

        jTextArea2.setColumns(20);
        jTextArea2.setRows(5);
        jTextArea2.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTextArea2MouseClicked(evt);
            }
        });
        jScrollPane4.setViewportView(jTextArea2);

        jPanel2.add(jScrollPane4);
        jScrollPane4.setBounds(1132, 248, 160, 52);

        washid.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        washid.setForeground(new java.awt.Color(255, 0, 0));
        washid.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        washid.setText("WASH ID");
        jPanel2.add(washid);
        washid.setBounds(1150, 20, 140, 20);

        jPanel1.add(jPanel2);
        jPanel2.setBounds(10, 360, 1330, 330);

        jButton7.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/save1.png"))); // NOI18N
        jButton7.setText("ADD DB");
        jButton7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton7ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton7);
        jButton7.setBounds(1180, 700, 120, 27);

        jButton8.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/remove1.png"))); // NOI18N
        jButton8.setText("REMOVE ROW");
        jButton8.setPreferredSize(new java.awt.Dimension(135, 27));
        jButton8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton8ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton8);
        jButton8.setBounds(1030, 700, 140, 27);

        jButton5.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/clean1.png"))); // NOI18N
        jButton5.setText("CLEAR ALL");
        jButton5.setPreferredSize(new java.awt.Dimension(73, 27));
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton5);
        jButton5.setBounds(40, 700, 122, 27);

        jButton6.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/add1.png"))); // NOI18N
        jButton6.setText("ADD TABLE");
        jButton6.setPreferredSize(new java.awt.Dimension(73, 27));
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton6);
        jButton6.setBounds(170, 700, 142, 27);

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setText("DATE");
        jPanel1.add(jLabel5);
        jLabel5.setBounds(340, 50, 80, 30);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 740, Short.MAX_VALUE)
        );

        setSize(new java.awt.Dimension(1366, 779));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        String masyear = "";
        String masmonth = "";
        String masdate = "";
        String masshift = "";
        String mastime = "";
        String masauditor = "";
        String mascustomer = "";
        String masstyle = "";
        String masgraphic = "";
        String mascombo = "";
        float mas_lots = 0;
        float mas_sams = 0;
        float mas_def_QTY = 0;
        String mas_def_type = "";
        float mas_def_pec = 0;
        String mas_aud_com = "";

        masyear = Converter.getStringIntValue(jYearChooser1.getValue());
        masmonth = co_month.getSelectedItem().toString();
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
        masdate = dFormat.format(jDateChooser1.getDate());
        masshift = co_shift.getSelectedItem().toString();
        mastime = timel.getText();
        masauditor = co_auditor1.getSelectedItem().toString();
        mascustomer = co_customer.getSelectedItem().toString();
        masstyle = txt_style.getText();
        masgraphic = txt_graphic.getText();
        mascombo = txt_combo.getText();
        mas_lots = Converter.getFloatValue(txt_lot.getText());
        mas_sams = Converter.getFloatValue(txt_sam.getText());
        mas_def_QTY = Converter.getFloatValue(txt_defect.getText());
        mas_def_type = co_deftype.getSelectedItem().toString();
        mas_def_pec = Converter.getFloatValue(getPercentage(mas_def_QTY, mas_sams));
        mas_aud_com = jTextArea1.getText();

        DefaultTableModel ddt = (DefaultTableModel) jTable1.getModel();
        try {
            Object abj[] = {masyear, masmonth, masdate, mastime, masshift, masauditor, mascustomer, masstyle, masgraphic, mascombo, mas_lots, mas_sams, mas_def_QTY, mas_def_type, mas_def_pec, mas_aud_com};
            ddt.addRow(abj);
            clearTextFields();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Table adding error");
            e.printStackTrace();
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void txt_defectActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_defectActionPerformed
        txt_def_pec.setText(getPercentage(Converter.getFloatValue(txt_defect.getText()), Converter.getFloatValue(txt_sam.getText())));
        co_deftype.requestFocus();
    }//GEN-LAST:event_txt_defectActionPerformed

    private void jTextArea1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTextArea1MouseClicked
        jTextArea1.setText("");
    }//GEN-LAST:event_jTextArea1MouseClicked

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        clearTextFields();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        removeRowTable();
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        int counter = 0;
        int i = jTable1.getRowCount();
        System.out.println("row count = " + i);

        String masyear = "";
        String masmonth = "";
        String masdate = "";
        String masshift = "";
        String mastime = "";
        String masauditor = "";
        String mascustomer = "";
        String masstyle = "";
        String masgraphic = "";
        String mascombo = "";
        float mas_lots = 0;
        float mas_sams = 0;
        float mas_def_QTY = 0;
        String mas_def_type = "";
        float mas_def_pec = 0;
        String mas_aud_com = "";

        if (i > 0) {
            while (counter < i) {
//            getValueAt(Row, Column);

                masyear = jTable1.getValueAt(counter, 0).toString();
                masmonth = jTable1.getValueAt(counter, 1).toString();
                masdate = jTable1.getValueAt(counter, 2).toString();
                mastime = jTable1.getValueAt(counter, 3).toString();
                masshift = jTable1.getValueAt(counter, 4).toString();
                masauditor = jTable1.getValueAt(counter, 5).toString();
                mascustomer = jTable1.getValueAt(counter, 6).toString();
                masstyle = jTable1.getValueAt(counter, 7).toString();
                masgraphic = jTable1.getValueAt(counter, 8).toString();
                mascombo = jTable1.getValueAt(counter, 9).toString();
                mas_lots = Converter.getFloatValue(jTable1.getValueAt(counter, 10).toString());
                mas_sams = Converter.getFloatValue(jTable1.getValueAt(counter, 11).toString());
                mas_def_QTY = Converter.getFloatValue(jTable1.getValueAt(counter, 12).toString());
                mas_def_type = jTable1.getValueAt(counter, 13).toString();
                mas_def_pec = Converter.getFloatValue(jTable1.getValueAt(counter, 14).toString());
                mas_aud_com = jTable1.getValueAt(counter, 15).toString();

                Auditing as = new Auditing();
                as.setMAS_HS_Audits(masyear, masmonth, masdate, mastime, masshift, masauditor, mascustomer, masstyle, masgraphic, mascombo, mas_lots, mas_sams, mas_def_QTY, mas_def_type, mas_def_pec, mas_aud_com);
                counter++;
            }
            JOptionPane.showMessageDialog(null, "Audits were successfully aded to the database");
            clearTable();
        } else {
            JOptionPane.showMessageDialog(null, "Please add audits data to the table before aded to the database");
        }
    }//GEN-LAST:event_jButton3ActionPerformed

    private void txt_styleActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_styleActionPerformed
        txt_graphic.requestFocus();
    }//GEN-LAST:event_txt_styleActionPerformed

    private void txt_graphicActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_graphicActionPerformed
        txt_combo.requestFocus();
    }//GEN-LAST:event_txt_graphicActionPerformed

    private void txt_comboActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_comboActionPerformed
        txt_lot.requestFocus();
    }//GEN-LAST:event_txt_comboActionPerformed

    private void txt_lotActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_lotActionPerformed
        txt_sam.requestFocus();
    }//GEN-LAST:event_txt_lotActionPerformed

    private void txt_samActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_samActionPerformed
        txt_defect.requestFocus();
    }//GEN-LAST:event_txt_samActionPerformed

    private void txt_style1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_style1ActionPerformed
        txt_graphic1.requestFocus();
    }//GEN-LAST:event_txt_style1ActionPerformed

    private void txt_graphic1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_graphic1ActionPerformed
        txt_combo2.requestFocus();
    }//GEN-LAST:event_txt_graphic1ActionPerformed

    private void txt_machineActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_machineActionPerformed
        co_submission.requestFocus();
    }//GEN-LAST:event_txt_machineActionPerformed

    private void txt_combo2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_combo2ActionPerformed
        txt_machine.requestFocus();
    }//GEN-LAST:event_txt_combo2ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        clearTextFieldsWash();
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        float wid = 0;
        String w_masyear = "";
        String w_masmonth = "";
        String w_masdate = "";
        String w_masshift = "";
        String w_mastime = "";
        String w_masauditor = "";
        String w_mascustomer = "";
        String w_masstyle = "";
        String w_masgraphic = "";
        String w_mascombo = "";
        String w_machine = "";
        String w_submission = "";
        String w_result = "";
        String w_ref_no = "";
        String w_comment = "";

        wid = Converter.getFloatValue(washid.getText());
        w_masyear = Converter.getStringIntValue(jYearChooser2.getValue());
        w_masmonth = co_month1.getSelectedItem().toString();
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
        w_masdate = dFormat.format(jDateChooser2.getDate());
        w_masshift = co_shift1.getSelectedItem().toString();
        w_mastime = timel.getText();
        w_masauditor = co_auditor2.getSelectedItem().toString();
        w_mascustomer = co_customer1.getSelectedItem().toString();
        w_masstyle = txt_style1.getText();
        w_masgraphic = txt_graphic1.getText();
        w_mascombo = txt_combo2.getText();
        w_machine = txt_machine.getText();
        w_submission = co_submission.getSelectedItem().toString();
        w_result = co_result.getSelectedItem().toString();
        w_ref_no = txt_ref_no.getText();
        w_comment = jTextArea2.getText();

        DefaultTableModel ddt = (DefaultTableModel) jTable2.getModel();
        try {
            Object abj[] = {wid, w_masyear, w_masmonth, w_masdate, w_mastime, w_masshift, w_masauditor, w_mascustomer, w_masstyle, w_masgraphic, w_mascombo, w_machine, w_submission, w_result, w_ref_no, w_comment};
            ddt.addRow(abj);
            clearTextFieldsWash();
            setNewWashId();
            washid.setText(Converter.getStringLongValue(getWashId()));
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Table adding error");
            e.printStackTrace();
        }
    }//GEN-LAST:event_jButton6ActionPerformed

    private void jButton8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton8ActionPerformed
        removeRowTable2();
    }//GEN-LAST:event_jButton8ActionPerformed

    private void jButton7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton7ActionPerformed

        int counter = 0;
        int i = jTable2.getRowCount();
        System.out.println("row count table 2 = " + i);

        float wid = 0;
        String w_masyear = "";
        String w_masmonth = "";
        String w_masdate = "";
        String w_masshift = "";
        String w_mastime = "";
        String w_masauditor = "";
        String w_mascustomer = "";
        String w_masstyle = "";
        String w_masgraphic = "";
        String w_mascombo = "";
        String w_machine = "";
        String w_submission = "";
        String w_result = "";
        String w_ref_no = "";
        String w_comment = "";

        if (i > 0) {
            while (counter < i) {
//            getValueAt(Row, Column);
                wid = Converter.getFloatValue(jTable2.getValueAt(counter, 0).toString());
                w_masyear = jTable2.getValueAt(counter, 1).toString();
                w_masmonth = jTable2.getValueAt(counter, 2).toString();
                w_masdate = jTable2.getValueAt(counter, 3).toString();
                w_mastime = jTable2.getValueAt(counter, 4).toString();
                w_masshift = jTable2.getValueAt(counter, 5).toString();
                w_masauditor = jTable2.getValueAt(counter, 6).toString();
                w_mascustomer = jTable2.getValueAt(counter, 7).toString();
                w_masstyle = jTable2.getValueAt(counter, 8).toString();
                w_masgraphic = jTable2.getValueAt(counter, 9).toString();
                w_mascombo = jTable2.getValueAt(counter, 10).toString();
                w_machine = jTable2.getValueAt(counter, 11).toString();
                w_submission = jTable2.getValueAt(counter, 12).toString();
                w_result = jTable2.getValueAt(counter, 13).toString();
                w_ref_no = jTable2.getValueAt(counter, 14).toString();
                w_comment = jTable2.getValueAt(counter, 15).toString();

                Auditing as = new Auditing();
                as.setMAS_HS_Wash(wid, w_masyear, w_masmonth, w_masdate, w_mastime, w_masshift, w_masauditor, w_mascustomer, w_masstyle, w_masgraphic, w_mascombo, w_machine, w_submission, w_result, w_ref_no, w_comment);
                counter++;
            }
            JOptionPane.showMessageDialog(null, "Audits were successfully aded to the database");
            clearTable2();
        } else {
            JOptionPane.showMessageDialog(null, "Please add audits data to the table before aded to the database");
        }
    }//GEN-LAST:event_jButton7ActionPerformed

    private void jTextArea2MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTextArea2MouseClicked
        jTextArea2.setText("");
    }//GEN-LAST:event_jTextArea2MouseClicked

    private void clearTextFields() {
        String sdates = sdate.getText().toString();
        String parts[] = sdates.split("-");
        jYearChooser1.setValue(Converter.getIntValue(parts[0]));

        co_month.setSelectedIndex(0);

        Date d = new Date();
        jDateChooser1.setDate(d);

        co_shift.setSelectedIndex(0);
        co_auditor1.setSelectedIndex(0);
        co_customer.setSelectedIndex(0);
        txt_style.setText("");
        txt_graphic.setText("");
        txt_combo.setText("");
        txt_lot.setText("");
        txt_sam.setText("");
        txt_defect.setText("");
        co_deftype.setSelectedIndex(0);
        txt_def_pec.setText("");
        jTextArea1.setText("Add Auditor Comments");
    }

    private void clearTextFieldsWash() {
        String sdates = sdate.getText().toString();
        String parts[] = sdates.split("-");
        jYearChooser2.setValue(Converter.getIntValue(parts[0]));

        co_month1.setSelectedIndex(0);

        Date d = new Date();
        jDateChooser2.setDate(d);

        co_shift1.setSelectedIndex(0);
        co_auditor2.setSelectedIndex(0);
        co_customer1.setSelectedIndex(0);
        txt_style1.setText("");
        txt_graphic1.setText("");
        txt_combo2.setText("");
        txt_machine.setText("");
        co_submission.setSelectedIndex(0);
        co_result.setSelectedIndex(0);
        txt_ref_no.setText("");
        jTextArea2.setText("Add Wash Comments");
    }

    private void removeRowTable() {
        try {
            DefaultTableModel ddf = (DefaultTableModel) jTable1.getModel();
            ddf.removeRow(jTable1.getSelectedRow());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "No selected rows at table");
        }
    }

    private void removeRowTable2() {
        try {
            DefaultTableModel ddf = (DefaultTableModel) jTable2.getModel();
            ddf.removeRow(jTable2.getSelectedRow());
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "No selected rows at table");
        }
    }

    private void clearTable() {
        try {
            int rowCount = jTable1.getRowCount();
            DefaultTableModel ddf = (DefaultTableModel) jTable1.getModel();
            while (rowCount > 0) {
                rowCount--;
                ddf.removeRow(rowCount);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "No content at table");
        }
    }

    private void clearTable2() {
        try {
            int rowCount = jTable2.getRowCount();
            DefaultTableModel ddf = (DefaultTableModel) jTable2.getModel();
            while (rowCount > 0) {
                rowCount--;
                ddf.removeRow(rowCount);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "No content at table");
        }
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
            java.util.logging.Logger.getLogger(MasHsAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MasHsAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MasHsAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MasHsAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MasHsAudit().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> co_auditor1;
    private javax.swing.JComboBox<String> co_auditor2;
    private javax.swing.JComboBox<String> co_customer;
    private javax.swing.JComboBox<String> co_customer1;
    private javax.swing.JComboBox<String> co_deftype;
    private javax.swing.JComboBox<String> co_month;
    private javax.swing.JComboBox<String> co_month1;
    private javax.swing.JComboBox<String> co_result;
    private javax.swing.JComboBox<String> co_shift;
    private javax.swing.JComboBox<String> co_shift1;
    private javax.swing.JComboBox<String> co_submission;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JButton jButton5;
    private javax.swing.JButton jButton6;
    private javax.swing.JButton jButton7;
    private javax.swing.JButton jButton8;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    private com.toedter.calendar.JDateChooser jDateChooser2;
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
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel27;
    private javax.swing.JLabel jLabel28;
    private javax.swing.JLabel jLabel29;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel30;
    private javax.swing.JLabel jLabel31;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JTable jTable1;
    private javax.swing.JTable jTable2;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JTextArea jTextArea2;
    private com.toedter.calendar.JYearChooser jYearChooser1;
    private com.toedter.calendar.JYearChooser jYearChooser2;
    private javax.swing.JLabel sdate;
    private javax.swing.JLabel timel;
    private javax.swing.JTextField txt_combo;
    private javax.swing.JTextField txt_combo2;
    private javax.swing.JTextField txt_def_pec;
    private javax.swing.JTextField txt_defect;
    private javax.swing.JTextField txt_graphic;
    private javax.swing.JTextField txt_graphic1;
    private javax.swing.JTextField txt_lot;
    private javax.swing.JTextField txt_machine;
    private javax.swing.JTextField txt_ref_no;
    private javax.swing.JTextField txt_sam;
    private javax.swing.JTextField txt_style;
    private javax.swing.JTextField txt_style1;
    private javax.swing.JLabel washid;
    // End of variables declaration//GEN-END:variables
}
