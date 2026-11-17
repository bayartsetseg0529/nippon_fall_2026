
/**
 * Write a description of class WaterBottle here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class WaterBottle {
    private int capacityML;
    private int currentML;
    public WaterBottle(int maxCapacity) {
        capacityML = maxCapacity;
        currentML = maxCapacity;
    }
    public void takeSip(int sipML) {
        currentML = currentML - sipML;
    }
    public void refillFull() {
        currentML = capacityML;
    }
    public double getPercentFull() {
        return (currentML * 100.0) / capacityML;
    }
}