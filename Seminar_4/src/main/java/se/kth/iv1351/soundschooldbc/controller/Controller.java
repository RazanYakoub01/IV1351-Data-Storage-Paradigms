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
import main.java.se.kth.iv1351.soundschooldbc.utility.*;


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
            availableInstrument = soundGoodDB.readAvailableInstrument(instrumentName);
            return availableInstrument;
        } catch (Exception e) {
            throw new InstrumentException(failureMsg, e);
        }
    }

    public void rentInstrument(Integer studentId, Integer instrumentId, Date dateTo)
            throws SchoolDBException, InstrumentException, Exception{
        String failureMsg = "Failed to rent instrument CONTROLLER";
        try {
            Instrument instrument = null;
            instrument = soundGoodDB.readInstrumentById(instrumentId);
            if (studentId == null || instrument == null || dateTo == null) {
                throw new InstrumentException(failureMsg);
            }
            String instrumentStock = instrument.getInstrumentAvailableStock();
            InstrumentAvailability.checkInstrumentAvailability(instrumentStock);
            int studentRentals = soundGoodDB.readActiveRentals(studentId).size();
            int maxAllowedRentals = soundGoodDB.readMaxInstrumentRule();
            StudentRental.checkStudentRentalAvailability(studentRentals,maxAllowedRentals);
            int maxAllowedRentingPeriod = soundGoodDB.readMaxRentingPeriod();
            DateValidator.validateDateWithinRange(dateTo,maxAllowedRentingPeriod);
            soundGoodDB.createRentedInstrument(instrumentId, studentId, dateTo);
            instrument.decrementAvailableStock();
            soundGoodDB.updateInstrumentStock(instrument);
            System.out.println("Rental is sucessful :) ");
        } catch (SchoolDBException bdbe) {
            throw new InstrumentException(failureMsg, bdbe);
        } catch (StudentRentalAvailabilityException bdbe) {
        	System.out.println(bdbe.getMessage());
            throw new InstrumentException(failureMsg, bdbe);
        } catch (InstrumentAvailabilityException bdbe) {
        	System.out.println(bdbe.getMessage());
            throw new InstrumentException(failureMsg, bdbe);
        } catch (DateOutOfRangeException bdbe) {
        	System.out.println(bdbe.getMessage());
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
            List<Rental> activeRentals = soundGoodDB.readActiveRentals(studentId);
            for (Rental rental : activeRentals) {
                if (rental.getRentalId() == rentalId) {
                    rentalToTerminate = rental;
                    break;
                }
            }
            if (rentalToTerminate == null) {
                throw new InstrumentException(failureMsg + ": Rental not found.");
            }
            rentalToTerminate.setTerminateStatus();
            soundGoodDB.updateRental(rentalToTerminate);
            Instrument inst = soundGoodDB.readInstrumentById (rentalToTerminate.getInstrumentId());
            inst.incrementAvailableStock();
            soundGoodDB.updateInstrumentStock(inst);
        } catch (SchoolDBException bdbe) {
            throw new InstrumentException(failureMsg, bdbe);
        } catch (Exception e) {
            commitOngoingTransaction(failureMsg);
            throw e;
        }
    }
    

    public List<Rental> getActiveRentals(int studentID) {
        try {
            return soundGoodDB.readActiveRentals(studentID);
        } catch (SchoolDBException e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

}
