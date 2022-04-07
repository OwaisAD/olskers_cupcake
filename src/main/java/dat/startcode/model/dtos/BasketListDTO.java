package dat.startcode.model.dtos;

import dat.startcode.model.entities.Bottom;
import dat.startcode.model.entities.Topping;

public class BasketListDTO {
    private Bottom bottom;
    private Topping topping;
    private int amount;

    public BasketListDTO(Bottom bottom, Topping topping, int amount) {
        this.bottom = bottom;
        this.topping = topping;
        this.amount = amount;
    }

    public BasketListDTO(Bottom bottom, Topping topping) {
        this.bottom = bottom;
        this.topping = topping;
    }

    public Bottom getBottom() {
        return bottom;
    }

    public Topping getTopping() {
        return topping;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "BasketListDTO{" +
                "bottom=" + bottom +
                ", topping=" + topping +
                ", amount=" + amount +
                '}';
    }
}
