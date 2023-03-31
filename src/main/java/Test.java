import ehotel.ConnectionDB;

import java.sql.Date;

public class Test {
    public static void main(String[] args) throws Exception {
        ConnectionDB conDB = new ConnectionDB();
        conDB.getConnection();
        conDB.printAllTable();


        conDB.close();

    }
}


