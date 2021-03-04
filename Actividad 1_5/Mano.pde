float angle1, angle2, angle3, angle4, allHand;
float angleMedio;
boolean dedo1, dedo2, dedo3, dedo4;

void settings() {
    size(640,480,P3D);
    angle1 = angle2 = angle3 = angle4 = allHand = angleMedio = 0.0f;
    dedo1 = dedo2 = dedo3 = dedo4 = false;
}

void draw(){
    background(0);
    translate(250,200,0);
    
    //  MANO
    pushMatrix();
      translate(90, 105,-20);
      scale(6,4,2);
      box(40);
    popMatrix();
    
    pushMatrix();
      translate(250, 90,-20);
      rotateZ(45);
      scale(1,2,1);
      box(40);
    popMatrix();
    
    //  DEDO 1
    pushMatrix();
      rotateX(angle1);
      translate(0,-15,0);
      pushMatrix();
        scale(1,2,1);
        box(40);
      popMatrix();
      translate(0,-60,0);
      rotateX(angleMedio);
      translate(0,-20,0);
      scale(1,2,1);
      box(40);
    popMatrix();
   
    //  DEDO 2
    pushMatrix();
      translate(60,0,0);
      rotateX(angle2);
      translate(0,-15,0);
      pushMatrix();
        scale(1,2,1);
        box(40);
      popMatrix();
      translate(0,-60,0);
      rotateX(angleMedio);
      translate(0,-20,0);
      scale(1,2,1);
      box(40);
    popMatrix();
    
    //  DEDO 3
    pushMatrix();
      translate(120,0,0);
      rotateX(angle3);
      translate(0,-15,0);
      pushMatrix();
        scale(1,2,1);
        box(40);
      popMatrix();
      translate(0,-60,0);
      rotateX(angleMedio);
      translate(0,-20,0);
      scale(1,2,1);
      box(40);
    popMatrix();
    //  DEDO 4
    pushMatrix();
      translate(180,0,0);
      rotateX(angle4);
      translate(0,-15,0);
      pushMatrix();
        scale(1,2,1);
        box(40);
      popMatrix();
      translate(0,-60,0);
      rotateX(angleMedio);
      translate(0,-20,0);
      scale(1,2,1);
      box(40);
    popMatrix();
}

void keyPressed() {
  println(key);
  //  DEDO 1
  if(key == 'A' || key == 'a'){
    angle1 -= 0.1f;
  }
  if(key == 'Q' || key == 'q'){
    angle1 += 0.1f;
  }
  
  //  DEDO 2
  if(key == 'S' || key == 's'){
    angle2 -= 0.1f;
  }
  if(key == 'W' || key == 'w'){
    angle2 += 0.1f;
  }
  
  //  DEDO 3
  if(key == 'D' || key == 'd'){
    angle3 -= 0.1f;
  }
  if(key == 'E' || key == 'e'){
    angle3 += 0.1f;
  }
  
  //  DEDO 4
  if(key == 'F' || key == 'f'){
    angle4 -= 0.1f;
  }
  if(key == 'R' || key == 'r'){
    angle4 += 0.1f;
  }
  
  //  TODOS LOS DEDOS
  if(key == 'X' || key == 'x'){
    angleMedio += 0.1f;
  }
  if(key == 'Z' || key == 'z'){
    angleMedio -= 0.1f;
  }
}
