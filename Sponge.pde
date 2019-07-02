public class Sponge implements Visual{
  float a = 0;

  ArrayList<Box> sponge;

  void setupVisual() {
    // An array of Box objects
    sponge = new ArrayList<Box>();

    // Star with one
    Box b = new Box(0, 0, 0, width/4);
    sponge.add(b);
  }
  void mousePressedSponge() {
    // Generate the next set of boxes
    ArrayList<Box> next = new ArrayList<Box>();
    for (Box b : sponge) {
      ArrayList<Box> newBoxes = b.generate();
      next.addAll(newBoxes);
    }
    sponge = next;
  }

  void drawVisual() {
    background(0);
    fill(mouseX%256, mouseY %256, (mouseX + mouseY) %256);
    noFill();
    lights();
    translate(width/2, height/2);
    rotateX(a);
    rotateY(a*0.4);
    rotateZ(a*0.1);
    int boxCounter = 0;
    for (Box b : sponge) {
      ++boxCounter;
      b.show(boxCounter);
    }
    a += 0.01;
  }

  class Box {
    PVector pos;
    float r;

    Box(float x, float y, float z, float r_) {
      pos = new PVector(x, y, z);
      r = r_;
    }

    ArrayList<Box> generate() {
      ArrayList<Box> boxes = new ArrayList<Box>();
      for (int x = -1; x < 2; x++) {
        for (int y = -1; y < 2; y++) {
          for (int z = -1; z < 2; z++) {
            int sum = abs(x) + abs(y) + abs(z);
            float newR = r/3;
            if (sum > 1) {
              Box b = new Box(pos.x+x*newR, pos.y+ y*newR, pos.z+z*newR, newR);
              boxes.add(b);
            }
          }
        }
      }
      return boxes;
    }

    void show(int boxCounter) {
      pushMatrix();
      translate(pos.x, pos.y, pos.z);
      noStroke();
      fill((mouseX+boxCounter*5)%256, mouseY %256, (boxCounter*10)%256);
      box(r);
      popMatrix();
    }
  }
}
