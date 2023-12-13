/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.utility;

/**
 * @author razan
 *
 */
public class InstrumentAvailability {
	
	public static void checkInstrumentAvailability(String instrumentStock) throws InstrumentAvailabilityException {
	    int availableStock = Integer.parseInt(instrumentStock);
	    if (availableStock <= 0) {
	        throw new InstrumentAvailabilityException("Instrument stock is zero or less.");
	    }
	}

}
