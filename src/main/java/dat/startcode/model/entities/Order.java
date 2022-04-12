package dat.startcode.model.entities;

import java.sql.Timestamp;

public class Order {
    private int orderId;
    private int userId;
    private Timestamp created;
    private boolean isPayed;

    public Order(int userId, boolean isPayed) {
        this.userId = userId;
        this.isPayed = isPayed;
    }

    public Order(int userId, Timestamp created, boolean isPayed) {
        this.userId = userId;
        this.created = created;
        this.isPayed = isPayed;
    }

    public Order(int orderId, int userId, Timestamp created, boolean isPayed) {
        this.orderId = orderId;
        this.userId = userId;
        this.created = created;
        this.isPayed = isPayed;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getUserId() {
        return userId;
    }

    public Timestamp getCreated() {
        return created;
    }

    public boolean isPayed() {
        return isPayed;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setCreated(Timestamp created) {
        this.created = created;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", created=" + created +
                ", isPayed=" + isPayed +
                '}';
    }
}
