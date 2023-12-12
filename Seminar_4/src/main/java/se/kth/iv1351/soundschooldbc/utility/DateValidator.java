package main.java.se.kth.iv1351.soundschooldbc.utility;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DateValidator {
    private int maxRentingPeriod;

    public DateValidator(int maxRentingPeriod) {
        this.maxRentingPeriod = maxRentingPeriod;
    }

    public boolean isDateWithinRange(String dateTo) {
        LocalDate currentDate = LocalDate.now();
        LocalDate allowedDate = currentDate.plusMonths(maxRentingPeriod);
        LocalDate toDate = LocalDate.parse(dateTo, DateTimeFormatter.ISO_DATE);
        return toDate.isAfter(allowedDate);
    }

}