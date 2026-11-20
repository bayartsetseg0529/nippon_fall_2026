
/**
 * Write a description of class RideShareTrip here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Trip {
    private String driverName;
    private String tripStatus;
    private double distanceKm;
    private boolean isSurgePricing;
    private int discountPercent;

    public Trip(String driverName, boolean isSurgePricing) {
        this.driverName = driverName;
        this.tripStatus = "WAITING";       
        this.distanceKm = 0.0;             
        this.isSurgePricing = isSurgePricing;
        this.discountPercent = 0;         
    }

    public void applyPromoCode(String code)
    {
        if (code.equals("SAVE20")) 
        {
            discountPercent = 20;
            System.out.println("20% promo applied!");
        } else if (code.equals("HALF")) 
        {
            discountPercent = 50;
            System.out.println("50% promo applied!");
        } else 
        {
            System.out.println("Invalid promo code.");
        }
    }

    public void startTrip()
    {
        if (tripStatus.equals("WAITING")) 
        {
            tripStatus = "IN_PROGRESS";
            System.out.println("Trip started with " + driverName);
        } else 
        {
            System.out.println("Cannot start trip. Current status: " + tripStatus);
        }
    }

 
    public void driveDistance(double km)
    {
        if (!tripStatus.equals("IN_PROGRESS")) 
        {
            System.out.println("Error: Trip has not started!");
            return;
        }
        if (km > 0) 
        {
            distanceKm += km;
            System.out.println("Driven " + distanceKm + " km so far.");
        }
    }

    public double finishAndPay() {
        if (!tripStatus.equals("IN_PROGRESS")) 
        {
            System.out.println("No active trip to finish!");
            return 0.0;
        }
        
        tripStatus = "COMPLETED";

        double fare = 3.00 + (distanceKm * 1.50);
        
        if (isSurgePricing) {
            fare = fare * 1.5;
        }
        
        fare = fare - (fare * (discountPercent / 100.0));
        
        System.out.println("Trip completed! Final fare: $" + fare);
        return fare;
    }
}