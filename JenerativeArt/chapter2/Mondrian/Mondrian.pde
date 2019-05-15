
  int numA = 7;
  int numB = 8;
  float ratio = (sqrt(5) + 1) / 2;   // 黄金数
  float thr = 20;                    // 分割する大きさに関する閾値
  float thr2 = 0.5;                  // 確率を決定する閾値
  
  void setup() {
    size(500, 500);
    colorMode(HSB, 1);
    colorRect(0, 0, width, width);
    divSquare(0, 0, width);
  }
  
  void divSquare(float xPos, float yPos, float wd) {
    int itr = 0;
    float xEndPos = wd + xPos;
    float yEndPos = wd + yPos;
    
    while(wd > thr) {
      itr++;
      if(itr % 2 == 1) {
        while(xPos + wd * ratio < xEndPos + 0.1) {
          fill(color(random(1), 1, 1));
          colorRect(xPos, yPos, wd * ratio, wd);
          if(random(1) < thr2) {
            divRect(xPos, yPos, wd);
          }
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
  
  void colorRect(float xPos, float yPos, float wd, float ht) {
    color col;
    float val = random(1);
    if(val < 0.15) {                 // 確率15%
      col = color(0, 1, 1);          // 赤
    } else if(val < 0.3) {           // 確率15%
      col = color(2.0 / 3, 1, 1);    // 青
    } else if(val < 0.45) {          // 確率15%
      col = color(1.0 / 6, 1, 1);    // 黄
    } else if(val < 0.5) {           // 確率5%
      col = color(0, 1, 0);          // 黒
    } else if(val < 0.7) {           // 確率20%
      col = color(0, 0, 0.9);        // 灰
    } else {                         // 確率30%
      col = color(0, 0, 1);          // 白
    }
    fill(col);
    strokeWeight(5);                 // 長方形の枠線の太さ
    rect(xPos, yPos, wd, ht);
  }
  
  //void mouseClicked() {
  //  numA = int(random(1, 20));
  //  numB = int(random(1, 20));
  //  while(numA == numB) {
  //    numB = int(random(1, 20));
  //  }
  //  thr = int(random(10, 300));
  //  println("numA =", numA, "numB =", numB, "thr =", thr);
  //  ratio = (float)numA / numB;
  //  background(0, 0, 1);
  //  divSquare(0, 0, width);
  //}
  
  void draw(){}
