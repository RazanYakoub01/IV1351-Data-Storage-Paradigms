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

	private static final String RENTING_TABLE_NAME = "renting_period";
	private static final String END_DATE_NAME = "date_to";
	private static final String START_DATE_NAME = "date_from";
	private static final String RENTAL_ID_NAME = "rental_id";
	private static final String RENTAL_STATUS_NAME = "status";
	private static final String RULE_VALUE_NAME = "rule_value";
	private static final String RULE_TABLE_NAME = "school_rules";
	private static final String RULE_DESCRIPTION_NAME = "rule_description";
	private static final String MAX_INSTRUMENT_RULE = "Maximum number of instruments allowed for rental";
	private static final String MAX_PERIOD_RULE = "Maximum renting period";
	private static final String INSTRUMENT_ID_NAME = "instrument_id";
	private static final String INSTRUMENT_NAME = "instrument_name";
	private static final String INSTRUMENT_BRAND_NAME = "brand";
	private static final String INSTRUMENT_RENTING_PRICE = "renting_price";
	private static final String INSTRUMENT_TABLE_NAME = "instrument";
	private static final String STOCK_TABLE_NAME = "instrument_stock";
	private static final String STOCK_ID_NAME = "stock_id";
	private static final String STOCK_AVAILABLITY_NAME = "availability_stock";
	private static final String STUDENT_ID_NAME = "student_id";

	private Connection connection;
	private PreparedStatement getAllRentalStmt;
	private PreparedStatement updateRentalStatusStmt;
	private PreparedStatement getMaxAllowedInstrumentStmt;
	private PreparedStatement getMaxRentingPeriodStmt;
	private PreparedStatement getDateRangeStmt;
	private PreparedStatement listAvailableInstrumentStmt;
	private PreparedStatement terminateRentalStmt;
	private PreparedStatement showActiveRentalStmt;
	private PreparedStatement countActiveRentalStmt;
	private PreparedStatement rentInstrumentStmt;
	private PreparedStatement incrementAvailableStockStmt;
	private PreparedStatement decrementAvailableStockStmt;

	private void preparedStatements() throws SQLException {
		getAllRentalStmt = connection.prepareStatement("SELECT * FROM " + RENTING_TABLE_NAME);
		updateRentalStatusStmt = connection.prepareStatement("UPDATE " + RENTING_TABLE_NAME + " SET "
				+ RENTAL_STATUS_NAME + " = '?' WHERE " + RENTAL_ID_NAME + "= ?");
		getMaxAllowedInstrumentStmt = connection.prepareStatement("SELECT " + RULE_VALUE_NAME + " FROM "
				+ RULE_TABLE_NAME + " WHERE " + RULE_DESCRIPTION_NAME + " LIKE '%" + MAX_INSTRUMENT_RULE + "%'");
		getMaxRentingPeriodStmt = connection.prepareStatement("SELECT " + RULE_VALUE_NAME + " FROM " + RULE_TABLE_NAME
				+ " WHERE " + RULE_DESCRIPTION_NAME + " LIKE '%" + MAX_PERIOD_RULE + "%'");
		getDateRangeStmt = connection.prepareStatement("SELECT CURRENT_DATE + INTERVAL '?' MONTH");
		listAvailableInstrumentStmt = connection.prepareStatement(
				"SELECT i." + INSTRUMENT_ID_NAME + ", s." + INSTRUMENT_NAME + ", s." + INSTRUMENT_BRAND_NAME + ", s."
						+ INSTRUMENT_RENTING_PRICE + " FROM " + INSTRUMENT_TABLE_NAME + " i JOIN " + STOCK_TABLE_NAME
						+ " s ON i." + STOCK_ID_NAME + "= s." + STOCK_ID_NAME + " WHERE s." + INSTRUMENT_NAME
						+ " = '?' AND CAST(s." + STOCK_AVAILABLITY_NAME + " AS INTEGER) > ?");
		terminateRentalStmt = connection.prepareStatement("UPDATE " + RENTING_TABLE_NAME + " SET "
				+ RENTAL_STATUS_NAME + " = '?' WHERE " + STUDENT_ID_NAME + " = ? AND " + RENTAL_ID_NAME + " = ? AND "
				+ RENTAL_STATUS_NAME + " = '?'");
		showActiveRentalStmt = connection.prepareStatement("SELECT * FROM " + RENTING_TABLE_NAME + "WHERE "
				+ STUDENT_ID_NAME + " = ? AND " + RENTAL_STATUS_NAME + " = '?'");
		countActiveRentalStmt = connection.prepareStatement("SELECT COUNT(*) FROM " + RENTING_TABLE_NAME + " WHERE "
				+ STUDENT_ID_NAME + " = ? AND " + RENTAL_STATUS_NAME + " = '?'");
		rentInstrumentStmt = connection.prepareStatement(
				"INSERT INTO " + RENTING_TABLE_NAME + " (" + STUDENT_ID_NAME + "," + START_DATE_NAME + ","
						+ END_DATE_NAME + "," + INSTRUMENT_ID_NAME + ")  VALUES ( ? , CURRENT_DATE, DATE '?', ? ");
		incrementAvailableStockStmt = connection.prepareStatement("UPDATE " + STOCK_TABLE_NAME +
					    " SET " + STOCK_AVAILABLITY_NAME + " = " + STOCK_AVAILABLITY_NAME + " + 1 " +
					    " WHERE " + STOCK_ID_NAME + " = ?");
		decrementAvailableStockStmt = connection.prepareStatement("UPDATE " + STOCK_TABLE_NAME +
			    " SET " + STOCK_AVAILABLITY_NAME + " = " + STOCK_AVAILABLITY_NAME + " - 1 " +
			    " WHERE " + STOCK_ID_NAME + " = ?");

	}

	public static Connection connect() throws SQLException {
		String url = "jdbc:postgresql://localhost:5432/soundgood_music_school"; // Update with your database name
		String username = "postgres";
		String password = "seemaärbäst";

		Connection connection = DriverManager.getConnection(url, username, password);
		connection.setAutoCommit(false);
		return connection;
	}

	//Fråga 3?
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
			handleException("Failed to check rental", e);
		}
	}

	public static void handleException(String failureMsg, SQLException e) {
		System.out.println(failureMsg);

		// Rollback the transaction if an error occurs
		Connection connection = null;
		try {
			// Obtain a new connection for the rollback
			connection = connect();
			if (connection != null) {
				connection.rollback();
			}
		} catch (SQLException rollbackException) {
			rollbackException.printStackTrace();
		} finally {
			try {
				// Close the connection used for rollback
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException closeException) {
				closeException.printStackTrace();
			}
		}
	}

	//Query 2
	private static int retrieveMaxInstrumentRule() {
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
			handleException("Failed to retrieve maximum instrument rule", e);
			return 0;
		}
	}

	private static int retrieveMaxRentingPeriod() throws SQLException {
		Connection connection = connect();
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery(
				"SELECT rule_value FROM school_rules WHERE rule_description LIKE '%Maximum renting period%'");

		int maxRentingPeriod = 0;
		if (resultSet.next()) {
			maxRentingPeriod = resultSet.getInt("rule_value");
		}

		// Close resources
		resultSet.close();
		statement.close();
		connection.close();

		return maxRentingPeriod;
	}

	private static boolean isDateWithinRange(String dateTo, int maxRentingPeriod) {
		try {
			Connection connection = connect();

			// Calculate the maximum allowed date in SQL
			String query = "SELECT CURRENT_DATE + INTERVAL '" + maxRentingPeriod + "' MONTH";
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);

			// Get the maximum allowed date from the SQL result
			if (resultSet.next()) {
				java.sql.Date maxAllowedDate = resultSet.getDate(1);

				// Parse the input date string to Date
				java.sql.Date toDate = java.sql.Date.valueOf(dateTo);

				// Check if toDate is within the allowed range
				return !toDate.after(maxAllowedDate);
			}

			resultSet.close();
			statement.close();
			connection.close();
		} catch (SQLException e) {
			handleException("Failed to retrieve data within range", e);
		}

		return false; // Error occurred or no result, default to false
	}

	//Fråga 1
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
			handleException("Failed to retrieve available instruments", e);
		}
	}

	//Fråga 3
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
			handleException("Failed to terminate rental.", e);
			
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
			handleException("Failed to retrieve active rentals.", e);
			
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
			handleException("Failed to count active rentals.",e);
			
		}
		return rentedInstruments;
	}

	public static void rentInstrument(int studentId, int instrumentId, String dateTo) {
		try {
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

			// Retrieve the maximum renting period from school rules
			int maxRentingPeriod = retrieveMaxRentingPeriod();

			// Check if the dateTo is within the allowed range (maxRentingPeriod from the
			// current date)
			if (!isDateWithinRange(dateTo, maxRentingPeriod)) {
				System.out.println("Maximum renting period exceeded. Please select a date within the allowed range.");
				return; // Exit method if the date exceeds the maximum range
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
			handleException("Failed to rent instrument.", e);
			
		}
	}

}
