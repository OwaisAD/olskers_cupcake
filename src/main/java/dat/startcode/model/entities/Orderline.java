package dat.startcode.model.entities;

public class Orderline {
    private int orderlineId;
    private int orderId;
    private int quantity;
    private int totalprice;
    private int bottomId;
    private int toppingId;

    public Orderline(int orderId, int quantity, int totalprice, int bottomId, int toppingId) {
        this.orderId = orderId;
        this.quantity = quantity;
        this.totalprice = totalprice;
        this.bottomId = bottomId;
        this.toppingId = toppingId;
    }

    public Orderline(int orderlineId, int orderId, int quantity, int totalprice, int bottomId, int toppingId) {
        this.orderlineId = orderlineId;
        this.orderId = orderId;
        this.quantity = quantity;
        this.totalprice = totalprice;
        this.bottomId = bottomId;
        this.toppingId = toppingId;
    }

    public int getOrderlineId() {
        return orderlineId;
    }

    public int getOrderId() {
        return orderId;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getTotalprice() {
        return totalprice;
    }

    public int getBottomId() {
        return bottomId;
    }

    public int getToppingId() {
        return toppingId;
    }

    public void setOrderlineId(int orderlineId) {
        this.orderlineId = orderlineId;
    }

    @Override
    public String toString() {
        return "Orderline{" +
                "orderlineId=" + orderlineId +
                ", orderId=" + orderId +
                ", quantity=" + quantity +
                ", totalprice=" + totalprice +
                ", bottomId=" + bottomId +
                ", toppingId=" + toppingId +
                '}';
    }
}
