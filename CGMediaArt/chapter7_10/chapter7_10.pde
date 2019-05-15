int count;
float radius;
float x1, y1;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 0, 100);
  count = 10;
  radius = 250;
  noStroke();
  noLoop();
  x1 = width/2;
  y1 = height/2;
}

void draw() {
  circleInCircle(x1, y1, radius);
}

void circleInCircle(float x1, float y1, float radius) {
  fill(random(180, 200), 80, 100, 110 - count*10);
  ellipse(x1, y1, radius*2, radius*2);
  if(count > 0) {
    count--;
    float x2 = x1 + random(-radius/2.0, radius/2.0);
    float y2 = y1 + random(-radius/2.0, radius/2.0);
    radius = radius - dist(x1, y1, x2, y2);
    circleInCircle(x2, y2, radius);
  }
}
