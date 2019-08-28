package Test;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class Test {

    public static void main(String[] args) {
//        DefaultTableModel model = new DefaultTableModel();
//        model.addColumn("Code");
//        model.addColumn("Name");
//        model.addColumn("Quantity");
//        model.addColumn("Unit Price");
//        model.addColumn("Price");
//        JTable table = new JTable(model);
//
////         DefaultTableModel model = (DefaultTableModel) table.getModel();
//        model.addRow(new Object[]{"Column 1", "Column 2", "Column 3", "Column 4", "Column 5"});
//        JFrame f = new JFrame();
//        f.setSize(300, 300);
//        f.add(new JScrollPane(table));
//        f.setVisible(true);
//        
//        float a = 3;
//        float b = 10;
//        System.out.println(a/b);

        getIntValueBondville("1000.0");
    }

    public static int getIntValueBondville(String count) {
        System.out.println("count " + count);
        String parts[] = count.split(".");
        System.out.println("length " + parts.length);
        int i = 0;
        while (i < parts.length) {
            System.out.println("parts " + i + parts[i]);
            i++;
        }
        int counts = 0;
        try {
            counts = Integer.parseInt(parts[0]);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "check bondville data");
            ex.printStackTrace();
        }
        return counts;
    }
}
