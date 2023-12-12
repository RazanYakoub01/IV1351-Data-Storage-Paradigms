/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.controller;

import java.sql.Date;
import java.util.Collections;
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

    public void rentInstrument(Integer studentId, Integer instrumentId, Date dateTo)
            throws SchoolDBException, InstrumentException {
        String failureMsg = "Failed to rent instrument";
        try {
            Instrument instrument = null;
            instrument = soundGoodDB.getInstrumentById(instrumentId);
            if (studentId == null || instrument == null || dateTo == null) {
                throw new InstrumentException(failureMsg);
            }
            soundGoodDB.rentInstrument(instrumentId, studentId, dateTo);
            instrument.decrementAvailableStock();
            soundGoodDB.updateInstrumentStock(instrument);
            System.out.println("Rental is sucessful :) ");
        } catch (SchoolDBException bdbe) {
            throw new InstrumentException(failureMsg, bdbe);
        } catch (Exception e) {
            commitOngoingTransaction(failureMsg);
            throw e;
        }
    }

    public void terminateRental(Integer studentId, Integer rentalId) throws InstrumentException {
        String failureMsg = "Failed to terminate rental CONTROLLER";
        try {
            Rental rentalToTerminate = null;
            List<Rental> activeRentals = soundGoodDB.getActiveRentals(studentId);
            
            // Find the rental to terminate
            for (Rental rental : activeRentals) {
                if (rental.getRentalId() == rentalId) {
                    rentalToTerminate = rental;
                    break;
                }
            }
            // Check if the rental was found
            if (rentalToTerminate == null) {
                throw new InstrumentException(failureMsg + ": Rental not found.");
            }


            // Terminate the rental and update
            rentalToTerminate.setTerminateStatus();

            soundGoodDB.updateRental(rentalToTerminate);
        } catch (SchoolDBException bdbe) {
            throw new InstrumentException(failureMsg, bdbe);
        } catch (Exception e) {
            commitOngoingTransaction(failureMsg);
            throw e;
        }
    }
    

    public List<Rental> getActiveRentals(int studentID) {
        try {
            return soundGoodDB.getActiveRentals(studentID);
        } catch (SchoolDBException e) {
            // Handle exception or log error
            e.printStackTrace();
            return Collections.emptyList(); // Return an empty list if there's an error
        }
    }

}
