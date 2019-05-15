
  // 横縦比が numA:numB の長方形を正方形によって分割
  int numA = 10;
  int numB = 6;
  int scalar = 50;    // 長方形の拡大倍率
  numA *= scalar;     // 数値の大きさを拡大
  numB *= scalar;
  
  // プログラム実行中に動く変数
  int wd = numB;      // 分割に使用する正方形の幅
  int xPos = 0;       // 正方形の x 位置
  int yPos = 0;       // 正方形の y 位置
  int itr = 0;        // 分割の繰り返し回数

  // 描画
  size(500, 500);
  
  // 繰り返し処理
  while(wd > 0) {     // 幅が 0 になるまで以下を実行
    itr++;
    if(itr % 2 == 1) {
      while(xPos + wd <= numA) {
        rect(xPos, yPos, wd, wd);
        xPos += wd;
      }
      wd = numA - xPos;
    } else {
      while(yPos + wd <= numB) {
        rect(xPos, yPos, wd, wd);
        yPos += wd;
      }
      wd = numB - yPos;
    }
  }
