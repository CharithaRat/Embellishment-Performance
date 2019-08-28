package Add;

import Calculations.Calculation;
import FormatFactory.Converter;
import dao.Auditing;
import dao.Searching;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import javax.swing.JOptionPane;
import util.JDBCConnector;
import FormatFactory.Converter;
import Security.EncapData;
import java.text.DecimalFormat;
import java.util.Calendar;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class AddAudit extends javax.swing.JFrame {

    private long last_insid;
    private int status = 0;

    public AddAudit() {
        initComponents();

        setDate();
        setPrinter();
        setCustomer();
        insid.setText(new Converter().getStringLongValue(getInspectionId()));
        JTable table = jTable1;
        table.getTableHeader().setReorderingAllowed(false);
        rightm.setVisible(false);
        setDisable();
//        DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
//        Calendar cal = Calendar.getInstance();
//        System.out.println("time " + cal.getTime());
        setInitials();
        Time();
    }

//    public void setDate() {
//        Date d = new Date();
//        DateFormat df = DateFormat.getDateInstance(DateFormat.FULL);
//        String date = df.format(d);
//        sdate.setText(date);
//        setPrinter();
//    }
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

    private void setPrinter() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Emb_Name FROM dbo.Printer";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String name1 = rs.getString("Emb_Name");
                co_printer.addItem(name1);
            }
        } catch (Exception ex) {
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
            }
        } catch (Exception ex) {
        }
    }

    public long getInspectionId() {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT Last_InsId FROM dbo.LastInsId WHERE Status = 'last'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                last_insid = rs.getLong("Last_InsId");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return last_insid;
    }

    public void setNewInspectionId() {

        long newlastinsid = last_insid + 1;

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE dbo.LastInsId SET Last_InsId = '" + newlastinsid + "' WHERE Status = 'last'";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    public String getPercentage(float small, float large) {

        float pec;
        String roval;

        System.out.println("small " + small + "large " + large + " = " + small / large);
        pec = (small / large) * 100;
//        roval = roundValue(pec);
        roval = Calculation.roundValues(pec);
        return roval;
    }

    public String roundValue(float a) {
        String rvalue;

        DecimalFormat df = new DecimalFormat("#.##");
        rvalue = df.format(a);
        System.out.println("rounded=" + rvalue);
        return rvalue;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        buttonGroup2 = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        eca_name = new javax.swing.JTextField();
        jLabel15 = new javax.swing.JLabel();
        jLabel17 = new javax.swing.JLabel();
        jLabel18 = new javax.swing.JLabel();
        jLabel19 = new javax.swing.JLabel();
        jLabel20 = new javax.swing.JLabel();
        jLabel21 = new javax.swing.JLabel();
        jLabel22 = new javax.swing.JLabel();
        jLabel23 = new javax.swing.JLabel();
        jLabel24 = new javax.swing.JLabel();
        eca_no_aud = new javax.swing.JTextField();
        eca_pa_aud = new javax.swing.JTextField();
        eca_pa_pt = new javax.swing.JTextField();
        eca_fa_aud = new javax.swing.JTextField();
        eca_fa_pt = new javax.swing.JTextField();
        eca_lots = new javax.swing.JTextField();
        eca_sams = new javax.swing.JTextField();
        eca_def_pt = new javax.swing.JTextField();
        jLabel43 = new javax.swing.JLabel();
        eca_dam = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel16 = new javax.swing.JLabel();
        jLabel46 = new javax.swing.JLabel();
        CB_eca = new javax.swing.JCheckBox();
        jreca_y = new javax.swing.JRadioButton();
        jreca_n = new javax.swing.JRadioButton();
        jLabel56 = new javax.swing.JLabel();
        jPanel3 = new javax.swing.JPanel();
        sbq_name = new javax.swing.JTextField();
        jLabel25 = new javax.swing.JLabel();
        jLabel26 = new javax.swing.JLabel();
        jLabel27 = new javax.swing.JLabel();
        jLabel28 = new javax.swing.JLabel();
        jLabel29 = new javax.swing.JLabel();
        jLabel30 = new javax.swing.JLabel();
        jLabel31 = new javax.swing.JLabel();
        jLabel32 = new javax.swing.JLabel();
        jLabel33 = new javax.swing.JLabel();
        sbq_no_aud = new javax.swing.JTextField();
        sbq_pa_aud = new javax.swing.JTextField();
        sbq_pa_pt = new javax.swing.JTextField();
        sbq_fa_aud = new javax.swing.JTextField();
        sbq_fa_pt = new javax.swing.JTextField();
        sbq_lots = new javax.swing.JTextField();
        sbq_sams = new javax.swing.JTextField();
        sbq_def_pt = new javax.swing.JTextField();
        jLabel44 = new javax.swing.JLabel();
        sbq_dam = new javax.swing.JTextField();
        jLabel47 = new javax.swing.JLabel();
        jLabel48 = new javax.swing.JLabel();
        jLabel49 = new javax.swing.JLabel();
        CB_sbqa = new javax.swing.JCheckBox();
        jLabel57 = new javax.swing.JLabel();
        jrsbqa_y = new javax.swing.JRadioButton();
        jrsbqa_n = new javax.swing.JRadioButton();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jPanel5 = new javax.swing.JPanel();
        ihq_no_aud = new javax.swing.JTextField();
        jLabel34 = new javax.swing.JLabel();
        jLabel35 = new javax.swing.JLabel();
        jLabel36 = new javax.swing.JLabel();
        jLabel37 = new javax.swing.JLabel();
        jLabel38 = new javax.swing.JLabel();
        jLabel39 = new javax.swing.JLabel();
        jLabel40 = new javax.swing.JLabel();
        jLabel41 = new javax.swing.JLabel();
        jLabel42 = new javax.swing.JLabel();
        ihq_name = new javax.swing.JTextField();
        ihq_pa_aud = new javax.swing.JTextField();
        ihq_pa_pt = new javax.swing.JTextField();
        ihq_fa_aud = new javax.swing.JTextField();
        ihq_fa_pt = new javax.swing.JTextField();
        ihq_lots = new javax.swing.JTextField();
        ihq_sams = new javax.swing.JTextField();
        ihq_def_pt = new javax.swing.JTextField();
        jLabel45 = new javax.swing.JLabel();
        ihq_dam = new javax.swing.JTextField();
        jLabel50 = new javax.swing.JLabel();
        jLabel51 = new javax.swing.JLabel();
        jLabel52 = new javax.swing.JLabel();
        CB_ihqa = new javax.swing.JCheckBox();
        jScrollPane1 = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList<>();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        add_li = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        co_printer = new javax.swing.JComboBox<>();
        jLabel7 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        add_gpq = new javax.swing.JTextField();
        co_month = new javax.swing.JComboBox<>();
        co_week = new javax.swing.JComboBox<>();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jLabel10 = new javax.swing.JLabel();
        add_so = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        add_grpn = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        add_table = new javax.swing.JButton();
        add_dbase = new javax.swing.JButton();
        ResetAll = new javax.swing.JButton();
        jPanel4 = new javax.swing.JPanel();
        jLabel53 = new javax.swing.JLabel();
        jLabel54 = new javax.swing.JLabel();
        co_submit = new javax.swing.JComboBox<>();
        co_result = new javax.swing.JComboBox<>();
        jLabel55 = new javax.swing.JLabel();
        jScrollPane3 = new javax.swing.JScrollPane();
        TA_com_wash = new javax.swing.JTextArea();
        jLabel58 = new javax.swing.JLabel();
        txt_ref = new javax.swing.JTextField();
        sdate = new javax.swing.JLabel();
        timel = new javax.swing.JLabel();
        rightm = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        ad_style = new javax.swing.JTextField();
        co_customer = new javax.swing.JComboBox<>();
        jYearChooser1 = new com.toedter.calendar.JYearChooser();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jPanel6 = new javax.swing.JPanel();
        jScrollPane4 = new javax.swing.JScrollPane();
        TA_com_eca = new javax.swing.JTextArea();
        jScrollPane5 = new javax.swing.JScrollPane();
        TA_com_sbqa = new javax.swing.JTextArea();
        jScrollPane6 = new javax.swing.JScrollPane();
        TA_com_ihqa = new javax.swing.JTextArea();
        insid = new javax.swing.JLabel();
        add_combn1 = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Add Audit Details");
        getContentPane().setLayout(null);

        jPanel1.setMinimumSize(new java.awt.Dimension(1360, 760));
        jPanel1.setPreferredSize(new java.awt.Dimension(1360, 760));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        jLabel1.setText("ADD EMBELLISHMENT AUDIT DETAILS");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(25, 10, 710, 27));

        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "ECA AUDIT", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 12))); // NOI18N
        jPanel2.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        eca_name.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        eca_name.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        eca_name.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                eca_nameMouseClicked(evt);
            }
        });
        eca_name.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                eca_nameActionPerformed(evt);
            }
        });
        eca_name.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                eca_nameKeyReleased(evt);
            }
        });
        jPanel2.add(eca_name, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 36, 175, 30));

        jLabel15.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel15.setText("No of Audit");
        jPanel2.add(jLabel15, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 72, 80, 30));

        jLabel17.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel17.setText("Name");
        jPanel2.add(jLabel17, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 36, 80, 30));

        jLabel18.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel18.setText("Pass Audits");
        jPanel2.add(jLabel18, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 108, 80, 30));

        jLabel19.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel19.setText("Pass(%)");
        jPanel2.add(jLabel19, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 144, 80, 30));

        jLabel20.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel20.setText("Fail Audits");
        jPanel2.add(jLabel20, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 180, 80, 30));

        jLabel21.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel21.setText("Fail(%)");
        jPanel2.add(jLabel21, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 216, 80, 30));

        jLabel22.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel22.setText("Lot Size");
        jPanel2.add(jLabel22, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 254, 80, 30));

        jLabel23.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel23.setText("Sample Size");
        jPanel2.add(jLabel23, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 290, 80, 30));

        jLabel24.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel24.setText("Defect(%)");
        jPanel2.add(jLabel24, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 362, 80, 30));

        eca_no_aud.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        eca_no_aud.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        eca_no_aud.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                eca_no_audMouseClicked(evt);
            }
        });
        eca_no_aud.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                eca_no_audActionPerformed(evt);
            }
        });
        jPanel2.add(eca_no_aud, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 72, 175, 30));

        eca_pa_aud.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        eca_pa_aud.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        eca_pa_aud.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                eca_pa_audActionPerformed(evt);
            }
        });
        jPanel2.add(eca_pa_aud, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 108, 175, 30));

        eca_pa_pt.setEditable(false);
        eca_pa_pt.setBackground(new java.awt.Color(255, 255, 204));
        eca_pa_pt.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        eca_pa_pt.setForeground(new java.awt.Color(0, 0, 255));
        eca_pa_pt.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel2.add(eca_pa_pt, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 144, 149, 30));

        eca_fa_aud.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        eca_fa_aud.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        eca_fa_aud.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                eca_fa_audActionPerformed(evt);
            }
        });
        jPanel2.add(eca_fa_aud, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 180, 175, 30));

        eca_fa_pt.setEditable(false);
        eca_fa_pt.setBackground(new java.awt.Color(255, 255, 204));
        eca_fa_pt.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        eca_fa_pt.setForeground(new java.awt.Color(51, 0, 255));
        eca_fa_pt.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel2.add(eca_fa_pt, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 216, 148, 30));

        eca_lots.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        eca_lots.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        eca_lots.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                eca_lotsActionPerformed(evt);
            }
        });
        jPanel2.add(eca_lots, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 254, 175, 30));

        eca_sams.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        eca_sams.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        eca_sams.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                eca_samsActionPerformed(evt);
            }
        });
        jPanel2.add(eca_sams, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 290, 175, 30));

        eca_def_pt.setEditable(false);
        eca_def_pt.setBackground(new java.awt.Color(255, 255, 204));
        eca_def_pt.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        eca_def_pt.setForeground(new java.awt.Color(51, 0, 255));
        eca_def_pt.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel2.add(eca_def_pt, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 362, 150, 30));

        jLabel43.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel43.setText("Damage QTY");
        jPanel2.add(jLabel43, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 326, 80, 30));

        eca_dam.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        eca_dam.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        eca_dam.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                eca_damActionPerformed(evt);
            }
        });
        jPanel2.add(eca_dam, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 326, 175, 30));

        jLabel8.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 0, 0));
        jLabel8.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel8.setText("%");
        jLabel8.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel2.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(253, 144, 22, 30));

        jLabel16.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel16.setForeground(new java.awt.Color(255, 0, 0));
        jLabel16.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel16.setText("%");
        jLabel16.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel2.add(jLabel16, new org.netbeans.lib.awtextra.AbsoluteConstraints(252, 218, 23, 30));

        jLabel46.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel46.setForeground(new java.awt.Color(255, 0, 0));
        jLabel46.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel46.setText("%");
        jLabel46.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel2.add(jLabel46, new org.netbeans.lib.awtextra.AbsoluteConstraints(254, 362, 21, 30));

        CB_eca.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        CB_eca.setText("Availability");
        CB_eca.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                CB_ecaActionPerformed(evt);
            }
        });
        jPanel2.add(CB_eca, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 90, 13));

        buttonGroup1.add(jreca_y);
        jreca_y.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jreca_y.setText("YES");
        jPanel2.add(jreca_y, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 10, -1, -1));

        buttonGroup1.add(jreca_n);
        jreca_n.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jreca_n.setText("NO");
        jPanel2.add(jreca_n, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 10, -1, -1));

        jLabel56.setFont(new java.awt.Font("Times New Roman", 3, 10)); // NOI18N
        jLabel56.setText("AUDIT REPORT STATUS");
        jPanel2.add(jLabel56, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 10, 130, 20));

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(19, 136, 330, 410));

        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "SUB QA AUDIT", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 12))); // NOI18N
        jPanel3.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        sbq_name.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sbq_name.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sbq_name.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                sbq_nameMouseClicked(evt);
            }
        });
        sbq_name.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sbq_nameActionPerformed(evt);
            }
        });
        sbq_name.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                sbq_nameKeyReleased(evt);
            }
        });
        jPanel3.add(sbq_name, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 36, 179, 30));

        jLabel25.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel25.setText("Name");
        jPanel3.add(jLabel25, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 36, 80, 30));

        jLabel26.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel26.setText("No of Audit");
        jPanel3.add(jLabel26, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 72, 80, 30));

        jLabel27.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel27.setText("Pass Audits");
        jPanel3.add(jLabel27, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 108, 80, 30));

        jLabel28.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel28.setText("Pass(%)");
        jPanel3.add(jLabel28, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 144, 80, 30));

        jLabel29.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel29.setText("Fail Audits");
        jPanel3.add(jLabel29, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 182, 80, 30));

        jLabel30.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel30.setText("Fail(%)");
        jPanel3.add(jLabel30, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 218, 80, 30));

        jLabel31.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel31.setText("Lot Size");
        jPanel3.add(jLabel31, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 256, 80, 30));

        jLabel32.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel32.setText("Sample Size");
        jPanel3.add(jLabel32, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 292, 80, 30));

        jLabel33.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel33.setText("Defect(%)");
        jPanel3.add(jLabel33, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 364, 80, 30));

        sbq_no_aud.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sbq_no_aud.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sbq_no_aud.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                sbq_no_audMouseClicked(evt);
            }
        });
        sbq_no_aud.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sbq_no_audActionPerformed(evt);
            }
        });
        jPanel3.add(sbq_no_aud, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 72, 179, 30));

        sbq_pa_aud.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sbq_pa_aud.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sbq_pa_aud.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sbq_pa_audActionPerformed(evt);
            }
        });
        jPanel3.add(sbq_pa_aud, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 108, 179, 30));

        sbq_pa_pt.setEditable(false);
        sbq_pa_pt.setBackground(new java.awt.Color(255, 255, 204));
        sbq_pa_pt.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        sbq_pa_pt.setForeground(new java.awt.Color(51, 0, 255));
        sbq_pa_pt.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel3.add(sbq_pa_pt, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 144, 150, 30));

        sbq_fa_aud.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sbq_fa_aud.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sbq_fa_aud.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sbq_fa_audActionPerformed(evt);
            }
        });
        jPanel3.add(sbq_fa_aud, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 182, 179, 30));

        sbq_fa_pt.setEditable(false);
        sbq_fa_pt.setBackground(new java.awt.Color(255, 255, 204));
        sbq_fa_pt.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        sbq_fa_pt.setForeground(new java.awt.Color(51, 0, 255));
        sbq_fa_pt.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel3.add(sbq_fa_pt, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 218, 148, 30));

        sbq_lots.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sbq_lots.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sbq_lots.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sbq_lotsActionPerformed(evt);
            }
        });
        jPanel3.add(sbq_lots, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 256, 179, 30));

        sbq_sams.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sbq_sams.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sbq_sams.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sbq_samsActionPerformed(evt);
            }
        });
        jPanel3.add(sbq_sams, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 292, 179, 30));

        sbq_def_pt.setEditable(false);
        sbq_def_pt.setBackground(new java.awt.Color(255, 255, 204));
        sbq_def_pt.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        sbq_def_pt.setForeground(new java.awt.Color(51, 0, 255));
        sbq_def_pt.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel3.add(sbq_def_pt, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 364, 152, 30));

        jLabel44.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel44.setText("Damage QTY");
        jPanel3.add(jLabel44, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 328, 80, 30));

        sbq_dam.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sbq_dam.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        sbq_dam.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                sbq_damActionPerformed(evt);
            }
        });
        jPanel3.add(sbq_dam, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 328, 179, 30));

        jLabel47.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel47.setForeground(new java.awt.Color(255, 0, 0));
        jLabel47.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel47.setText("%");
        jLabel47.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel3.add(jLabel47, new org.netbeans.lib.awtextra.AbsoluteConstraints(254, 146, 22, 30));

        jLabel48.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel48.setForeground(new java.awt.Color(255, 0, 0));
        jLabel48.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel48.setText("%");
        jLabel48.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel3.add(jLabel48, new org.netbeans.lib.awtextra.AbsoluteConstraints(252, 220, 22, 30));

        jLabel49.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel49.setForeground(new java.awt.Color(255, 0, 0));
        jLabel49.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel49.setText("%");
        jLabel49.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel3.add(jLabel49, new org.netbeans.lib.awtextra.AbsoluteConstraints(256, 366, 22, 30));

        CB_sbqa.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        CB_sbqa.setText("Availability");
        CB_sbqa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                CB_sbqaActionPerformed(evt);
            }
        });
        jPanel3.add(CB_sbqa, new org.netbeans.lib.awtextra.AbsoluteConstraints(12, 16, -1, 13));

        jLabel57.setFont(new java.awt.Font("Times New Roman", 3, 10)); // NOI18N
        jLabel57.setText("AUDIT REPORT STATUS");
        jPanel3.add(jLabel57, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 10, 120, 20));

        buttonGroup2.add(jrsbqa_y);
        jrsbqa_y.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jrsbqa_y.setText("YES");
        jPanel3.add(jrsbqa_y, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 10, 50, -1));

        buttonGroup2.add(jrsbqa_n);
        jrsbqa_n.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jrsbqa_n.setText("NO");
        jPanel3.add(jrsbqa_n, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 10, 40, -1));

        jPanel1.add(jPanel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(353, 136, 320, 410));

        jTable1.setBackground(new java.awt.Color(255, 255, 153));
        jTable1.setFont(new java.awt.Font("Times New Roman", 0, 10)); // NOI18N
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "ID", "User", "Year", "Month", "Week", "Printer", "Customer", "Style", "SO", "LI", "Graphic", "Combo", "Date", "Time", "GP QTY", "ECA Report", "ECA Name", "ECA Audits", "ECA Pass Audits", "ECA Pass(%)", "ECA Fail Audits", "ECA Fail(%)", "ECA Lot Size", "ECA Sample Size", "ECA Defects", "ECA Defect(%)", "ECA Comment", "SUB QA Report", "SUB QA Name", "SUB QA Audits", "SUB QA Pass Audits", "SUB QA Pass(%)", "SUB QA Fail Audits", "SUB QA Fail(%)", "SUB QA Lot Size", "SUB QA Sample Size", "SUB QA Defects", "SUB QA Defect(%)", "SUB QA Comment", "IN HOUSE QA Name", "IN HOUSE QA Audits", "IN HOUSE QA Pass Audits", "IN HOUSE QA Pass(%)", "IN HOUSE QA Fail Audits", "IN HOUSE QA Fail(%)", "IN HOUSE QA Lot Size", "IN HOUSE QA Sample Size", "IN HOUSE QA Defects", "IN HOUSE QA Defect(%)", "IN HOUSE QA Comment", "Wash Submission", "Wash Result", "Wash Ref. No", "Wash Comment"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Float.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Float.class, java.lang.Integer.class, java.lang.Float.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Float.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Float.class, java.lang.Integer.class, java.lang.Float.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Float.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Float.class, java.lang.Integer.class, java.lang.Float.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Float.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, true, false, false, false, false, false, false, false, false, false, false, false, true, false, true, false, false, false, false, false, false, false, false, false, false, true, true, false, false, false, false, false, false, false, false, false, false, true, false, false, false, false, false, false, false, false, false, false, true, false, true, true, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable1.setAutoResizeMode(javax.swing.JTable.AUTO_RESIZE_OFF);
        jScrollPane2.setViewportView(jTable1);

        jPanel1.add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(19, 578, 1300, 80));

        jPanel5.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "IN-HOUSE QA AUDIT", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 12))); // NOI18N
        jPanel5.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        ihq_no_aud.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        ihq_no_aud.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        ihq_no_aud.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                ihq_no_audMouseClicked(evt);
            }
        });
        ihq_no_aud.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ihq_no_audActionPerformed(evt);
            }
        });
        jPanel5.add(ihq_no_aud, new org.netbeans.lib.awtextra.AbsoluteConstraints(94, 72, 174, 30));

        jLabel34.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel34.setText("Name");
        jPanel5.add(jLabel34, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 36, 80, 30));

        jLabel35.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel35.setText("No of Audit");
        jPanel5.add(jLabel35, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 72, 80, 30));

        jLabel36.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel36.setText("Pass Audits");
        jPanel5.add(jLabel36, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 108, 80, 30));

        jLabel37.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel37.setText("Pass(%)");
        jPanel5.add(jLabel37, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 144, 80, 30));

        jLabel38.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel38.setText("Fail Audits");
        jPanel5.add(jLabel38, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 182, 80, 30));

        jLabel39.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel39.setText("Fail(%)");
        jPanel5.add(jLabel39, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 218, 80, 30));

        jLabel40.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel40.setText("Lot Size");
        jPanel5.add(jLabel40, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 256, 80, 30));

        jLabel41.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel41.setText("Sample Size");
        jPanel5.add(jLabel41, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 292, 80, 30));

        jLabel42.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel42.setText("Defect(%)");
        jPanel5.add(jLabel42, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 365, 80, 30));

        ihq_name.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        ihq_name.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        ihq_name.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                ihq_nameMouseClicked(evt);
            }
        });
        ihq_name.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ihq_nameActionPerformed(evt);
            }
        });
        ihq_name.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                ihq_nameKeyReleased(evt);
            }
        });
        jPanel5.add(ihq_name, new org.netbeans.lib.awtextra.AbsoluteConstraints(94, 36, 174, 30));

        ihq_pa_aud.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        ihq_pa_aud.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        ihq_pa_aud.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ihq_pa_audActionPerformed(evt);
            }
        });
        jPanel5.add(ihq_pa_aud, new org.netbeans.lib.awtextra.AbsoluteConstraints(94, 108, 174, 30));

        ihq_pa_pt.setEditable(false);
        ihq_pa_pt.setBackground(new java.awt.Color(255, 255, 204));
        ihq_pa_pt.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        ihq_pa_pt.setForeground(new java.awt.Color(51, 0, 255));
        ihq_pa_pt.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel5.add(ihq_pa_pt, new org.netbeans.lib.awtextra.AbsoluteConstraints(94, 144, 150, 30));

        ihq_fa_aud.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        ihq_fa_aud.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        ihq_fa_aud.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ihq_fa_audActionPerformed(evt);
            }
        });
        jPanel5.add(ihq_fa_aud, new org.netbeans.lib.awtextra.AbsoluteConstraints(94, 182, 174, 30));

        ihq_fa_pt.setEditable(false);
        ihq_fa_pt.setBackground(new java.awt.Color(255, 255, 204));
        ihq_fa_pt.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        ihq_fa_pt.setForeground(new java.awt.Color(51, 0, 255));
        ihq_fa_pt.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel5.add(ihq_fa_pt, new org.netbeans.lib.awtextra.AbsoluteConstraints(94, 218, 150, 30));

        ihq_lots.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        ihq_lots.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        ihq_lots.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ihq_lotsActionPerformed(evt);
            }
        });
        jPanel5.add(ihq_lots, new org.netbeans.lib.awtextra.AbsoluteConstraints(94, 256, 174, 30));

        ihq_sams.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        ihq_sams.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        ihq_sams.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ihq_samsActionPerformed(evt);
            }
        });
        jPanel5.add(ihq_sams, new org.netbeans.lib.awtextra.AbsoluteConstraints(94, 292, 174, 30));

        ihq_def_pt.setEditable(false);
        ihq_def_pt.setBackground(new java.awt.Color(255, 255, 204));
        ihq_def_pt.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        ihq_def_pt.setForeground(new java.awt.Color(51, 0, 255));
        ihq_def_pt.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel5.add(ihq_def_pt, new org.netbeans.lib.awtextra.AbsoluteConstraints(94, 365, 147, 30));

        jLabel45.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel45.setText("Damage QTY");
        jPanel5.add(jLabel45, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 328, 80, 30));

        ihq_dam.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        ihq_dam.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        ihq_dam.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ihq_damActionPerformed(evt);
            }
        });
        jPanel5.add(ihq_dam, new org.netbeans.lib.awtextra.AbsoluteConstraints(94, 328, 174, 30));

        jLabel50.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel50.setForeground(new java.awt.Color(255, 0, 0));
        jLabel50.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel50.setText("%");
        jLabel50.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel5.add(jLabel50, new org.netbeans.lib.awtextra.AbsoluteConstraints(248, 146, 22, 30));

        jLabel51.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel51.setForeground(new java.awt.Color(255, 0, 0));
        jLabel51.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel51.setText("%");
        jLabel51.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel5.add(jLabel51, new org.netbeans.lib.awtextra.AbsoluteConstraints(248, 220, 22, 30));

        jLabel52.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel52.setForeground(new java.awt.Color(255, 0, 0));
        jLabel52.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel52.setText("%");
        jLabel52.setBorder(javax.swing.BorderFactory.createBevelBorder(javax.swing.border.BevelBorder.RAISED));
        jPanel5.add(jLabel52, new org.netbeans.lib.awtextra.AbsoluteConstraints(245, 367, 22, 30));

        CB_ihqa.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        CB_ihqa.setText("Availability");
        CB_ihqa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                CB_ihqaActionPerformed(evt);
            }
        });
        jPanel5.add(CB_ihqa, new org.netbeans.lib.awtextra.AbsoluteConstraints(12, 16, -1, 13));

        jPanel1.add(jPanel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(677, 136, 290, 410));

        jList1.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jList1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jList1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jList1);

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(1178, 146, 140, 210));

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel2.setText("RECEIVED DATE");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(770, 40, 100, 30));

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel3.setText("GATE PASS QTY");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(560, 80, 100, 30));

        add_li.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        add_li.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                add_liMouseClicked(evt);
            }
        });
        add_li.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                add_liActionPerformed(evt);
            }
        });
        jPanel1.add(add_li, new org.netbeans.lib.awtextra.AbsoluteConstraints(520, 80, 30, 30));

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel4.setText("MONTH");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 40, 50, 30));

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel5.setText("PRINTER");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(1050, 40, 70, 30));

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel6.setText("GRAPHIC NO");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(770, 80, 90, 30));

        co_printer.setFont(new java.awt.Font("Times New Roman", 0, 10)); // NOI18N
        co_printer.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT PRINTING PLANT-" }));
        co_printer.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                co_printerActionPerformed(evt);
            }
        });
        jPanel1.add(co_printer, new org.netbeans.lib.awtextra.AbsoluteConstraints(1160, 40, 160, 30));

        jLabel7.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel7.setText("YEAR");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 40, 40, 30));

        jLabel9.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel9.setText("SO");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(270, 80, 20, 30));

        add_gpq.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        add_gpq.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                add_gpqMouseClicked(evt);
            }
        });
        add_gpq.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                add_gpqActionPerformed(evt);
            }
        });
        jPanel1.add(add_gpq, new org.netbeans.lib.awtextra.AbsoluteConstraints(660, 80, 100, 30));

        co_month.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_month.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT MONTH-", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }));
        co_month.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                co_monthActionPerformed(evt);
            }
        });
        jPanel1.add(co_month, new org.netbeans.lib.awtextra.AbsoluteConstraints(330, 40, 170, 30));

        co_week.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_week.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT WEEK-", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52" }));
        co_week.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                co_weekActionPerformed(evt);
            }
        });
        jPanel1.add(co_week, new org.netbeans.lib.awtextra.AbsoluteConstraints(590, 40, 170, 30));

        jDateChooser1.setDateFormatString("yyyy-MM-dd");
        jPanel1.add(jDateChooser1, new org.netbeans.lib.awtextra.AbsoluteConstraints(880, 40, 160, 30));

        jLabel10.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel10.setText("WEEK NO");
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(520, 40, 70, 30));

        add_so.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        add_so.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                add_soMouseClicked(evt);
            }
        });
        add_so.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                add_soActionPerformed(evt);
            }
        });
        jPanel1.add(add_so, new org.netbeans.lib.awtextra.AbsoluteConstraints(330, 80, 170, 30));

        jLabel11.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel11.setText("LI");
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(500, 80, 20, 30));

        add_grpn.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        add_grpn.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                add_grpnMouseClicked(evt);
            }
        });
        add_grpn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                add_grpnActionPerformed(evt);
            }
        });
        jPanel1.add(add_grpn, new org.netbeans.lib.awtextra.AbsoluteConstraints(880, 80, 160, 30));

        jLabel12.setFont(new java.awt.Font("Times New Roman", 0, 11)); // NOI18N
        jLabel12.setText("CUSTOMER");
        jPanel1.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(1130, 80, 60, 30));

        add_table.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        add_table.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/buttonadd.png"))); // NOI18N
        add_table.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                add_tableActionPerformed(evt);
            }
        });
        jPanel1.add(add_table, new org.netbeans.lib.awtextra.AbsoluteConstraints(1110, 540, 200, 30));

        add_dbase.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        add_dbase.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/save.png"))); // NOI18N
        add_dbase.setText("ADD AUDIT");
        add_dbase.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                add_dbaseActionPerformed(evt);
            }
        });
        jPanel1.add(add_dbase, new org.netbeans.lib.awtextra.AbsoluteConstraints(1140, 670, 180, 30));

        ResetAll.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        ResetAll.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/buttonremove.png"))); // NOI18N
        ResetAll.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ResetAllActionPerformed(evt);
            }
        });
        jPanel1.add(ResetAll, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 670, 170, 30));

        jPanel4.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "WASH STATUS", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 12))); // NOI18N
        jPanel4.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel53.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel53.setText("Wash Submit");
        jPanel4.add(jLabel53, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 20, -1, 30));

        jLabel54.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel54.setText("Wash Result");
        jPanel4.add(jLabel54, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 60, -1, 30));

        co_submit.setFont(new java.awt.Font("Times New Roman", 0, 10)); // NOI18N
        co_submit.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT-", "YES", "NO" }));
        jPanel4.add(co_submit, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 20, 80, 30));

        co_result.setFont(new java.awt.Font("Times New Roman", 0, 10)); // NOI18N
        co_result.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT-", "PASS", "FAIL", "PENDING" }));
        jPanel4.add(co_result, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 60, 80, 30));

        jLabel55.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel55.setText("Ref. Number");
        jPanel4.add(jLabel55, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 104, -1, 20));

        TA_com_wash.setColumns(20);
        TA_com_wash.setRows(5);
        TA_com_wash.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                TA_com_washMouseClicked(evt);
            }
        });
        jScrollPane3.setViewportView(TA_com_wash);

        jPanel4.add(jScrollPane3, new org.netbeans.lib.awtextra.AbsoluteConstraints(16, 145, 151, 60));

        jLabel58.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel58.setText("Wash Comments");
        jPanel4.add(jLabel58, new org.netbeans.lib.awtextra.AbsoluteConstraints(20, 130, -1, -1));

        txt_ref.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        txt_ref.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                txt_refMouseClicked(evt);
            }
        });
        txt_ref.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txt_refActionPerformed(evt);
            }
        });
        jPanel4.add(txt_ref, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 100, 80, 30));

        jPanel1.add(jPanel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(978, 140, 190, 220));

        sdate.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        sdate.setForeground(new java.awt.Color(0, 0, 153));
        sdate.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        sdate.setText("DATE");
        jPanel1.add(sdate, new org.netbeans.lib.awtextra.AbsoluteConstraints(1170, 10, 150, 20));

        timel.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        timel.setForeground(new java.awt.Color(255, 0, 0));
        timel.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        timel.setText("TIME");
        jPanel1.add(timel, new org.netbeans.lib.awtextra.AbsoluteConstraints(1040, 10, 100, 20));

        rightm.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        rightm.setForeground(new java.awt.Color(255, 51, 0));
        rightm.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/okn.png"))); // NOI18N
        jPanel1.add(rightm, new org.netbeans.lib.awtextra.AbsoluteConstraints(1310, 540, 30, 30));

        jLabel13.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel13.setText("COMBO");
        jPanel1.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(1040, 80, 50, 30));

        jLabel14.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jLabel14.setText("STYLE");
        jPanel1.add(jLabel14, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 80, -1, 30));

        ad_style.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        ad_style.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                ad_styleMouseClicked(evt);
            }
        });
        ad_style.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ad_styleActionPerformed(evt);
            }
        });
        jPanel1.add(ad_style, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 80, 150, 30));

        co_customer.setFont(new java.awt.Font("Times New Roman", 0, 10)); // NOI18N
        co_customer.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT CUSTOMER" }));
        jPanel1.add(co_customer, new org.netbeans.lib.awtextra.AbsoluteConstraints(1190, 80, 130, 30));
        jPanel1.add(jYearChooser1, new org.netbeans.lib.awtextra.AbsoluteConstraints(87, 40, 150, 30));

        jButton1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/delete.png"))); // NOI18N
        jButton1.setText("CLEAR TABLE");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 670, 160, 30));

        jButton2.setFont(new java.awt.Font("Times New Roman", 1, 10)); // NOI18N
        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Add/clean.png"))); // NOI18N
        jButton2.setText("CLEAR ALL");
        jButton2.setActionCommand("CLEAR");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(973, 540, 130, 30));

        jPanel6.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Audit Comments", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 14))); // NOI18N

        TA_com_eca.setColumns(20);
        TA_com_eca.setRows(5);
        TA_com_eca.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                TA_com_ecaMouseClicked(evt);
            }
        });
        jScrollPane4.setViewportView(TA_com_eca);

        TA_com_sbqa.setColumns(20);
        TA_com_sbqa.setRows(5);
        TA_com_sbqa.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                TA_com_sbqaMouseClicked(evt);
            }
        });
        jScrollPane5.setViewportView(TA_com_sbqa);

        TA_com_ihqa.setColumns(20);
        TA_com_ihqa.setRows(5);
        TA_com_ihqa.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                TA_com_ihqaMouseClicked(evt);
            }
        });
        jScrollPane6.setViewportView(TA_com_ihqa);

        javax.swing.GroupLayout jPanel6Layout = new javax.swing.GroupLayout(jPanel6);
        jPanel6.setLayout(jPanel6Layout);
        jPanel6Layout.setHorizontalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane4)
                    .addComponent(jScrollPane5, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 308, Short.MAX_VALUE)
                    .addComponent(jScrollPane6))
                .addContainerGap())
        );
        jPanel6Layout.setVerticalGroup(
            jPanel6Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel6Layout.createSequentialGroup()
                .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane5, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane6, javax.swing.GroupLayout.PREFERRED_SIZE, 41, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel1.add(jPanel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(980, 360, 340, 170));

        insid.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        insid.setForeground(new java.awt.Color(0, 102, 0));
        insid.setText("ID");
        jPanel1.add(insid, new org.netbeans.lib.awtextra.AbsoluteConstraints(930, 10, 80, 20));

        add_combn1.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        add_combn1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                add_combn1MouseClicked(evt);
            }
        });
        add_combn1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                add_combn1ActionPerformed(evt);
            }
        });
        jPanel1.add(add_combn1, new org.netbeans.lib.awtextra.AbsoluteConstraints(1090, 80, 40, 30));

        getContentPane().add(jPanel1);
        jPanel1.setBounds(0, 0, 1340, 740);

        setSize(new java.awt.Dimension(1356, 779));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void add_tableActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_add_tableActionPerformed

        String year = "";
        String month = "";
        String weekno = "";
        String printer = "";
        String customer = "";
        String style = "";
        String SO = "";
        String li = "";
        int gpqty = 0;
        String grapno = "";
        String cono = "";
        String timev = "";

        float ins_id = Float.parseFloat(insid.getText().trim());
        year = Integer.toString(jYearChooser1.getValue());
