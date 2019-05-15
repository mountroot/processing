size(500, 500);
colorMode(HSB, 360, 100, 100);
float step=10;
fill(100, 50, 80, 60);
noStroke();
background(0, 0, 100);

for(float i=0; i<TWO_PI; i+=TWO_PI/step) {
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(i);
  triangle(100, -50, -100, -50, 0, 100);
  popMatrix();
}
