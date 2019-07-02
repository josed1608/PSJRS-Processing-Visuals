import ddf.minim.*;
import java.util.Vector;

public class Radio implements Visual{
  Minim minim;
  AudioInput in;
  Vector<Float> volhistory = new Vector<Float>();
  
  int[] radiuses = new int[50];
  int numOfSuns = 20;
  int sunSeparation = 50;

  Radio(Minim minim1, AudioInput song1){
    minim = minim1;
    in = song1;
  }

  void setupVisual() {
    colorMode(HSB);
  }

  void drawVisual() {
    colorMode(HSB);
    background(0);
    float vol = in.mix.level();
    volhistory.add(vol);
    noFill();
    translate(width / 2, height / 2);
    
    
    for(int i = 1; i <= numOfSuns; i++)
      radiuses[i-1] = sunSeparation * i;
    
    for(int i = numOfSuns - 1; i >= 0; i--) {
       stroke((frameCount + radiuses[i]) % 256, 255, 255);
       drawCircle(radiuses[i]);
    }

    if (volhistory.size() > 360) {
      volhistory.remove(0);
    }
  }
  
  void drawCircle(int minRadius){
    beginShape();
    for (int i = 0; i < volhistory.size(); i++) {
      float r = map(volhistory.elementAt(i), 0, 1, minRadius, minRadius * 3);
      float x = r * cos(radians(i));
      float y = r * sin(radians(i));
      vertex(x, y);
    }
    endShape();
  }
}
