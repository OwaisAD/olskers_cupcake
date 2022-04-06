package dat.startcode.model.dtos;

public class OrderListDTO {
    String created;
    String email;
    int orderId;
    int totalSum;

    public OrderListDTO(String created, String email, int orderId, int totalSum) {
        this.created = created;
        this.email = email;
        this.orderId = orderId;
        this.totalSum = totalSum;
    }

    public String getCreated() {
        return created;
    }

    public String getEmail() {
        return email;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getTotalSum() {
        return totalSum;
    }
}
