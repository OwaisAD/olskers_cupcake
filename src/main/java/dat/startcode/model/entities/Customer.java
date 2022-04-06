package dat.startcode.model.entities;

public class Customer {

    private int userId;
    private String email;
    private String password;
    private int credit;
    private String role;

    public Customer(int userId, String email, String password, int credit, String role) {
        this.userId = userId;
        this.email = email;
        this.password = password;
        this.credit = credit;
        this.role = role;
    }

    public Customer(String email, String password, int credit, String role) {
        this.email = email;
        this.password = password;
        this.credit = credit;
        this.role = role;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserId() {
        return userId;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public int getCredit() {
        return credit;
    }

    public String getRole() {
        return role;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "userId=" + userId +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", credit=" + credit +
                ", role='" + role + '\'' +
                '}';
    }

    public Customer(String email, String password, String role) {
        this.email = email;
        this.password = password;
        this.role = role;
    }

}
