/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Calculations;

import java.text.DecimalFormat;

/**
 *
 * @author windows
 */
public class Calculation {
    
    public static String roundValues(float value) {

        String rvalue = "";
        float roundvalue = 0;

        DecimalFormat df = new DecimalFormat("0.00");
        rvalue = df.format(value);
               
        return rvalue;
    }
}
