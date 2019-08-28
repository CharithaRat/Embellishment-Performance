/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Update;

import static Update.WashResult.selectid;
import dao.Update;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class HeatSeal_Wash extends javax.swing.JFrame {

    static float selectid;

    public HeatSeal_Wash() {
        initComponents();
    }

    HashMap<String, Float> id = new HashMap<String, Float>();

    public List getWashId(String idate) {
        List stlist = new ArrayList();
        String sty;
        float ids;
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT dbo.MAS_HS_WashR.Style, dbo.MAS_HS_WashR.Hs_Wash_Id FROM dbo.MAS_HS_WashR WHERE dbo.MAS_HS_WashR.Date = '" + idate + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                sty = rs.getString("Style");
                stlist.add(sty);
                ids = rs.getFloat("Hs_Wash_Id");
                id.put(sty, ids);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return stlist;
    }

    public List getHsWashStatus(float id) {
        List wlist = new ArrayList();
        String graphic = "";
        String combo = "";
        String machine = "";
        String wref = "";
        String wresult = "";
        String wcomm = "";
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT Graphic, Combo, Machine_No, Ref_No, Result, Wash_Comment FROM dbo.MAS_HS_WashR WHERE Hs_Wash_Id = '" + id + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                graphic = rs.getString("Graphic");
                wlist.add(graphic);
                combo = rs.getString("Combo");
                wlist.add(combo);
                machine = rs.getString("Machine_No");
                wlist.add(machine);
                wref = rs.getString("Ref_No");
                wlist.add(wref);
                wresult = rs.getString("Result");
                wlist.add(wresult);
                wcomm = rs.getString("Wash_Comment");
                wlist.add(wcomm);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return wlist;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jCheckBox1 = new javax.swing.JCheckBox();
        jScrollPane1 = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList<>();
        jLabel3 = new javax.swing.JLabel();
        txt_style = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        txt_graphic = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        txt_combo = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        co_nresult = new javax.swing.JComboBox<>();
        jLabel10 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTextArea1 = new javax.swing.JTextArea();
        txt_machine = new javax.swing.JTextField();
        txt_ref = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jLabel11 = new javax.swing.JLabel();
        txt_status = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Heat Seal Wash");
        setResizable(false);

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        jLabel1.setText("HEAT-SEAL WASH");
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 11, 277, 26));

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel2.setText("Date");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 43, 91, 28));

        jDateChooser1.setDateFormatString("yyyy-MM-dd");
        jDateChooser1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jPanel1.add(jDateChooser1, new org.netbeans.lib.awtextra.AbsoluteConstraints(145, 43, 135, 28));

        jCheckBox1.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jCheckBox1.setText("Check");
        jCheckBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCheckBox1ActionPerformed(evt);
            }
        });
        jPanel1.add(jCheckBox1, new org.netbeans.lib.awtextra.AbsoluteConstraints(282, 43, -1, 28));

        jList1.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jList1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jList1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jList1);

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(399, 43, 210, 360));

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("Style No");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 82, 91, 27));

        txt_style.setEditable(false);
        txt_style.setBackground(new java.awt.Color(204, 204, 255));
        txt_style.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        txt_style.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel1.add(txt_style, new org.netbeans.lib.awtextra.AbsoluteConstraints(145, 82, 202, 27));

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setText("Graphic No");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 120, 91, 27));

        txt_graphic.setEditable(false);
        txt_graphic.setBackground(new java.awt.Color(204, 204, 255));
        txt_graphic.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        txt_graphic.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel1.add(txt_graphic, new org.netbeans.lib.awtextra.AbsoluteConstraints(145, 120, 202, 27));

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setText("Combo No");
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 158, 91, 27));

        txt_combo.setEditable(false);
        txt_combo.setBackground(new java.awt.Color(204, 204, 255));
        txt_combo.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        txt_combo.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel1.add(txt_combo, new org.netbeans.lib.awtextra.AbsoluteConstraints(145, 158, 202, 27));

        jLabel6.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel6.setText("Machine No");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 196, 91, 27));

        jLabel7.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel7.setText("Ref. Number");
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 234, 91, 27));

        jLabel9.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel9.setText("New Status");
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 303, 108, 30));

        co_nresult.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        co_nresult.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "-SELECT NEW RESULT-", "PASS", "FAIL" }));
        jPanel1.add(co_nresult, new org.netbeans.lib.awtextra.AbsoluteConstraints(145, 303, 200, 30));

        jLabel10.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel10.setText("Wash Comments");
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 339, 108, 39));

        jTextArea1.setColumns(20);
        jTextArea1.setRows(5);
        jTextArea1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTextArea1MouseClicked(evt);
            }
        });
        jScrollPane2.setViewportView(jTextArea1);

        jPanel1.add(jScrollPane2, new org.netbeans.lib.awtextra.AbsoluteConstraints(145, 339, 200, 60));

        txt_machine.setEditable(false);
        txt_machine.setBackground(new java.awt.Color(204, 204, 255));
        txt_machine.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        txt_machine.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel1.add(txt_machine, new org.netbeans.lib.awtextra.AbsoluteConstraints(145, 196, 202, 27));

        txt_ref.setEditable(false);
        txt_ref.setBackground(new java.awt.Color(204, 204, 255));
        txt_ref.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        txt_ref.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel1.add(txt_ref, new org.netbeans.lib.awtextra.AbsoluteConstraints(145, 234, 202, 27));

        jButton1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton1.setText("EXIT");
        jButton1.setPreferredSize(new java.awt.Dimension(59, 27));
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(520, 410, 87, -1));

        jButton2.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton2.setText("UPDATE");
        jButton2.setPreferredSize(new java.awt.Dimension(59, 27));
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2, new org.netbeans.lib.awtextra.AbsoluteConstraints(150, 410, 190, -1));

        jButton3.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton3.setText("CLEAR ALL");
        jButton3.setPreferredSize(new java.awt.Dimension(59, 27));
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton3, new org.netbeans.lib.awtextra.AbsoluteConstraints(400, 410, 105, -1));

        jLabel11.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel11.setText("Current Status");
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(27, 267, 108, 30));

        txt_status.setEditable(false);
        txt_status.setBackground(new java.awt.Color(204, 204, 255));
        txt_status.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        txt_status.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        jPanel1.add(txt_status, new org.netbeans.lib.awtextra.AbsoluteConstraints(145, 267, 202, 27));

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

        setSize(new java.awt.Dimension(646, 485));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jTextArea1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTextArea1MouseClicked
        jTextArea1.selectAll();
    }//GEN-LAST:event_jTextArea1MouseClicked

    private void jCheckBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCheckBox1ActionPerformed
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = dFormat.format(jDateChooser1.getDate());

        List list = new ArrayList();
        list = getWashId(date);

        Vector v = new Vector();

        int c = list.size() - 1;

        for (int i = 0; i <= c; i++) {
            v.add(list.get(i));
        }

        if (v.size() > 0) {
            jList1.setListData(v);
        }
    }//GEN-LAST:event_jCheckBox1ActionPerformed

    private void jList1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jList1MouseClicked
        List w_com = new ArrayList();
        List wr = new ArrayList();
        String style = jList1.getSelectedValue();
        txt_style.setText(style);

        selectid = id.get(style);
        System.out.println("Wash id : " + selectid);

        wr = getHsWashStatus(selectid);
        txt_graphic.setText(wr.get(0).toString());
        txt_combo.setText(wr.get(1).toString());
        txt_machine.setText(wr.get(2).toString());
        txt_ref.setText(wr.get(3).toString());
        txt_status.setText(wr.get(4).toString());
        jTextArea1.setText(wr.get(5).toString());
    }//GEN-LAST:event_jList1MouseClicked

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        int a = 1;

        while (a == 1) {
            if (co_nresult.getSelectedIndex() == 0) {
                JOptionPane.showMessageDialog(null, "Eneter valid result");
                break;
            } else if (!getHsWashStatus(selectid).get(4).toString().equals("PENDING")) {
                JOptionPane.showMessageDialog(null, "WARNING...To Edit...? Current Result should be PENDING");
                break;
            } else {

                String nresults = co_nresult.getSelectedItem().toString();
                String upd_wash_comment = "1st HS Wash Comment->" + getHsWashStatus(selectid).get(5) + " / " + "2nd HS Wash Comment->" + " / " + jTextArea1.getText();
                Update up = new Update();
                up.updateHsWashResult(nresults, selectid, upd_wash_comment);
                JOptionPane.showMessageDialog(null, "Heat-Seal Wash successfully updated");

                Date d = new Date();
                jDateChooser1.setDate(d);
                jCheckBox1.setSelected(false);
                txt_style.setText("");
                txt_graphic.setText("");
                txt_combo.setText("");
                txt_machine.setText("");
                txt_ref.setText("");
                txt_status.setText("");
                co_nresult.setSelectedIndex(0);
                jTextArea1.setText("");
                jList1.setListData(new Vector());
                a++;
            }
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        Date d = new Date();
        jDateChooser1.setDate(d);
        jCheckBox1.setSelected(false);
        txt_style.setText("");
        txt_graphic.setText("");
        txt_combo.setText("");
        txt_machine.setText("");
        txt_ref.setText("");
        txt_status.setText("");
        co_nresult.setSelectedIndex(0);
        jTextArea1.setText("");
        jList1.setListData(new Vector());
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        this.dispose();
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
            java.util.logging.Logger.getLogger(HeatSeal_Wash.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(HeatSeal_Wash.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(HeatSeal_Wash.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(HeatSeal_Wash.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new HeatSeal_Wash().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JComboBox<String> co_nresult;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JCheckBox jCheckBox1;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JList<String> jList1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTextArea jTextArea1;
    private javax.swing.JTextField txt_combo;
    private javax.swing.JTextField txt_graphic;
    private javax.swing.JTextField txt_machine;
    private javax.swing.JTextField txt_ref;
    private javax.swing.JTextField txt_status;
    private javax.swing.JTextField txt_style;
    // End of variables declaration//GEN-END:variables
}
