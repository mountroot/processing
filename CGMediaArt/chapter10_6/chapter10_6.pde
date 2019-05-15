int LENGTH = 200;
ArrayList<PVector> mouseLocs = new ArrayList<PVector>();

void setup() {
  size(640, 400);
  frameRate(60);
  background(0);
  rectMode(CENTER);
  for(int i=0; i<LENGTH; i++) {
    PVector loc = new PVector(width/2, height/2);
    mouseLocs.add(loc);
  }
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  PVector loc = new PVector(mouseX, mouseY);
  mouseLocs.add(loc);
  for(int i=0; i<mouseLocs.size(); i+=10) {
    if(mousePressed) {
      rect(mouseLocs.get(i).x, mouseLocs.get(i).y, i, i);
    } else {
      ellipse(mouseLocs.get(i).x, mouseLocs.get(i).y, i, i);
    }
  }
  if(mouseLocs.size() > LENGTH) {
    mouseLocs.remove(0);
  }
}
