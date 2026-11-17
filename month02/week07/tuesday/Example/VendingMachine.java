
/**
 * Write a description of class VendingMachine here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class VendingMachine
{
    private String itemName;
    private double itemPrice;
    private int stock;
    private double totalRevenue;
    private double insertedMoney = 0.0; 
    public VendingMachine(String name, double price, int initialStock) {
        itemName = name;
        itemPrice = price;
        stock = initialStock;
        totalRevenue = 0.0;
        insertedMoney = 0.0;
    }

    public void insertMoney(double amount) {
        if (amount == 0.25 || amount == 0.50 || amount == 1.00 || amount == 5.00) {
            insertedMoney = insertedMoney+amount;
            System.out.println("Credit: $" + insertedMoney);
        } else {
            System.out.println("Invalid coin/bill rejected.");
        }
    }
    public double buyItem() {
    if (stock <= 0) {
        System.out.println("SOLD OUT!");
        return 0.0;
    } else if (insertedMoney < itemPrice) {
        System.out.println("Need $" + (itemPrice - insertedMoney) + " more.");
        return 0.0;
    } else {
        double change = insertedMoney - itemPrice;
        stock = stock - 1;
        totalRevenue =totalRevenue + itemPrice;
        insertedMoney = 0.0;
        System.out.println("Dispensing " + itemName + "! Your change: $" + change);
        return change;
    }
}
    public double cancelAndRefund() 
    {
    double refund = insertedMoney;
    insertedMoney = 0.0;
    System.out.println("Refunding $" + refund);
    return refund;
}
}
        
