float y;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  frameRate(10);
  y = 0;
}

void draw() {
  //fill(random(360), random(100), random(100)));
  ellipse(250, y, 50, 50);
  y++;
}
