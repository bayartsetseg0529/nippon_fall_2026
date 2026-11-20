
/**
 * Write a description of class house here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class house {
    private Square wall;
    private Square window;
    private Triangle roof;
    private Circle blueCircle;
    private Circle yellowCircle;

    public house() {
        wall = new Square();
        window = new Square();
        roof = new Triangle();
        blueCircle = new Circle();
        yellowCircle = new Circle();
    }

    public void draw() {
   
        wall.changeColor("red");
        wall.changeSize(140);
        wall.moveHorizontal(-230);
        wall.moveVertical(80);
        wall.makeVisible();

    
        window.changeColor("black");
        window.changeSize(40);
        window.moveHorizontal(-200);
        window.moveVertical(100);
        window.makeVisible();

     
        roof.changeColor("green");
        roof.changeSize(70, 175);
        roof.moveHorizontal(-58);
        roof.moveVertical(3);
        roof.makeVisible();

        blueCircle.changeColor("blue");
        blueCircle.changeSize(75);
        blueCircle.moveHorizontal(-18);
        blueCircle.moveVertical(-35);
        blueCircle.makeVisible();

        yellowCircle.changeColor("yellow");
        yellowCircle.changeSize(95);
        yellowCircle.moveHorizontal(102);
        yellowCircle.moveVertical(-15);
        yellowCircle.makeVisible();
    }
}

