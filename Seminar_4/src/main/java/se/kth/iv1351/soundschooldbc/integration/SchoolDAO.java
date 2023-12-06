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
	
	public static void retrieveSchoolRule() {
        String query = "SELECT * FROM school_rules"; // Your SQL query to retrieve data

        try {
        		Connection connection = connect();
        		Statement statement = connection.createStatement();
        		ResultSet resultSet = statement.executeQuery(query);
        		while (resultSet.next()) {
	            	int lessonId = resultSet.getInt("rule_value");
	            	String lessonName = resultSet.getString("rule_description");
	            	System.out.println("Rule Value: " + lessonId + ", Rule Description: " + lessonName);
            	}
    	        // Close resources
    	        resultSet.close();
    	        statement.close();
    	        connection.close();
        } catch (SQLException e) {
            System.out.println("Failed to retrieve lesson data.");
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

	        // Process the results
	        while (resultSet.next()) {
	            int instrumentId = resultSet.getInt("instrument_id");
	            String instrumentName = resultSet.getString("instrument_name");
	            String brand = resultSet.getString("brand");
	            int rentingPrice = resultSet.getInt("renting_price");

	            // Display instrument details
	            System.out.println("Instrument ID: " + instrumentId +
	                               ", Name: " + instrumentName +
	                               ", Brand: " + brand +
	                               ", Renting Price: " + rentingPrice);
	        }

	        // Close resources
	        resultSet.close();
	        statement.close();
	        connection.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}




}