//        month = co_month.getSelectedItem().toString();
//        weekno = co_week.getSelectedItem().toString();

//        Date d = new Date();
//        DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
//        String date = df.format(d);
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
        String redate = dFormat.format(jDateChooser1.getDate());
//        String redate = sdate.getText();
        printer = co_printer.getSelectedItem().toString();
        customer = co_customer.getSelectedItem().toString();
        style = ad_style.getText();
        SO = add_so.getText();
        li = add_li.getText();
        gpqty = Converter.getIntValue(add_gpq.getText());
        grapno = add_grpn.getText();
        cono = txt_ref.getText();
        timev = timel.getText();
        EncapData ed = new EncapData();
        String user = ed.getUname();

//        Query should call from another button.....................................................
//        Auditing ad = new Auditing();
//        ad.setAuditGeneralData(ins_id, year, month, weekno, redate, printer, customer, style, SO, li, gpqty, grapno, cono);
//        rightm.setText("Added");
//        Add ECA Audit Details
        String eca_nam = "";
        int eno_audit = 0;
        int epass_audit = 0;
        float epass_pt = 0;
        int efail_audit = 0;
        float efail_pt = 0;
        int elotsi = 0;
        int esams = 0;
        int edamage = 0;
        float edefect_pt = 0;
        String e_comment = "";
        String ecarep_st = "";

        if (jreca_y.isSelected()) {
            ecarep_st = "YES";
        } else if (jreca_n.isSelected()) {
            ecarep_st = "NO";
        }
        eca_nam = eca_name.getText();
        eno_audit = Converter.getIntValue(eca_no_aud.getText());
        epass_audit = Converter.getIntValue(eca_pa_aud.getText());
        epass_pt = Converter.getFloatValue(eca_pa_pt.getText());
        efail_audit = Converter.getIntValue(eca_fa_aud.getText());
        efail_pt = Converter.getFloatValue(eca_fa_pt.getText());
        elotsi = Converter.getIntValue(eca_lots.getText());
        esams = Converter.getIntValue(eca_sams.getText());
        edamage = Converter.getIntValue(eca_dam.getText());
        edefect_pt = Converter.getFloatValue(eca_def_pt.getText());
        e_comment = TA_com_eca.getText();

        System.out.println("eca");

