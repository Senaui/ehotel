package ehotel;

import java.sql.Connection;
import java.sql.Statement;

public class HotelChainService {public void deleteHotelchain(HotelChain hotelChain){
    try {
        ConnectionDB conDB = new ConnectionDB();
        Connection con = conDB.getConnection();

        Statement st = con.createStatement();
        st.executeQuery("DELETE FROM room WHERE hAddress IN " +
                "(SELECT address FROM hotel WHERE addressOfCentralOffice = '" + hotelChain.getAddressofcentraloffice()+"');");
        st.executeQuery("DELETE FROM manager WHERE haddress IN " +
                "(SELECT address FROM hotel WHERE addressOfCentralOffice = '" + hotelChain.getAddressofcentraloffice()+"');");
        st.executeQuery("DELETE FROM hotel WHERE address = " +
                "(SELECT address FROM hotel WHERE addressOfCentralOffice = '" + hotelChain.getAddressofcentraloffice()+"');");
        st.executeQuery("DELETE FROM hotelChain WHERE address = '"+hotelChain.getAddressofcentraloffice()+"';");

        st.close();

    } catch(Exception exception) {
        System.out.println("An exception was thrown:" + exception.getMessage());
    }
}
}
