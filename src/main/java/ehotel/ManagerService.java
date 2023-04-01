package ehotel;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ManagerService {
    public void addManager(String email, String hAddress, String fullName, String pAddress) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection connection = conDB.getConnection();
            PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO person(email, fullName, pAddress) VALUES(?, ?, ?)");
            statement.setString(1, email);
            statement.setString(2, fullName);
            statement.setString(3, pAddress);
            statement.executeUpdate();

            statement = connection.prepareStatement(
                    "INSERT INTO manager(email, hAddress) VALUES(?, ?)");
            statement.setString(1, email);
            statement.setString(2, hAddress);
            statement.executeUpdate();

            System.out.println("Manager added to database.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void deleteManager(String email) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection connection = conDB.getConnection();
            PreparedStatement statement = connection.prepareStatement(
                    "DELETE FROM manager WHERE email = ?");
            statement.setString(1, email);
            statement.executeUpdate();

            statement = connection.prepareStatement(
                    "DELETE FROM person WHERE email = ?");
            statement.setString(1, email);
            statement.executeUpdate();

            System.out.println("Manager deleted from database.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
