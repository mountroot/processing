  
  int[][] mtxA = {{2, 1}, {0, 1}};            // 行列 A
  int[][] mtxB = {{3}, {1}};                  // 行列 B
  
  void setup() {
    size(500, 500);
    colorMode(HSB, 1);
    int[][] mtx = multMtx(mtxA, mtxB);        // 行列 A と 行列 B の積
    println("mult: ");
    
    for(int i=0; i < mtx.length; i++) {
      println("row: " + i);
      printArray(mtx[i]);                     // i 列の配列を表示
    }
    
    mtx = trMtx(mtxA);                        // 行列 A の転置
    println("transpose: ");
    
    for(int i=0; i < mtx.length; i++) {
      println("row: " + i);
      printArray(mtx[i]);                     // i 列の配列を表示
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
