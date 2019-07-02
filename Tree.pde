import java.util.Scanner;
import java.util.Stack;

public class Tree implements Visual{
  Minim minim;
  AudioInput in;

  float angle;
  String sentence;
  float len;
  int i;
  float leafW; 
  float leafH;
  
  float volumeIncrease = 100;
  int lenReductionSteps = 5;
  int stepsPerFrame = 20;
  
  
  PVector cPoint;
  float currentAngle;
  Stack<Position> pointStack;
  
  Tree(Minim minim, AudioInput in){
    this.minim = minim;
    this.in = in;
  }

  void setupVisual() {
    cPoint = new PVector(width / 2, height);
    currentAngle = radians(90);
    pointStack = new Stack<Position>();
    
    angle = radians(25);
    i = 0;
    background(0);
    try{
     sentence = new Scanner(new File("LTree.txt")).useDelimiter("\\Z").next();
    }
    catch (Exception e) {
     System.out.println("LTree.txt file not found"); 
    }
    
    len = 300;
    for(int i = 0; i < lenReductionSteps; i++){
     len *= 0.5; 
    }
    leafW = len/5; 
    leafH = 2*len/5;
  }

  void drawVisual() {
    for(int j = 0; j < stepsPerFrame; j++){
      stroke(255, 150);
      if (i<sentence.length()) {
        char current = sentence.charAt(i);
        if (current == 'F') {
          line(cPoint.x, cPoint.y, cPoint.x + len * cos(currentAngle), cPoint.y - len * sin(currentAngle));
          cPoint.set(cPoint.x + len * cos(currentAngle), cPoint.y - len * sin(currentAngle));
        } else if (current == '+') {
          //rotate right
          currentAngle = currentAngle - angle;
        } else if (current == '-') {
          //rotate left
          currentAngle = currentAngle + angle;
        } else if (current == '[') {
          pointStack.push(new Position( new PVector(cPoint.x, cPoint.y), currentAngle));
        } else if (current == ']') {
          createLeaf();
          Position prevPosition = pointStack.pop();
          cPoint = prevPosition.point;
          currentAngle = prevPosition.angle;
        }
        i++;
      }
      else{
       i = 0; 
      }
    }
  }
  
  class Position {
   public PVector point;
   public float angle;
   
   Position(PVector point, float angle){
     this.point = point;
     this.angle = angle;
   }
  }

  void createLeaf() { 
    fill(255, 100, 0, 150);
    stroke(255, 100, 0, 150);
    ellipse(cPoint.x, cPoint.y, leafW + (volumeIncrease * in.mix.level()), leafH  + (volumeIncrease * in.mix.level())); 
    noFill();
  }
}
