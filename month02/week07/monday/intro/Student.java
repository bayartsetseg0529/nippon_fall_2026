
/**
 * Write a description of class Student here.
 *
 * @author (your name)
 * @version (a version number or a date)
 */
public class Student
{
    private String studentName;
    private int age;
    private boolean isMale;
    private double grades;
    //zuwhun oyutnii neriig awaad 18 tai, dandaa eregtei , 0 gradestei 
    //constructor uusgenuu 
    public Student(String name){
        studentName =name;
        age =18;
        isMale = true;
        grades =0.0;

    }
    // zuwhun oyutnii ner bolon nasnii utgiig awaad emegtei 0 gradestei 
    //obyekt uusgedeg constructor (baiguulagch punkts ) bichne uu
    public Student(String name, int studentAge){
        studentName =name;
        age = studentAge;
        isMale = false;
        grades =0.0;

    }
    // Odoo grades = 0.0 baidag gehdee busad utguudiig argumentaar awaad
    // obyekt uusgedgeg constructer bichne uu
    public Student(String name, int StudentAge, boolean isStudentMale){
        studentName =name;
        age = StudentAge;
        isMale = isStudentMale;
        grades =0.0;

    }
    //hamgiin suuld buh utguudiig ni awaad obyekt uusgedeg
    //construcor bichne uu
    public Student(String name, int StudentAge, boolean isStudentMale, double studentGrades){
        studentName =name;
        age = StudentAge;
        isMale = isStudentMale;
        grades =studentGrades;

    }

    public void calculateGrades(){
        if(grades >= 0  && grades < 60 ){
            System.out.println('F');
        } else if (grades >= 60 && grades <70){
            System.out.println('D');
        } else if(grades >= 70 && grades <80){      
            System.out.println('C');
        } else if(grades >= 80 && grades <90){      
            System.out.println('B');
        }
        else if(grades >= 90 && grades <=100){      
            System.out.println('A');
        } else{
            System.out.println("No grades");
        }
    }
    public int getAge(){
    return age;
    
}
    public String getName(){
        return studentName;
    }
    public void printInfo()
    {
        String name = getName();
        int age = getAge();
        System.out.println(name + "is" + age + "years old."+ "has grades of" + grades);
    }    
}
    
    
    

