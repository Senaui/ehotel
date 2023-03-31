package ehotel;

import java.sql.Date;

public class CheckIn {

    private Integer sinSsn;

    private Integer roomNumber;

    private Integer checkInId;

    private Date startDate;

    private Date endDate;

    public CheckIn(Integer sinSsn, Integer roomNumber, Integer checkInId,
                   Date startDate, Date endDate){
        this.sinSsn = sinSsn;
        this.roomNumber = roomNumber;
        this.checkInId = checkInId;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public Integer getSinSsn() {
        return sinSsn;
    }

    public Integer getRoomNumber() {
        return roomNumber;
    }

    public Integer getCheckInId() {
        return checkInId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setSinSsn(Integer sinSsn) {
        this.sinSsn = sinSsn;
    }

    public void setRoomNumber(Integer roomNumber) {
        this.roomNumber = roomNumber;
    }

    public void setCheckInId(Integer checkInId) {
        this.checkInId = checkInId;
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
                + "<li>SINSSN= " + sinSsn + "</li>"
                + "<li>RoomNumber = " + roomNumber + "</li>"
                + "<li>CheckIn_ID = " + checkInId + "</li>"
                + "<li>Start_Date = " + startDate + "</li>"
                + "<li>End_Date = " + endDate + "</li>";
    }
}
