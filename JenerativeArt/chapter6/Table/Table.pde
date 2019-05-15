
  int mod = 5;
  size(500, 500);
  float scalar = (float) width / mod;
  for(int i=0; i < mod; i++) {
    for(int j=0; j < mod; j++) {
      int num = (i + j) % mod;
      PVector v = new PVector(j, i);
      v.mult(scalar);
      // int num = (i * j) % mod;
      fill(255);
      rect(v.x, v.y, scalar, scalar);
      fill(0);
      textSize(scalar);
      text(num, v.x, v.y + scalar);
    }
  }
