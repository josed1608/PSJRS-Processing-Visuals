import java.util.Vector;

public class Planets implements Visual{
  Vector<Planet> planets;

  int nmbPlanets = 600;

  void setupVisual() {
    background(0);
    planets = new Vector<Planet>();
    for (int planetCounter = 0; planetCounter < nmbPlanets; ++planetCounter) {
      planets.add(new Planet());
    }
  }

  void drawVisual() {
    colorMode(HSB);
    background(0);
    for (int planetCounter = 0; planetCounter < nmbPlanets; ++planetCounter) {
      planets.elementAt(planetCounter).update();
    }
  }
}

float radius = 50;
int startZ = -10000, maxZ = 1000;
int speedZ = 20;
int detail = 10;
int Rot = 10;
int speedRot = 2;

public class Planet {
  float x, y, z;
  color fillColor, strokeColor;

  Planet() {
    colorMode(HSB);
    x = random(0, width);
    y = random(0, height);
    z = random(startZ, maxZ);
    int color1 = int(random(0,255));
    fillColor = color(color1, 255, 255);
    strokeColor = color((color1+random(50,100))%256, 255, 255);
  }

  void update() {
    colorMode(HSB);
    fill(fillColor); 
    stroke(strokeColor);
    z+=speedZ;
    if (z > maxZ) {
      z = startZ;
      x = random(0, width);
      y = random(0, height);
    }
    pushMatrix();
    translate(x, y, z);
    rotateY(Rot);
    sphereDetail(detail);
    sphere(radius);
    popMatrix();
    Rot += speedRot;
  }
}
