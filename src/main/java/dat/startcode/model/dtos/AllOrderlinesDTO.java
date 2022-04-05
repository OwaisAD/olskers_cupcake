package dat.startcode.model.dtos;

import java.time.LocalDate;

public class AllOrderlinesDTO {
    private int orderId;
    private LocalDate created;
    private int orderlineId;
    private int amount;
    private String toppingName;
    private String bottomName;
    private String customerEmail;
    private int totalPrice;

    public AllOrderlinesDTO(int orderId, LocalDate created, int orderlineId, int amount, String toppingName, String bottomName, String customerEmail, int totalPrice) {
        this.orderId = orderId;
        this.created = created;
        this.orderlineId = orderlineId;
        this.amount = amount;
        this.toppingName = toppingName;
        this.bottomName = bottomName;
        this.customerEmail = customerEmail;
        this.totalPrice = totalPrice;
    }

    public AllOrderlinesDTO(LocalDate created, int orderlineId, int amount, String toppingName, String bottomName, String customerEmail, int totalPrice) {
        this.created = created;
        this.orderlineId = orderlineId;
        this.amount = amount;
        this.toppingName = toppingName;
        this.bottomName = bottomName;
        this.customerEmail = customerEmail;
        this.totalPrice = totalPrice;
    }

    public int getOrderId() {
        return orderId;
    }

    public LocalDate getCreated() {
        return created;
    }

    public int getOrderlineId() {
        return orderlineId;
    }

    public int getAmount() {
        return amount;
    }

    public String getToppingName() {
        return toppingName;
    }

    public String getBottomName() {
        return bottomName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    @Override
    public String toString() {
        return "AllOrderlinesDTO{" +
                "orderId=" + orderId +
                ", created=" + created +
                ", orderlineId=" + orderlineId +
                ", amount=" + amount +
                ", toppingName='" + toppingName + '\'' +
                ", bottomName='" + bottomName + '\'' +
                ", customerEmail='" + customerEmail + '\'' +
                ", totalPrice=" + totalPrice +
                '}';
    }
}
