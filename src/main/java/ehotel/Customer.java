package ehotel;

import java.util.*;
import java.sql.Date;

public class Customer extends Person{
    public Date bookingDate;

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public Customer(String SIN, String fullName, String paddress, Date bookingDate) {
        super(SIN, fullName, paddress);
        this.bookingDate = bookingDate;
    }

    @Override
    public String toString() {
        return "ehotel.Customer{" +
                "bookingDate=" + bookingDate +
                ", SIN='" + SIN + '\'' +
                ", fullName='" + fullName + '\'' +
                ", paddress='" + paddress + '\'' +
                '}';
    }


}
