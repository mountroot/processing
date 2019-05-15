void setup() {
  size(1000, 1000, P3D);
}

void draw() {
  background(0);
  
  lights();
  
  translate(0, height/2, -height/2);
  fill(153);
  box(150);
  
  translate(width, 0, 0);
  fill(255);
  sphere(150);
}
