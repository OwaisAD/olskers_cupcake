package dat.startcode.model.entities;

public class Cupcake {
    private Bottom bottom;
    private Topping topping;
    private int price;


    public Cupcake(Bottom bottom, Topping topping) {
        this.bottom = bottom;
        this.topping = topping;
        this.price = bottom.getPrice() + topping.getPrice();
    }

    public Bottom getBottom() {
        return bottom;
    }

    public Topping getTopping() {
        return topping;
    }

    public int getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return "Cupcake{" +
                "bottom=" + bottom +
                ", topping=" + topping +
                ", price=" + price +
                '}';
    }
}
