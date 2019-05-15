int[] x = new int[4];
int[] y = new int[4];
int clickNum;
void setup() {
  size(500, 500);
  clickNum = 0;
}

void draw() {
}

void mousePressed() {
  x[clickNum] = mouseX;
  y[clickNum] = mouseY;
  
  ellipse(mouseX, mouseY, 10, 10);
  if(clickNum > 0) {
    line(x[clickNum], y[clickNum], x[clickNum-1], y[clickNum-1]);
  }
  
  if(clickNum == 3) {
    bezier(
      x[0], y[0],
      x[1], y[1],
      x[2], y[2],
      x[3], y[3]
  );
  clickNum = 0;
  } else {
    clickNum++;
  }
}
