package ehotel;

public class Room {
    private int roomNum;
    private float price;
    private String amenity;
    private int capacity;
    private String description;
    private String status;
    private String viewOfRoom;
    private int addingBed;
    private String hAddress;

    public Room(int roomNum, float price, String amenity, int capacity, String description, String status, String viewOfRoom, int addingBed, String hAddress) {
        this.roomNum = roomNum;
        this.price = price;
        this.amenity = amenity;
        this.capacity = capacity;
        this.description = description;
        this.status = status;
        this.viewOfRoom = viewOfRoom;
        this.addingBed = addingBed;
        this.hAddress = hAddress;
    }

    public int getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(int roomNum) {
        this.roomNum = roomNum;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getAmenity() {
        return amenity;
    }

    public void setAmenity(String amenity) {
        this.amenity = amenity;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getViewOfRoom() {
        return viewOfRoom;
    }

    public void setViewOfRoom(String viewOfRoom) {
        this.viewOfRoom = viewOfRoom;
    }

    public int getAddingBed() {
        return addingBed;
    }

    public void setAddingBed(int addingBed) {
        this.addingBed = addingBed;
    }

    public String gethAddress() {
        return hAddress;
    }

    public void sethAddress(String hAddress) {
        this.hAddress = hAddress;
    }

    @Override
    public String toString() {
        return "ehotel.Room{" +
                "roomNum=" + roomNum +
                ", price=" + price +
                ", amenity='" + amenity + '\'' +
                ", capacity=" + capacity +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                ", viewOfRoom='" + viewOfRoom + '\'' +
                ", addingBed=" + addingBed +
                ", hAddress='" + hAddress + '\'' +
                '}';
    }
}

