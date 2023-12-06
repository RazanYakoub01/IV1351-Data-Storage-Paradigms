/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.integration;

/**
 * @author Razan Yakoub , Seema Bashir , Teoman Köylüoglu
 *
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class SchoolDAO {
	public static Connection connect() throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/soundgood_music_school"; // Update with your database name
        String username = "postgres";
        String password = "seemaärbäst";

        Connection connection = DriverManager.getConnection(url, username, password);
        return connection;
    }

	
	public static void checkRental() {
		try {
            Connection conn = connect();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM renting_period");

            // Get current date
            java.util.Date currentDate = new java.util.Date();
            java.sql.Date sqlDate = new java.sql.Date(currentDate.getTime());

            while (resultSet.next()) {
                java.sql.Date dateTo = resultSet.getDate("date_to");
                int rentalId = resultSet.getInt("rental_id");

                // Compare date_to with current date
                if (dateTo != null && dateTo.before(sqlDate)) {
                    // Execute update query to change status to 'Terminated'
                    PreparedStatement updateStatement = conn.prepareStatement(
                            "UPDATE renting_period SET status = 'Terminated' WHERE rental_id = ?");
                    updateStatement.setInt(1, rentalId);
                    updateStatement.executeUpdate();
                    updateStatement.close();
                }
            }

            // Close resources
            resultSet.close();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}


	public static int retrieveMaxInstrumentRule() {
	    String query = "SELECT rule_value FROM school_rules WHERE rule_description LIKE '%Maximum number of instruments allowed for rental%'";

	    try {
	        Connection connection = connect();
	        Statement statement = connection.createStatement();
	        ResultSet resultSet = statement.executeQuery(query);
	        
	        int maxInstruments = 0;
	        if (resultSet.next()) {
	            maxInstruments = resultSet.getInt("rule_value");
	        }

	        // Close resources
	        resultSet.close();
	        statement.close();
	        connection.close();

	        return maxInstruments;
	    } catch (SQLException e) {
	        System.out.println("Failed to retrieve maximum instrument rule.");
	        return 0;
	    }
	}
	
	
	public static void listInstrument(String instrumentType) {
	    try {

	        // SQL query to retrieve available instruments of a certain type
	        String query = "SELECT i.instrument_id, s.instrument_name, s.brand, s.renting_price " +
	                       "FROM instrument i " +
	                       "JOIN instrument_stock s ON i.stock_id = s.stock_id " +
	                       "WHERE s.instrument_name = '" + instrumentType + "' AND CAST(s.availability_stock AS INTEGER) > 0";

	        // Create a prepared statement with a parameter
	        Connection connection = connect();
	        Statement statement = connection.createStatement();
	        ResultSet resultSet = statement.executeQuery(query);

	        // Check if there are available instruments
	        if (!resultSet.next()) {
	            System.out.println("No available instruments of type: " + instrumentType);
	        } else {
	            // Display available instruments
	            do {
	                int instrumentId = resultSet.getInt("instrument_id");
	                String instrumentName = resultSet.getString("instrument_name");
	                String brand = resultSet.getString("brand");
	                int rentingPrice = resultSet.getInt("renting_price");

	                // Display instrument details
	                System.out.println("Instrument ID: " + instrumentId +
	                                   ", Name: " + instrumentName +
	                                   ", Brand: " + brand +
	                                   ", Renting Price: " + rentingPrice);
	            } while (resultSet.next());
	        }
	        // Close resources
	        resultSet.close();
	        statement.close();
	        connection.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	
	public static void terminateRental(int studentID, int rentalID) {
	    try {
	        Connection connection = connect();

	        String updateQuery = "UPDATE renting_period " +
	                "SET status = 'Terminated' " +
	                "WHERE student_id = " + studentID +
	                " AND rental_id = " + rentalID +
	                " AND status = 'Active'";

	        Statement statement = connection.createStatement();
	        int rowsAffected = statement.executeUpdate(updateQuery);

	        if (rowsAffected > 0) {
	            System.out.println("Rental terminated successfully.");
	        } else {
	            System.out.println("Failed to terminate rental.");
	        }

	        statement.close();
	        connection.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("Failed to terminate rental.");
	    }
	}
	
	
	public static void showActiveRentals(int studentID) {
	    try {
	        Connection connection = connect();

	        String fetchQuery = "SELECT * FROM renting_period " +
	                            "WHERE student_id = " + studentID +
	                            " AND status = 'Active'";
	        
	        Statement statement = connection.createStatement();
	        ResultSet activeRentals = statement.executeQuery(fetchQuery);

	        System.out.println("Active Rentals for Student ID: " + studentID);
	        int count = 0;
	        while (activeRentals.next()) {
	            int rentalId = activeRentals.getInt("rental_id");
	            int instrumentId = activeRentals.getInt("instrument_id");
	            String dateFrom = activeRentals.getString("date_from");
	            String dateTo = activeRentals.getString("date_to");

	            System.out.println(count + ". Instrument ID: " + instrumentId +
	                               ", Rental Nr: " + rentalId +
	                               ", Date From: " + dateFrom +
	                               ", Date To: " + dateTo);
	        }
	        activeRentals.close();
	        statement.close();
	        connection.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("Failed to retrieve active rentals.");
	    }
	}
	
	
	public static int countActiveRentals(int studentId) {
	    int rentedInstruments = 0;
	    try {
	        Connection connection = connect();
	        String countQuery = "SELECT COUNT(*) FROM renting_period " +
	                            "WHERE student_id = ? AND status = 'Active'";
	        PreparedStatement countStatement = connection.prepareStatement(countQuery);
	        countStatement.setInt(1, studentId);
	        ResultSet countResult = countStatement.executeQuery();

	        if (countResult.next()) {
	            rentedInstruments = countResult.getInt(1);
	        }

	        // Close resources
	        countResult.close();
	        countStatement.close();
	        connection.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("Failed to count active rentals.");
	    }
	    return rentedInstruments;
	}

	
	public static void rentInstrument(int studentId, int instrumentId, String dateTo) {
		try {
	        // Establish connection (replace with your connection details)
	        Connection connection = connect();

	        // Retrieve the maximum number of instruments allowed for rental
	        int maxInstruments = retrieveMaxInstrumentRule();

	        // Check the number of instruments already rented by the student
	        int rentedInstruments = countActiveRentals(studentId);

	        // Check if the student has already rented the maximum number of instruments
	        if (rentedInstruments >= maxInstruments) {
	            System.out.println("You have already rented the maximum number of instruments allowed.");
	            return; // Exit method if the limit is reached
	        }

	        // Proceed with renting the instrument
	        String rentQuery = "INSERT INTO renting_period (student_id, date_from, date_to, instrument_id) " +
	                           "VALUES (" + studentId + ", CURRENT_DATE, DATE '" + dateTo + "', " + instrumentId + ")";
	        Statement rentStatement = connection.createStatement();
	        int rowsAffected = rentStatement.executeUpdate(rentQuery);

	        if (rowsAffected > 0) {
	            System.out.println("Instrument rented successfully.");
	        } else {
	            System.out.println("Failed to rent the instrument.");
	        }

	        // Close resources
	        rentStatement.close();
	        connection.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("Failed to rent instrument.");
	    }
	}





}




