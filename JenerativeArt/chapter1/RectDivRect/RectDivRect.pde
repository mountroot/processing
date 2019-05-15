
  int numA = 10;
  int numB = 7;
  float ratio = (float) numB / numA;
    
  void setup() {
    size(1000, 1000);
    colorMode(HSB, 1);
    float wd = width * ratio;
    float xPos = 0;
    float yPos = 0;
    int itr = 0;
  
    while(wd > 0.1) {
      itr++;
      if(itr % 2 == 1) {
        while(xPos + wd < width + 0.1) {
          divSquare(xPos, yPos, wd);
          xPos += wd;
        }
        wd = width - xPos;
      } else {
        while (yPos + wd / ratio < width + 0.1) {
          divSquare(xPos, yPos, wd);
          yPos += wd;
        }
        wd = width * ratio - yPos;
      } 
    }
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
          rect(xPos, yPos, wd * ratio, wd);
          xPos += wd * ratio;
        }
        wd = xEndPos - xPos;
      } else {
        while(yPos + wd / ratio < yEndPos + 0.1) {
          fill(color(random(1), 1, 1));
          rect(xPos, yPos, wd, wd / ratio);
          yPos += wd / ratio;
        }
        wd = yEndPos - yPos;
      }
    }
  }
