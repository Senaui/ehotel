package ehotel;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class RecordService {
    public SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public Integer makeBooking(Date bookingD, Date startD, Date endD, Room room, Customer customer) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("SELECT reference FROM history");
            Integer newReference = 0;
            if (rs.last()) {
                newReference = rs.getInt(1) + 1;
            }

            st.executeQuery("INSERT INTO record (recordID, bookingDate, startDate, endDate, roomNum, cSIN )" +
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

    public Integer makeRenting(Date startD, Date endD, Room room, Customer customer, Employee employee, Float payment) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("SELECT reference FROM history");
            Integer newReference = 0;
            if (rs.last()) {
                newReference = rs.getInt(1) + 1;
            }

            st.executeQuery("INSERT INTO record (recordID, startDate, endDate, roomNum, cSIN, eSIN, payment)" +
                    "VALUES (" +
                    newReference.toString() + ", '" +
                    dateFormat.format(startD) + "', '" +
                    dateFormat.format(endD) + "', " +
                    room.getRoomNum() + ", '" +
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


}
