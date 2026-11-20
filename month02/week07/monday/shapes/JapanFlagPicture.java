
/**
 * Write a description of class JapanFlagPicture here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class JapanFlagPicture {
    private Square background;
    private Square flagLeft;
    private Square flagRight;
    private Circle redSun;

    public JapanFlagPicture() {
        background = new Square();
        flagLeft = new Square();
        flagRight = new Square();
        redSun = new Circle();
    }

    public void draw() {
        //1. Dark frame behind the flag so white edges are visible
        background.changeColor("black");
        background.changeSize(300);
        background.moveHorizontal(-60);
        background.moveVertical(-50);
        background.makeVisible();
        //2. White flag rectangle 
        flagLeft.changeColor("white");
        flagLeft.changeSize(160);
        flagLeft.moveHorizontal(-30);
        flagLeft.moveVertical(20);
        flagLeft.makeVisible();
        flagRight.changeColor("white");
        flagRight.changeSize(160);
        flagRight.moveHorizontal(50);
        flagRight.moveVertical(20);
        flagRight.makeVisible();
        //3. Red sun circle centered
        redSun.changeColor("red");
        redSun.changeSize(96);
        redSun.moveHorizontal(332);
        redSun.moveVertical(112);
        redSun.makeVisible();
        
        

    
    }
}