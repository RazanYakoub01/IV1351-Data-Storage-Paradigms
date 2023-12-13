package main.java.se.kth.iv1351.soundschooldbc.view;

import main.java.se.kth.iv1351.soundschooldbc.controller.Controller;
import java.text.SimpleDateFormat;

import main.java.se.kth.iv1351.soundschooldbc.model.Instrument;
import main.java.se.kth.iv1351.soundschooldbc.model.InstrumentException;
import main.java.se.kth.iv1351.soundschooldbc.model.Rental;

import java.text.ParseException;
import java.util.List;
import java.util.Scanner;

public class BlockingInterpreter {

    private static final String PROMPT = "> ";
    private final Scanner console = new Scanner(System.in);
    private boolean keepReceivingCmds = true;
    private Controller ctrl;
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");


    public BlockingInterpreter(Controller ctrl) {
        this.ctrl = ctrl;
    }

    public void stop() {
        keepReceivingCmds = false;
    }

    private String readNextLine() {
        System.out.print(PROMPT);
        return console.nextLine();
    }

    public void handleCmds() {
        System.out.println("Welcome to School Good Music School!");
        System.out.println("You can use the following commands:");
        System.out.println("- help: To display available commands.");
        System.out.println("- list: To list available instruments of a specific type.");
        System.out.println("- rent: To rent an instrument.");
        System.out.println("- terminate: To terminate a rental.");
        System.out.println("- quit: To exit.");

        // Loop to handle commands
        while (keepReceivingCmds) {
            try {
                CmdLine cmdLine = new CmdLine(readNextLine());
                switch (cmdLine.getCmd()) {
                    case HELP:
                        for (Command command : Command.values()) {
                            if (command == Command.ILLEGAL_COMMAND) {
                                continue;
                            }
                            System.out.println(command.toString().toLowerCase());
                        }
                        break;
                    case ILLEGAL_COMMAND:
                        System.out.println("illegal command");
                        break;
                    case QUIT:
                        keepReceivingCmds = false;
                        break;
                    case LIST:
                        System.out.println("Enter instrument type (e.g., Guitar): ");
                        String instrumentType = readNextLine();
                        List<Instrument> availableInstruments = ctrl.getAvailableInstrument(instrumentType);
                        if (!availableInstruments.isEmpty()) {
                            System.out.println("Available instruments of type " + instrumentType + ":");
                            for (Instrument instrument : availableInstruments) {
                                System.out.println(instrument);
                            }
                        } else {
                            System.out.println("No available instruments of type " + instrumentType);
                        }
                        break;
                    case RENT:
                        System.out.println("Enter student ID: ");
                        int studentId = Integer.parseInt(readNextLine());
                        System.out.println("Enter instrument ID: ");
                        int instrumentId = Integer.parseInt(readNextLine());
                        System.out.println("Enter date to (YYYY-MM-DD): ");
                        java.sql.Date dateTo;
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                        try {
                            java.util.Date parsedDate = dateFormat.parse(readNextLine());
                            dateTo = new java.sql.Date(parsedDate.getTime());
                        } catch (ParseException e) {
                            System.out.println("Invalid date format. Please use YYYY-MM-DD.");
                            return; 
                        }
                        try {
                            ctrl.rentInstrument(studentId, instrumentId, dateTo);
                        } catch(InstrumentException e) {
                        	System.out.println("Failed to rent instrument ");
                        }

                        break;
                    case TERMINATE:
                        System.out.println("Enter student ID: ");
                        int studentID = Integer.parseInt(readNextLine());
                        List<Rental> activeRentals = ctrl.getActiveRentals(studentID);

                        if (!activeRentals.isEmpty()) {
                            // Display active rentals to the user
                            System.out.println("Active rentals for student " + studentID + ":");
                            for (Rental rental : activeRentals) {
                                System.out.println(rental);
                            }

                            System.out.println("Enter rental ID to terminate: ");
                            int rentalID = Integer.parseInt(readNextLine());
                            try {
                                ctrl.terminateRental(studentID, rentalID);
                                System.out.println("Rental terminated successfully.");
                            } catch (InstrumentException e) {
                                System.out.println("Failed to terminate rental: " + e.getMessage());
                            }
                        } else {
                            System.out.println("No active rentals found for student " + studentID);
                        }
                        break;

                    default:
                        System.out.println("Invalid command.");
                        break;
                }
            } catch (Exception e) {
                System.out.println("Operation failed");
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        }
    }

}
