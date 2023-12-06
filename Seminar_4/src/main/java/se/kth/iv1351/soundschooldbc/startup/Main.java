/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.startup;

/**
 * @author razan
 *
 */
import  main.java.se.kth.iv1351.soundschooldbc.integration.*;

import java.sql.Connection;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) {
        try {
            Connection conn = SchoolDAO.connect();
            System.out.println("Connected to the database!");
            // You can use 'conn' to perform database operations
        } catch (SQLException e) {
            System.out.println("Connection failed.");
            e.printStackTrace();
        }
    }


}
