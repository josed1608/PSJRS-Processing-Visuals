public class Sun implements Visual{
  float radius1 = 500;
  float radius2 = 300;
  float radius3 = 100;
  float yoff = 0;
  
  int[] radiuses = new int[50];
  int numOfSuns = 20;
  int sunSeparation = 50;

  void setupVisual() {
    background(0);
    yoff = 0;
  }

  void drawVisual() {
    colorMode(HSB);
    background(0);
    noStroke();
    translate(width/2, height/2);
    
    for(int i = 1; i <= numOfSuns; i++)
      radiuses[i-1] = sunSeparation * i;
    
    for(int i = numOfSuns - 1; i >= 0; i--) {
     drawBlob(radiuses[i], radiuses[i] / 5, color((frameCount + radiuses[i])%255, 255, 255)); 
    }

    yoff += 0.01;
  }

  void drawBlob(float radius, float range, color clr) {
    fill(clr);
    beginShape();
    float xoff = 0.0;
    for (float angle = 0.0; angle < TWO_PI; angle += TWO_PI/600) {
      float noise = map(noise(xoff, yoff), 0, 1, -range, range);
      float r = radius + noise;
      float x = r * cos(angle);
      float y = r * sin(angle);
      vertex(x, y);
      if (angle < TWO_PI/2)
        xoff += 0.1;
      else
        xoff -= 0.1;
    }
    endShape();
  }
}
