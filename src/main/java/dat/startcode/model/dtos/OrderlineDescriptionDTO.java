package dat.startcode.model.dtos;

public class OrderlineDescriptionDTO {
    private int orderId;
    private String bottom;
    private String topping;
    private int price;
    private int amount;
    private int totalSum;

    public OrderlineDescriptionDTO(int orderId, String bottom, String topping, int price, int amount, int totalSum) {
        this.orderId = orderId;
        this.bottom = bottom;
        this.topping = topping;
        this.price = price;
        this.amount = amount;
        this.totalSum = totalSum;
    }

    public int getOrderId() {
        return orderId;
    }

    public String getBottom() {
        return bottom;
    }

    public String getTopping() {
        return topping;
    }

    public int getPrice() {
        return price;
    }

    public int getAmount() {
        return amount;
    }

    public int getTotalSum() {
        return totalSum;
    }

    @Override
    public String toString() {
        return "OrderlineDescriptionDTO{" +
                "orderId=" + orderId +
                ", bottom='" + bottom + '\'' +
                ", topping='" + topping + '\'' +
                ", amout=" + amount +
                ", totalSum=" + totalSum +
                '}';
    }
}
