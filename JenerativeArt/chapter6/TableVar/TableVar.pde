
  int mod = 17;
  size(500, 500);
  colorMode(HSB, 1);
  float scalar = (float) width / mod;
  for(int i=0; i < mod; i++) {
    for(int j=0; j < mod; j++) {
      int num = (i + j) % mod;
      PVector v = new PVector(j, i);
      v.mult(scalar);
      // int num = (i * j) % mod;
      fill(num * 1.0 / mod, 1, 1);
      noStroke();
      ellipse(v.x, v.y, scalar / 2, scalar / 2);
      fill(255);
      ellipse(v.x, v.y, scalar * num / mod, scalar * num / mod);
    }
  }
