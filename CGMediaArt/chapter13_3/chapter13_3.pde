void setup() {
  size(1000, 1000, P3D);
}

void draw() {
  background(0);
  translate(0, height/2, -height/4);
  fill(128);
  box(180, 240, 180);
  
  translate(width, 0, -height/2);
  fill(255);
  box(180, 240, 180);
}
