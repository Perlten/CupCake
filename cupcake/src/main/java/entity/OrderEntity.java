/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Perlt
 */
public class OrderEntity {
    
    private String topping;
    private String bottom;
    private double price;
    private int orderId;
    private int amount;

    public OrderEntity(String topping, String bottom, double price, int orderId, int amount) {
        this.topping = topping;
        this.bottom = bottom;
        this.price = price;
        this.orderId = orderId;
        this.amount = amount;
    }

   public OrderEntity(String topping, String bottom, double price, int amount) {
        this.topping = topping;
        this.bottom = bottom;
        this.price = price;
        this.orderId = -1;
        this.amount = amount;
    }

    public int getAmount() {
        return amount;
    }
    
    public int getOrderId() {
        return orderId;
    }

    public String getBottom() {
        return bottom;
    }

    public double getPrice() {
        return price;
    }

    public String getTopping() {
        return topping;
    }

    @Override
    public String toString() {
        return "Topping: " + topping + " bottom: " + bottom + " price: " + price + " Amount: " + amount; 
    }
    
    
    
    
    
}
