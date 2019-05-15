
  int numA = 7;
  int numB = 8;
  float ratio = (float) numB / numA;
  float thr = 10;
  
  void setup() {
    size(1000, 1000);
    colorMode(HSB, 1);
    divSquare(0, 0, width);
  }
  
  void divSquare(float xPos, float yPos, float wd) {
    int itr = 0;
    float xEndPos = wd + xPos;
    float yEndPos = wd + yPos;
    
    while(wd > 0.1) {
      itr++;
      if(itr % 2 == 1) {
        while(xPos + wd * ratio < xEndPos + 0.1) {
          fill(color(random(1), 1, 1));
          divRect(xPos, yPos, wd);
          xPos += wd * ratio;
        }
        wd = xEndPos - xPos;
      } else {
        while(yPos + wd / ratio < yEndPos + 0.1) {
          fill(color(random(1), 1, 1));
          divRect(xPos, yPos, wd);
          yPos += wd / ratio;
        }
        wd = yEndPos - yPos;
      }
    }
  }
  
  void divRect(float xPos, float yPos, float wd) {
    int itr = 0;
    float xEndPos = xPos + wd;
    float yEndPos = yPos + wd / ratio;
    fill(color(random(1), 1, 1));
    rect(xPos, yPos, wd, wd / ratio);
      while(wd > thr) {
      itr++;
      if(itr % 2 == 0) {
        while(xPos + wd < xEndPos + 0.1) {
          divSquare(xPos, yPos, wd);
          xPos += wd;
        }
        wd = xEndPos - xPos;
      } else {
        while(yPos + wd < yEndPos + 0.1) {
          divSquare(xPos, yPos, wd);
          yPos += wd;
        }
        wd = yEndPos - yPos;
      }
    }
  }
  
  void mouseClicked() {
    numA = int(random(1, 20));
    numB = int(random(1, 20));
    while(numA == numB) {
      numB = int(random(1, 20));
    }
    thr = int(random(10, 300));
    println("numA =", numA, "numB =", numB, "thr =", thr);
    ratio = (float)numA / numB;
    background(0, 0, 1);
    divSquare(0, 0, width);
  }
  
  void draw(){}
