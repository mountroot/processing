import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FermatSpiral extends PApplet {


int itr = 0;
float scalar = 5;

public void setup() {
  
  background(255);
}

public void draw() {
  translate(width / 2, height / 2);
  fill(255, 0, 0, 127);
  drawFermatSpiral(1.0f / 3);
  fill(0, 0, 255, 127);
  drawFermatSpiral(1.0f / 61);
  fill(0, 255, 0, 127);
  drawFermatSpiral(20.0f / 61);
  itr++;
  drawLine(3);
  drawRealCurve(1.0f / 40);
}

public void drawFermatSpiral(float rot) {
  float theta = 2 * PI * itr * rot;
  PVector v = PVector.fromAngle(theta);
  v.mult(scalar * sqrt(itr));
  ellipse(v.x, v.y, scalar, scalar);
}

public void drawLine(int n) {
  for(int i=0; i <= n / 2; i++) {
    PVector v = PVector.fromAngle(2 * i * PI / n);
    v.mult(width / sqrt(2));
    line(v.x, v.y, -v.x, -v.y);
  }
}

public void drawRealCurve(float rot) {
  float STEP = 2 * PI * 0.01f;
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
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FermatSpiral" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