//        Add SUB QA Details
        String sb_name = "";
        int sbno_audit = 0;
        int sbpass_audit = 0;
        float sbpass_pt = 0;
        int sbfail_audit = 0;
        float sbfail_pt = 0;
        int sblotsi = 0;
        int sbsams = 0;
        int sbdamage = 0;
        float sbdefect_pt = 0;
        String sb_comment = "";
        String sbqarep_st = "";

        if (jrsbqa_y.isSelected()) {
            sbqarep_st = "YES";
        } else if (jrsbqa_n.isSelected()) {
            sbqarep_st = "NO";
        }
        sb_name = sbq_name.getText();
        sbno_audit = Converter.getIntValue(sbq_no_aud.getText());
        sbpass_audit = Converter.getIntValue(sbq_pa_aud.getText());
        sbpass_pt = Converter.getFloatValue(sbq_pa_pt.getText());
        sbfail_audit = Converter.getIntValue(sbq_fa_aud.getText());
        sbfail_pt = Converter.getFloatValue(sbq_fa_pt.getText());
        sblotsi = Converter.getIntValue(sbq_lots.getText());
        sbsams = Converter.getIntValue(sbq_sams.getText());
        sbdamage = Converter.getIntValue(sbq_dam.getText());
        sbdefect_pt = Converter.getFloatValue(sbq_def_pt.getText());
        sb_comment = TA_com_sbqa.getText();

        System.out.println("sub qa");

