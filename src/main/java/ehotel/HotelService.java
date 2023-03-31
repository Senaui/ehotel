package ehotel;

import java.sql.Connection;
import java.sql.Statement;

public class HotelService {
    public void deleteHotel(Hotel hotel) {
        try {
            ConnectionDB conDB = new ConnectionDB();
            Connection con = conDB.getConnection();
            Statement st = con.createStatement();
            st.executeQuery("DELETE FROM room WHERE haddress = '" + hotel.getAddress() + "';");
            st.executeQuery("DELETE FROM manager WHERE haddress = '" + hotel.getAddress() + "';");
            st.executeQuery("DELETE FROM hotel WHERE address = '" + hotel.getAddress() + "';");
            st.close();
        } catch (Exception exception) {
            System.out.println("An exception was thrown:" + exception.getMessage());
        }
    }
}
