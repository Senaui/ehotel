package ehotel;

public class HotelChain {

    public String addressofcentraloffice;
    public int totalHotel;
    public String email;
    public String phoneNum;

    public String getAddressofcentraloffice() {
        return addressofcentraloffice;
    }

    public void setAddressofcentraloffice(String addressofcentraloffice) {
        this.addressofcentraloffice = addressofcentraloffice;
    }

    public int getTotalHotel() {
        return totalHotel;
    }

    public void setTotalHotel(int totalHotel) {
        this.totalHotel = totalHotel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public HotelChain(String addressofcentraloffice, int totalHotel, String email, String phoneNum) {
        this.addressofcentraloffice = addressofcentraloffice;
        this.totalHotel = totalHotel;
        this.email = email;
        this.phoneNum = phoneNum;
    }

    @Override
    public String toString() {
        return "ehotel.HotelChain{" +
                "addressofcentraloffice='" + addressofcentraloffice + '\'' +
                ", totalHotel=" + totalHotel +
                ", email='" + email + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                '}';
    }
}
