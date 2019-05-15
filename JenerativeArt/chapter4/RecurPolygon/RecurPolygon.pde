
  GifRecorder recorder = new GifRecorder(this);
  
  PVector[] vec;
  float gap = (float)random(0.2);
  int gon = 8;
  
  void setup() {
    size(1000, 1000);
    vec = new PVector[gon];
    for(int i=0; i < gon; i++) {
      vec[i] = PVector.fromAngle(2 * i * PI / gon);
      vec[i].mult(width / 2);
    }
    
    recorder.onDraw();
  }
  
  void draw() {
    translate(width / 2, height / 2);
    drawPolygon(vec);
    vec = getVector(vec);
  }
  
  void mouseClicked() {
    recorder.recordForSeconds("export.gif", 10);
  }
  
  void drawPolygon(PVector[] v) {
    for(int i=0; i < 8; i++) {
      line(v[i].x, v[i].y, v[(i + 1) % 8].x, v[(i + 1) % 8].y);
    }
  }
  
  PVector[] getVector(PVector[] vec) {
    PVector[] nextVec = new PVector[8];
    for(int i=0; i < 8; i++) {
      PVector dir = PVector.sub(vec[(i + 1) % 8], vec[i]);
      dir.mult(gap);
      nextVec[i] = PVector.add(vec[i], dir);
    }
    return(nextVec);
  }
