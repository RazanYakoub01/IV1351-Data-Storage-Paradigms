/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.model;

import java.sql.Date;

/**
 * @author razan
 *
 */
public interface RentalDTO {
	int getStudentId();
    int getRentalId();
    int getInstrumentId();
    Date getDateFrom();
    Date getDateTo();
    String getRentalStatus();
    String toString();
}
