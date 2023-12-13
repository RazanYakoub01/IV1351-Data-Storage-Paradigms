/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.utility;

/**
 * @author razan
 *
 */
public class StudentRental {

	public static void checkStudentRentalAvailability(int numberOfRentals, int maxNumberOfRentals) throws StudentRentalAvailabilityException {
		if (numberOfRentals >= maxNumberOfRentals) {
            throw new StudentRentalAvailabilityException("Maximum number of rentals reached for this student.");
		}
		
	}
}
