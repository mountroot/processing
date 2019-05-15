  
  int rowA = 20;                              // A の行数( C の列数)
  int columnA = 4;                            // A, B の列数(B, C の行数)
  int[][] mtxA = new int[rowA][columnA];
  int[][] mtxB = new int[columnA][columnA];
  int[][] mtxC = new int[columnA][rowA];
  int[][] mtxP = new int[rowA][rowA];
  float scalar;
  
  void setup() {
    
    size(500, 500);
    initialize(mtxA);
    initialize(mtxB);
    initialize(mtxC);
    scalar = (float) height / (rowA + columnA);
  }
  
  void initialize(int[][] mtx) {
    
    int num = 4;
    
    for(int i=0; i < num; i++) {
      for(int j=0; j < num; j++) {
        if(i == num / 2 && j == num / 2) {
          mtx[i][j] = 1;
        } else {
          mtx[i][j] = 0;
        }
      }
    }
  }
  
  void draw() {
    color BLACK = color(255, 255, 255);
    color WHITE = color(0,0,0);
    color colorYoko = color(128, 0, 128);
    color colorTate = color(58, 93, 159);
    mtxP = multMtx(multMtx(mtxA, trMtx(mtxB)), mtxC);
    strokeWeight(1);
    drawTable(mtxA, 0, columnA, BLACK, WHITE);
    drawTable(mtxB, 0, 0, BLACK, WHITE);
    drawTable(mtxC, columnA, 0, BLACK, WHITE);
    drawTable(mtxP, columnA, columnA, colorYoko, colorTate);
    strokeWeight(3);
    line(0, scalar * columnA, width, scalar * columnA);
    line(scalar * columnA, 0, scalar * columnA, height);
  }
  
  void drawTable(int[][] mtx, float x, float y, color c1, color c2) {
    
    float posY = y * scalar;
    
    for(int i=0; i < mtx.length; i++) {
      float posX = x * scalar;
      
      for(int j=0; j < mtx[0].length; j++) {
        if(mtx[i][j] == 0) {
          fill(c2);
        } else {
          fill(c1);
        }
        rect(posX, posY, scalar, scalar);
        posX += scalar;
      }
      posY += scalar;
    }
  }
  
  int[][] multMtx(int[][] mtx1, int[][] mtx2) {   // mtx1 と mtx2 を掛けて返す
  
    int[][] newMtx = new int[mtx1.length][mtx2[0].length];
    
    for(int i=0; i < mtx1.length; i++) {
      for(int j=0; j < mtx2[0].length; j++) {
        int sum = 0;                          // (i,j) 要素の初期化
        
        for(int k=0; k < mtx2.length; k++) {
          sum += mtx1[i][k] * mtx2[k][j];     // 要素を掛けて足す
        }
        newMtx[i][j] = sum;
      }
    }
    return newMtx;
  }
  
  int[][] trMtx(int[][] mtx) {                // mtx を転置して返す
  
    int[][] newMtx = new int[mtx[0].length][mtx.length];
    
    for(int i=0; i < mtx.length; i++) {
      for(int j=0; j < mtx[0].length; j++) {
        newMtx[j][i] = mtx[i][j];             // 要素を入れ替える
      }
    }
    return newMtx;
  }
  
  void mouseClicked() {
    
    int x = floor(mouseX / scalar);
    int y = floor(mouseY / scalar);
    
    if(y < columnA) {
      if(x < columnA) {
        mtxB[y][x] = (mtxB[y][x] + 1) % 2;
      } else {
        mtxC[y][x - columnA] = (mtxC[y][x - columnA] + 1) % 2;
      }
    } else if (x < columnA) {
      mtxA[y - columnA][x] = (mtxA[y - columnA][x] + 1) % 2;
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
