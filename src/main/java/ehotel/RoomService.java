package ehotel;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public class RoomService {
    public SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    public ArrayList<String> tableName = new ArrayList<String>(Arrays.asList("hotelchain", "hotel", "room", "person", "manager", "employee", "customer", "reservation", "history", "changeroomstatus"));

    public List<Room> getAvailableRooms(Date startD, Date endD, int capacity, String area, String hotelChain, int category, int totalRoom, double price) {
        LinkedList<Room> result = null;
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM (room JOIN reservation ON room.roomNum = reservation.roomNum) AS rr " +
                    "JOIN hotel ON rr.hAddress = hotel.address WHERE" +
                    " startDate >= " + "'" + dateFormat.format(endD) + "'" + " Or endDate <= " + "'" + dateFormat.format(startD) + "'" +
                    " AND capacity = " + capacity +
                    " AND hAddress = " + "'" + area + "'" +
                    " AND addressofcentraloffice = " + "'" + hotelChain + "'" +
                    " AND category = " + category +
                    " AND totalRoom = " + totalRoom +
                    " AND price <= " + price);
            st.close();

            result = new LinkedList<Room>();


            while (rs.next()) {
                result.add(new Room(rs.getInt("roomNum"), rs.getFloat("price"),
                        rs.getString("amenity"), rs.getInt("capacity"),
                        rs.getString("description"), rs.getString("status"),
                        rs.getString("viewofroom"), rs.getInt("addingBed"), rs.getString("hAddress")));
            }
            rs.close();
            st.close();
        } catch (Exception exception) {
            System.out.println("An exception was thrown:" + exception.getMessage());
        }
        return result;
    }


    public void setDStatus(String status, Integer roomNum) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();
            Statement st = con.createStatement();
            String query = "UPDATE room set status = ? WHERE roomNum = ?;";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, status);
            stmt.setInt(2, roomNum);
            int output = stmt.executeUpdate();
        } catch (Exception exception) {
            System.out.println("An exception was thrown:" + exception.getMessage());
        }
    }

    public void addroom(int roomNum, float price, String amenity, int capacity, String description, String status, String viewofroom, int addingBed, String hAddress) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();
            Statement st = con.createStatement();

            String query = "INSERT INTO room(roomNum, price, amenity, capacity, description, status, viewofroom, addingBed, hAddress)" +
                    "VALUES (?,?,?,?,?,?,?,?,?);";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, roomNum);
            stmt.setFloat(2, price);
            stmt.setString(3, amenity);
            stmt.setInt(4, capacity);
            stmt.setString(5, description);
            stmt.setString(6, status);
            stmt.setString(7, viewofroom);
            stmt.setInt(8, addingBed);
            stmt.setString(9, hAddress);

            int output = stmt.executeUpdate();
        } catch (Exception exception) {
            System.out.println("An exception was thrown:" + exception.getMessage());
        }
    }

    public void deleteroom(int roomNum) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();
            Statement st = con.createStatement();

            String query = "DELETE FROM room WHERE roomNum = ?;";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, roomNum);


            int output = stmt.executeUpdate();
        } catch (Exception exception) {
            System.out.println("An exception was thrown:" + exception.getMessage());
        }
    }
}
