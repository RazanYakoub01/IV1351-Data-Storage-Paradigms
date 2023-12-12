package main.java.se.kth.iv1351.soundschooldbc.integration;

import main.java.se.kth.iv1351.soundschooldbc.model.*;
import main.java.se.kth.iv1351.soundschooldbc.utility.*;

/**
 * @author Razan Yakoub , Seema Bashir , Teoman Köylüoglu
 *
 */

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	private PreparedStatement getMaxAllowedInstrumentStmt;
	private PreparedStatement getMaxRentingPeriodStmt;
	private PreparedStatement listAvailableInstrumentStmt;
	private PreparedStatement terminateRentalStmt;
	private PreparedStatement showActiveRentalStmt;
	private PreparedStatement rentInstrumentStmt;
	private PreparedStatement updateInstrumentStmt;

	public SchoolDAO() throws SchoolDBException {
		try {
			connectToSchoolDB();
			preparedStatements();
		} catch (SQLException exception) {
			throw new SchoolDBException("Could not connect to datasource.", exception);
		}
	}

	private void connectToSchoolDB() throws SQLException {
		String url = "jdbc:postgresql://localhost:5432/soundgood_music_school";
		String username = "postgres";
		String password = "seemaärbäst";

		connection = DriverManager.getConnection(url, username, password);
		connection.setAutoCommit(false);
	}

	public void commit() throws SchoolDBException {
		try {
			connection.commit();
		} catch (SQLException e) {
			handleException("Failed to commit", e);
		}
	}

	// Query 1
	public List<Instrument> listInstrument(String instrumentType) throws SchoolDBException {
		List<Instrument> instrumentList = new ArrayList<>();
		String failureMsg = "Failed to retrieve available instruments of type: " + instrumentType;
		ResultSet result = null;

		try {
			result = listAvailableInstrumentStmt.executeQuery();
			while (result.next()) {
				int instrumentId = result.getInt(INSTRUMENT_ID_NAME);
				int stockId = result.getInt(STOCK_ID_NAME);
				String instrumentName = result.getString(INSTRUMENT_NAME);
				String brand = result.getString(INSTRUMENT_BRAND_NAME);
				int rentingPrice = result.getInt(INSTRUMENT_RENTING_PRICE);
				String availableStock = result.getString(STOCK_AVAILABLITY_NAME);

				// Create an Instrument object and add it to the list
				Instrument instrument = new Instrument(instrumentId, stockId, instrumentName, brand, rentingPrice,
						availableStock);
				instrumentList.add(instrument);
			}
			connection.commit();
		} catch (SQLException e) {
			handleException(failureMsg, e);
		} finally {
			closeResultSet(failureMsg, result);
		}

		return instrumentList;
	}

	// Query 2
	public void rentInstrument(int instrumentId, int studentId, String dateTo) throws SchoolDBException {
		String failureMsg = "Failed to rent instrument";
		if (!checkRentalRules(studentId, dateTo)) {
			return;
		}
		try {
			rentInstrumentStmt.setInt(1, studentId);
			rentInstrumentStmt.setString(2, dateTo);
			rentInstrumentStmt.setInt(3, instrumentId);
			int rowsAffected = rentInstrumentStmt.executeUpdate();
			if (rowsAffected != 1) {
				handleException(failureMsg, null);
			}
			connection.commit();
		} catch (SQLException e) {
			handleException(failureMsg, e);
		}
	}

	/*
	 * Används när man rentat ett instrument eller terminerat en rental.
	 */
	public void updateInstrumentStock(Instrument instrument) throws SchoolDBException {
		String failureMsg = "Failed to update instrument Stock";
		String newInstrumentStock = instrument.getInstrumentAvailableStock();
		try {
			updateInstrumentStmt.setString(1, newInstrumentStock);
			updateInstrumentStmt.setInt(2, instrument.getStockID());
			int rowsAffected = updateInstrumentStmt.executeUpdate();
			if (rowsAffected != 1) {
				handleException(failureMsg, null);
			}
			connection.commit();
		} catch (SQLException e) {
			handleException(failureMsg, e);
		}
	}

	public List<Rental> getActiveRentals(int studentID) throws SchoolDBException {
		String failureMsg = "Failed to retrieve active rentals";
		ResultSet result = null;
		List<Rental> activeRentals = new ArrayList<>();

		try {
			result = showActiveRentalStmt.executeQuery();

			while (result.next()) {
				int rentalId = result.getInt(RENTAL_ID_NAME);
				int instrumentId = result.getInt(INSTRUMENT_ID_NAME);
				Date dateFrom = result.getDate(START_DATE_NAME);
				Date dateTo = result.getDate(END_DATE_NAME);
				String rentalStatus = result.getString(RENTAL_STATUS_NAME);

				Rental rental = new Rental(studentID, rentalId, instrumentId, dateFrom, dateTo, rentalStatus);
				activeRentals.add(rental);
			}

		} catch (SQLException e) {
			handleException("Failed to retrieve active rentals.", e);
		} finally {
			closeResultSet(failureMsg, result);
		}

		return activeRentals;
	}

	/**
	 * @param studentID
	 * @param rentalID
	 * @throws SchoolDBException
	 *                           Denna metod anropar på getRentalStatus som per
	 *                           automatik terminerar en rental.
	 *                           Denna metod terminerar då ett specifikt instrument
	 *                           och fastställer den i databasen.
	 */
	public void updateRental(Rental rental) throws SchoolDBException {
		String failureMsg = "Failed to terminate a rental";
		try {
			terminateRentalStmt.setString(1, rental.getRentalStatus());
			terminateRentalStmt.setInt(2, rental.getStudentId());
			terminateRentalStmt.setInt(3, rental.getRentalId());
			int rowsAffected = terminateRentalStmt.executeUpdate();
			if (rowsAffected != 1) {
				handleException(failureMsg, null);
			}
			connection.commit();
		} catch (SQLException e) {
			handleException(failureMsg, e);
		}
	}

	/**
	 * Har till rent instrument att göra (Query 2), används för att enforca regeln.
	 */
	private Integer retrieveMaxInstrumentRule() throws SchoolDBException {
		String failureMsg = "Failed to retrieve maximum instrument rule";
		ResultSet result = null;
		Integer maxInstruments = null;
		try {
			result = getMaxAllowedInstrumentStmt.executeQuery();
			if (result.next()) {
				maxInstruments = result.getInt(RULE_VALUE_NAME);
			}
			connection.commit();
		} catch (SQLException e) {
			handleException(failureMsg, e);
		} finally {
			closeResultSet(failureMsg, result);
		}
		return maxInstruments;
	}

	private Integer retrieveMaxRentingPeriod() throws SchoolDBException {
		String failureMsg = "Failed to retrieve maximum renting period";
		ResultSet result = null;
		Integer maxRentingPeriod = null;
		try {
			result = getMaxRentingPeriodStmt.executeQuery();
			if (result.next()) {
				maxRentingPeriod = result.getInt(RULE_VALUE_NAME);
			}
			connection.commit();
		} catch (SQLException e) {
			handleException(failureMsg, e);
		} finally {
			closeResultSet(failureMsg, result);
		}
		return maxRentingPeriod;
	}

	/*
	 * Denna metod sammanställer retrieveMaxRentingPeriod och
	 * retrieveMaxInstrumentRule
	 * Genom att anropa på dem, och säkerställa att reglerna tillhandlas.
	 */
	private boolean checkRentalRules(int studentId, String dateTo) throws SchoolDBException {
		boolean status = true;
		Integer maxInstruments = retrieveMaxInstrumentRule();
		Integer rentedInstruments = getActiveRentals(studentId).size();
		Integer maxRentingPeriod = retrieveMaxRentingPeriod();
		DateValidator dv = new DateValidator(maxRentingPeriod);
		if (rentedInstruments >= maxInstruments) {
			System.out.println("You have already rented the maximum number of instruments allowed.");
			return false;
		}
		if (dv.isDateWithinRange(dateTo)) {
			System.out.println("Maximum renting period exceeded. Please select a date within the allowed range.");
			return false;
		}
		return status;
	}

	private void handleException(String failureMsg, Exception cause) throws SchoolDBException {
		String completeFailureMsg = failureMsg;
		try {
			connection.rollback();
		} catch (SQLException rollbackExc) {
			completeFailureMsg = completeFailureMsg +
					". Also failed to rollback transaction because of: " + rollbackExc.getMessage();
		}

		if (cause != null) {
			throw new SchoolDBException(failureMsg, cause);
		} else {
			throw new SchoolDBException(failureMsg);
		}
	}

	private void closeResultSet(String failureMsg, ResultSet result) throws SchoolDBException {
		try {
			result.close();
		} catch (Exception e) {
			throw new SchoolDBException(failureMsg + " Could not close result set.", e);
		}
	}

	private void preparedStatements() throws SQLException {
		getMaxAllowedInstrumentStmt = connection.prepareStatement("SELECT " + RULE_VALUE_NAME + " FROM "
				+ RULE_TABLE_NAME + " WHERE " + RULE_DESCRIPTION_NAME + " LIKE '%" + MAX_INSTRUMENT_RULE + "%'");
		getMaxRentingPeriodStmt = connection.prepareStatement("SELECT " + RULE_VALUE_NAME + " FROM " + RULE_TABLE_NAME
				+ " WHERE " + RULE_DESCRIPTION_NAME + " LIKE '%" + MAX_PERIOD_RULE + "%'");
		listAvailableInstrumentStmt = connection.prepareStatement("SELECT i." + INSTRUMENT_ID_NAME + ", s."
				+ STOCK_ID_NAME + ", s." + INSTRUMENT_NAME + ", s." + INSTRUMENT_BRAND_NAME + ", s."
				+ INSTRUMENT_RENTING_PRICE + " FROM " + INSTRUMENT_TABLE_NAME + " i JOIN " + STOCK_TABLE_NAME
				+ " s ON i." + STOCK_ID_NAME + "= s." + STOCK_ID_NAME + " WHERE s." + INSTRUMENT_NAME
				+ " = ? AND CAST(s." + STOCK_AVAILABLITY_NAME + " AS INTEGER) > ?");
		terminateRentalStmt = connection.prepareStatement("UPDATE " + RENTING_TABLE_NAME + " SET "
				+ RENTAL_STATUS_NAME + " = ?, " + END_DATE_NAME + " = CURRENT_DATE WHERE "
				+ STUDENT_ID_NAME + " = ? AND " + RENTAL_ID_NAME + " = ? AND "
				+ RENTAL_STATUS_NAME + " = ?");
		showActiveRentalStmt = connection.prepareStatement("SELECT * FROM " + RENTING_TABLE_NAME + "WHERE "
				+ STUDENT_ID_NAME + " = ? AND " + RENTAL_STATUS_NAME + " = '?'");
		rentInstrumentStmt = connection.prepareStatement(
				"INSERT INTO " + RENTING_TABLE_NAME + " (" + STUDENT_ID_NAME + "," + START_DATE_NAME + ","
						+ END_DATE_NAME + "," + INSTRUMENT_ID_NAME + ")  VALUES ( ? , CURRENT_DATE, DATE '?', ? ");
		updateInstrumentStmt = connection.prepareStatement("UPDATE " + STOCK_TABLE_NAME +
				" SET " + STOCK_AVAILABLITY_NAME + " =  '?' WHERE " + STOCK_ID_NAME + " = ? ");

	}

}
