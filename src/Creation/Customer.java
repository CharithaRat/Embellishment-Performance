package Creation;

import com.toedter.calendar.JDateChooser;
import com.toedter.calendar.demo.DateChooserPanel;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import util.JDBCConnector;
import dao.Creation;
import java.util.Calendar;
import javax.swing.JOptionPane;

public class Customer extends javax.swing.JFrame {

    private int last_cusid;

    public Customer() {
        initComponents();
        custid.setText(Long.toString(getCustomerId()));
    }

    public String getDatefromchooser(Calendar ob) {
        Date d = ob.getTime();
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
        return targetDateStr;
    }

//    public String setDate() {
//        Date d = new Date();
//        DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
//        String sdate = df.format(d);
//        String targetDateStr = "";
//        SimpleDateFormat sourceFormat = new SimpleDateFormat("MM/dd/yy");
//        SimpleDateFormat targetFormat = new SimpleDateFormat("yyyy-MM-dd");
//        String sourceDateStr = sdate;
//        try {
//            Date sourceDate = sourceFormat.parse(sourceDateStr);
//            targetDateStr = targetFormat.format(sourceDate);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return targetDateStr;
//    }
    public long getCustomerId() {
        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "SELECT Cus_Id FROM dbo.LastCusId WHERE Status = 'last'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                last_cusid = rs.getInt("Cus_Id");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return last_cusid;
    }

    public void setNewCustomerId() {

        int newlastcusid = last_cusid + 1;

        try {
            Connection con = JDBCConnector.getConnection();
            Statement stmt = con.createStatement();
            String sql = "UPDATE dbo.LastCusId SET Cus_Id = '" + newlastcusid + "' WHERE Status = 'last'";
            stmt.execute(sql);
        } catch (Exception ex) {
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        custid = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Customer Creation");
        setResizable(false);

        jPanel1.setLayout(null);

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 18)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("CREATE CUSTOMER");
        jPanel1.add(jLabel1);
        jLabel1.setBounds(23, 11, 398, 27);

        custid.setFont(new java.awt.Font("Times New Roman", 1, 12)); // NOI18N
        custid.setText("CUSTOMER ID");
        jPanel1.add(custid);
        custid.setBounds(37, 44, 102, 24);

        jLabel3.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel3.setText("Create Date");
        jPanel1.add(jLabel3);
        jLabel3.setBounds(37, 130, 102, 32);

        jLabel4.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jLabel4.setText("Customer Name");
        jPanel1.add(jLabel4);
        jLabel4.setBounds(37, 86, 102, 28);

        jTextField1.setFont(new java.awt.Font("Times New Roman", 0, 14)); // NOI18N
        jPanel1.add(jTextField1);
        jTextField1.setBounds(177, 86, 202, 33);

        jDateChooser1.setDateFormatString("yyyy/MM/dd");
        jPanel1.add(jDateChooser1);
        jDateChooser1.setBounds(177, 130, 202, 32);

        jButton1.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jButton1.setText("EXIT");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton1);
        jButton1.setBounds(180, 170, 80, 30);

        jButton2.setFont(new java.awt.Font("Times New Roman", 0, 12)); // NOI18N
        jButton2.setText("CREATE");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });
        jPanel1.add(jButton2);
        jButton2.setBounds(290, 170, 90, 30);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 215, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );

        setSize(new java.awt.Dimension(460, 254));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        this.dispose();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        if (!jTextField1.getText().isEmpty()) {
            String customer = jTextField1.getText();
            String dt = "";
            //String dt = jDateChooser1.getDateFormatString();
            try {
                Calendar c = jDateChooser1.getCalendar();
                dt = getDatefromchooser(c);
            } catch (Exception ex) {

            }
            System.out.println(dt);

            new Creation().customerCreate(Integer.parseInt(custid.getText()), customer, dt);
            setNewCustomerId();

            JOptionPane.showMessageDialog(this, "Customer added successfully");

            jTextField1.setText("");
            Date d = new Date();
            jDateChooser1.setDate(d);

            custid.setText(Long.toString(getCustomerId()));
        } else {
            JOptionPane.showMessageDialog(this, "Please add valid customer");
        }
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
            java.util.logging.Logger.getLogger(Customer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Customer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Customer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Customer.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new Customer().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel custid;
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables
}
