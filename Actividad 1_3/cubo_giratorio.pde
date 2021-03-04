float angle;

void settings(){
  size(640, 480, P3D);
}

void setup(){
  angle = 0.0f;
}

void draw(){
  translate(320,100,50);
  rotateY(angle);
  translate(-150,-0,-50);
  
  background(0,0,0);
 
  //  CARA 1
  beginShape();
  vertex(100,100,0);
  vertex(200,100,0);
  vertex(200,200,0);
  vertex(100,200,0);
  endShape(CLOSE);
  
  //  CARA 2
  beginShape();
  vertex(100,100,100);
  vertex(200,100,100);
  vertex(200,200,100);
  vertex(100,200,100);
  endShape(CLOSE);
  
  //  CARA 3
  beginShape();
  vertex(100,100,100);
  vertex(200,100,100);
  vertex(200,100,0);
  vertex(100,100,0);
  endShape(CLOSE);
  
  //  CARA 4
  beginShape();
  vertex(100,100,0);
  vertex(100,100,100);
  vertex(100,200,100);
  vertex(100,200,0);
  endShape(CLOSE);
  
  //  CARA 6
  beginShape();
  vertex(200,100,0);
  vertex(200,100,100);
  vertex(200,200,100);
  vertex(200,200,0);
  endShape(CLOSE);
  
  angle+=0.05f;
}
