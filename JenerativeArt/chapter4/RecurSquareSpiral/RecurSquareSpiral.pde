
  PVector[] vec;
  float gap = 0.02;
  
  void setup() {
    size(1000, 1000);
    vec = new PVector[4];
    vec[0] = new PVector(0, 0);
    vec[1] = new PVector(width, 0);
    vec[2] = new PVector(width, height);
    vec[3] = new PVector(0, height);
    drawLogSpiral();
  }
  
  void draw() {
    drawSquare(vec);
    vec = getVector(vec);
  }
  
  void drawSquare(PVector[] v) {
    for(int i=0; i < 4; i++) {
      line(v[i].x, v[i].y, v[(i + 1) % 4].x, v[(i + 1) % 4].y);
    }
  }
  
  PVector[] getVector(PVector[] vec) {
    PVector[] nextVec = new PVector[4];
    for(int i=0; i < 4; i++) {
      PVector dir = PVector.sub(vec[(i + 1) % 4], vec[i]);
      dir.mult(gap);
      nextVec[i] = PVector.add(vec[i], dir);
    }
    return(nextVec);
  }
  
  void drawLogSpiral() {
    float STEP = 2 * PI * 0.001;
    float b = sqrt(2 * gap * gap - 2 * gap + 1);
    float c = atan(gap / (1 - gap));
    PVector o = new PVector(width / 2, height / 2);
    PVector v = new PVector(0, 0);
    v.sub(o);
    translate(o.x, o.y);
    stroke(color(255, 0, 0));
    strokeWeight(3);
    while(v.mag() > 1) {
      PVector nextV = v.copy();
      nextV.rotate(STEP);
      nextV.mult(pow(b, STEP / c));
      line(v.x, v.y, nextV.x, nextV.y);
      v = nextV;
    }
  }
