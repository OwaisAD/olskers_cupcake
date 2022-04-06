package dat.startcode.model.entities;

public class Topping {
    private int toppingId;
    private String name;
    private int price;

    public Topping(String name, int price) {
        this.name = name;
        this.price = price;
    }

    public Topping(int toppingId, String name, int price) {
        this.toppingId = toppingId;
        this.name = name;
        this.price = price;
    }

    public int getToppingId() {
        return toppingId;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "Topping{" +
                "toppingId=" + toppingId +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
