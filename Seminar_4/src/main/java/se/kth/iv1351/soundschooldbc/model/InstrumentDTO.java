/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.model;

/**
 * @author razan
 *
 */
public interface InstrumentDTO {
	int getInstrumentID();

	int getStockID();

	String getInstrumentName();

	String getInstrumentBrand();

	int getInstrumentRentingPrice();

	String getInstrumentAvailableStock();

	String toString();

}