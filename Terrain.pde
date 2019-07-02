public class Terrain implements Visual{
  Minim minim;
  AudioInput in;
  
  int cols, rows;
  int scl = 20;
  int w = 2000;
  int h = 1600;
  int currentColor = 0;
  int currentColor2;

  float flying = 0;

  float[][] terrain;

  Terrain(Minim minim, AudioInput in){
    this.minim = minim;
    this.in = in;
  }

  void setupVisual() {
    cols = w / scl;
    rows = h/ scl;
    terrain = new float[cols][rows];
  }

  void drawVisual() {
    colorMode(HSB);

    flying -= 0.2;

    float yoff = flying;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
        xoff += 0.2;
      }
      yoff += 0.2;
    }

    translate(width/2, height/2+50);
    rotateX(PI/3);
    translate(-w/2, -h/2);

    background(0);
    if (frameCount % 5 == 0) {
      currentColor++;
      currentColor %= 256;
      currentColor2 = mouseX%256;
      stroke(currentColor2, 255, 255); 
      fill(currentColor, 255, 255);
    }

    for (int y = 0; y < rows-1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      }
      endShape();
    }

    //System.out.println(frameRate);
  }
}
