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
        
        Scanner scanner = new Scanner(System.in);

        System.out.println("Welcome to SoundGood Music School!");

        while (true) {
            System.out.println("Select an option:");
            System.out.println("1. List Available instruments");
            System.out.println("2. Rent instrument");
            System.out.println("3. Terminate rental");
            System.out.println("4. Exit");

            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume newline character

            switch (choice) {
                case 1:
                    System.out.println("Enter instrument type (e.g., Guitar): ");
                    String instrumentType = scanner.nextLine();
                    SchoolDAO.listInstrument(instrumentType);
                    break;

                case 2:
                    System.out.println("Enter student ID: ");
                    int studentId = scanner.nextInt();
                    scanner.nextLine(); // Consume newline character

                    System.out.println("Enter instrument ID: ");
                    int instrumentId = scanner.nextInt();
                    scanner.nextLine(); // Consume newline character

                    System.out.println("Enter date to (YYYY-MM-DD): ");
                    String dateTo = scanner.nextLine();

                    SchoolDAO.rentInstrument(studentId, instrumentId, dateTo);
                    break;

                case 3:
                	System.out.println("Enter student ID: ");
                    int studentID = scanner.nextInt();
                    scanner.nextLine(); // Consume newline character

                    int activeRentalsCount = SchoolDAO.countActiveRentals(studentID);
                    if (activeRentalsCount > 0) {
                        SchoolDAO.showActiveRentals(studentID);
                        System.out.println("Enter rental ID to terminate: ");
                        int rentalID = scanner.nextInt();
                        scanner.nextLine(); // Consume newline character

                        SchoolDAO.terminateRental(studentID, rentalID);

                    } else {
                        System.out.println("No active rentals found for the specified student.");
                    }
                    break;

                case 4:
                    System.out.println("Exiting program...");
                    scanner.close();
                    System.exit(0);
                    break;

                default:
                    System.out.println("Invalid choice. Please enter a valid option.");
            }
        }
    }
}
