/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Creation;

import FormatFactory.Converter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.swing.JOptionPane;
import util.JDBCConnector;
import dao.Creation;
import dao.Searching;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class AuditorCreation extends javax.swing.JFrame {

    private long last_audid;
    static String aud_plant = "MAS";

    public AuditorCreation() {
        initComponents();
        last_audno.setText(new Converter().getStringLongValue(getAuditorId()));
    }

    public String getDatefromchooser(Calendar ob) {
        Date d = ob.getTime();
        DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
        String bthdate = df.format(d);
        return bthdate;
    }

    public long getAuditorId() {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT Aud_Id FROM dbo.LastAuditorId WHERE Status = 'last'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                last_audid = rs.getLong("Aud_Id");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return last_audid;
    }

    public void setNewAuditorId() {

        long newlastaudid = last_audid + 1;

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE dbo.LastAuditorId SET Aud_Id = '" + newlastaudid + "' WHERE Status = 'last'";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        aud_id = new javax.swing.JLabel();
        last_audno = new javax.swing.JLabel();
        aud_type = new javax.swing.JLabel();
        aud_name = new javax.swing.JLabel();
        aud_eplant = new javax.swing.JLabel();
        aud_ctnu = new javax.swing.JLabel();
        aud_emadd = new javax.swing.JLabel();
        jComboBox1 = new javax.swing.JComboBox<>();
        aud_n = new javax.swing.JTextField();
        aud_p = new javax.swing.JTextField();
        aud_c = new javax.swing.JTextField();
        aud_e = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jList1 = new javax.swing.JList<>();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        star1 = new javax.swing.JLabel();
        star2 = new javax.swing.JLabel();
        star3 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Auditor Creation");
        setResizable(false);

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 24)); // NOI18N
        jLabel1.setText("AUDITOR CREATION");

        aud_id.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        aud_id.setText("Auditor Id");

        last_audno.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        last_audno.setText("No");

        aud_type.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        aud_type.setText("Auditor Type");

        aud_name.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        aud_name.setText("Auditor Name");

        aud_eplant.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        aud_eplant.setText("Embellishment Plant");

        aud_ctnu.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        aud_ctnu.setText("Contact No");

        aud_emadd.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        aud_emadd.setText("Email Address");

        jComboBox1.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jComboBox1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "        -SELECT AUDITOR TYPE-", "ECA", "SUB QA", "IN-HOUSE QA" }));
        jComboBox1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jComboBox1ActionPerformed(evt);
            }
        });

        aud_n.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        aud_n.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aud_nActionPerformed(evt);
            }
        });

        aud_p.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        aud_p.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aud_pActionPerformed(evt);
            }
        });
        aud_p.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                aud_pKeyReleased(evt);
            }
        });

        aud_c.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        aud_c.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aud_cActionPerformed(evt);
            }
        });

        aud_e.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        aud_e.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                aud_eActionPerformed(evt);
            }
        });

        jList1.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jList1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jList1MouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jList1);

        jButton1.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jButton1.setText("ADD AUDITOR");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jButton2.setText("CLEAR ALL");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        star1.setForeground(new java.awt.Color(255, 0, 0));

        star2.setForeground(new java.awt.Color(255, 0, 0));

        star3.setForeground(new java.awt.Color(255, 0, 0));

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(48, 48, 48)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 325, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                    .addComponent(aud_eplant, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 129, Short.MAX_VALUE)
                                    .addComponent(aud_name, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(aud_type, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                .addGap(20, 20, 20))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(aud_emadd, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 131, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(aud_ctnu, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(aud_id, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(18, 18, 18)))
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                            .addComponent(jButton1)
                            .addGroup(javax.swing.GroupLayout.Alignment.LEADING, jPanel1Layout.createSequentialGroup()
                                .addComponent(last_audno, javax.swing.GroupLayout.PREFERRED_SIZE, 76, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addComponent(aud_n, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(aud_p, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(aud_c, javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jComboBox1, javax.swing.GroupLayout.Alignment.LEADING, 0, 239, Short.MAX_VALUE)
                            .addComponent(aud_e))
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(star1, javax.swing.GroupLayout.PREFERRED_SIZE, 13, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(star2, javax.swing.GroupLayout.PREFERRED_SIZE, 13, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(star3, javax.swing.GroupLayout.PREFERRED_SIZE, 13, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 160, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(61, 61, 61)
                                .addComponent(jButton2)))))
                .addContainerGap(39, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(19, 19, 19)
                .addComponent(jLabel1)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(35, 35, 35)
                        .addComponent(jScrollPane1))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(last_audno, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(aud_id, javax.swing.GroupLayout.PREFERRED_SIZE, 29, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(20, 20, 20)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jComboBox1, javax.swing.GroupLayout.PREFERRED_SIZE, 28, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(star1))
                            .addComponent(aud_type, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(aud_name, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(aud_n, javax.swing.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE)
                                .addComponent(star2)))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(aud_eplant, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(aud_p, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addComponent(star3)))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(aud_ctnu, javax.swing.GroupLayout.PREFERRED_SIZE, 25, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(aud_c, javax.swing.GroupLayout.PREFERRED_SIZE, 24, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(26, 26, 26)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(aud_emadd, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(aud_e, javax.swing.GroupLayout.DEFAULT_SIZE, 25, Short.MAX_VALUE))))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(13, Short.MAX_VALUE))
        );

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        setSize(new java.awt.Dimension(678, 422));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        long aud_id;
        String aud_type = "";
        String aud_name = "";
        //String aud_plant = "";
        String aud_tel = "";
        String aud_email = "";

        aud_id = new Converter().getLongValue(last_audno.getText());
        aud_type = jComboBox1.getSelectedItem().toString();
        aud_name = aud_n.getText();
        aud_email = aud_e.getText();

        if (jComboBox1.getSelectedIndex() == 1) {
            aud_plant = aud_p.getText();
        }

        while (true) {
            aud_tel = aud_c.getText().trim();

            if (aud_tel.equals("") || aud_tel.length() == 10) {
                while (true) {
                    if (aud_type.equals("") || jComboBox1.getSelectedIndex() == 0) {
                        star1.setText("*");
                        star2.setText("*");
                        star3.setText("*");

                        jComboBox1.setSelectedIndex(0);
                        aud_n.setText("");
                        aud_p.setText("");
                        aud_c.setText("");
                        aud_e.setText("");
                        //----------------
                        JOptionPane.showMessageDialog(null, "Fill all required fields marks as (*)");
                        break;
                    } else if (aud_name.equals("")) {
                        star1.setText("*");
                        star2.setText("*");
                        star3.setText("*");

                        jComboBox1.setSelectedIndex(0);
                        aud_n.setText("");
                        aud_p.setText("");
                        aud_c.setText("");
                        aud_e.setText("");
                        //----------------
                        JOptionPane.showMessageDialog(null, "Fill all required fields marks as (*)");
                        break;
                    } else if (aud_plant.equals("")) {
                        star1.setText("*");
                        star2.setText("*");
                        star3.setText("*");

                        jComboBox1.setSelectedIndex(0);
                        aud_n.setText("");
                        aud_p.setText("");
                        aud_c.setText("");
                        aud_e.setText("");
                        //----------------
                        JOptionPane.showMessageDialog(null, "Fill all required fields marks as (*)");
                        break;
                    } else {
                        Creation pd = new Creation();
                        switch (jComboBox1.getSelectedIndex()) {
                            case 2:
                                aud_plant = "MAS-SB";
                                pd.auditorCreate(aud_id, aud_type, aud_name, aud_plant, aud_tel, aud_email);
                                break;
                            case 3:
                                aud_plant = "MAS-IH";
                                pd.auditorCreate(aud_id, aud_type, aud_name, aud_plant, aud_tel, aud_email);
                                break;
                            default:
                                pd.auditorCreate(aud_id, aud_type, aud_name, aud_plant, aud_tel, aud_email);
                        }

//                        if (jComboBox1.getSelectedIndex() == 2) {
//                            aud_plant = "MAS-SB";
//                            pd.auditorCreate(aud_id, aud_type, aud_name, aud_plant, aud_tel, aud_email);
//                        } else if (jComboBox1.getSelectedIndex() == 3) {
//                            aud_plant = "MAS-IH";
//                            pd.auditorCreate(aud_id, aud_type, aud_name, aud_plant, aud_tel, aud_email);
//                        } else {
//                            pd.auditorCreate(aud_id, aud_type, aud_name, aud_plant, aud_tel, aud_email);
//                        }
                        setNewAuditorId();
                        last_audno.setText(new Converter().getStringLongValue(getAuditorId()));
                        jComboBox1.setSelectedIndex(0);
                        jList1.setListData(new Vector());
                        aud_n.setText("");
                        aud_p.setText("");
                        aud_c.setText("");
                        aud_e.setText("");
                        //----------------
                        JOptionPane.showMessageDialog(null, "Auditor was added successfully");
                        break;
                    }

                }
                break;
            } else {
                JOptionPane.showMessageDialog(null, "Please enter valid telephone number");
                break;
            }
        }


    }//GEN-LAST:event_jButton1ActionPerformed

    private void aud_pKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_aud_pKeyReleased
        String pr_name = aud_p.getText();

        Searching sech = new Searching();
        List list = new ArrayList();
        list = sech.getPrinterName(pr_name);

        Vector v = new Vector();

        int c = list.size() - 1;

        for (int i = 0; i <= c; i++) {
            v.add(list.get(i));
        }

        if (v.size() > 0) {
            jList1.setListData(v);
        }
    }//GEN-LAST:event_aud_pKeyReleased

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        //last_audno.setText("No");
        jComboBox1.setSelectedIndex(0);
        jList1.setListData(new Vector());
        aud_n.setText("");
        aud_p.setText("");
        aud_c.setText("");
        aud_e.setText("");

    }//GEN-LAST:event_jButton2ActionPerformed

    private void jList1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jList1MouseClicked
        String p_plant = jList1.getSelectedValue().toString();
        aud_p.setText(p_plant);
    }//GEN-LAST:event_jList1MouseClicked

    private void jComboBox1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jComboBox1ActionPerformed
        if (jComboBox1.getSelectedIndex() == 1) {
            aud_n.requestFocus();
            aud_p.enable();
        } else if (jComboBox1.getSelectedIndex() == 2) {
            aud_n.requestFocus();
            aud_p.disable();
        } else if (jComboBox1.getSelectedIndex() == 3) {
            aud_n.requestFocus();
            aud_p.disable();
        }

    }//GEN-LAST:event_jComboBox1ActionPerformed

    private void aud_nActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aud_nActionPerformed
        if (jComboBox1.getSelectedIndex() == 2) {
            aud_c.requestFocus();
        } else if (jComboBox1.getSelectedIndex() == 3) {
            aud_c.requestFocus();
        }

    }//GEN-LAST:event_aud_nActionPerformed

    private void aud_pActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aud_pActionPerformed
        aud_c.requestFocus();
    }//GEN-LAST:event_aud_pActionPerformed

    private void aud_cActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aud_cActionPerformed
        aud_e.requestFocus();
    }//GEN-LAST:event_aud_cActionPerformed

    private void aud_eActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_aud_eActionPerformed
        jButton1.requestFocus();
    }//GEN-LAST:event_aud_eActionPerformed

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
            java.util.logging.Logger.getLogger(AuditorCreation.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(AuditorCreation.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(AuditorCreation.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(AuditorCreation.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new AuditorCreation().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField aud_c;
    private javax.swing.JLabel aud_ctnu;
    private javax.swing.JTextField aud_e;
    private javax.swing.JLabel aud_emadd;
    private javax.swing.JLabel aud_eplant;
    private javax.swing.JLabel aud_id;
    private javax.swing.JTextField aud_n;
    private javax.swing.JLabel aud_name;
    private javax.swing.JTextField aud_p;
    private javax.swing.JLabel aud_type;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JComboBox<String> jComboBox1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JList<String> jList1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JLabel last_audno;
    private javax.swing.JLabel star1;
    private javax.swing.JLabel star2;
    private javax.swing.JLabel star3;
    // End of variables declaration//GEN-END:variables
}
