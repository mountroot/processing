
  int num = 250;
  int[] state = {1};
  int gen = 0;
  int mod = 5;
  
  void setup() {
    size(500, 500);
  }
  
  void draw() {
    if(gen < num) {
      drawCell(gen);
      updateState();
    }
  }
  
  void drawCell(float y) {
    float scalar = (float) width / num;                // 数字の大きさ
    float x = (width - state.length * scalar) * 0.5;   // 数字を書く位置を x 座標方向にずらす
    y *= scalar;
    noStroke();
    
    for(int i=0; i < state.length; i++) {
      fill(state[i] * 1.0 / mod, state[i] * 1.0 / mod, 1);  // 色相にセルの状態を割り当て
      rect(x, y, scalar, scalar);
      x += scalar;
    }
  }
  
  void updateState() {
    int[] BOUNDARY = {0};
    int[] nextState = new int[state.length + 1];
    state = splice(state, BOUNDARY, 0);
    state = splice(state, BOUNDARY, state.length);
    
    for(int i=0; i < state.length - 1; i++) {
      nextState[i] = transition(i);
    }
    state = nextState;
    gen++;
  }
  
  int transition(int i) {
    int nextC = state[i + 1] + state[i];
    return nextC;
  }
