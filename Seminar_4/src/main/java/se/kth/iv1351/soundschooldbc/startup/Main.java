/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.startup;

import main.java.se.kth.iv1351.soundschooldbc.controller.Controller;
import main.java.se.kth.iv1351.soundschooldbc.integration.SchoolDBException;
import main.java.se.kth.iv1351.soundschooldbc.view.BlockingInterpreter;

/**
 * @author razan
 *
 */

public class Main {
    public static void main(String[] args) {
        try {
            new BlockingInterpreter(new Controller()).handleCmds();
        } catch (SchoolDBException bdbe) {
            System.out.println("Could not connect to School db.");
            bdbe.printStackTrace();
        }
    }
}
