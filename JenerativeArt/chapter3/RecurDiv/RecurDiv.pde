
  int num = 10;
  int thr = 1;
  int[] fib;
  int[] SGN = { 1, 1, -1, -1 };
  
  void setup() {
    size(500, 500);
    colorMode(HSB, 1);
    background(0, 0, 1);
    generateFib(num);
    divSquare(0, 0, 0, 0, 1, 1);
  }
  
  void divSquare(float xPos, float yPos, int ind, int itr, int sgnX, int sgnY) {
    
    for(int i=0; i < num; i++) {
      float lng0 = fib[i + ind + 1];
      float lng1 = fib[i + ind];
      int newSgnX = sgnX * SGN[i % 4];
      int newSgnY = sgnY * SGN[(i + 1) % 4];
      
      colRect(xPos, yPos, newSgnX * lng0, newSgnY * lgn1, ind + i + 1);
      xPos += newSgnX * lng0;
      yPos += newSgnY * lng1;
      
      if(itr < thr) {
        divRect(xPos, yPos, i + ind + 1, itr + 1, -newSgnX, -newSgnY);
      }
    }
  }
  
