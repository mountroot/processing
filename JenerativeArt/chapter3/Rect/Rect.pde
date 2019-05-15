
  int[] fib = {0, 1};
  
  void setup() {
    size(500, 500);
    colorMode(HSB, 1);
    drawRect();
  }
  
  void drawRect() {
    int[] SGN = {-1, 1, 1, -1};
    float xPos = 0;
    float yPos = 0;
    float scalar = (float) width / (2 * fib[fib.length - 1]);
    background(0, 0, 1);
    translate(width / 2, height / 2);
    
    for(int i=1; i < fib.length - 1; i++) {
      fill((0.1 * i) % 1, 1, 1);
      rect(scalar * xPos,
        scalar * yPos,
        scalar * SGN[(i + 1) % 4] * fib[i - 1],
        scalar * SGN[i % 4] * fib[i]);
      
      if(i % 2 == 1) {
        xPos += SGN[i % 4] * (fib[i - 1] + fib[i]);
      }
    }
  }
  
  void mouseClicked() {
    int nextFib = fib[fib.length - 2] + fib[fib.length - 1];
    fib = append(fib, nextFib);
    drawRect();
    println(nextFib);
  }
  
  void draw() {}
