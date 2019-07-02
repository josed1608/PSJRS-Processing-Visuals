import ddf.minim.*;

Minim minim;
AudioInput in;
Visual currentVisual;

Tree tree;
Sun sun;
Cubes cubes;
Terrain terrain;
Radio radio;
Spiral spiral;
Planets planets;
StarField stars;
Flow flow;
Sponge sponge;

int curVis = 0;
int totalVis = 10;
boolean firstRun = true;


void setup(){  
  fullScreen(P3D);
  background(0);
  noCursor();
  
  minim = new Minim(this);
  in = minim.getLineIn();
  
  tree = new Tree(minim, in);
  sun = new Sun();
  terrain = new Terrain(minim, in);
  cubes = new Cubes(minim, in);
  radio = new Radio(minim, in);
  spiral = new Spiral(minim, in);
  planets = new Planets();
  stars = new StarField(minim, in);
  flow =  new Flow();
  sponge = new Sponge();
  
  currentVisual = cubes;
}

void draw(){
  colorMode(RGB, 255, 255, 255);
  strokeWeight(1);
  if(firstRun){
    background(0);
    currentVisual.setupVisual();
    firstRun = false;
  }
  else{
    currentVisual.drawVisual();
  }
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e > 0){
    curVis++;
    curVis %= totalVis;
    firstRun = true;
  }
  else if(e < 0){
    curVis--;
    if(curVis == -1)
      curVis = totalVis-1;
    firstRun = true;
  }
  
  switch(curVis){
      case 6: currentVisual = tree; break; 
      case 3: currentVisual = sun; break; 
      case 0: currentVisual = cubes; break;
      case 1: currentVisual = terrain; break;
      case 4: currentVisual = radio; break;
      case 5: currentVisual = spiral; break;
      case 2: currentVisual = planets; break;
      case 7: currentVisual = stars; break;
      case 8: currentVisual = flow; break;
      case 9: currentVisual = sponge; break;
    }
}


void mousePressed(){
  
  switch(curVis){
    case 9: sponge.mousePressedSponge(); break;
  }
}
