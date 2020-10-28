// Comentarios
/* asi tambien */

float ejemplo = 5;

//  ciclo de vida

//  corre una vez al inicio
void settings(){
  size(640, 480, P3D);
  println("setup");
}


//  corre una vez al inicio (después)
void setup() {
  println("setup");
}


//  corre una vez por cuadro
//  CUADRO -> Proceso de redibujado, sucede muchas veces por segundo
//  30 fps + - aplicacion en tiempo real
void draw(){
  //  rgb - red, green, blue
  //  0 - 255
  background(0, 0, 0);
  
  //  color de lineas
  stroke(0, 255, 255);
  
  //  color de relleno
  //  fill(255, 0, 255);
  
  noFill();
  /*
  beginShape();
  vertex(150, 100, 0);
  vertex(150, 100, 0);
  vertex(250, 100, 0);
  vertex(250, 200, 0);
  vertex(100, 200, 0);
  
  vertex(100,250, 0);
  vertex(100,300, 0);
  endShape(CLOSE);
  */
  
  //rect(120, 100, 180, 100);
  
  //  cabeza
  beginShape();
  vertex(170,140);
  vertex(120,120);
  vertex(90,120);
  vertex(50,140);
  vertex(50,170);
  vertex(70,180);
  vertex(95,180);
  vertex(120,200);
  endShape();
  
  //  OREJA
  beginShape();
  vertex(85,120);
  vertex(85,150);
  vertex(95,165);
  vertex(105,165);
  vertex(115,165);
  vertex(125,150);
  vertex(120,120);
  endShape();
  
  // parte de abajo
  beginShape();
  vertex(170, 220, 0);
  vertex(190, 225, 0);
  vertex(280, 225, 0);
  vertex(300, 220, 0);
  endShape();
  
  // patas delanteras
  beginShape();
  vertex(120, 200, 0);
  vertex(120, 270, 0);
  vertex(140, 270, 0);
  endShape();
  
  beginShape();  
  vertex(140, 220, 0);
  vertex(140, 300, 0);
  vertex(170, 300, 0);
  vertex(170, 200, 0);
  endShape();
  
  //  patas traseras
  beginShape();
  vertex(280, 225, 0);
  vertex(280, 270, 0);
  vertex(300, 270, 0);
  endShape();
  
  beginShape();  
  vertex(300, 220, 0);
  vertex(300, 300, 0);
  vertex(330, 300, 0);
  vertex(330, 200, 0);
  endShape();
  
  rect(mouseX, mouseY, 50, 50);
}

void mousePressed(){
  //  rect(mouseX, mouseY, 100, 100);
}

void keyPressed(){
  println(key);
  println(keyCode);
}
