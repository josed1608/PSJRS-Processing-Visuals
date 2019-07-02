public class Spiral implements Visual{
  Minim minim;
  AudioInput in;
  
  float n = 0;
  float originalC = 10;
  float start = 0;
  boolean grow = true;
  float maxSize = 5000;
  float minSize = 100;
  float sizeIncrease = 5;
  float volumeIncrease = 10;
  
  Spiral(Minim minim, AudioInput in){
    this.minim = minim;
    this.in = in;
  }

  void setupVisual() {
    colorMode(HSB, 360, 255, 255);
  }

  void drawVisual() {
    System.out.println();
    colorMode(HSB, 360, 255, 255);
    background(0);
    translate(width / 2, height / 2);
    rotate(n * 0.3);
    for (int i = 0; i < n; i++) {
      float a = i * radians(137.5);
      float volumedC = originalC + volumeIncrease * in.mix.level();
      float r = volumedC * sqrt(i);
      float x = r * cos(a);
      float y = r * sin(a);
      float hu = i+start;
      hu = i/3.0 % 360;
      fill(hu, 255, 255);
      noStroke();
      ellipse(x, y, 4, 4);
    }

    if (n > maxSize){ 
       grow = false;
    }
    else if (n < minSize){
       grow = true; 
    }
    
    n += grow ? sizeIncrease : -sizeIncrease;
    start += 5;
  }
}
