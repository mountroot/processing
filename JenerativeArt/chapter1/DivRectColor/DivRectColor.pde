
  // 横縦比が numA:numB の長方形を正方形によって分割
  int numA = 14;
  int numB = 9;
  int scalar = 50;    // 長方形の拡大倍率
  numA *= scalar;     // 数値の大きさを拡大
  numB *= scalar;
  
  // プログラム実行中に動く変数
  int wd = numB;      // 分割に使用する正方形の幅
  int xPos = 0;       // 正方形の x 位置
  int yPos = 0;       // 正方形の y 位置
  int itr = 0;        // 分割の繰り返し回数
  
  // 色付け
  color col;
  colorMode(HSB, 1);  // 01 区間をパラメータとする HSB 色形式を使用

  // 描画
  size(1000, 1000);
  
  // 繰り返し処理
  while(wd > 0) {     // 幅が 0 になるまで以下を実行
    itr++;
    if(itr % 2 == 1) {
      while(xPos + wd <= numA) {
        col = color(random(1), 1, 1);
        fill(col);
        rect(xPos, yPos, wd, wd);
        xPos += wd;
      }
      wd = numA - xPos;
    } else {
      while(yPos + wd <= numB) {
        col = color(random(1), 1, 1);
        fill(col);
        rect(xPos, yPos, wd, wd);
        yPos += wd;
      }
      wd = numB - yPos;
    }
  }
