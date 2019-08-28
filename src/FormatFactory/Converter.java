package FormatFactory;

import javax.swing.JOptionPane;

public class Converter {

    public double getDoubleValue(String dvalue) {
        double covalues = 0.0;
        try {
            covalues = Double.parseDouble(dvalue);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "check data");
        }
        return covalues;
    }

    public static String getStringLongValue(long value) {
        String usid = "";
        try {
            usid = Long.toString(value);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "check data");
        }
        return usid;
    }

    public static String getStringIntValue(int value) {
        String usid = "";
        try {
            usid = Integer.toString(value);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "check data");
        }
        return usid;
    }

    public static long getLongValue(String userid) {

        long id = Long.parseLong(userid);
        return id;
    }

    public static int getIntValue(String count) {
        int counts = 0;
        try {
            counts = Integer.parseInt(count);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "check data");
//            ex.printStackTrace();
        }
        return counts;
    }

    public static float getFloatValue(String pc) {
//        System.out.println(pc);
        float price = 0;
        try {
            price = Float.parseFloat(pc);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "check data");
        }
        return price;
    }
}
