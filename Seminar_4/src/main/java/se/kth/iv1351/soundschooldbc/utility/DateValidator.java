package main.java.se.kth.iv1351.soundschooldbc.utility;

import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class DateValidator {


	public static void validateDateWithinRange(Date dateTo, int maxRentingPeriod) throws DateOutOfRangeException {
	    LocalDate currentDate = LocalDate.now();
	    LocalDate allowedDate = currentDate.plusMonths(maxRentingPeriod);

	    // Convert java.util.Date to LocalDate
	    LocalDate dateToCheck = dateTo.toLocalDate(); // This directly converts to LocalDate

	    if (dateToCheck.isAfter(allowedDate)) {
	        throw new DateOutOfRangeException("Date is beyond the allowed range.");
	    }
	}

}