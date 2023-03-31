package ehotel;

public class Employee extends Person{
    public String roleofemployee;

    public String getRoleofemployee() {
        return roleofemployee;
    }

    public void setRoleofemployee(String roleofemployee) {
        this.roleofemployee = roleofemployee;
    }

    public Employee(String SIN, String fullName, String paddress, String roleofemployee) {
        super(SIN, fullName, paddress);
        this.roleofemployee = roleofemployee;
    }

    @Override
    public String toString() {
        return "ehotel.Employee{" +
                "roleofemployee='" + roleofemployee + '\'' +
                ", SIN='" + SIN + '\'' +
                ", fullName='" + fullName + '\'' +
                ", paddress='" + paddress + '\'' +
                '}';
    }
}
