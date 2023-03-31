package ehotel;

import java.sql.Date;

public class Record {
    private int recordID;
    private Date bookingDate;
    private Date startDate;
    private Date endDate;
    private int roomNum;
    private String eSIN;
    private String cSIN;
    private float payment;

    public Record(int recordID, Date bookingDate, Date startDate, Date endDate, int roomNum, String eSIN, String cSIN, float payment) {
        this.recordID = recordID;
        this.bookingDate = bookingDate;
        this.startDate = startDate;
        this.endDate = endDate;
        this.roomNum = roomNum;
        this.eSIN = eSIN;
        this.cSIN = cSIN;
        this.payment = payment;
    }

    // getters and setters
    public int getRecordID() {
        return recordID;
    }

    public void setRecordID(int recordID) {
        this.recordID = recordID;
    }

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }

    public String geteSIN() {
        return eSIN;
    }

    public void seteSIN(String eSIN) {
        this.eSIN = eSIN;
    }

    public String getcSIN() {
        return cSIN;
    }

    public void setcSIN(String cSIN) {
        this.cSIN = cSIN;
    }

    public float getPayment() {
        return payment;
    }

    public void setPayment(float payment) {
        this.payment = payment;
    }
}
