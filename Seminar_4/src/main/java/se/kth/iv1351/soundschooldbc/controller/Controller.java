/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.controller;

import java.util.List;

import main.java.se.kth.iv1351.soundschooldbc.integration.SchoolDAO;
import main.java.se.kth.iv1351.soundschooldbc.integration.SchoolDBException;
import main.java.se.kth.iv1351.soundschooldbc.model.Instrument;
import main.java.se.kth.iv1351.soundschooldbc.model.InstrumentException;
import main.java.se.kth.iv1351.soundschooldbc.model.Rental;

/**
 * @author razan
 *
 */
public class Controller {

    private final SchoolDAO soundGoodDB;
    private List<Instrument> availableInstrument;

    public Controller() throws SchoolDBException {
        soundGoodDB = new SchoolDAO();
    }

    private void commitOngoingTransaction(String failureMsg) throws InstrumentException {
        try {
            soundGoodDB.commit();
        } catch (SchoolDBException bdbe) {
            throw new InstrumentException(failureMsg, bdbe);
        }
    }

    public List<Instrument> getAvailableInstrument(String instrumentName) throws InstrumentException {
        String failureMsg = "Could not get available instruments for: " + instrumentName;
        try {
            availableInstrument = soundGoodDB.listInstrument(instrumentName);
            return availableInstrument;
        } catch (Exception e) {
            throw new InstrumentException(failureMsg, e);
        }
    }

    public void rentInstrument(Integer studentId, Integer instrumentId, String dateTo)
            throws SchoolDBException, InstrumentException {
        String failureMsg = "Failed to rent instrument";
        try {
            Instrument instrument = null;
            for (Instrument inst : availableInstrument) {
                if (inst.getInstrumentID() == instrumentId) {
                    instrument = inst;
                    break;
                }
            }
            if (studentId == null || instrument == null || dateTo == null) {
                throw new InstrumentException(failureMsg);
            }
            soundGoodDB.rentInstrument(instrumentId, studentId, dateTo);
            instrument.decrementAvailableStock();
            soundGoodDB.updateInstrumentStock(instrument);
        } catch (SchoolDBException bdbe) {
            throw new InstrumentException(failureMsg, bdbe);
        } catch (Exception e) {
            commitOngoingTransaction(failureMsg);
            throw e;
        }
    }

    public void terminateRental(Integer studentId, Integer rentalId) throws InstrumentException {
        String failureMsg = "Failed to terminate rental";
        try {
            List<Rental> activeRentals = soundGoodDB.getActiveRentals(studentId);
            Rental rental = null;
            for (Rental rent : activeRentals) {
                if (rent.getRentalId() == rentalId) {
                    rental = rent;
                    break;
                }
            }
            if (studentId == null || rental == null) {
                throw new InstrumentException(failureMsg);
            }
            rental.setTerminateStatus();
            soundGoodDB.updateRental(rental);
        } catch (SchoolDBException bdbe) {
            throw new InstrumentException(failureMsg, bdbe);
        } catch (Exception e) {
            commitOngoingTransaction(failureMsg);
            throw e;
        }
    }
}
