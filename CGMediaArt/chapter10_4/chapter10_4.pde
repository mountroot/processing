float moveX, moveY;
float dragX, dragY;
float interpX, interpY;

void setup() {
  size(640, 480);
  noStroke();
  interpX = moveX = dragX = width/2;
  interpY = moveY = dragY = height/2;
}

void draw() {
  background(0);
  fill(127);
  interpX = interpX + (dragX - interpX) * 0.1;
  interpY = interpY + (dragY - interpY) * 0.1;
  ellipse(interpX, interpY, 60, 60);
  fill(255, 0, 0);
  ellipse(dragX, dragY, 40, 40);
  fill(0, 0, 255);
  ellipse(moveX, moveY, 20, 20);
}

void mouseMoved() {
  moveX = mouseX;
  moveY = mouseY;
}

void mouseDragged() {
  dragX = mouseX;
  dragY = mouseY;
}

void mousePressed() {
  dragX = mouseX;
  dragY = mouseY;
}

void mouseReleased() {
  dragX = width/2;
  dragY = height/2;
}
