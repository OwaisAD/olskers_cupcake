package dat.startcode.model.dtos;

import java.util.List;

public class OrderListDTO {
    String created;
    String email;
    int orderId;
    List<OrderlineDescriptionDTO> orderLines;
    int totalSum;

    public OrderListDTO(String created, String email, int orderId, List<OrderlineDescriptionDTO> orderLines, int totalSum) {
        this.created = created;
        this.email = email;
        this.orderId = orderId;
        this.orderLines = orderLines;
        this.totalSum = totalSum;
    }

    public OrderListDTO(String created, String email, int orderId, int totalSum) {
        this.created = created;
        this.email = email;
        this.orderId = orderId;
        this.totalSum = totalSum;
    }

    public void setOrderLines(List<OrderlineDescriptionDTO> orderLines) {
        this.orderLines = orderLines;
    }

    public List<OrderlineDescriptionDTO> getOrderLines() {
        return orderLines;
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
