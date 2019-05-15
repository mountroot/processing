
  int[] fib = {0, 1};
  
  void setup() {
    size(500, 500);
    colorMode(HSB, 1);
    drawSquare();
  }
  
  void drawSquare() {
    float xPos = 0;
    float yPos = 0;
    float nextFib = fib[fib.length - 2] + fib[fib.length - 1];
    float scalar = (float) width / nextFib;
    background(0, 0, 1);
    
    for(int i=1; i < fib.length; i++) {
      fill((0.1 * i) % 1, 1, 1);
      rect(scalar * xPos,
        scalar * yPos,
        scalar * fib[i],
        scalar * fib[i]);
      
      if(i % 2 == 1) {
        xPos += fib[i];
        yPos -= fib[i - 1];
      } else {
        xPos -= fib[i - 1];
        yPos += fib[i];
      }
    }
  }
  
  void mouseClicked() {
    int nextFib = fib[fib.length - 2] + fib[fib.length - 1];
    fib = append(fib, nextFib);
    drawSquare();
    println(nextFib);
  }
  
  void draw() {}
