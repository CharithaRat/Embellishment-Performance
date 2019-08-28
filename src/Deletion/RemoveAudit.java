package Deletion;

import dao.Deletion;
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

public class RemoveAudit extends javax.swing.JFrame {

    static float selectid;

    public RemoveAudit() {
        initComponents();
    }

    HashMap<String, Float> id = new HashMap<String, Float>();

    public List getSalesOrder(String idate) {
        List stlist = new ArrayList();
        String so;
        float ids;
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT dbo.InsGeneralDet.Ins_SO, dbo.InsWash.Ins_Id FROM dbo.InsGeneralDet, dbo.InsEcaDet, dbo.InsSbqaDet, dbo.InsIhqaDet, dbo.InsWash WHERE dbo.InsGeneralDet.Ins_Date = '" + idate + "' and dbo.InsGeneralDet.Ins_Id = dbo.InsEcaDet.Ins_Id and dbo.InsEcaDet.Ins_Id = dbo.InsSbqaDet.Ins_Id and  dbo.InsSbqaDet.Ins_Id = dbo.InsIhqaDet.Ins_Id and dbo.InsIhqaDet.Ins_Id = dbo.InsWash.Ins_Id";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                so = rs.getString("Ins_SO");
                stlist.add(so);
                ids = rs.getFloat("Ins_Id");
                id.put(so, ids);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return stlist;
    }

    public String getStyleNumber(float id) {
        String style = "";
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT dbo.InsGeneralDet.Ins_Style FROM dbo.InsGeneralDet, dbo.InsEcaDet, dbo.InsSbqaDet, dbo.InsIhqaDet, dbo.InsWash WHERE dbo.InsGeneralDet.Ins_Id = '" + id + "' and dbo.InsGeneralDet.Ins_Id = dbo.InsEcaDet.Ins_Id and dbo.InsEcaDet.Ins_Id = dbo.InsSbqaDet.Ins_Id and  dbo.InsSbqaDet.Ins_Id = dbo.InsIhqaDet.Ins_Id and dbo.InsIhqaDet.Ins_Id = dbo.InsWash.Ins_Id";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                style = rs.getString("Ins_Style");
                System.out.println("style no= " + style);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return style;
    }

    public int getAuditQTY(float id) {
        int gpqty = 0;
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT dbo.InsGeneralDet.Ins_GpQTY FROM dbo.InsGeneralDet, dbo.InsEcaDet, dbo.InsSbqaDet, dbo.InsIhqaDet, dbo.InsWash WHERE dbo.InsGeneralDet.Ins_Id = '" + id + "' and dbo.InsGeneralDet.Ins_Id = dbo.InsEcaDet.Ins_Id and dbo.InsEcaDet.Ins_Id = dbo.InsSbqaDet.Ins_Id and  dbo.InsSbqaDet.Ins_Id = dbo.InsIhqaDet.Ins_Id and dbo.InsIhqaDet.Ins_Id = dbo.InsWash.Ins_Id";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                gpqty = rs.getInt("Ins_GpQTY");
                System.out.println("Gate Pass QTY= " + gpqty);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return gpqty;
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jLabel3 = new javax.swing.JLabel();
        jtso = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jtsn = new javax.swing.JTextField();
        jtgpq = new javax.swing.JTextField();
        jCheckBox1 = new javax.swing.JCheckBox();
        jScrollPane1 = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList<>();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Remove Audit");
        setResizable(false);

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        jLabel1.setText("REMOVE AUDIT");

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel2.setText("Date");

        jDateChooser1.setDateFormatString("yyyy-MM-dd");

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("Sales Order");

        jtso.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setText("Style Number");

        jLabel5.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel5.setText("Gate Pass QTY");

        jtsn.setEditable(false);
        jtsn.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jtsn.setForeground(new java.awt.Color(0, 0, 204));

        jtgpq.setEditable(false);
        jtgpq.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jtgpq.setForeground(new java.awt.Color(0, 0, 204));

        jCheckBox1.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jCheckBox1.setText("Check");
        jCheckBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCheckBox1ActionPerformed(evt);
            }
        });

        jList1.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jList1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jList1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jList1);

        jButton1.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton1.setText("DELETE");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        jButton2.setText("CLEAR ALL");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(47, 47, 47)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 518, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(10, 10, 10)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(jtgpq)
                                    .addComponent(jDateChooser1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 160, Short.MAX_VALUE)
                                    .addComponent(jtso)
                                    .addComponent(jtsn)))
                            .addComponent(jButton2))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jCheckBox1)
                                .addGap(27, 27, 27)
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 96, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(28, 28, 28))))))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(11, 11, 11)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(28, 28, 28)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(17, 17, 17)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jtsn, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(15, 15, 15)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                    .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(jtgpq, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jDateChooser1, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(14, 14, 14)
                                .addComponent(jtso, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(4, 4, 4)
                                .addComponent(jCheckBox1))))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addGap(29, 29, 29)
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(34, 34, 34)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton1)
                    .addComponent(jButton2))
                .addContainerGap())
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        setSize(new java.awt.Dimension(626, 340));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jCheckBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCheckBox1ActionPerformed
        SimpleDateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd");
        String date = dFormat.format(jDateChooser1.getDate());

        List list = new ArrayList();
        list = getSalesOrder(date);

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
        String so = jList1.getSelectedValue();
        jtso.setText(so);

        selectid = id.get(so);
        System.out.println("Ins Id : " + selectid);
        jtgpq.setText(Integer.toString(getAuditQTY(selectid)));
        jtsn.setText(getStyleNumber(selectid));
    }//GEN-LAST:event_jList1MouseClicked

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        Date d = new Date();
        jDateChooser1.setDate(d);
        jtso.setText("");
        jtsn.setText("");
        jtgpq.setText("");
        jCheckBox1.setSelected(false);
        jList1.setListData(new Vector());
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        Deletion d = new Deletion();
        d.deleteGeneralAuditData(selectid);
        d.deleteEcaAuditData(selectid);
        d.deleteSubQAAuditData(selectid);
        d.deleteInhouseQAAuditData(selectid);
        d.deleteWashData(selectid);
        JOptionPane.showMessageDialog(null, "Audit deleated successfully");
        Date dt = new Date();
        jDateChooser1.setDate(dt);
        jtso.setText("");
        jtsn.setText("");
        jtgpq.setText("");
        jCheckBox1.setSelected(false);
        jList1.setListData(new Vector());
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
            java.util.logging.Logger.getLogger(RemoveAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(RemoveAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(RemoveAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(RemoveAudit.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new RemoveAudit().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JCheckBox jCheckBox1;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JList<String> jList1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextField jtgpq;
    private javax.swing.JTextField jtsn;
    private javax.swing.JTextField jtso;
    // End of variables declaration//GEN-END:variables
}
