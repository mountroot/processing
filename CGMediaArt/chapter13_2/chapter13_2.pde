float rx = 0.0;
float ry = 0.0;
float rz = 0.0;

void setup() {
  size(1000, 1000, P3D);
}

void draw() {
  background(204);
  
  translate(width/2, height/2);
  
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  
  rect(-300, -300, 500, 500);
}

void keyPressed() {
  switch(keyCode) {
    case UP:
      rx = rx - 0.5;
    case DOWN:
      rx = rx + 0.5;
    case LEFT:
      ry = ry - 0.5;
    case RIGHT:
      ry = ry + 0.5;
    break;
  }
}

void mouseDragged() {
  rz = mouseX * 0.01;
}
