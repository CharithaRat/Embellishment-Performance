package Reflection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import util.JDBCConnector;

/**
 *
 * @author windows
 */
public class ViewAuditDetails extends javax.swing.JFrame {

    /**
     * Creates new form ViewAuditDetails
     */
    public ViewAuditDetails() {
        initComponents();
        setDate();
        setYear();
        setMonth();
        setPrinter();
        setCustomer();
        JTable table1 = jTable1;
        table1.getTableHeader().setReorderingAllowed(false);
        Date d = new Date();
        jDateChooser1.setDate(d);
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
            String sql = "SELECT DISTINCT Ins_Customer FROM dbo.InsGeneralDet";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String cus = rs.getString("Ins_Customer");
                co_customer.addItem(cus);
            }
        } catch (Exception ex) {
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jPanel2 = new javax.swing.JPanel();
        jLabel5 = new javax.swing.JLabel();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        spc_wash = new javax.swing.JRadioButton();
        jLabel6 = new javax.swing.JLabel();
        co_customer = new javax.swing.JComboBox<>();
        jPanel3 = new javax.swing.JPanel();
        co_printer = new javax.swing.JComboBox<>();
        jLabel3 = new javax.swing.JLabel();
        co_month = new javax.swing.JComboBox<>();
        jLabel2 = new javax.swing.JLabel();
        co_year = new javax.swing.JComboBox<>();
        jLabel1 = new javax.swing.JLabel();
        ecap = new javax.swing.JRadioButton();
        subp = new javax.swing.JRadioButton();
        inhp = new javax.swing.JRadioButton();
        com_wash = new javax.swing.JRadioButton();
        Rep_R_Status = new javax.swing.JRadioButton();
        prd_feedback = new javax.swing.JRadioButton();
        f_detail = new javax.swing.JRadioButton();
        bond_pb_ad = new javax.swing.JRadioButton();
        mas_hs_ad = new javax.swing.JRadioButton();
        bond_lam_ad = new javax.swing.JRadioButton();
        mas_hs_wash = new javax.swing.JRadioButton();
        jLabel4 = new javax.swing.JLabel();
        sdate = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Check Table", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 0, 11))); // NOI18N
        jPanel1.setPreferredSize(new java.awt.Dimension(1296, 600));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jTable1.setFocusable(false);
        jScrollPane1.setViewportView(jTable1);

        jButton1.setFont(new java.awt.Font("Trebuchet MS", 1, 14)); // NOI18N
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/Reflection/search2.png"))); // NOI18N
        jButton1.setText("SEARCH DETAILS");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jPanel2.setBackground(new java.awt.Color(204, 204, 255));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Wash Test Search Option(Date Wise)", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 0, 12), new java.awt.Color(255, 51, 0))); // NOI18N

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setText("CUSTOMER");

        jDateChooser1.setDateFormatString("yyyy-MM-dd");

        buttonGroup1.add(spc_wash);
        spc_wash.setFont(new java.awt.Font("Tahoma", 3, 11)); // NOI18N
        spc_wash.setForeground(new java.awt.Color(0, 102, 0));
        spc_wash.setText("Wash Test Details to selected date");

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel6.setText("DATE");

        co_customer.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_customer.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-Select Customer-" }));

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jDateChooser1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(spc_wash, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 252, Short.MAX_VALUE)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 91, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(co_customer, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(co_customer, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jDateChooser1, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(spc_wash)
                .addContainerGap())
        );

        jPanel3.setBackground(new java.awt.Color(255, 255, 255));
        jPanel3.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Common Search Options", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 0, 12), new java.awt.Color(0, 0, 204))); // NOI18N

        co_printer.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_printer.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-Select Printer-" }));

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("EMBELLISHMENT SUPPLIER");

        co_month.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_month.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-Select Month-" }));

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel2.setText("MONTH");

        co_year.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_year.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-Select Year-" }));

        jLabel1.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel1.setText("YEAR");

        buttonGroup1.add(ecap);
        ecap.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        ecap.setForeground(new java.awt.Color(51, 0, 51));
        ecap.setText("ECA Performance");

        buttonGroup1.add(subp);
        subp.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        subp.setForeground(new java.awt.Color(51, 0, 51));
        subp.setText("SUB QA Performance");

        buttonGroup1.add(inhp);
        inhp.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        inhp.setForeground(new java.awt.Color(51, 0, 51));
        inhp.setText("IN-HOUSE QA Performance");

        buttonGroup1.add(com_wash);
        com_wash.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        com_wash.setForeground(new java.awt.Color(51, 0, 51));
        com_wash.setText("Wash Test Results");

        buttonGroup1.add(Rep_R_Status);
        Rep_R_Status.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        Rep_R_Status.setForeground(new java.awt.Color(51, 0, 51));
        Rep_R_Status.setText("Report Receving Status");

        buttonGroup1.add(prd_feedback);
        prd_feedback.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        prd_feedback.setForeground(new java.awt.Color(51, 0, 51));
        prd_feedback.setText("Production Feedbacks");

        buttonGroup1.add(f_detail);
        f_detail.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        f_detail.setForeground(new java.awt.Color(51, 0, 51));
        f_detail.setText("Full Audit Details");

        buttonGroup1.add(bond_pb_ad);
        bond_pb_ad.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        bond_pb_ad.setForeground(new java.awt.Color(51, 0, 51));
        bond_pb_ad.setText("Bondville Peelbond Audits");

        buttonGroup1.add(mas_hs_ad);
        mas_hs_ad.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        mas_hs_ad.setForeground(new java.awt.Color(51, 0, 51));
        mas_hs_ad.setText("MAS HS Audits");

        buttonGroup1.add(bond_lam_ad);
        bond_lam_ad.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        bond_lam_ad.setForeground(new java.awt.Color(51, 0, 51));
        bond_lam_ad.setText("Bondville Lamination Audits");

        buttonGroup1.add(mas_hs_wash);
        mas_hs_wash.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        mas_hs_wash.setForeground(new java.awt.Color(51, 0, 51));
        mas_hs_wash.setText("MAS HS Wash Test Results");

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(22, 22, 22)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 76, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(co_year, javax.swing.GroupLayout.PREFERRED_SIZE, 145, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 24, Short.MAX_VALUE)
                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 94, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(2, 2, 2))
                    .addComponent(inhp)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(ecap, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(subp, javax.swing.GroupLayout.DEFAULT_SIZE, 167, Short.MAX_VALUE))
                        .addGap(20, 20, 20)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(f_detail, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(com_wash, javax.swing.GroupLayout.DEFAULT_SIZE, 172, Short.MAX_VALUE))))
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(0, 18, Short.MAX_VALUE)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(prd_feedback, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(Rep_R_Status, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(24, 24, 24)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(bond_pb_ad, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(bond_lam_ad, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(9, 9, 9)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(mas_hs_ad, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(mas_hs_wash, javax.swing.GroupLayout.DEFAULT_SIZE, 185, Short.MAX_VALUE))
                        .addContainerGap(17, Short.MAX_VALUE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(co_month, 0, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 182, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(co_printer, javax.swing.GroupLayout.PREFERRED_SIZE, 207, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(6, 6, 6))))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(18, 18, 18)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(co_printer, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(co_month, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(co_year, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(ecap)
                    .addComponent(f_detail)
                    .addComponent(Rep_R_Status)
                    .addComponent(bond_pb_ad)
                    .addComponent(mas_hs_ad))
                .addGap(6, 6, 6)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(subp)
                    .addComponent(com_wash)
                    .addComponent(prd_feedback)
                    .addComponent(bond_lam_ad)
                    .addComponent(mas_hs_wash))
                .addGap(8, 8, 8)
                .addComponent(inhp)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jPanel3, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                    .addComponent(jScrollPane1))
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jButton1)
                .addGap(532, 532, 532))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 12, Short.MAX_VALUE)
                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 39, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 364, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(39, 39, 39))
        );

        jLabel4.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        jLabel4.setText("AUDIT SUMMERY - DATA VIWER");

        sdate.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        sdate.setForeground(new java.awt.Color(0, 0, 153));
        sdate.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        sdate.setText("DATE");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(23, 23, 23)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(31, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 581, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(sdate, javax.swing.GroupLayout.PREFERRED_SIZE, 166, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(33, 33, 33))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jLabel4, javax.swing.GroupLayout.DEFAULT_SIZE, 31, Short.MAX_VALUE)
                    .addComponent(sdate, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 660, Short.MAX_VALUE)
                .addGap(37, 37, 37))
        );

        setSize(new java.awt.Dimension(1366, 784));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        DefaultTableModel dft = (DefaultTableModel) jTable1.getModel();

        Vector<String> vas = new Vector<String>();

        String year = "";
        String month = "";
        String printer = "";

        if (!spc_wash.isSelected()) {
            if (co_year.getSelectedIndex() != 0) {
                year = co_year.getSelectedItem().toString();
            } else {
                JOptionPane.showMessageDialog(null, "Enter valid year to get results");
            }
            if (co_month.getSelectedIndex() != 0) {
                month = co_month.getSelectedItem().toString();
            } else {
                JOptionPane.showMessageDialog(null, "Enter valid month to get results");
            }
            if (co_printer.getSelectedIndex() != 0) {
                printer = co_printer.getSelectedItem().toString();
            } else {
                JOptionPane.showMessageDialog(null, "Enter valid printer to get results");
            }
        }
        if (ecap.isSelected()) {
            dft.setColumnCount(0);
            dft.setRowCount(0);
            dft.addColumn("Year");
            dft.addColumn("Month");
            dft.addColumn("Week");
            dft.addColumn("Customer");
            dft.addColumn("Printer");
            dft.addColumn("ECA Pass(%)");
            dft.addColumn("ECA Fail(%)");
            dft.addColumn("ECA Defect(%)");

            Object[] ecad = new Object[8];
            try {
                Connection con = JDBCConnector.getConnection();
                Statement stmt = con.createStatement();
                String sql = "SELECT InsGeneralDet.Ins_Year, InsGeneralDet.Ins_Month, InsGeneralDet.Ins_Week, InsGeneralDet.Ins_Customer, InsGeneralDet.Ins_Printer, InsEcaDet.Eca_PassPt, InsEcaDet.Eca_FailPt, InsEcaDet.Eca_DefPt FROM dbo.InsGeneralDet INNER JOIN dbo.InsEcaDet ON InsGeneralDet.Ins_Id = InsEcaDet.Ins_Id WHERE  dbo.InsGeneralDet.Ins_Year = '" + year + "' and dbo.InsGeneralDet.Ins_Month = '" + month + "' and dbo.InsGeneralDet.Ins_Printer = '" + printer + "'";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {

                    String eyear = rs.getString("Ins_Year");
                    ecad[0] = eyear;
                    String emonth = rs.getString("Ins_Month");
                    ecad[1] = emonth;
                    String eweek = rs.getString("Ins_Week");
                    ecad[2] = eweek;
                    String ecustomer = rs.getString("Ins_Customer");
                    ecad[3] = ecustomer;
                    String eprinter = rs.getString("Ins_Printer");
                    ecad[4] = eprinter;
                    float epasspt = rs.getFloat("Eca_PassPt");
                    ecad[5] = epasspt;
                    float efailpt = rs.getFloat("Eca_FailPt");
                    ecad[6] = efailpt;
                    float edefectpt = rs.getFloat("Eca_DefPt");
                    ecad[7] = edefectpt;

                    dft.addRow(ecad);
                }
            } catch (Exception ex) {
//                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "wrong search! Try Again");
            }
        } else if (subp.isSelected()) {
            dft.setColumnCount(0);
            dft.setRowCount(0);
            dft.addColumn("Year");
            dft.addColumn("Month");
            dft.addColumn("Week");
            dft.addColumn("Customer");
            dft.addColumn("Printer");
            dft.addColumn("SUB QA Pass(%)");
            dft.addColumn("SUB QA Fail(%)");
            dft.addColumn("SUB QA Defect(%)");

            Object[] sqad = new Object[8];
            try {
                Connection con = JDBCConnector.getConnection();
                Statement stmt = con.createStatement();
                String sql = "SELECT InsGeneralDet.Ins_Year, InsGeneralDet.Ins_Month, InsGeneralDet.Ins_Week, InsGeneralDet.Ins_Customer, InsGeneralDet.Ins_Printer, InsSbqaDet.SQA_PassPt, InsSbqaDet.SQA_FailPt, InsSbqaDet.SQA_DefPt FROM dbo.InsGeneralDet INNER JOIN dbo.InsSbqaDet ON InsGeneralDet.Ins_Id = InsSbqaDet.Ins_Id WHERE  dbo.InsGeneralDet.Ins_Year = '" + year + "' and dbo.InsGeneralDet.Ins_Month = '" + month + "' and dbo.InsGeneralDet.Ins_Printer = '" + printer + "'";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {

                    String syear = rs.getString("Ins_Year");
                    sqad[0] = syear;
                    String smonth = rs.getString("Ins_Month");
                    sqad[1] = smonth;
                    String sweek = rs.getString("Ins_Week");
                    sqad[2] = sweek;
                    String scustomer = rs.getString("Ins_Customer");
                    sqad[3] = scustomer;
                    String sprinter = rs.getString("Ins_Printer");
                    sqad[4] = sprinter;
                    float spasspt = rs.getFloat("SQA_PassPt");
                    sqad[5] = spasspt;
                    float sfailpt = rs.getFloat("SQA_FailPt");
                    sqad[6] = sfailpt;
                    float sdefectpt = rs.getFloat("SQA_DefPt");
                    sqad[7] = sdefectpt;

                    dft.addRow(sqad);
                }
            } catch (Exception ex) {
//                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "wrong search! Try Again");
            }
        } else if (inhp.isSelected()) {
            dft.setColumnCount(0);
            dft.setRowCount(0);
            dft.addColumn("Year");
            dft.addColumn("Month");
            dft.addColumn("Week");
            dft.addColumn("Customer");
            dft.addColumn("Printer");
            dft.addColumn("IN-HOUSE QA Pass(%)");
            dft.addColumn("IN-HOUSE QA Fail(%)");
            dft.addColumn("IN-HOUSE QA Defect(%)");

            Object[] iqad = new Object[8];
            try {
                Connection con = JDBCConnector.getConnection();
                Statement stmt = con.createStatement();
                String sql = "SELECT InsGeneralDet.Ins_Year, InsGeneralDet.Ins_Month, InsGeneralDet.Ins_Week, InsGeneralDet.Ins_Customer, InsGeneralDet.Ins_Printer, InsIhqaDet.IHQA_PassPt, InsIhqaDet.IHQA_FailPt, InsIhqaDet.IHQA_DefPt FROM dbo.InsGeneralDet INNER JOIN dbo.InsIhqaDet ON InsGeneralDet.Ins_Id = InsIhqaDet.Ins_Id WHERE  dbo.InsGeneralDet.Ins_Year = '" + year + "' and dbo.InsGeneralDet.Ins_Month = '" + month + "' and dbo.InsGeneralDet.Ins_Printer = '" + printer + "'";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {

                    String iyear = rs.getString("Ins_Year");
                    iqad[0] = iyear;
                    String imonth = rs.getString("Ins_Month");
                    iqad[1] = imonth;
                    String iweek = rs.getString("Ins_Week");
                    iqad[2] = iweek;
                    String icustomer = rs.getString("Ins_Customer");
                    iqad[3] = icustomer;
                    String iprinter = rs.getString("Ins_Printer");
                    iqad[4] = iprinter;
                    String ipasspt = rs.getString("IHQA_PassPt");
                    iqad[5] = ipasspt;
                    String ifailpt = rs.getString("IHQA_FailPt");
                    iqad[6] = ifailpt;
                    String idefectpt = rs.getString("IHQA_DefPt");
                    iqad[7] = idefectpt;

                    dft.addRow(iqad);
                }
            } catch (Exception ex) {
//                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "wrong search! Try Again");
            }
        } else if (Rep_R_Status.isSelected()) {
            dft.setColumnCount(0);
            dft.setRowCount(0);
            dft.addColumn("Year");
            dft.addColumn("Month");
            dft.addColumn("Week");
            dft.addColumn("Date");
            dft.addColumn("Customer");
            dft.addColumn("Printer");
            dft.addColumn("ECA Report Received Status");
            dft.addColumn("SUB QA Report Received Status");

            Object[] reps = new Object[8];
            try {
                Connection con = JDBCConnector.getConnection();
                Statement stmt = con.createStatement();
                String sql = "SELECT InsGeneralDet.Ins_Year, InsGeneralDet.Ins_Month, InsGeneralDet.Ins_Week, InsGeneralDet.Ins_Date, InsGeneralDet.Ins_Customer, InsGeneralDet.Ins_Printer, InsEcaDet.Eca_Rep_St, InsSbqaDet.SQA_Rep_St FROM dbo.InsGeneralDet INNER JOIN dbo.InsEcaDet ON InsGeneralDet.Ins_Id = InsEcaDet.Ins_Id INNER JOIN dbo.InsSbqaDet ON InsGeneralDet.Ins_Id = InsSbqaDet.Ins_Id WHERE  dbo.InsGeneralDet.Ins_Year = '" + year + "' and dbo.InsGeneralDet.Ins_Month = '" + month + "' and dbo.InsGeneralDet.Ins_Printer = '" + printer + "'";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {

                    String ryear = rs.getString("Ins_Year");
                    reps[0] = ryear;
                    String rmonth = rs.getString("Ins_Month");
                    reps[1] = rmonth;
                    String rweek = rs.getString("Ins_Week");
                    reps[2] = rweek;
                    String rdate = rs.getString("Ins_Date");
                    reps[3] = rdate;
                    String rcustomer = rs.getString("Ins_Customer");
                    reps[4] = rcustomer;
                    String rprinter = rs.getString("Ins_Printer");
                    reps[5] = rprinter;
                    String recareps = rs.getString("Eca_Rep_St");
                    reps[6] = recareps;
                    String rsbqareps = rs.getString("SQA_Rep_St");
                    reps[7] = rsbqareps;

                    dft.addRow(reps);
                }
            } catch (Exception ex) {
//                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "wrong search! Try Again");
            }
        } else if (com_wash.isSelected()) {
            dft.setColumnCount(0);
            dft.setRowCount(0);
            dft.addColumn("Year");
            dft.addColumn("Month");
            dft.addColumn("Week");
            dft.addColumn("Date");
            dft.addColumn("Customer");
            dft.addColumn("Printer");
            dft.addColumn("Wash Submission");
            dft.addColumn("Wash Result");
            dft.addColumn("Wash Comment");
            dft.addColumn("Wash Reference No");

            Object[] washd = new Object[10];
            try {
                Connection con = JDBCConnector.getConnection();
                Statement stmt = con.createStatement();
                String sql = "SELECT InsGeneralDet.Ins_Year, InsGeneralDet.Ins_Month, InsGeneralDet.Ins_Week, InsGeneralDet.Ins_Date, InsGeneralDet.Ins_Customer, InsGeneralDet.Ins_Printer, InsWash.Wash_SbStatus, InsWash.Wash_Result, InsWash.Wash_Comment, InsWash.Wash_Ref_No FROM dbo.InsGeneralDet INNER JOIN dbo.InsWash ON InsGeneralDet.Ins_Id = InsWash.Ins_Id WHERE  dbo.InsGeneralDet.Ins_Year = '" + year + "' and dbo.InsGeneralDet.Ins_Month = '" + month + "' and dbo.InsGeneralDet.Ins_Printer = '" + printer + "'";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {

                    String wyear = rs.getString("Ins_Year");
                    washd[0] = wyear;
                    String wmonth = rs.getString("Ins_Month");
                    washd[1] = wmonth;
                    String wweek = rs.getString("Ins_Week");
                    washd[2] = wweek;
                    String wdate = rs.getString("Ins_Date");
                    washd[3] = wdate;
                    String wcustomer = rs.getString("Ins_Customer");
                    washd[4] = wcustomer;
                    String wprinter = rs.getString("Ins_Printer");
                    washd[5] = wprinter;
                    String wstatus = rs.getString("Wash_SbStatus");
                    washd[6] = wstatus;
                    String wresult = rs.getString("Wash_Result");
                    washd[7] = wresult;
                    String wcomment = rs.getString("Wash_Comment");
                    washd[8] = wcomment;
                    String wref = rs.getString("Wash_Ref_No");
                    washd[9] = wref;

                    dft.addRow(washd);
                }
            } catch (Exception ex) {
//                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "wrong search! Try Again");
            }
        } else if (prd_feedback.isSelected()) {
            dft.setColumnCount(0);
            dft.setRowCount(0);
            dft.addColumn("Year");
            dft.addColumn("Month");
            dft.addColumn("Week");
            dft.addColumn("Date");
            dft.addColumn("Customer");
            dft.addColumn("Printer");
            dft.addColumn("Module");
            dft.addColumn("Production Feedbacks");

            Object[] prdf = new Object[8];
            try {
                Connection con = JDBCConnector.getConnection();
                Statement stmt = con.createStatement();
                String sql = "SELECT InsGeneralDet.Ins_Year, InsGeneralDet.Ins_Month, InsGeneralDet.Ins_Week, InsGeneralDet.Ins_Date, InsGeneralDet.Ins_Customer, InsGeneralDet.Ins_Printer, InsGeneralDet.Ins_Module, InsGeneralDet.Ins_Prd_Feedback FROM dbo.InsGeneralDet WHERE  dbo.InsGeneralDet.Ins_Year = '" + year + "' and dbo.InsGeneralDet.Ins_Month = '" + month + "' and dbo.InsGeneralDet.Ins_Printer = '" + printer + "'";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {

                    String prdyear = rs.getString("Ins_Year");
                    prdf[0] = prdyear;
                    String prdmonth = rs.getString("Ins_Month");
                    prdf[1] = prdmonth;
                    String prdweek = rs.getString("Ins_Week");
                    prdf[2] = prdweek;
                    String prddate = rs.getString("Ins_Date");
                    prdf[3] = prddate;
                    String prdcustomer = rs.getString("Ins_Customer");
                    prdf[4] = prdcustomer;
                    String prdprinter = rs.getString("Ins_Printer");
                    prdf[5] = prdprinter;
                    String prdmodule = rs.getString("Ins_Module");
                    prdf[6] = prdmodule;
                    String prdfeedback = rs.getString("Ins_Prd_Feedback");
                    prdf[7] = prdfeedback;

                    dft.addRow(prdf);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "wrong search! Try Again");
            }
        } else if (spc_wash.isSelected()) {
            SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
            String wdate = dFormat.format(jDateChooser1.getDate());

            String cus = "";
            if (co_customer.getSelectedIndex() != 0) {
                cus = co_customer.getSelectedItem().toString();
            } else {
                JOptionPane.showMessageDialog(null, "Enter valid customer to get results ");
            }
            dft.setColumnCount(0);
            dft.setRowCount(0);
            dft.addColumn("Year");
            dft.addColumn("Month");
            dft.addColumn("Week");
            dft.addColumn("Date");
            dft.addColumn("Customer");
            dft.addColumn("Printer");
            dft.addColumn("Wash Submission");
            dft.addColumn("Wash Result");
            dft.addColumn("Wash Comment");
            dft.addColumn("Wash Reference No");

            Object[] washd = new Object[10];
            try {
                Connection con = JDBCConnector.getConnection();
                Statement stmt = con.createStatement();
                String sql = "SELECT InsGeneralDet.Ins_Year, InsGeneralDet.Ins_Month, InsGeneralDet.Ins_Week, InsGeneralDet.Ins_Date, InsGeneralDet.Ins_Customer, InsGeneralDet.Ins_Printer, InsWash.Wash_SbStatus, InsWash.Wash_Result, InsWash.Wash_Comment, InsWash.Wash_Ref_No FROM dbo.InsGeneralDet INNER JOIN dbo.InsWash ON InsGeneralDet.Ins_Id = InsWash.Ins_Id WHERE  dbo.InsGeneralDet.Ins_Date = '" + wdate + "' and dbo.InsGeneralDet.Ins_Customer = '" + cus + "'";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {

                    String wyear = rs.getString("Ins_Year");
                    washd[0] = wyear;
                    String wmonth = rs.getString("Ins_Month");
                    washd[1] = wmonth;
                    String wweek = rs.getString("Ins_Week");
                    washd[2] = wweek;
                    String date = rs.getString("Ins_Date");
                    washd[3] = date;
                    String wcustomer = rs.getString("Ins_Customer");
                    washd[4] = wcustomer;
                    String wprinter = rs.getString("Ins_Printer");
                    washd[5] = wprinter;
                    String wstatus = rs.getString("Wash_SbStatus");
                    washd[6] = wstatus;
                    String wresult = rs.getString("Wash_Result");
                    washd[7] = wresult;
                    String wcomment = rs.getString("Wash_Comment");
                    washd[8] = wcomment;
                    String wref = rs.getString("Wash_Ref_No");
                    washd[9] = wref;

                    dft.addRow(washd);
                }
            } catch (Exception ex) {
//                ex.printStackTrace();
                JOptionPane.showMessageDialog(null, "WRONG SEARCH! Try Again");
            }
        } else if (f_detail.isSelected()) {
//        Full detail reort
        } else if (bond_pb_ad.isSelected()) {
//        Bondville peelbond audit
        } else if (bond_lam_ad.isSelected()) {
//        Bondville lamination audit
        } else if (mas_hs_ad.isSelected()) {
//        HS audit
        } else if (mas_hs_wash.isSelected()) {
//        HS wash
        }

    }//GEN-LAST:event_jButton1ActionPerformed

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
            java.util.logging.Logger.getLogger(ViewAuditDetails.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ViewAuditDetails.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ViewAuditDetails.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ViewAuditDetails.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ViewAuditDetails().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JRadioButton Rep_R_Status;
    private javax.swing.JRadioButton bond_lam_ad;
    private javax.swing.JRadioButton bond_pb_ad;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JComboBox<String> co_customer;
    private javax.swing.JComboBox<String> co_month;
    private javax.swing.JComboBox<String> co_printer;
    private javax.swing.JComboBox<String> co_year;
    private javax.swing.JRadioButton com_wash;
    private javax.swing.JRadioButton ecap;
    private javax.swing.JRadioButton f_detail;
    private javax.swing.JRadioButton inhp;
    private javax.swing.JButton jButton1;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JRadioButton mas_hs_ad;
    private javax.swing.JRadioButton mas_hs_wash;
    private javax.swing.JRadioButton prd_feedback;
    private javax.swing.JLabel sdate;
    private javax.swing.JRadioButton spc_wash;
    private javax.swing.JRadioButton subp;
    // End of variables declaration//GEN-END:variables
}
