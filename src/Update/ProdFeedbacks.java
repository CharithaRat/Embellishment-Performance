/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Update;

import dao.Searching;
import dao.Update;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;
import javax.swing.JOptionPane;
import util.JDBCConnector;

/**
 *
 * @author windows
 */
public class ProdFeedbacks extends javax.swing.JFrame {

    static float selectId;

    public ProdFeedbacks() {
        initComponents();
        setDate();
        Time();
        setGraphic();
        setCombo();
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

    private void setGraphic() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Ins_Graphic FROM dbo.InsGeneralDet";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String name1 = rs.getString("Ins_Graphic");
                co_graphic.addItem(name1);
            }
        } catch (Exception ex) {
        }
    }

    private void setCombo() {

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT DISTINCT Ins_Combo FROM dbo.InsGeneralDet";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String name1 = rs.getString("Ins_Combo");
                co_combo.addItem(name1);
            }
        } catch (Exception ex) {
        }
    }

    HashMap<String, Float> id = new HashMap<String, Float>();

    public List getReceivedDate(String style, String graphic, String combo) {

        List list = new ArrayList();
        String pdate = "";
        float ids;
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT Ins_Date, Ins_Id FROM dbo.InsGeneralDet WHERE Ins_Style LIKE'" + style + "%' and Ins_Graphic = '" + graphic + "' and Ins_Combo = '" + combo + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                pdate = rs.getString("Ins_Date");
                list.add(pdate);
                ids = rs.getFloat("Ins_Id");
                System.out.println("ID number's -> " + ids);
                id.put(pdate, ids);
            }
        } catch (Exception ex) {
        }
        return list;
    }

    private List getdata(Float id) {
        List pfdata = new ArrayList();
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT Ins_Style, Ins_Date, Ins_Printer, Ins_GpQTY, Ins_Prd_Feedback FROM dbo.InsGeneralDet where Ins_Id = '" + id + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String style = rs.getString("Ins_Style");
                pfdata.add(style);
                String date = rs.getString("Ins_Date");
                pfdata.add(date);
                String printer = rs.getString("Ins_Printer");
                pfdata.add(printer);
                String GPQ = rs.getString("Ins_GpQTY");
                pfdata.add(GPQ);
                String prdFe = rs.getString("Ins_Prd_Feedback");
                pfdata.add(prdFe);
            }
        } catch (Exception ex) {
        }
        return pfdata;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        sdate = new javax.swing.JLabel();
        timel = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        txt_style = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList<>();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        co_graphic = new javax.swing.JComboBox<>();
        co_combo = new javax.swing.JComboBox<>();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        txt_date = new javax.swing.JTextField();
        txt_printer = new javax.swing.JTextField();
        txt_aod = new javax.swing.JTextField();
        jScrollPane2 = new javax.swing.JScrollPane();
        ta_current = new javax.swing.JTextArea();
        jLabel9 = new javax.swing.JLabel();
        co_module = new javax.swing.JComboBox<>();
        jLabel10 = new javax.swing.JLabel();
        jScrollPane3 = new javax.swing.JScrollPane();
        ta_new = new javax.swing.JTextArea();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setResizable(false);

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        jLabel1.setText("PRODUCTION FEEDBACKS");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(31, 21, 279, 25));

        sdate.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        sdate.setForeground(new java.awt.Color(0, 0, 204));
        sdate.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        sdate.setText("DATE");
        jPanel1.add(sdate, new org.netbeans.lib.awtextra.AbsoluteConstraints(538, 23, 111, 25));

        timel.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        timel.setForeground(new java.awt.Color(255, 0, 0));
        timel.setHorizontalAlignment(javax.swing.SwingConstants.RIGHT);
        timel.setText("TIME");
        jPanel1.add(timel, new org.netbeans.lib.awtextra.AbsoluteConstraints(431, 21, 89, 27));

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel2.setText("Style Number");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(31, 132, 105, 26));

        txt_style.setBackground(new java.awt.Color(204, 255, 204));
        txt_style.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_style.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        txt_style.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txt_styleKeyReleased(evt);
            }
        });
        jPanel1.add(txt_style, new org.netbeans.lib.awtextra.AbsoluteConstraints(154, 133, 213, 26));

        jList1.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jList1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jList1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jList1);

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(419, 66, 230, 330));

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("Graphic Number");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(31, 66, 105, 26));

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setText("Combo Number");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(31, 99, 105, 26));

        co_graphic.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_graphic.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT GRAPHIC NUMBER" }));
        jPanel1.add(co_graphic, new org.netbeans.lib.awtextra.AbsoluteConstraints(154, 67, 213, 26));

        co_combo.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_combo.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT COMBO NUMBER" }));
        jPanel1.add(co_combo, new org.netbeans.lib.awtextra.AbsoluteConstraints(154, 100, 213, 26));

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setText("Date");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(31, 165, 105, 26));

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel6.setText("Printer");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(31, 198, 105, 26));

        jLabel7.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel7.setText("AOD Quantity");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(31, 231, 105, 26));

        jLabel8.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel8.setText("Current Feedbacks");
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(31, 264, 116, 26));

        txt_date.setEditable(false);
        txt_date.setBackground(new java.awt.Color(204, 204, 255));
        txt_date.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_date.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel1.add(txt_date, new org.netbeans.lib.awtextra.AbsoluteConstraints(154, 166, 213, 26));

        txt_printer.setEditable(false);
        txt_printer.setBackground(new java.awt.Color(204, 204, 255));
        txt_printer.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_printer.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel1.add(txt_printer, new org.netbeans.lib.awtextra.AbsoluteConstraints(154, 199, 213, 26));

        txt_aod.setEditable(false);
        txt_aod.setBackground(new java.awt.Color(204, 204, 255));
        txt_aod.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        txt_aod.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel1.add(txt_aod, new org.netbeans.lib.awtextra.AbsoluteConstraints(154, 232, 213, 26));

        ta_current.setColumns(20);
        ta_current.setRows(5);
        jScrollPane2.setViewportView(ta_current);

        jPanel1.add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(154, 264, 213, 56));

        jLabel9.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel9.setText("Module Number");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(31, 336, 116, 26));

        co_module.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_module.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "SELECT MODULE NUMBER", "CL001", "CL002", "CL003", "CL004", "CL005", "CL006", "CL007", "CL008", "CL009", "CL010", "CL011", "CL012", "CL013", "CL014", "CL015", "CL016", "CL017", "CL018", "CL019", "CL020", "CL021", "CL022", "CL023", "CL024", "CL025", "CL026", "CL027", "CL028", "CL029", "CL030", "CL031", "CL032", "CL033", "CL034", "CL035", "CL036", "CL037", "CL038", "CL039", "CL040", "CL041", "CL042", "CL043", "CL044", "CL045", "CL046", "CL047", "CL048", "CL049", "CL050" }));
        jPanel1.add(co_module, new org.netbeans.lib.awtextra.AbsoluteConstraints(154, 337, 213, 26));

        jLabel10.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel10.setText("New Feedbacks");
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(31, 381, 116, 26));

        ta_new.setColumns(20);
        ta_new.setRows(5);
        jScrollPane3.setViewportView(ta_new);

        jPanel1.add(jScrollPane3, new org.netbeans.lib.awtextra.AbsoluteConstraints(154, 381, 213, 79));

        jButton1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jButton1.setText("CLEAR ALL");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(530, 420, 120, 30));

        jButton2.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jButton2.setText("UPDATE");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(420, 420, 90, 30));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        setSize(new java.awt.Dimension(696, 519));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void txt_styleKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txt_styleKeyReleased
        String graphic = "";
        String combo = "";
        String style = "";
        if (co_graphic.getSelectedIndex() != 0) {
            graphic = co_graphic.getSelectedItem().toString();
        } else {
            JOptionPane.showMessageDialog(null, "Select valid graphic number");
        }
        if (co_combo.getSelectedIndex() != 0) {
            combo = co_combo.getSelectedItem().toString();
        } else {
            JOptionPane.showMessageDialog(null, "Select valid combo number");
        }
        style = txt_style.getText().trim();

        List list = new ArrayList();
        list = getReceivedDate(style, graphic, combo);

        Vector v = new Vector();

        int c = list.size() - 1;

        for (int i = 0; i <= c; i++) {
            v.add(list.get(i));
        }

        if (v.size() > 0) {
            jList1.setListData(v);
        }
    }//GEN-LAST:event_txt_styleKeyReleased

    private void jList1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jList1MouseClicked
        String prdate = jList1.getSelectedValue();

        selectId = id.get(prdate);
        System.out.println("id -> " + selectId);
        List pfdet = getdata(selectId);

        for (int i = 0; i < pfdet.size(); i++) {
            System.out.println("Value " + i + pfdet.get(i));
        }

        txt_style.setText(pfdet.get(0).toString());
        txt_date.setText(pfdet.get(1).toString());
        txt_printer.setText(pfdet.get(2).toString());
        txt_aod.setText(pfdet.get(3).toString());
        ta_current.setText(pfdet.get(4).toString());

    }//GEN-LAST:event_jList1MouseClicked

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        co_graphic.setSelectedIndex(0);
        co_combo.setSelectedIndex(0);
        txt_style.setText("");
        txt_date.setText("");
        txt_printer.setText("");
        txt_aod.setText("");
        ta_current.setText("");
        ta_current.setText("");
        co_module.setSelectedIndex(0);
        ta_new.setText("");

        jList1.setListData(new Vector());
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        String currFeedback = "";
        String nPrdFeedback = "";
        String pmodule = "";
        String finFeedback = "";

        if (co_module.getSelectedIndex() == 0) {
            JOptionPane.showMessageDialog(this, "Enter valid module number");
        } else if (ta_current.getText().equals("") || ta_new.getText().equals("")) {
            JOptionPane.showMessageDialog(this, "Enter valid production feedbacks");
        } else {
            currFeedback = ta_current.getText();
            nPrdFeedback = ta_new.getText();
            pmodule = co_module.getSelectedItem().toString();

            finFeedback = "Previous Production Feedbacks -> " + currFeedback + " " + "New Production Feedbacks to Module No " + pmodule + " -> " + nPrdFeedback;

            Update ud = new Update();
            ud.updateProductionFeedbacks(selectId, finFeedback, pmodule);

            JOptionPane.showMessageDialog(this, "Production feedback updated");

            co_graphic.setSelectedIndex(0);
            co_combo.setSelectedIndex(0);
            txt_style.setText("");
            txt_date.setText("");
            txt_printer.setText("");
            txt_aod.setText("");
            ta_current.setText("");
            ta_current.setText("");
            co_module.setSelectedIndex(0);
            ta_new.setText("");

            jList1.setListData(new Vector());
        }
//        --------------------------------------------------------------------------------------------
    }//GEN-LAST:event_jButton2ActionPerformed

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
            java.util.logging.Logger.getLogger(ProdFeedbacks.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(ProdFeedbacks.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(ProdFeedbacks.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(ProdFeedbacks.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new ProdFeedbacks().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> co_combo;
    private javax.swing.JComboBox<String> co_graphic;
    private javax.swing.JComboBox<String> co_module;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JList<String> jList1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JLabel sdate;
    private javax.swing.JTextArea ta_current;
    private javax.swing.JTextArea ta_new;
    private javax.swing.JLabel timel;
    private javax.swing.JTextField txt_aod;
    private javax.swing.JTextField txt_date;
    private javax.swing.JTextField txt_printer;
    private javax.swing.JTextField txt_style;
    // End of variables declaration//GEN-END:variables
}
