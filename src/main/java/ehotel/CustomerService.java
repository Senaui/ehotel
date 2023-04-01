package ehotel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {
    public boolean createCustomer(String SIN, String fullName, String pAddress, Date registerDate) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();

            String query1 = "INSERT INTO person (SIN, fullName, pAddress)" +
                    "VALUES (?, ?, ?);";
            String query2 = "INSERT INTO customer (SIN, registerDate)" +
                    "VALUES (?, ?);";
            PreparedStatement stmt = con.prepareStatement(query1);
            stmt.setString(1, SIN);
            stmt.setString(2, fullName);
            stmt.setString(3, pAddress);
            int output = stmt.executeUpdate();

            stmt = con.prepareStatement(query2);
            stmt.setString(1, SIN);
            stmt.setDate(2, registerDate);

            output = stmt.executeUpdate();

            stmt.close();
            con.close();
            conDB.close();
        } catch (Exception exception) {
            System.out.println("An exception was thrown:" + exception.getMessage());
            return false;
        }
        return true;
    }


}
