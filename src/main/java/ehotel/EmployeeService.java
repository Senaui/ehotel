package ehotel;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class EmployeeService {
    public void addEmployee(String email, String fullName, String pAddress, String roleofemployee) throws Exception {
        ConnectionDB conDB = new ConnectionDB();
        Connection connection = conDB.getConnection();

        String sql = "INSERT INTO person (email, fullName, pAddress) VALUES (?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);

        statement.setString(1, email);
        statement.setString(2, fullName);
        statement.setString(3, pAddress);
        statement.executeUpdate();

        sql = "INSERT INTO employee (email, roleofemployee) VALUES (?, ?)";
        statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, roleofemployee);
        statement.executeUpdate();
    }


    public void deleteEmployee(String email) throws Exception {
        ConnectionDB conDB = new ConnectionDB();
        Connection connection = conDB.getConnection();

        String sql = "DELETE FROM employee WHERE email = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.executeUpdate();

        sql = "DELETE FROM person WHERE email = ?";
        statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.executeUpdate();
    }
}
