package ehotel;

public class Manager extends Person {

    public Manager(String SIN, String fullName, String paddress) {
        super(SIN, fullName, paddress);
    }

    @Override
    public String toString() {
        return "ehotel.Manager{" +
                "SIN='" + SIN + '\'' +
                ", fullName='" + fullName + '\'' +
                ", paddress='" + paddress + '\'' +
                '}';
    }
}
