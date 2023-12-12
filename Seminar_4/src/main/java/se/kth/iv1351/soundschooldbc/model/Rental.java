/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.model;

import java.sql.Date;

/**
 * @author razan
 *
 */
public class Rental implements RentalDTO {
    private int studentId;
    private int rentalId;
    private int instrumentId;
    private Date dateFrom;
    private Date dateTo;
    private String rentalStatus;

    // Constructor
    public Rental(int studentId, int rentalId, int instrumentId, Date dateFrom, Date dateTo, String rentalStatus) {
        this.studentId = studentId;
        this.rentalId = rentalId;
        this.instrumentId = instrumentId;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
        this.rentalStatus = rentalStatus;
    }

    // Getters
    public int getStudentId() {
        return studentId;
    }

    public int getRentalId() {
        return rentalId;
    }

    public int getInstrumentId() {
        return instrumentId;
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public String getRentalStatus() {
        return rentalStatus;
    }

    public void setTerminateStatus() {
        this.rentalStatus = "Terminated";
    }

    @Override
    public String toString() {

        return "Rental ID: " + rentalId +
                ", Student ID: " + studentId +
                ", Instrument ID: " + instrumentId +
                ", Date From: " + (dateFrom != null ? dateFrom.toString() : "N/A") +
                ", Date To: " + (dateTo != null ? dateTo.toString() : "N/A") +
                ", Rental Status: " + rentalStatus;
    }
}
