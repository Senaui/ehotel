package ehotel;

public class Person {
    String SIN;
    String fullName;
    String paddress;

    public String getSIN() {
        return SIN;
    }

    public void setSIN(String SIN) {
        this.SIN = SIN;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPaddress() {
        return paddress;
    }

    public void setPaddress(String paddress) {
        this.paddress = paddress;
    }

    public Person(String SIN, String fullName, String paddress) {
        this.SIN = SIN;
        this.fullName = fullName;
        this.paddress = paddress;
    }

    @Override
    public String toString() {
        return "ehotel.Person{" +
                "SIN='" + SIN + '\'' +
                ", fullName='" + fullName + '\'' +
                ", paddress='" + paddress + '\'' +
                '}';
    }
}
