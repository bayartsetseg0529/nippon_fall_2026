
/**
 * Write a description of class deposit here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class deposit
{
    private String owner;
    private int pin;
    private double balance;
    private int failedAttempts;
    private boolean isLocked;
    public deposit(String ownerName, int userPin, double initialBalance) 
    {
        owner = ownerName;
        pin = userPin;
        balance = initialBalance;
        failedAttempts = 0;
        isLocked = false;
    }
    public void deposit (double amount){
        if (amount > 0 && !isLocked) {
            balance = balance + amount;
            System.out.println(amount + " Account is locked! " + balance);
        } else {
            System.out.println("Invalid deposit amount.");
        }
    }
   public void withdraw(int enteredPin, double amount) {
  
    if (isLocked) {
        System.out.println("Account is locked! Contact bank.");
        return;
    }
    if (enteredPin != pin) {
        failedAttempts++;         
        if (failedAttempts >= 3) {
            isLocked = true;
            System.out.println("3 wrong PINs! Account LOCKED.");
        } else {
            System.out.println("Wrong PIN! Attempts left: " + (3 - failedAttempts));
        }
    } 
    
    else {
        failedAttempts = 0; 
        if (amount > balance) {
            System.out.println("Insufficient funds!");
        } else {
            balance -= amount;
            if (balance < 50.0) {
                balance -= 2.50;
            }
            System.out.println("Withdrew $" + amount + ". Balance: $" + balance);
        }        
    }
}

    public void unlockAccount(int masterCode) {
    if (masterCode == 9999)
    {
        isLocked = false;
        failedAttempts = 0;
        System.out.println("Account unlocked.");
    }
}
}