
int itr = 0;
float scalar = 5;

void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  translate(width / 2, height / 2);
  fill(255, 0, 0, 127);
  drawFermatSpiral(1.0 / 3);
  fill(0, 0, 255, 127);
  drawFermatSpiral(1.0 / 61);
  fill(0, 255, 0, 127);
  drawFermatSpiral(20.0 / 61);
  itr++;
  drawLine(3);
  drawRealCurve(1.0 / 40);
}

void drawFermatSpiral(float rot) {
  float theta = 2 * PI * itr * rot;
  PVector v = PVector.fromAngle(theta);
  v.mult(scalar * sqrt(itr));
  ellipse(v.x, v.y, scalar, scalar);
}

void drawLine(int n) {
  for(int i=0; i <= n / 2; i++) {
    PVector v = PVector.fromAngle(2 * i * PI / n);
    v.mult(width / sqrt(2));
    line(v.x, v.y, -v.x, -v.y);
  }
}

void drawRealCurve(float rot) {
  float STEP = 2 * PI * 0.01;
  float theta = 0;
  float rad = 0;
  noFill();
  beginShape();
  while(rad < width / sqrt(2)) {
    rad = scalar * sqrt(theta / (2 * PI * rot));
    PVector v = PVector.fromAngle(theta);
    v.mult(rad);
    vertex(v.x, v.y);
    theta += STEP;
  }
  endShape();
}
