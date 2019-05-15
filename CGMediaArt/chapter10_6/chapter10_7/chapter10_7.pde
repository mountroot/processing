int mode;

void setup() {
  size(640, 480, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  background(0);
  mode = 0;
  totalDist = 0;
  lastEllipseX = 0;
  lastEllipseY = 0;
}

void draw() {
}

void mouseDragged() {
  if(mode == 0) {
    drawLine0();
  }
  if(mode == 1) {
    drawLine1();
  }
  if(mode == 2) {
    drawLine2();
  }
}

void drawLine0() {
  float dist = dist(mouseX, mouseY, pmouseX, pmouseY);
  stroke(dist*3, 75, 100);
  strokeWeight(4);
  line(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(1);
}

void drawLine1() {
  float dist = dist(mouseX, mouseY, pmouseX, pmouseY);
  rectMode(CENTER);
  noStroke();
  fill(random(60, 240), 100, 100, 50);
  pushMatrix();
  translate(mouseX, mouseY);
  rotateZ(random(PI));
  rotateY(random(PI));
  float rectSize = random(10);
  rect(0, 0, rectSize * dist, rectSize * dist/random(5, 10));
  popMatrix();
}

float totalDist;
float lastEllipseX, lastEllipseY;

void drawLine2() {
  float dist = dist(mouseX, mouseY, pmouseX, pmouseY);
  totalDist += dist;
  if(totalDist > 80) {
    noStroke();
    fill(180, 100, 100, 50);
    float diameter = map(dist, 0, 10, 5, 20);
    ellipse(mouseX, mouseY, diameter, diameter);
    if(lastEllipseX > 0 && lastEllipseY > 0) {
      stroke(255);
      line(mouseX, mouseY, lastEllipseX, lastEllipseY);
    }
    totalDist = 0;
    lastEllipseX = mouseX;
    lastEllipseY = mouseY;
  }
}

void mousePressed() {
  background(0);
  lastEllipseX = mouseX;
  lastEllipseY = mouseY;
}

void keyPressed() {
  if(key == 'a') {
    mode = 0;
  }
  if(key == 's') {
    mode = 1;
  }
  if(key == 'd') {
    mode = 2;
  }
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
