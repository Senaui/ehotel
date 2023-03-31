package ehotel;

import java.util.Date;

public class Booking {
    private Integer id;
    private Integer ssn;
    private Integer roomNumber;
    private Date startDate;
    private Date endDate;

    public Booking(Integer id, Integer ssn, Integer roomNumber, Date startDate, Date endDate) {
        this.id = id;
        this.ssn = ssn;
        this.roomNumber = roomNumber;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Integer getId() {
        return id;
    }

    public Integer getSsn() {
        return ssn;
    }

    public Integer getRoomNumber() {
        return roomNumber;
    }

    public Date getStartDate() {
        return startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setSsn(Integer ssn) {
        this.ssn = ssn;
    }

    public void setRoomNumber(Integer roomNumber) {
        this.roomNumber = roomNumber;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "<ul>"
                + "<li>id= " + id + "</li>"
                + "<li>ssn= " + ssn + "</li>"
                + "<li>roomNumber= " + roomNumber + "</li>"
                + "<li>startDate= " + startDate + "</li>"
                + "<li>endDate= " + endDate + "</li>";
    }
}
