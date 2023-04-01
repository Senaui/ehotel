package ehotel;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class RecordService {
    public SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public Integer makeBooking(Date bookingD, Date startD, Date endD, Room room, Customer customer) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("SELECT recordID FROM history");
            Integer newReference = 0;
            if (rs.last()) {
                newReference = rs.getInt(1) + 1;
            }

            st.executeQuery("INSERT INTO record (recordID, bookingDate, startDate, endDate, roomID, cSIN )" +
                    "VALUES (" +
                    newReference.toString() + ", '" +
                    dateFormat.format(bookingD) + "', '" +
                    dateFormat.format(startD) + "', '" +
                    dateFormat.format(endD) + "', " +
                    room.getRoomNum() + ", '" +
                    customer.SIN + "');");
            rs.close();
            st.close();

            return newReference;
        } catch (Exception exception) {
            System.out.println("An exception was thrown:" + exception.getMessage());
        }
        return -1;
    }

    public Integer makeRenting(Date startD, Date endD, int roomID, Customer customer, Employee employee, Float payment) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("SELECT recordID FROM history");
            Integer newReference = 0;
            if (rs.last()) {
                newReference = rs.getInt(1) + 1;
            }

            st.executeQuery("INSERT INTO record (recordID, startDate, endDate, roomID, cSIN, eSIN, payment)" +
                    "VALUES (" +
                    newReference.toString() + ", '" +
                    dateFormat.format(startD) + "', '" +
                    dateFormat.format(endD) + "', " +
                    roomID + ", '" +
                    customer.SIN + "', '" +
                    employee.SIN + "', " +
                    payment.toString() + ");");


            rs.close();
            st.close();
            return newReference;
        } catch (Exception exception) {
            System.out.println("An exception was thrown:" + exception.getMessage());
        }
        return -1;
    }


    public Integer finishRenting(Employee employee, Integer recordID) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();

            Statement st = con.createStatement();
            st.executeQuery("UPDATE record set eSIN = " + "'" + employee.SIN + "' WHERE recordID = " + recordID + ";");
            st.close();
            return recordID;
        } catch (Exception exception) {
            System.out.println("An exception was thrown:" + exception.getMessage());
        }
        return -1;
    }

    public Integer makePayment(Float payment, Integer recordID) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();

            Statement st = con.createStatement();
            st.executeQuery("UPDATE record set payment = " + payment.toString() + " WHERE recordID = " + recordID + ";");
            st.close();
            return recordID;
        } catch (Exception exception) {
            System.out.println("An exception was thrown:" + exception.getMessage());
        }
        return -1;
    }
    public List<Record> getRecordsByPerson(String personEmail) throws Exception {
        ConnectionDB conDB = new ConnectionDB();
        Connection connection = conDB.getConnection();
        List<Record> records = new ArrayList<>();

        try {
            PreparedStatement statement = connection.prepareStatement(
                    "SELECT * FROM record WHERE cemail = ? OR eemail = ?"
            );
            statement.setString(1, personEmail);
            statement.setString(2, personEmail);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int recordID = resultSet.getInt("recordID");
                Date bookingDate = resultSet.getDate("bookingDate");
                Date startDate = resultSet.getDate("startDate");
                Date endDate = resultSet.getDate("endDate");
                int roomNum = resultSet.getInt("roomNum");
                String eemail = resultSet.getString("eemail");
                String cemail = resultSet.getString("cemail");
                float payment = resultSet.getFloat("payment");

                Record record = new Record(recordID, bookingDate, startDate, endDate, roomNum, eemail, cemail, payment);
                records.add(record);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return records;
    }



}
