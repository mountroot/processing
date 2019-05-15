void setup() {
  size(500, 500);
  noLoop();
}

void draw() {
  nGram(width/2, height/2, 150, 100, 20);
}

void nGram(float x, float y, float r_out, float r_in, int n) {
  float[] cv_x = new float[n*2];
  float[] cv_y = new float[n*2];
  float angle = TWO_PI / (n*2);
  
  for(int step=0; step<n*2; step+= 2) {
    cv_x[step] = x + cos(step * angle) * r_out;
    cv_y[step] = y + sin(step * angle) * r_out;
    fill(0);
    ellipse(cv_x[step], cv_y[step], 10, 10);
  }
  
  for(int step=1; step < n*2; step += 2) {
    cv_x[step] = x + cos(step * angle) * r_in;
    cv_y[step] = y + sin(step * angle) * r_in;
    fill(255);
    ellipse(cv_x[step], cv_y[step], 10, 10);
  }
  //beginShape();
  //for(int step=0; step < n*2; step++) {
  //  curveVertex(cv_x[step], cv_y[step]);
  //}
  //curveVertex(cv_x[0], cv_y[0]);
  //curveVertex(cv_x[1], cv_y[1]);
  //curveVertex(cv_x[2], cv_y[2]);
  //endShape(CLOSE);
}
