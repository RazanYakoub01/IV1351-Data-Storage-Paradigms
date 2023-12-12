package main.java.se.kth.iv1351.soundschooldbc.view;

public enum Command {

    HELP,
    /**
     * Leave the chat application.
     */

    /**
     * Lists all available instruments of a type.
     */
    LIST,
    /**
     * Rents the specified instrument.
     */
    RENT,
    /**
     * Terminates a chosen rental.
     */
    TERMINATE,
    /**
     * Leave the chat application.
     */
    QUIT,
    /**
     * None of the valid commands above was specified.
     */
    ILLEGAL_COMMAND
}