//        Add IN_HOUSE QA Details
        String ih_name = "";
        int ihno_audit = 0;
        int ihpass_audit = 0;
        float ihpass_pt = 0;
        int ihfail_audit = 0;
        float ihfail_pt = 0;
        int ihlotsi = 0;
        int ihsams = 0;
        int ihdamage = 0;
        float ihdefect_pt = 0;
        String ih_comment = "";

        ih_name = ihq_name.getText();
        ihno_audit = Converter.getIntValue(ihq_no_aud.getText());
        ihpass_audit = Converter.getIntValue(ihq_pa_aud.getText());
        ihpass_pt = Converter.getFloatValue(ihq_pa_pt.getText());
        ihfail_audit = Converter.getIntValue(ihq_fa_aud.getText());
        ihfail_pt = Converter.getFloatValue(ihq_fa_pt.getText());
        ihlotsi = Converter.getIntValue(ihq_lots.getText());
        ihsams = Converter.getIntValue(ihq_sams.getText());
        ihdamage = Converter.getIntValue(ihq_dam.getText());
        ihdefect_pt = Converter.getFloatValue(ihq_def_pt.getText());
        ih_comment = TA_com_ihqa.getText();

        System.out.println("in house qa");

//       Add Wash Details
        String submit = "";
        String result = "";
        String ref_No = "";
        String w_comment = "";

        if (co_month.getSelectedIndex() == 0) {
            JOptionPane.showMessageDialog(null, "select valid month");
        } else if (co_week.getSelectedIndex() == 0) {
            JOptionPane.showMessageDialog(null, "select valid week");
        } else if (co_submit.getSelectedIndex() == 0) {
            JOptionPane.showMessageDialog(null, "select wash submission status");
        } else if (co_result.getSelectedIndex() == 0) {
            JOptionPane.showMessageDialog(null, "select wash result");
        } else {
            month = co_month.getSelectedItem().toString();
            weekno = co_week.getSelectedItem().toString();
            submit = co_submit.getSelectedItem().toString();
            System.out.println("submission-" + submit);
            result = co_result.getSelectedItem().toString();
            System.out.println("Result-" + result);
            ref_No = txt_ref.getText();
            w_comment = TA_com_wash.getText();
            DefaultTableModel ddt = (DefaultTableModel) jTable1.getModel();
            try {
                Object abj[] = {
                    ins_id, user, year, month, weekno, printer, customer, style, SO, li, grapno, cono, redate, timev, gpqty,
                    ecarep_st, eca_nam, eno_audit, epass_audit, epass_pt, efail_audit, efail_pt, elotsi, esams, edamage, edefect_pt, e_comment,
                    sbqarep_st, sb_name, sbno_audit, sbpass_audit, sbpass_pt, sbfail_audit, sbfail_pt, sblotsi, sbsams, sbdamage, sbdefect_pt, sb_comment,
                    ih_name, ihno_audit, ihpass_audit, ihpass_pt, ihfail_audit, ihfail_pt, ihlotsi, ihsams, ihdamage, ihdefect_pt, ih_comment,
                    submit, result, ref_No, w_comment};
                ddt.addRow(abj);
                CB_eca.setSelected(false);
                CB_sbqa.setSelected(false);
                CB_ihqa.setSelected(false);
                setNewInspectionId();
                insid.setText(new Converter().getStringLongValue(getInspectionId()));
                rightm.setVisible(true);
                setInitials();
                setDisable();
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Table adding error");
                e.printStackTrace();
            }
        }

    }//GEN-LAST:event_add_tableActionPerformed

    private void eca_nameKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_eca_nameKeyReleased
        status = 1;
        String audname = eca_name.getText();
        String printern = co_printer.getSelectedItem().toString();

        Searching sech = new Searching();
        List list = new ArrayList();
        list = sech.getAuditorName(audname, printern);

        Vector v = new Vector();

        int c = list.size() - 1;

        for (int i = 0; i <= c; i++) {
            v.add(list.get(i));
        }

        if (v.size() > 0) {
            jList1.setListData(v);
        }
    }//GEN-LAST:event_eca_nameKeyReleased

    private void sbq_nameKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_sbq_nameKeyReleased
        status = 2;
        String audname = sbq_name.getText();
        String printern = "MAS-SB";

        Searching sech = new Searching();
        List list = new ArrayList();
        list = sech.getAuditorName(audname, printern);

        Vector v = new Vector();

        int c = list.size() - 1;

        for (int i = 0; i <= c; i++) {
            v.add(list.get(i));
        }

        if (v.size() > 0) {
            jList1.setListData(v);
        }
    }//GEN-LAST:event_sbq_nameKeyReleased

    private void ihq_nameKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_ihq_nameKeyReleased
        status = 3;
        String audname = ihq_name.getText();
        String printern = "MAS-IH";

        Searching sech = new Searching();
        List list = new ArrayList();
        list = sech.getAuditorName(audname, printern);

        Vector v = new Vector();

        int c = list.size() - 1;

        for (int i = 0; i <= c; i++) {
            v.add(list.get(i));
        }

        if (v.size() > 0) {
            jList1.setListData(v);
        }
    }//GEN-LAST:event_ihq_nameKeyReleased

    private void jList1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jList1MouseClicked
        if (status == 1) {
            eca_name.setText(jList1.getSelectedValue());
        } else if (status == 2) {
            sbq_name.setText(jList1.getSelectedValue());
        } else if (status == 3) {
            ihq_name.setText(jList1.getSelectedValue());
        }
    }//GEN-LAST:event_jList1MouseClicked

    private void eca_pa_audActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_eca_pa_audActionPerformed
        float eno_audit = Converter.getFloatValue(eca_no_aud.getText());
        float epass_audit = Converter.getFloatValue(eca_pa_aud.getText());

        eca_pa_pt.setText(getPercentage(epass_audit, eno_audit));
        eca_fa_aud.requestFocus();
        eca_fa_aud.selectAll();
    }//GEN-LAST:event_eca_pa_audActionPerformed

    private void eca_nameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_eca_nameActionPerformed
        eca_no_aud.requestFocus();
    }//GEN-LAST:event_eca_nameActionPerformed

    private void eca_no_audActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_eca_no_audActionPerformed
        eca_pa_aud.requestFocus();
        eca_pa_aud.selectAll();
    }//GEN-LAST:event_eca_no_audActionPerformed

    private void eca_fa_audActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_eca_fa_audActionPerformed
        float eno_audit = Converter.getFloatValue(eca_no_aud.getText());
        float efail_audit = Converter.getFloatValue(eca_fa_aud.getText());

        eca_fa_pt.setText(getPercentage(efail_audit, eno_audit));
        eca_lots.requestFocus();
        eca_lots.selectAll();
    }//GEN-LAST:event_eca_fa_audActionPerformed

    private void eca_lotsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_eca_lotsActionPerformed
        eca_sams.requestFocus();
        eca_sams.selectAll();
    }//GEN-LAST:event_eca_lotsActionPerformed

    private void eca_samsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_eca_samsActionPerformed
        eca_dam.requestFocus();
        eca_dam.selectAll();
    }//GEN-LAST:event_eca_samsActionPerformed

    private void eca_damActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_eca_damActionPerformed
        float esams = Converter.getFloatValue(eca_sams.getText());
        float edamage = Converter.getFloatValue(eca_dam.getText());

        eca_def_pt.setText(getPercentage(edamage, esams));
