
void setup() {
  size(1000, 1000);
  colorMode(RGB, 255, 255, 255);
  noStroke();
  drawAll();
}

void drawCircle(float x, float y, float r, float strength) {
  if(r < 10 || strength < 0.01) {
    return;
  }
  
  pushStyle();
  pushMatrix();
  
  translate(x, y);
  blendMode(256);
  fill(0, 0, 0);
  ellipse(0, 0, r * 2, r * 2);
  
  int ciliumCount = floor(PI * r * r * strength * 0.2);
  blendMode(ADD);
  for(int i=0; i < ciliumCount; i++) {
    stroke(random(60, 240), 130, 150, random(50, 80) * strength);
    strokeWeight(1 + pow(0.30, strength * 3.00) * 7.0);
    
    float ang = random(TWO_PI);
    float d = (1 - random(1) * random(1) * random(1) * random(1)) * r;
    float dang = random(-1, +1) * PI / 2 * 0.5;
    float len = random(1, 3) * d / r * 3.0;
    line(
      cos(ang) * d, sin(ang) * d,
      cos(ang) * d + cos(ang + dang) * len,
      sin(ang) * d + sin(ang + dang) * len
    );
  }
  
  popMatrix();
  popStyle();
  
  int innerCount = floor(r / 30 * random(0.5, 1));
  for(int i=0; i < innerCount; i++) {
    float ang = random(TWO_PI);
    float subr = random(0.1, 0.3) * r;
    float d = (1 - random(1) * random(1)) * (r - subr);
    drawCircle(
      x + cos(ang) * d,
      y + sin(ang) * d,
      subr,
      strength * random(0.1, 1.0)
    );
  }
}

void drawAll() {
  background(0);
  drawCircle(
    width / 2, height / 2,
    dist(0, 0, width / 2, height / 2),
    0.2
  );
  
  int count = floor(random(1, 4));
  for(int i=0; i < count; i++) {
    drawCircle(
      random(width), random(height),
      random(100, 400),
      1.0
    );
  }
}

void mousePressed() {
  drawAll();
}

void draw() {}
