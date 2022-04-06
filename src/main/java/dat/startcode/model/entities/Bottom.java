package dat.startcode.model.entities;

public class Bottom {
    private int bottomId;
    private String name;
    private int price;

    public Bottom(String name, int price) {
        this.name = name;
        this.price = price;
    }

    public Bottom(int bottomId, String name, int price) {
        this.bottomId = bottomId;
        this.name = name;
        this.price = price;
    }

    public int getBottomId() {
        return bottomId;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "Bottom{" +
                "bottomId=" + bottomId +
                ", name='" + name + '\'' +
                ", price=" + price +
                '}';
    }
}