//        sbq_name.requestFocus();
    }//GEN-LAST:event_eca_damActionPerformed

    private void sbq_nameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sbq_nameActionPerformed
        sbq_no_aud.requestFocus();
    }//GEN-LAST:event_sbq_nameActionPerformed

    private void sbq_no_audActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sbq_no_audActionPerformed
        sbq_pa_aud.requestFocus();
        sbq_pa_aud.selectAll();
    }//GEN-LAST:event_sbq_no_audActionPerformed

    private void sbq_pa_audActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sbq_pa_audActionPerformed
        float sbno_audit = Converter.getFloatValue(sbq_no_aud.getText());
        float sbpass_audit = Converter.getFloatValue(sbq_pa_aud.getText());

        sbq_pa_pt.setText(getPercentage(sbpass_audit, sbno_audit));
        sbq_fa_aud.requestFocus();
        sbq_fa_aud.selectAll();
    }//GEN-LAST:event_sbq_pa_audActionPerformed

    private void sbq_fa_audActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sbq_fa_audActionPerformed
        float sbno_audit = Converter.getFloatValue(sbq_no_aud.getText());
        float sbfail_audit = Converter.getFloatValue(sbq_fa_aud.getText());

        sbq_fa_pt.setText(getPercentage(sbfail_audit, sbno_audit));
        sbq_lots.requestFocus();
        sbq_lots.selectAll();
    }//GEN-LAST:event_sbq_fa_audActionPerformed

    private void sbq_lotsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sbq_lotsActionPerformed
        sbq_sams.requestFocus();
        sbq_sams.selectAll();
    }//GEN-LAST:event_sbq_lotsActionPerformed

    private void sbq_samsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sbq_samsActionPerformed
        sbq_dam.requestFocus();
        sbq_dam.selectAll();
    }//GEN-LAST:event_sbq_samsActionPerformed

    private void sbq_damActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_sbq_damActionPerformed
        float sbdamage = Converter.getFloatValue(sbq_dam.getText());
        float sbsams = Converter.getFloatValue(sbq_sams.getText());

        sbq_def_pt.setText(getPercentage(sbdamage, sbsams));
    }//GEN-LAST:event_sbq_damActionPerformed

    private void ihq_nameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ihq_nameActionPerformed
        ihq_no_aud.requestFocus();
    }//GEN-LAST:event_ihq_nameActionPerformed

    private void ihq_no_audActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ihq_no_audActionPerformed
        ihq_pa_aud.requestFocus();
        ihq_pa_aud.selectAll();
    }//GEN-LAST:event_ihq_no_audActionPerformed

    private void ihq_pa_audActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ihq_pa_audActionPerformed
        float ihno_audit = Converter.getFloatValue(ihq_no_aud.getText());
        float ihpass_audit = Converter.getFloatValue(ihq_pa_aud.getText());

        ihq_pa_pt.setText(getPercentage(ihpass_audit, ihno_audit));
        ihq_fa_aud.requestFocus();
        ihq_fa_aud.selectAll();
    }//GEN-LAST:event_ihq_pa_audActionPerformed

    private void ihq_fa_audActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ihq_fa_audActionPerformed
        float ihno_audit = Converter.getFloatValue(ihq_no_aud.getText());
        float ihfail_audit = Converter.getFloatValue(ihq_fa_aud.getText());

        ihq_fa_pt.setText(getPercentage(ihfail_audit, ihno_audit));
        ihq_lots.requestFocus();
        ihq_lots.selectAll();
    }//GEN-LAST:event_ihq_fa_audActionPerformed

    private void ihq_lotsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ihq_lotsActionPerformed
        ihq_sams.requestFocus();
        ihq_sams.selectAll();
    }//GEN-LAST:event_ihq_lotsActionPerformed

    private void ihq_samsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ihq_samsActionPerformed
        ihq_dam.requestFocus();
        ihq_dam.selectAll();
    }//GEN-LAST:event_ihq_samsActionPerformed

    private void ihq_damActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ihq_damActionPerformed
        float ihsams = Converter.getFloatValue(ihq_sams.getText());
        float ihdamage = Converter.getFloatValue(ihq_dam.getText());

        ihq_def_pt.setText(getPercentage(ihdamage, ihsams));
    }//GEN-LAST:event_ihq_damActionPerformed

    private void co_monthActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_co_monthActionPerformed
        co_week.requestFocus();
    }//GEN-LAST:event_co_monthActionPerformed

    private void co_weekActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_co_weekActionPerformed
        jDateChooser1.requestFocus();
    }//GEN-LAST:event_co_weekActionPerformed

    private void co_printerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_co_printerActionPerformed
        ad_style.requestFocus();
    }//GEN-LAST:event_co_printerActionPerformed

    private void add_soActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_add_soActionPerformed
        add_li.requestFocus();
        add_li.selectAll();
    }//GEN-LAST:event_add_soActionPerformed

    private void ad_styleActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ad_styleActionPerformed
        add_so.requestFocus();
        add_so.selectAll();
    }//GEN-LAST:event_ad_styleActionPerformed

    private void add_liActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_add_liActionPerformed
        add_gpq.requestFocus();
        add_gpq.selectAll();
    }//GEN-LAST:event_add_liActionPerformed

    private void add_gpqActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_add_gpqActionPerformed
        add_grpn.requestFocus();
        add_grpn.selectAll();
    }//GEN-LAST:event_add_gpqActionPerformed

    private void add_grpnActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_add_grpnActionPerformed
        txt_ref.requestFocus();
        txt_ref.selectAll();
    }//GEN-LAST:event_add_grpnActionPerformed

    private void txt_refActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txt_refActionPerformed
        co_customer.requestFocus();
    }//GEN-LAST:event_txt_refActionPerformed

    private void ResetAllActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ResetAllActionPerformed
        removeRow();
    }//GEN-LAST:event_ResetAllActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        clearTable();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        setInitials();
        setDisable();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void add_dbaseActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_add_dbaseActionPerformed
