package main.java.se.kth.iv1351.soundschooldbc.utility;

import java.sql.Date;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class DateValidator {
    private int maxRentingPeriod;

    public DateValidator(int maxRentingPeriod) {
        this.maxRentingPeriod = maxRentingPeriod;
    }

    public boolean isDateWithinRange(Date dateTo) {
        LocalDate currentDate = LocalDate.now();
        LocalDate allowedDate = currentDate.plusMonths(maxRentingPeriod);

        // Convert java.sql.Date to LocalDate
        LocalDate dateToCheck = dateTo.toLocalDate();

        return dateToCheck.isAfter(allowedDate);
    }

}