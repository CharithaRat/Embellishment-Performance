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
public class BondvilleAudit extends javax.swing.JFrame {

    /**
     * Creates new form BondvilleAudit
     */
    public BondvilleAudit() {
        initComponents();
        setDate();
        Time();
        setAuditor();
//        Date d = new Date();
//        jDateChooser1.setDate(d);
//        jDateChooser2.setDate(d);
        JTable table1 = jTable1;
        table1.getTableHeader().setReorderingAllowed(false);
        JTable table2 = jTable2;
        table2.getTableHeader().setReorderingAllowed(false);
        clearPeelBondArea();
        clearLaminationAuditArea();
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
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jYearChooser1 = new com.toedter.calendar.JYearChooser();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jLabel5 = new javax.swing.JLabel();
        co_auditor1 = new javax.swing.JComboBox<>();
        jLabel6 = new javax.swing.JLabel();
        txt_style1 = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        txt_roll = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        txt_batch = new javax.swing.JTextField();
        txt_color1 = new javax.swing.JTextField();
        jLabel10 = new javax.swing.JLabel();
        txt_req_ps = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        txt_act_ps = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        txt_pb_speciman = new javax.swing.JTextField();
        jLabel13 = new javax.swing.JLabel();
        co_status = new javax.swing.JComboBox<>();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        co_month1 = new javax.swing.JComboBox<>();
        jPanel3 = new javax.swing.JPanel();
        jLabel14 = new javax.swing.JLabel();
        jYearChooser2 = new com.toedter.calendar.JYearChooser();
        jLabel15 = new javax.swing.JLabel();
        jLabel16 = new javax.swing.JLabel();
        jDateChooser2 = new com.toedter.calendar.JDateChooser();
        jLabel17 = new javax.swing.JLabel();
        co_shift = new javax.swing.JComboBox<>();
        jLabel18 = new javax.swing.JLabel();
        co_auditor2 = new javax.swing.JComboBox<>();
        jLabel19 = new javax.swing.JLabel();
        txt_style2 = new javax.swing.JTextField();
        jLabel20 = new javax.swing.JLabel();
        txt_color2 = new javax.swing.JTextField();
        jLabel21 = new javax.swing.JLabel();
        txt_lot_size = new javax.swing.JTextField();
        jLabel22 = new javax.swing.JLabel();
        txt_sam_size = new javax.swing.JTextField();
        jLabel23 = new javax.swing.JLabel();
        txt_def_QTY = new javax.swing.JTextField();
        jButton5 = new javax.swing.JButton();
        jButton6 = new javax.swing.JButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        jButton7 = new javax.swing.JButton();
        jButton8 = new javax.swing.JButton();
        co_month2 = new javax.swing.JComboBox<>();
        jLabel1 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Bondville Audits");

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        sdate.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sdate.setForeground(new java.awt.Color(0, 0, 153));
        sdate.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        sdate.setText("DATE");
        jPanel1.add(sdate, new org.netbeans.lib.awtextra.AbsoluteConstraints(1200, 10, 141, 26));

        timel.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        timel.setForeground(new java.awt.Color(255, 0, 0));
        timel.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        timel.setText("TIME");
        jPanel1.add(timel, new org.netbeans.lib.awtextra.AbsoluteConstraints(1020, 10, 141, 26));

        jPanel2.setBackground(new java.awt.Color(204, 204, 255));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "PEEL-BOND TEST", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 12))); // NOI18N
        jPanel2.setLayout(null);

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel2.setText("YEAR");
        jPanel2.add(jLabel2);
        jLabel2.setBounds(16, 16, 67, 30);

        jYearChooser1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jPanel2.add(jYearChooser1);
        jYearChooser1.setBounds(138, 16, 125, 30);

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("MONTH");
        jPanel2.add(jLabel3);
        jLabel3.setBounds(305, 18, 67, 24);

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setText("DATE");
        jPanel2.add(jLabel4);
        jLabel4.setBounds(606, 16, 67, 20);

        jDateChooser1.setDateFormatString("yyyy-MM-dd");
        jDateChooser1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jPanel2.add(jDateChooser1);
        jDateChooser1.setBounds(740, 16, 149, 27);

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setText("AUDITOR");
        jPanel2.add(jLabel5);
        jLabel5.setBounds(977, 16, 120, 28);

        co_auditor1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_auditor1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT AUDITOR-" }));
        jPanel2.add(co_auditor1);
        co_auditor1.setBounds(1145, 16, 156, 28);

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel6.setText("STYLE NO");
        jPanel2.add(jLabel6);
        jLabel6.setBounds(16, 52, 67, 27);

        txt_style1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_style1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_style1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_style1ActionPerformed(evt);
            }
        });
        jPanel2.add(txt_style1);
        txt_style1.setBounds(138, 52, 125, 27);

        jLabel7.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel7.setText("ROLL NO");
        jPanel2.add(jLabel7);
        jLabel7.setBounds(305, 52, 67, 25);

        txt_roll.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_roll.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_roll.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_rollActionPerformed(evt);
            }
        });
        jPanel2.add(txt_roll);
        txt_roll.setBounds(427, 52, 140, 27);

        jLabel8.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel8.setText("BATCH NO");
        jPanel2.add(jLabel8);
        jLabel8.setBounds(606, 49, 82, 17);

        jLabel9.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel9.setText("COLOR");
        jPanel2.add(jLabel9);
        jLabel9.setBounds(977, 50, 120, 32);

        txt_batch.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_batch.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_batch.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_batchActionPerformed(evt);
            }
        });
        jPanel2.add(txt_batch);
        txt_batch.setBounds(740, 49, 149, 27);

        txt_color1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_color1.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_color1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_color1ActionPerformed(evt);
            }
        });
        jPanel2.add(txt_color1);
        txt_color1.setBounds(1145, 50, 156, 32);

        jLabel10.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel10.setText("Required Peel Strength");
        jPanel2.add(jLabel10);
        jLabel10.setBounds(16, 86, 118, 27);

        txt_req_ps.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_req_ps.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_req_ps.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_req_psActionPerformed(evt);
            }
        });
        jPanel2.add(txt_req_ps);
        txt_req_ps.setBounds(138, 85, 125, 27);

        jLabel11.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel11.setText("Actual Peel Strength");
        jPanel2.add(jLabel11);
        jLabel11.setBounds(305, 86, 118, 27);

        txt_act_ps.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_act_ps.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_act_ps.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_act_psActionPerformed(evt);
            }
        });
        jPanel2.add(txt_act_ps);
        txt_act_ps.setBounds(427, 85, 140, 27);

        jLabel12.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel12.setText("Speciman Ref. No");
        jPanel2.add(jLabel12);
        jLabel12.setBounds(606, 83, 95, 27);

        txt_pb_speciman.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_pb_speciman.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel2.add(txt_pb_speciman);
        txt_pb_speciman.setBounds(741, 82, 148, 27);

        jLabel13.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel13.setText("Test Status");
        jPanel2.add(jLabel13);
        jLabel13.setBounds(977, 88, 95, 27);

        co_status.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_status.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT STATUS-", "PASS", "FAIL" }));
        jPanel2.add(co_status);
        co_status.setBounds(1145, 88, 156, 26);

        jButton1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/add1.png"))); // NOI18N
        jButton1.setText("ADD TABLE");
        jButton1.setPreferredSize(new java.awt.Dimension(119, 27));
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel2.add(jButton1);
        jButton1.setBounds(1161, 117, 140, 27);

        jButton2.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/clean1.png"))); // NOI18N
        jButton2.setText("CLEAR ALL");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel2.add(jButton2);
        jButton2.setBounds(1011, 117, 144, 27);

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Year", "Month", "Date", "Time", "Auditor", "Style No", "Roll No", "Batch No", "Color", "Req.Peel Strength", "Act.Peel Strength", "Speciman Ref.No", "Status"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane1.setViewportView(jTable1);

        jPanel2.add(jScrollPane1);
        jScrollPane1.setBounds(16, 150, 1285, 109);

        jButton3.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/save1.png"))); // NOI18N
        jButton3.setText("ADD DB");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        jPanel2.add(jButton3);
        jButton3.setBounds(1166, 265, 135, 27);

        jButton4.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/remove1.png"))); // NOI18N
        jButton4.setText("REMOVE ROW");
        jButton4.setPreferredSize(new java.awt.Dimension(135, 27));
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });
        jPanel2.add(jButton4);
        jButton4.setBounds(1015, 265, 145, 27);

        co_month1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_month1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT MONTH-", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }));
        jPanel2.add(co_month1);
        co_month1.setBounds(427, 16, 140, 30);

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(21, 43, 1320, 310));

        jPanel3.setBackground(new java.awt.Color(204, 204, 204));
        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "LAMINATION AUDIT", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 12))); // NOI18N
        jPanel3.setPreferredSize(new java.awt.Dimension(1320, 310));
        jPanel3.setLayout(null);

        jLabel14.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel14.setText("YEAR");
        jPanel3.add(jLabel14);
        jLabel14.setBounds(16, 27, 93, 32);

        jYearChooser2.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jYearChooser2.setMinimumSize(new java.awt.Dimension(51, 20));
        jPanel3.add(jYearChooser2);
        jYearChooser2.setBounds(127, 27, 125, 30);

        jLabel15.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel15.setText("MONTH");
        jPanel3.add(jLabel15);
        jLabel15.setBounds(279, 33, 85, 17);

        jLabel16.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel16.setText("DATE");
        jPanel3.add(jLabel16);
        jLabel16.setBounds(538, 27, 85, 30);

        jDateChooser2.setDateFormatString("yyyy-MM-dd");
        jDateChooser2.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jPanel3.add(jDateChooser2);
        jDateChooser2.setBounds(633, 27, 142, 30);

        jLabel17.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel17.setText("SHIFT");
        jPanel3.add(jLabel17);
        jLabel17.setBounds(785, 27, 50, 30);

        co_shift.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_shift.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT SHIFT-", "A", "B", "GENERAL" }));
        jPanel3.add(co_shift);
        co_shift.setBounds(876, 27, 130, 30);

        jLabel18.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel18.setText("AUDITOR");
        jLabel18.setPreferredSize(new java.awt.Dimension(61, 20));
        jPanel3.add(jLabel18);
        jLabel18.setBounds(1049, 27, 78, 30);

        co_auditor2.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_auditor2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT AUDITOR-" }));
        jPanel3.add(co_auditor2);
        co_auditor2.setBounds(1131, 27, 164, 30);

        jLabel19.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel19.setText("STYLE NO");
        jPanel3.add(jLabel19);
        jLabel19.setBounds(16, 75, 93, 17);

        txt_style2.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_style2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_style2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_style2ActionPerformed(evt);
            }
        });
        jPanel3.add(txt_style2);
        txt_style2.setBounds(127, 70, 125, 27);

        jLabel20.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel20.setText("COLOR");
        jPanel3.add(jLabel20);
        jLabel20.setBounds(279, 75, 85, 17);

        txt_color2.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_color2.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_color2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_color2ActionPerformed(evt);
            }
        });
        jPanel3.add(txt_color2);
        txt_color2.setBounds(371, 70, 140, 27);

        jLabel21.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel21.setText("LOT SIZE");
        jPanel3.add(jLabel21);
        jLabel21.setBounds(538, 75, 72, 17);

        txt_lot_size.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_lot_size.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_lot_size.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_lot_sizeActionPerformed(evt);
            }
        });
        jPanel3.add(txt_lot_size);
        txt_lot_size.setBounds(633, 70, 142, 27);

        jLabel22.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel22.setText("SAMPLE SIZE");
        jPanel3.add(jLabel22);
        jLabel22.setBounds(785, 75, 90, 17);

        txt_sam_size.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_sam_size.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_sam_size.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_sam_sizeActionPerformed(evt);
            }
        });
        jPanel3.add(txt_sam_size);
        txt_sam_size.setBounds(876, 70, 130, 27);

        jLabel23.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel23.setText("Def.Panel QTY");
        jPanel3.add(jLabel23);
        jLabel23.setBounds(1010, 70, 115, 29);

        txt_def_QTY.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_def_QTY.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel3.add(txt_def_QTY);
        txt_def_QTY.setBounds(1131, 70, 164, 27);

        jButton5.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/add1.png"))); // NOI18N
        jButton5.setText("ADD TABLE");
        jButton5.setPreferredSize(new java.awt.Dimension(119, 27));
        jButton5.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton5ActionPerformed(evt);
            }
        });
        jPanel3.add(jButton5);
        jButton5.setBounds(1164, 105, 131, 27);

        jButton6.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton6.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/clean1.png"))); // NOI18N
        jButton6.setText("CLEAR ALL");
        jButton6.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton6ActionPerformed(evt);
            }
        });
        jPanel3.add(jButton6);
        jButton6.setBounds(1006, 105, 152, 27);

        jTable2.setBackground(new java.awt.Color(255, 255, 204));
        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Year", "Month", "Date", "Time", "Shift", "Auditor", "Style No", "Color", "Lot Size", "Sample Size", "Defect Panel QTY", "Defect(%)"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Float.class, java.lang.Float.class, java.lang.Float.class, java.lang.Float.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jScrollPane2.setViewportView(jTable2);

        jPanel3.add(jScrollPane2);
        jScrollPane2.setBounds(16, 143, 1279, 106);

        jButton7.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/save1.png"))); // NOI18N
        jButton7.setText("ADD DB");
        jButton7.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton7ActionPerformed(evt);
            }
        });
        jPanel3.add(jButton7);
        jButton7.setBounds(1168, 265, 127, 27);

        jButton8.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/remove1.png"))); // NOI18N
        jButton8.setText("REMOVE ROW");
        jButton8.setPreferredSize(new java.awt.Dimension(135, 27));
        jButton8.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton8ActionPerformed(evt);
            }
        });
        jPanel3.add(jButton8);
        jButton8.setBounds(1010, 265, 152, 27);

        co_month2.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        co_month2.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT MONTH-", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }));
        jPanel3.add(co_month2);
        co_month2.setBounds(371, 27, 140, 30);

        jPanel1.add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(19, 383, 1320, -1));

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        jLabel1.setText("BONDVILLE PERFORMANCE");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(21, 11, 363, 26));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 768, Short.MAX_VALUE)
        );

        setSize(new java.awt.Dimension(1366, 768));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        String bvyear = "";
        String bvmonth = "";
        String bvdate = "";
        String bvtime = "";
        String bvauditor = "";
        String bvstyle = "";
        String bvrollno = "";
        String bvbatchno = "";
        String bvcolor = "";
        String bv_req_ps = "";
        String bv_act_ps = "";
        String bv_pb_spec_ref = "";
        String bvstatus = "";

        bvyear = Converter.getStringIntValue(jYearChooser1.getValue());
        bvmonth = co_month1.getSelectedItem().toString();
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
        bvdate = dFormat.format(jDateChooser1.getDate());
        bvtime = timel.getText();
        bvauditor = co_auditor1.getSelectedItem().toString();
        bvstyle = txt_style1.getText();
        bvrollno = txt_roll.getText();
        bvbatchno = txt_batch.getText();
        bvcolor = txt_color1.getText();
        bv_req_ps = txt_req_ps.getText();
        bv_act_ps = txt_act_ps.getText();
        bv_pb_spec_ref = txt_pb_speciman.getText();
        bvstatus = co_status.getSelectedItem().toString();

        DefaultTableModel ddt = (DefaultTableModel) jTable1.getModel();
        try {
            Object abj[] = {bvyear, bvmonth, bvdate, bvtime, bvauditor, bvstyle, bvrollno, bvbatchno, bvcolor, bv_req_ps, bv_act_ps, bv_pb_spec_ref, bvstatus};
            ddt.addRow(abj);
            clearPeelBondArea();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Table adding error");
            e.printStackTrace();
        }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        clearPeelBondArea();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        removeRowTable1();
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jButton6ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton6ActionPerformed
        clearLaminationAuditArea();
    }//GEN-LAST:event_jButton6ActionPerformed

    private void jButton5ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton5ActionPerformed
        String bvyear = "";
        String bvmonth = "";
        String bvdate = "";
        String bvshift = "";
        String bvtime = "";
        String bvauditor = "";
        String bvstyle = "";
        String bvcolor = "";
        float bv_lots = 0;
        float bv_sams = 0;
        float bv_def_QTY = 0;
        float bv_def_pec = 0;

        bvyear = Converter.getStringIntValue(jYearChooser2.getValue());
        bvmonth = co_month2.getSelectedItem().toString();
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
        bvdate = dFormat.format(jDateChooser2.getDate());
        bvshift = co_shift.getSelectedItem().toString();
        bvtime = timel.getText();
        bvauditor = co_auditor2.getSelectedItem().toString();
        bvstyle = txt_style2.getText();
        bvcolor = txt_color2.getText();
        bv_lots = Converter.getFloatValue(txt_lot_size.getText());
        bv_sams = Converter.getFloatValue(txt_sam_size.getText());
        bv_def_QTY = Converter.getFloatValue(txt_def_QTY.getText());
        bv_def_pec = Converter.getFloatValue(getPercentage(bv_def_QTY, bv_sams));

        DefaultTableModel ddt = (DefaultTableModel) jTable2.getModel();
        try {
            Object abj[] = {bvyear, bvmonth, bvdate, bvtime, bvshift, bvauditor, bvstyle, bvcolor, bv_lots, bv_sams, bv_def_QTY, bv_def_pec};
            ddt.addRow(abj);
            clearLaminationAuditArea();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Table adding error");
            e.printStackTrace();
        }
    }//GEN-LAST:event_jButton5ActionPerformed

    private void jButton8ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton8ActionPerformed
        removeRowTable2();
    }//GEN-LAST:event_jButton8ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        int counter = 0;
        int i = jTable1.getRowCount();
        System.out.println("row count table1=" + i);

        String bvyear = "";
        String bvmonth = "";
        String bvdate = "";
        String bvtime = "";
        String bvauditor = "";
        String bvstyle = "";
        String bvrollno = "";
        String bvbatchno = "";
        String bvcolor = "";
        String bv_req_ps = "";
        String bv_act_ps = "";
        String bv_pb_spec_ref = "";
        String bvstatus = "";

        if (i > 0) {
            while (counter < i) {
//            getValueAt(Row, Column);
                bvyear = jTable1.getValueAt(counter, 0).toString();
                bvmonth = jTable1.getValueAt(counter, 1).toString();
                bvdate = jTable1.getValueAt(counter, 2).toString();
                bvtime = jTable1.getValueAt(counter, 3).toString();
                bvauditor = jTable1.getValueAt(counter, 4).toString();
                bvstyle = jTable1.getValueAt(counter, 5).toString();
                bvrollno = jTable1.getValueAt(counter, 6).toString();
                bvbatchno = jTable1.getValueAt(counter, 7).toString();
                bvcolor = jTable1.getValueAt(counter, 8).toString();
                bv_req_ps = jTable1.getValueAt(counter, 9).toString();
                bv_act_ps = jTable1.getValueAt(counter, 10).toString();
                bv_pb_spec_ref = jTable1.getValueAt(counter, 11).toString();
                bvstatus = jTable1.getValueAt(counter, 12).toString();

                Auditing as = new Auditing();
                as.setBondvillePeelBondData(bvyear, bvmonth, bvdate, bvtime, bvauditor, bvstyle, bvrollno, bvbatchno, bvcolor, bv_req_ps, bv_act_ps, bv_pb_spec_ref, bvstatus);
                counter++;
            }
            JOptionPane.showMessageDialog(null, "Audits were successfully aded to the database");
            clearTable1();
        } else {
            JOptionPane.showMessageDialog(null, "Please add audits data to the table before aded to the database");
        }
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton7ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton7ActionPerformed
        int counter = 0;
        int i = jTable2.getRowCount();
        System.out.println("row count table2=" + i);

        String bvyear = "";
        String bvmonth = "";
        String bvdate = "";
        String bvshift = "";
        String bvtime = "";
        String bvauditor = "";
        String bvstyle = "";
        String bvcolor = "";
        float bv_lots = 0;
        float bv_sams = 0;
        float bv_def_QTY = 0;
        float bv_def_pec = 0;

        if (i > 0) {
            while (counter < i) {
//            getValueAt(Row, Column);
                bvyear = jTable2.getValueAt(counter, 0).toString();
                bvmonth = jTable2.getValueAt(counter, 1).toString();
                bvdate = jTable2.getValueAt(counter, 2).toString();
                bvshift = jTable2.getValueAt(counter, 3).toString();
                bvtime = jTable2.getValueAt(counter, 4).toString();
                bvauditor = jTable2.getValueAt(counter, 5).toString();
                bvstyle = jTable2.getValueAt(counter, 6).toString();
                bvcolor = jTable2.getValueAt(counter, 7).toString();
                bv_lots = Converter.getFloatValue(jTable2.getValueAt(counter, 8).toString());
                bv_sams = Converter.getFloatValue(jTable2.getValueAt(counter, 9).toString());
                bv_def_QTY = Converter.getFloatValue(jTable2.getValueAt(counter, 10).toString());
                bv_def_pec = Converter.getFloatValue(jTable2.getValueAt(counter, 11).toString());

                Auditing as = new Auditing();
                as.setBondvilleLaminationAuditData(bvyear, bvmonth, bvdate, bvshift, bvtime, bvauditor, bvstyle, bvcolor, bv_lots, bv_sams, bv_def_QTY, bv_def_pec);
                counter++;
            }
            JOptionPane.showMessageDialog(null, "Audits were successfully aded to the database");
            clearTable2();
        } else {
            JOptionPane.showMessageDialog(null, "Please add audits data to the table before aded to the database");
        }
    }//GEN-LAST:event_jButton7ActionPerformed

    private void txt_style1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_style1ActionPerformed
        txt_roll.requestFocus();
    }//GEN-LAST:event_txt_style1ActionPerformed

    private void txt_rollActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_rollActionPerformed
        txt_batch.requestFocus();
    }//GEN-LAST:event_txt_rollActionPerformed

    private void txt_batchActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_batchActionPerformed
        txt_color1.requestFocus();
    }//GEN-LAST:event_txt_batchActionPerformed

    private void txt_color1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_color1ActionPerformed
        txt_req_ps.requestFocus();
    }//GEN-LAST:event_txt_color1ActionPerformed

    private void txt_req_psActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_req_psActionPerformed
        txt_act_ps.requestFocus();
    }//GEN-LAST:event_txt_req_psActionPerformed

    private void txt_act_psActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_act_psActionPerformed
        txt_pb_speciman.requestFocus();
    }//GEN-LAST:event_txt_act_psActionPerformed

    private void txt_style2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_style2ActionPerformed
        txt_color2.requestFocus();
    }//GEN-LAST:event_txt_style2ActionPerformed

    private void txt_color2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_color2ActionPerformed
        txt_lot_size.requestFocus();
    }//GEN-LAST:event_txt_color2ActionPerformed

    private void txt_lot_sizeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_lot_sizeActionPerformed
        txt_sam_size.requestFocus();
    }//GEN-LAST:event_txt_lot_sizeActionPerformed

    private void txt_sam_sizeActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_sam_sizeActionPerformed
        txt_def_QTY.requestFocus();
    }//GEN-LAST:event_txt_sam_sizeActionPerformed

    private void clearLaminationAuditArea() {

        String sdates = sdate.getText().toString();
        String parts[] = sdates.split("-");
//        System.out.println("year=" + parts[0]);
        jYearChooser2.setValue(Converter.getIntValue(parts[0]));

        co_month2.setSelectedIndex(0);

        Date d = new Date();
        jDateChooser2.setDate(d);

        co_shift.setSelectedIndex(0);
        co_auditor2.setSelectedIndex(0);
        txt_style2.setText("");
        txt_color2.setText("");
        txt_lot_size.setText("");
        txt_sam_size.setText("");
        txt_def_QTY.setText("");
    }

    private void clearPeelBondArea() {
        String sdates = sdate.getText().toString();
        String parts[] = sdates.split("-");
        jYearChooser1.setValue(Converter.getIntValue(parts[0]));

        co_month1.setSelectedIndex(0);

        Date d = new Date();
        jDateChooser1.setDate(d);

        co_auditor1.setSelectedIndex(0);
        txt_style1.setText("");
        txt_roll.setText("");
        txt_batch.setText("");
        txt_color1.setText("");
        txt_req_ps.setText("");
        txt_act_ps.setText("");
        txt_pb_speciman.setText("");
        co_status.setSelectedIndex(0);
    }

    private void removeRowTable1() {
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

    private void clearTable1() {
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

    /**
     * @param args the command line arguments
     */
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
            java.util.logging.Logger.getLogger(BondvilleAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(BondvilleAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(BondvilleAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(BondvilleAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new BondvilleAudit().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> co_auditor1;
    private javax.swing.JComboBox<String> co_auditor2;
    private javax.swing.JComboBox<String> co_month1;
    private javax.swing.JComboBox<String> co_month2;
    private javax.swing.JComboBox<String> co_shift;
    private javax.swing.JComboBox<String> co_status;
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
    private javax.swing.JLabel jLabel23;
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
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTable jTable2;
    private com.toedter.calendar.JYearChooser jYearChooser1;
    private com.toedter.calendar.JYearChooser jYearChooser2;
    private javax.swing.JLabel sdate;
    private javax.swing.JLabel timel;
    private javax.swing.JTextField txt_act_ps;
    private javax.swing.JTextField txt_batch;
    private javax.swing.JTextField txt_color1;
    private javax.swing.JTextField txt_color2;
    private javax.swing.JTextField txt_def_QTY;
    private javax.swing.JTextField txt_lot_size;
    private javax.swing.JTextField txt_pb_speciman;
    private javax.swing.JTextField txt_req_ps;
    private javax.swing.JTextField txt_roll;
    private javax.swing.JTextField txt_sam_size;
    private javax.swing.JTextField txt_style1;
    private javax.swing.JTextField txt_style2;
    // End of variables declaration//GEN-END:variables
}
