size(500, 500);
colorMode(HSB, 360, 100, 100);
float step=30;
fill(100, 50, 80, 60);
noStroke();
background(0, 0, 100);

for(float i=0; i<TWO_PI; i+=TWO_PI/step) {
  rotate(i);
  triangle(250, 200, 200, 300, 300, 300);
}
