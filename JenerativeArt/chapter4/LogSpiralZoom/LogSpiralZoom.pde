
float STEP = 2 * PI * 0.01;

void setup() {
  size(500, 500);
  colorMode(HSB, 1);
}

void draw() {
  background(1, 0.1);
  drawLogSpiral();
}

void drawLogSpiral() {
  float theta = 0;
  float scalar = pow(10, (float)mouseX / width) * height / 2;
  translate(width / 2, height / 2);
  for(int i=0; i < 2000; i++) {
    line(scalar * rad(theta) * cos(theta),
      scalar * rad(theta) * sin(theta),
      scalar * rad(theta + STEP) * cos(theta + STEP),
      scalar * rad(theta + STEP) * sin(theta + STEP));
    theta -= STEP;
  }
}

float rad(float t) {
  float r = pow(1.1, t);
  return(r);
}
