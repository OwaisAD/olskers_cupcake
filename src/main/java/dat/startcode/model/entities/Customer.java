package dat.startcode.model.entities;

public class Customer {
    String email;
    String password;
    String role;

    public Customer(String email, String password, String role) {
        this.email = email;
        this.password = password;
        this.role = role;
    }
}
