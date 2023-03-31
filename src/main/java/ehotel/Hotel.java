package ehotel;

public class Hotel {
    private String address;
    private int category;
    private int totalRoom;
    private String email;
    private String phoneNum;
    private String addressOfCentralOffice;

    public Hotel(String address, int category, int totalRoom, String email, String phoneNum, String addressOfCentralOffice) {
        this.address = address;
        this.category = category;
        this.totalRoom = totalRoom;
        this.email = email;
        this.phoneNum = phoneNum;
        this.addressOfCentralOffice = addressOfCentralOffice;
    }

    public String getAddress() {
        return address;
    }

    public int getCategory() {
        return category;
    }

    public int getTotalRoom() {
        return totalRoom;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public String getAddressOfCentralOffice() {
        return addressOfCentralOffice;
    }


}
