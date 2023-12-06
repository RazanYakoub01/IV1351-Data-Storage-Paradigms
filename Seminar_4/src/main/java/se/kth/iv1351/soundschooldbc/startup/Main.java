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

import java.util.Scanner;

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
        
       SchoolDAO.retrieveSchoolRule();
       SchoolDAO.listInstrument("Drums");
       SchoolDAO.terminateRental(3, 16);
       
      /* scanner = new Scanner(System.in);

       System.out.println("Enter the instrument name to search:");
       String instrumentName = scanner.nextLine(); // Read user input

       // Call the listInstrument function with the provided instrument name
       SchoolDAO.listInstrument(instrumentName);

       scanner.close();
*/
    }


}
