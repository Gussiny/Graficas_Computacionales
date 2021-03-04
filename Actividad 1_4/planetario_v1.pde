float angle, anglePlanet, angleSatellite;

void settings(){
  size(640, 480, P3D);
}

void setup() {
  angle = 0.0f;
  anglePlanet = 0.0f;
  angleSatellite = 0.0f;
}

void draw(){
    
  background(0,0,0); 
  
  
  //  SOL
  translate(320,240,50);
  rotateY(angle);
  noStroke();
  lights();
  fill(255, 255, 0);
  sphere(60.0f);
  angle+=0.05f;
  
  //  PLANETA
  translate(0,0,150);
  rotateY(anglePlanet);
  noStroke();
  lights();
  fill(0, 172, 255);
  sphere(15.0f);
  anglePlanet+=0.01f;
  
  //  SATELITE
  translate(10,-10,50);
  rotateY(angleSatellite);
  noStroke();
  lights();
  fill(#515E64);
  sphere(5.0f);
  angleSatellite+=0.03f;
}
