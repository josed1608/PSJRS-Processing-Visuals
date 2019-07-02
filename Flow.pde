public class Flow implements Visual{
  float inc = 0.1;
  float scl = 20;
  int cols, rows;
  float zoff = 0;
  int currentColor = 0;
  boolean upColor =  true;

  PVector[] flowField;

  void setupVisual()
  {
    cols = floor(width / scl);
    rows = floor(height / scl);

    flowField = new PVector[cols * rows];

    background(0);
  }

  void drawVisual()
  {
    //background(0);
    stroke(changeColor());
    float yoff = 0;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        // set the vector in the flow field
        int index = y * cols + x; 
        float angle = noise(xoff, yoff, zoff) * TWO_PI * 2;
        PVector v = PVector.fromAngle(angle);
        v.setMag(0.5); // set the power of the field on the particle
        flowField[index] = v;
        pushMatrix();
        translate(x*scl, y*scl);
        rotate(v.heading());
        line(0, 0, scl, 0);
        popMatrix();
        xoff += inc;
      }
      yoff += inc;
      zoff += 0.0003; // rate the flow field changes
    }
  }

  color changeColor() {
    /*if (upColor) {
      currentColor++;
      if (currentColor == 256) {
        upColor = false;
        --currentColor;
      }
    } else {
      currentColor--;
      if (currentColor == -1) {
        upColor = true;
        ++currentColor;
      }
    }*/
    return color(mouseY % 256, mouseX % 256, currentColor, 80);
  }
}
