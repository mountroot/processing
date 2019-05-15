
  int num = 250;
  int[][] state = new int[num][num];
  int mod = 4;
  
  void setup() {
    size(500, 500);
    colorMode(HSB, 1);
    initialize();
  }
  
  void draw() {
      drawCell();
      updateState();
  }
  
  void drawCell() {
    float scalar = (float) width / num;                // 数字の大きさ
    float x = (width - state.length * scalar) * 0.5;   // 数字を書く位置を x 座標方向にずらす
    
    for(int i=0; i < state.length; i++) {
      for(int j=0; j < state.length; j++) {
        fill(state[i][j] * 1.0 / mod, state[i][j] * 1.0 / mod, 1);  // 色相にセルの状態を割り当て
        rect(x, x, scalar, scalar);
        x += scalar;
      }
    }
  }
  
  void initialize() {
    for(int i=0; i < num; i++) {
      for(int j=0; j < num; j++) {
        if(i == num / 2 && j == num / 2) {
          state[i][j] = 1;
        } else {
          state[i][j] = 0;
        }
      }
    }
  }
  
  void updateState() {
    int[][] nextState = new int[num][num];
    
    for(int i=0; i < num; i++) {
      for(int j=0; j < num; j++) {
        nextState[i][j] = transition(i, j);
      }
    }
    state = nextState;
  }
  
  int transition(int i, int j) {
    int nextC;
    nextC = state[(i - 1 + num) % num][j]    // 上セル
      + state[i][(j -1 + num) % num]         // 左セル
      + state[i][j]                          // 中央セル
      + state[i][(j + 1) % num]              // 右セル
      + state[(i + 1) % num][j];
    nextC = nextC % mod;
    return nextC;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
