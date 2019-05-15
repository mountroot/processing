
  int[] fib = {0, 1, 1};
  int[] SGN = {-1, 1, 1, -1};
  
  void setup() {
    size(500, 500);
    translate(width / 2, height /2);
    stroke(0);
    drawSpiral();
    stroke(255, 0, 0);
    drawGoldSpiral();
  }
  
  void drawSpiral() {
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
        scalar * SGN[(i + 1) % 4] * fib[i],
        scalar * SGN[i % 4] * fib[i]);
      arc(scalar * (xPos + SGN[(i + 1) % 4] * fib[i]),
        scalar * (yPos + SGN[i % 4] * fib[i]),
        scalar * 2 * fib[i],
        scalar * 2 * fib[i],
        (1 + i) * PI / 2,
        (2 + i) * PI / 2);
      
      if(i % 2 == 1) {
        xPos += SGN[i % 4] * (fib[i] + fib[i + 1]);
      } else {
        yPos += SGN[i % 4] * (fib[i] + fib[i + 1]);
      }
    }
  }
  
  void drawGoldSpiral() {
    float scalar = (float) width / (2 * fib[fib.length - 1]);
    float PHI = (1 + sqrt(5)) / 2;
    float STEP = -PI / 50;
    PVector o = new PVector(1, 1);
    PVector v = new PVector(0, 1);
    for(int i=1; i < fib.length - 1; i++) {
      v.add(SGN[i % 4] * fib[i], SGN[(i - 1) % 4] * fib[i]);
    }
    v.sub(o);
    v.mult(scalar);
    translate(scalar, scalar);
    for(int i=0; i < (fib.length - 2) * 25; i++) {
      PVector nextV = v.copy();
      nextV.rotate(STEP);
      nextV.mult(pow(PHI, 2 * STEP / PI));
      line(v.x, v.y, nextV.x, nextV.y);
      v = nextV;
    }
  }
  
  void mouseClicked() {
    int nextFib = fib[fib.length - 2] + fib[fib.length - 1];
    fib = append(fib, nextFib);
    drawSpiral();
    println(nextFib);
  }
  
  void draw() {}
