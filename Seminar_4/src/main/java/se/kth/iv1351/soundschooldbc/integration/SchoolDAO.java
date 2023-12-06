/**
 * 
 */
package main.java.se.kth.iv1351.soundschooldbc.integration;

/**
 * @author Razan Yakoub , Seema Bashir
 *
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SchoolDAO {
	public static Connection connect() throws SQLException {
        String url = "jdbc:postgresql://localhost:5432/soundgood_music_school"; // Update with your database name
        String username = "postgres";
        String password = "seemaärbäst";

        Connection connection = DriverManager.getConnection(url, username, password);
        return connection;
    }


}