//Need to add data to db codes...2/28 & data deletion/ reportings with graph & 
        int counter = 0;
        int i = jTable1.getRowCount();
        System.out.println("row count=" + i);

        float insid = 0;
        String year = "";
        String month = "";
        String weekno = "";
        String date = "";
        String printer = "";
        String customer = "";
        String style = "";
        String SO = "";
        String li = "";
        int gpqty = 0;
        String grapno = "";
        String cono = "";
        String user = "";
        String time = "";

        String eca_name = "";
        int eno_audit = 0;
        int epass_audit = 0;
        float epass_pt = 0;
        int efail_audit = 0;
        float efail_pt = 0;
        int elotsi = 0;
        int esams = 0;
        int edamage = 0;
        float edefect_pt = 0;
        String e_comment = "";

        String sb_name = "";
        int sbno_audit = 0;
        int sbpass_audit = 0;
        float sbpass_pt = 0;
        int sbfail_audit = 0;
        float sbfail_pt = 0;
        int sblotsi = 0;
        int sbsams = 0;
        int sbdamage = 0;
        float sbdefect_pt = 0;
        String sb_comment = "";

        String ih_name = "";
        int ihno_audit = 0;
        int ihpass_audit = 0;
        float ihpass_pt = 0;
        int ihfail_audit = 0;
        float ihfail_pt = 0;
        int ihlotsi = 0;
        int ihsams = 0;
        int ihdamage = 0;
        float ihdefect_pt = 0;
        String ih_comment = "";

        String submit = "";
        String result = "";
        String ref_No = "";
        String w_comment = "";
        String Prd_Feedback = "No Feedbacks";
        String Prd_Module = "";

        if (i > 0) {
            while (counter < i) {
//            getValueAt(Row, Column);
                insid = Converter.getFloatValue(jTable1.getValueAt(counter, 0).toString());
                System.out.println("Ins ID=" + insid);
                user = jTable1.getValueAt(counter, 1).toString();
                year = jTable1.getValueAt(counter, 2).toString();
                month = jTable1.getValueAt(counter, 3).toString();
                weekno = jTable1.getValueAt(counter, 4).toString();
                printer = jTable1.getValueAt(counter, 5).toString();
                customer = jTable1.getValueAt(counter, 6).toString();
                style = jTable1.getValueAt(counter, 7).toString();
                SO = jTable1.getValueAt(counter, 8).toString();
                li = jTable1.getValueAt(counter, 9).toString();
                grapno = jTable1.getValueAt(counter, 10).toString();
                cono = jTable1.getValueAt(counter, 11).toString();
                date = jTable1.getValueAt(counter, 12).toString();
                time = jTable1.getValueAt(counter, 13).toString();
                gpqty = Converter.getIntValue(jTable1.getValueAt(counter, 14).toString());

                Auditing ad = new Auditing();
                ad.setAuditGeneralData(insid, year, month, weekno, date, printer, customer, style, SO, li, gpqty, grapno, cono, time, user, Prd_Feedback, Prd_Module);

                String ecarep_st = jTable1.getValueAt(counter, 15).toString();
                eca_name = jTable1.getValueAt(counter, 16).toString();
                eno_audit = Converter.getIntValue(jTable1.getValueAt(counter, 17).toString());
//            System.out.println("eca n-audits=" + eno_audit);
                epass_audit = Converter.getIntValue(jTable1.getValueAt(counter, 18).toString());
                epass_pt = Converter.getFloatValue(jTable1.getValueAt(counter, 19).toString());
                efail_audit = Converter.getIntValue(jTable1.getValueAt(counter, 20).toString());
                efail_pt = Converter.getFloatValue(jTable1.getValueAt(counter, 21).toString());
                elotsi = Converter.getIntValue(jTable1.getValueAt(counter, 22).toString());
                esams = Converter.getIntValue(jTable1.getValueAt(counter, 23).toString());
                edamage = Converter.getIntValue(jTable1.getValueAt(counter, 24).toString());
                edefect_pt = Converter.getFloatValue(jTable1.getValueAt(counter, 25).toString());
                e_comment = jTable1.getValueAt(counter, 26).toString();
                ad.setAuditECAData(insid, eca_name, eno_audit, epass_audit, epass_pt, efail_audit, efail_pt, elotsi, esams, edamage, edefect_pt, e_comment, ecarep_st);

                String sbqarep_st = jTable1.getValueAt(counter, 27).toString();
                sb_name = jTable1.getValueAt(counter, 28).toString();
                sbno_audit = Converter.getIntValue(jTable1.getValueAt(counter, 29).toString());
                sbpass_audit = Converter.getIntValue(jTable1.getValueAt(counter, 30).toString());
                sbpass_pt = Converter.getFloatValue(jTable1.getValueAt(counter, 31).toString());
                sbfail_audit = Converter.getIntValue(jTable1.getValueAt(counter, 32).toString());
                sbfail_pt = Converter.getFloatValue(jTable1.getValueAt(counter, 33).toString());
                sblotsi = Converter.getIntValue(jTable1.getValueAt(counter, 34).toString());
                sbsams = Converter.getIntValue(jTable1.getValueAt(counter, 35).toString());
                sbdamage = Converter.getIntValue(jTable1.getValueAt(counter, 36).toString());
                sbdefect_pt = Converter.getFloatValue(jTable1.getValueAt(counter, 37).toString());
                sb_comment = jTable1.getValueAt(counter, 38).toString();
                ad.setAuditSBQAData(insid, sb_name, sbno_audit, sbpass_audit, sbpass_pt, sbfail_audit, sbfail_pt, sblotsi, sbsams, sbdamage, sbdefect_pt, sb_comment, sbqarep_st);

                ih_name = jTable1.getValueAt(counter, 39).toString();
                ihno_audit = Converter.getIntValue(jTable1.getValueAt(counter, 40).toString());
                ihpass_audit = Converter.getIntValue(jTable1.getValueAt(counter, 41).toString());
                ihpass_pt = Converter.getFloatValue(jTable1.getValueAt(counter, 42).toString());
                ihfail_audit = Converter.getIntValue(jTable1.getValueAt(counter, 43).toString());
                ihfail_pt = Converter.getFloatValue(jTable1.getValueAt(counter, 44).toString());
                ihlotsi = Converter.getIntValue(jTable1.getValueAt(counter, 45).toString());
                ihsams = Converter.getIntValue(jTable1.getValueAt(counter, 46).toString());
                ihdamage = Converter.getIntValue(jTable1.getValueAt(counter, 47).toString());
                ihdefect_pt = Converter.getFloatValue(jTable1.getValueAt(counter, 48).toString());
                ih_comment = jTable1.getValueAt(counter, 49).toString();
                ad.setAuditIHQAData(insid, ih_name, ihno_audit, ihpass_audit, ihpass_pt, ihfail_audit, ihfail_pt, ihlotsi, ihsams, ihdamage, ihdefect_pt, ih_comment);

                submit = jTable1.getValueAt(counter, 50).toString();
                result = jTable1.getValueAt(counter, 51).toString();
                ref_No = jTable1.getValueAt(counter, 52).toString();
                w_comment = jTable1.getValueAt(counter, 53).toString();
                ad.setAuditWashData(insid, submit, result, w_comment, ref_No);

                counter++;
            }
            JOptionPane.showMessageDialog(null, "Audits were successfully aded to the database");
            clearTable();
        } else {
            JOptionPane.showMessageDialog(null, "Please add audits data to the table before aded to the database");
        }
    }//GEN-LAST:event_add_dbaseActionPerformed

    private void CB_ecaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_CB_ecaActionPerformed
        if (CB_eca.isSelected() == true) {
            eca_name.enable();
            eca_name.show();
            eca_no_aud.enable();
            eca_pa_aud.enable();
            eca_pa_pt.enable();
            eca_fa_aud.enable();
            eca_fa_pt.enable();
            eca_lots.enable();
            eca_sams.enable();
            eca_dam.enable();
            eca_def_pt.enable();
        } else if (CB_eca.isSelected() == false) {
            eca_name.setText("Enter Name");
            eca_no_aud.setText("0");
            eca_pa_aud.setText("0");
            eca_pa_pt.setText("0.0");
            eca_fa_aud.setText("0");
            eca_fa_pt.setText("0.0");
            eca_lots.setText("0");
            eca_sams.setText("0");
            eca_dam.setText("0");
            eca_def_pt.setText("0.0");

            eca_name.disable();
            eca_no_aud.disable();
            eca_pa_aud.disable();
            eca_pa_pt.disable();
            eca_fa_aud.disable();
            eca_fa_pt.disable();
            eca_lots.disable();
            eca_sams.disable();
            eca_dam.disable();
            eca_def_pt.disable();
        }

    }//GEN-LAST:event_CB_ecaActionPerformed

    private void CB_sbqaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_CB_sbqaActionPerformed
        if (CB_sbqa.isSelected() == true) {
            sbq_name.enable();
            sbq_no_aud.enable();
            sbq_pa_aud.enable();
            sbq_pa_pt.enable();
            sbq_fa_aud.enable();
            sbq_fa_pt.enable();
            sbq_lots.enable();
            sbq_sams.enable();
            sbq_dam.enable();
            sbq_def_pt.enable();
        } else if (CB_sbqa.isSelected() == false) {
            sbq_name.setText("Enter Name");
            sbq_no_aud.setText("0");
            sbq_pa_aud.setText("0");
            sbq_pa_pt.setText("0.0");
            sbq_fa_aud.setText("0");
            sbq_fa_pt.setText("0.0");
            sbq_lots.setText("0");
            sbq_sams.setText("0");
            sbq_dam.setText("0");
            sbq_def_pt.setText("0.0");

            sbq_name.disable();
            sbq_no_aud.disable();
            sbq_pa_aud.disable();
            sbq_pa_pt.disable();
            sbq_fa_aud.disable();
            sbq_fa_pt.disable();
            sbq_lots.disable();
            sbq_sams.disable();
            sbq_dam.disable();
            sbq_def_pt.disable();
        }
    }//GEN-LAST:event_CB_sbqaActionPerformed

    private void CB_ihqaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_CB_ihqaActionPerformed
        if (CB_ihqa.isSelected() == true) {
            ihq_name.enable();
            ihq_no_aud.enable();
            ihq_pa_aud.enable();
            ihq_pa_pt.enable();
            ihq_fa_aud.enable();
            ihq_fa_pt.enable();
            ihq_lots.enable();
            ihq_sams.enable();
            ihq_dam.enable();
            ihq_def_pt.enable();
        } else if (CB_ihqa.isSelected() == false) {
            ihq_name.setText("Enter Name");
            ihq_no_aud.setText("0");
            ihq_pa_aud.setText("0");
            ihq_pa_pt.setText("0.0");
            ihq_fa_aud.setText("0");
            ihq_fa_pt.setText("0.0");
            ihq_lots.setText("0");
            ihq_sams.setText("0");
            ihq_dam.setText("0");
            ihq_def_pt.setText("0.0");

            ihq_name.disable();
            ihq_no_aud.disable();
            ihq_pa_aud.disable();
            ihq_pa_pt.disable();
            ihq_fa_aud.disable();
            ihq_fa_pt.disable();
            ihq_lots.disable();
            ihq_sams.disable();
            ihq_dam.disable();
            ihq_def_pt.disable();
        }
    }//GEN-LAST:event_CB_ihqaActionPerformed

    private void TA_com_washMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_TA_com_washMouseClicked
        TA_com_wash.setText("");
    }//GEN-LAST:event_TA_com_washMouseClicked

    private void TA_com_ecaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_TA_com_ecaMouseClicked
        TA_com_eca.setText("");
    }//GEN-LAST:event_TA_com_ecaMouseClicked

    private void TA_com_sbqaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_TA_com_sbqaMouseClicked
        TA_com_sbqa.setText("");
    }//GEN-LAST:event_TA_com_sbqaMouseClicked

    private void TA_com_ihqaMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_TA_com_ihqaMouseClicked
        TA_com_ihqa.setText("");
    }//GEN-LAST:event_TA_com_ihqaMouseClicked

    private void eca_no_audMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_eca_no_audMouseClicked
        eca_no_aud.selectAll();
    }//GEN-LAST:event_eca_no_audMouseClicked

    private void sbq_no_audMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_sbq_no_audMouseClicked
        sbq_no_aud.selectAll();
    }//GEN-LAST:event_sbq_no_audMouseClicked

    private void ihq_no_audMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_ihq_no_audMouseClicked
        ihq_no_aud.selectAll();
    }//GEN-LAST:event_ihq_no_audMouseClicked

    private void add_gpqMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_add_gpqMouseClicked
        add_gpq.selectAll();
    }//GEN-LAST:event_add_gpqMouseClicked

    private void ad_styleMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_ad_styleMouseClicked
        ad_style.selectAll();
    }//GEN-LAST:event_ad_styleMouseClicked

    private void add_soMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_add_soMouseClicked
        add_so.selectAll();
    }//GEN-LAST:event_add_soMouseClicked

    private void add_liMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_add_liMouseClicked
        add_li.selectAll();
    }//GEN-LAST:event_add_liMouseClicked

    private void add_grpnMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_add_grpnMouseClicked
        add_grpn.selectAll();
    }//GEN-LAST:event_add_grpnMouseClicked

    private void txt_refMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_txt_refMouseClicked
        txt_ref.selectAll();
    }//GEN-LAST:event_txt_refMouseClicked

    private void eca_nameMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_eca_nameMouseClicked
        eca_name.selectAll();
    }//GEN-LAST:event_eca_nameMouseClicked

    private void sbq_nameMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_sbq_nameMouseClicked
        sbq_name.selectAll();
    }//GEN-LAST:event_sbq_nameMouseClicked

    private void ihq_nameMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_ihq_nameMouseClicked
        ihq_name.selectAll();
    }//GEN-LAST:event_ihq_nameMouseClicked

    private void add_combn1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_add_combn1MouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_add_combn1MouseClicked

    private void add_combn1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_add_combn1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_add_combn1ActionPerformed

    private void setDisable() {
        eca_name.disable();
        eca_no_aud.disable();
        eca_pa_aud.disable();
        eca_pa_pt.disable();
        eca_fa_aud.disable();
        eca_fa_pt.disable();
        eca_lots.disable();
        eca_sams.disable();
        eca_dam.disable();
        eca_def_pt.disable();

        sbq_name.disable();
        sbq_no_aud.disable();
        sbq_pa_aud.disable();
        sbq_pa_pt.disable();
        sbq_fa_aud.disable();
        sbq_fa_pt.disable();
        sbq_lots.disable();
        sbq_sams.disable();
        sbq_dam.disable();
        sbq_def_pt.disable();

        ihq_name.disable();
        ihq_no_aud.disable();
        ihq_pa_aud.disable();
        ihq_pa_pt.disable();
        ihq_fa_aud.disable();
        ihq_fa_pt.disable();
        ihq_lots.disable();
        ihq_sams.disable();
        ihq_dam.disable();
        ihq_def_pt.disable();
    }

    private void setInitials() {
////        Need to clear jyearchooser field................................................???? ->ok
        String sdates = sdate.getText().toString();
        String parts[] = sdates.split("-");
        System.out.println("year=" + parts[0]);
        jYearChooser1.setValue(Converter.getIntValue(parts[0]));

        co_month.setSelectedIndex(0);
        co_week.setSelectedIndex(0);
//        Need to clear jdatechooser field................................................???? ->ok

        Date d = new Date();
        jDateChooser1.setDate(d);
        co_printer.setSelectedIndex(0);
        co_customer.setSelectedIndex(0);
        ad_style.setText("Enter Style");
        add_so.setText("Enter SO");
        add_li.setText("LI");
        add_gpq.setText("0");
        add_grpn.setText("Enter Graphic");
        txt_ref.setText("Com");

        eca_name.setText("Enter Name");
        eca_no_aud.setText("0");
        eca_pa_aud.setText("0");
        eca_pa_pt.setText("0.0");
        eca_fa_aud.setText("0");
        eca_fa_pt.setText("0.0");
        eca_lots.setText("0");
        eca_sams.setText("0");
        eca_dam.setText("0");
        eca_def_pt.setText("0.0");

        sbq_name.setText("Enter Name");
        sbq_no_aud.setText("0");
        sbq_pa_aud.setText("0");
        sbq_pa_pt.setText("0.0");
        sbq_fa_aud.setText("0");
        sbq_fa_pt.setText("0.0");
        sbq_lots.setText("0");
        sbq_sams.setText("0");
        sbq_dam.setText("0");
        sbq_def_pt.setText("0.0");

        ihq_name.setText("Enter Name");
        ihq_no_aud.setText("0");
        ihq_pa_aud.setText("0");
        ihq_pa_pt.setText("0.0");
        ihq_fa_aud.setText("0");
        ihq_fa_pt.setText("0.0");
        ihq_lots.setText("0");
        ihq_sams.setText("0");
        ihq_dam.setText("0");
        ihq_def_pt.setText("0.0");

        co_submit.setSelectedIndex(0);
        co_result.setSelectedIndex(0);
        txt_ref.setText("");
        setDefaults();
        rightm.setVisible(false);
        jList1.setListData(new Vector());
    }

    private void setDefaults() {
        TA_com_eca.setText("Enter ECA Audit comments");
        TA_com_sbqa.setText("Enater Sub QA Audit comments");
        TA_com_ihqa.setText("Enter Inhouse QA Audit comments");
        TA_com_wash.setText("Enter wash comments");
    }

    private void removeRow() {
        try {
            DefaultTableModel ddf = (DefaultTableModel) jTable1.getModel();
            ddf.removeRow(jTable1.getSelectedRow());
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
            java.util.logging.Logger.getLogger(AddAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(AddAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(AddAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(AddAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {

            public void run() {
                new AddAudit().setVisible(true);
            }

        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JCheckBox CB_eca;
    private javax.swing.JCheckBox CB_ihqa;
    private javax.swing.JCheckBox CB_sbqa;
    private javax.swing.JButton ResetAll;
    private javax.swing.JTextArea TA_com_eca;
    private javax.swing.JTextArea TA_com_ihqa;
    private javax.swing.JTextArea TA_com_sbqa;
    private javax.swing.JTextArea TA_com_wash;
    private javax.swing.JTextField ad_style;
    private javax.swing.JTextField add_combn1;
    private javax.swing.JButton add_dbase;
    private javax.swing.JTextField add_gpq;
    private javax.swing.JTextField add_grpn;
    private javax.swing.JTextField add_li;
    private javax.swing.JTextField add_so;
    private javax.swing.JButton add_table;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.ButtonGroup buttonGroup2;
    private javax.swing.JComboBox<String> co_customer;
    private javax.swing.JComboBox<String> co_month;
    private javax.swing.JComboBox<String> co_printer;
    private javax.swing.JComboBox<String> co_result;
    private javax.swing.JComboBox<String> co_submit;
    private javax.swing.JComboBox<String> co_week;
    private javax.swing.JTextField eca_dam;
    private javax.swing.JTextField eca_def_pt;
    private javax.swing.JTextField eca_fa_aud;
    private javax.swing.JTextField eca_fa_pt;
    private javax.swing.JTextField eca_lots;
    private javax.swing.JTextField eca_name;
    private javax.swing.JTextField eca_no_aud;
    private javax.swing.JTextField eca_pa_aud;
    private javax.swing.JTextField eca_pa_pt;
    private javax.swing.JTextField eca_sams;
    private javax.swing.JTextField ihq_dam;
    private javax.swing.JTextField ihq_def_pt;
    private javax.swing.JTextField ihq_fa_aud;
    private javax.swing.JTextField ihq_fa_pt;
    private javax.swing.JTextField ihq_lots;
    private javax.swing.JTextField ihq_name;
    private javax.swing.JTextField ihq_no_aud;
    private javax.swing.JTextField ihq_pa_aud;
    private javax.swing.JTextField ihq_pa_pt;
    private javax.swing.JTextField ihq_sams;
    private javax.swing.JLabel insid;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private com.toedter.calendar.JDateChooser jDateChooser1;
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
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel27;
    private javax.swing.JLabel jLabel28;
    private javax.swing.JLabel jLabel29;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel30;
    private javax.swing.JLabel jLabel31;
    private javax.swing.JLabel jLabel32;
    private javax.swing.JLabel jLabel33;
    private javax.swing.JLabel jLabel34;
    private javax.swing.JLabel jLabel35;
    private javax.swing.JLabel jLabel36;
    private javax.swing.JLabel jLabel37;
    private javax.swing.JLabel jLabel38;
    private javax.swing.JLabel jLabel39;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel40;
    private javax.swing.JLabel jLabel41;
    private javax.swing.JLabel jLabel42;
    private javax.swing.JLabel jLabel43;
    private javax.swing.JLabel jLabel44;
    private javax.swing.JLabel jLabel45;
    private javax.swing.JLabel jLabel46;
    private javax.swing.JLabel jLabel47;
    private javax.swing.JLabel jLabel48;
    private javax.swing.JLabel jLabel49;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel50;
    private javax.swing.JLabel jLabel51;
    private javax.swing.JLabel jLabel52;
    private javax.swing.JLabel jLabel53;
    private javax.swing.JLabel jLabel54;
    private javax.swing.JLabel jLabel55;
    private javax.swing.JLabel jLabel56;
    private javax.swing.JLabel jLabel57;
    private javax.swing.JLabel jLabel58;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JList<String> jList1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanel5;
    private javax.swing.JPanel jPanel6;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JScrollPane jScrollPane5;
    private javax.swing.JScrollPane jScrollPane6;
    private javax.swing.JTable jTable1;
    private com.toedter.calendar.JYearChooser jYearChooser1;
    private javax.swing.JRadioButton jreca_n;
    private javax.swing.JRadioButton jreca_y;
    private javax.swing.JRadioButton jrsbqa_n;
    private javax.swing.JRadioButton jrsbqa_y;
    private javax.swing.JLabel rightm;
    private javax.swing.JTextField sbq_dam;
    private javax.swing.JTextField sbq_def_pt;
    private javax.swing.JTextField sbq_fa_aud;
    private javax.swing.JTextField sbq_fa_pt;
    private javax.swing.JTextField sbq_lots;
    private javax.swing.JTextField sbq_name;
    private javax.swing.JTextField sbq_no_aud;
    private javax.swing.JTextField sbq_pa_aud;
    private javax.swing.JTextField sbq_pa_pt;
    private javax.swing.JTextField sbq_sams;
    private javax.swing.JLabel sdate;
    private javax.swing.JLabel timel;
    private javax.swing.JTextField txt_ref;
    // End of variables declaration//GEN-END:variables
}
