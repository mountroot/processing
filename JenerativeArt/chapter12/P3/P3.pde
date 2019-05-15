
int num = 10;
PVector[][] lattice;
PShape tile;
PVector[] base = new PVector[2];
float scalar;

void setup() {
  size(500, 500);
  colorMode(HSB, 1);
  scalar = height * 1.0 / num;
  makeHexVector();
  makeLattice();
  makePatternP3();
  drawTilling();
}

void draw() {}

void mouseClicked() {
  drawTilling();
}

void makeHexVector() {
  base[0] = PVector.fromAngle(PI / 2);
  base[1] = PVector.fromAngle(PI / 6);
}

void makeLattice() {
  int m = ceil(num / base[1].x);
  lattice = new PVector[num + 1][m + 1];
  for(int i=0; i < num + 1; i++) {
    for(int j=0; j < m + 1; j++) {
      PVector v = PVector.mult(base[0], i * scalar);
      v.add(PVector.mult(base[1], j * scalar));
      lattice[i][j] = new PVector(v.x, v.y % (height + scalar));
    }
  }
}

void makePatternP3() {
  tile = createShape(GROUP);
  float[] rand = new float[4];
  for(int i=0; i < 4; i++) {
    rand[i] = random(-1, 1);
  }
  for(int i=0; i < 3; i++) {
    PShape rhomb = makeRhomb(rand);
    rhomb.rotate(2 * PI * i / 3);
    tile.addChild(rhomb);
  }
  tile.setFill(color(random(1), 1, 1));
}

PShape makeRhomb(float[] rand) {
  PVector[] v = new PVector[2];
  for(int i=0; i < 2; i++) {
    v[i] = PVector.fromAngle(2 * PI * i / 3);
    v[i].mult(scalar / sqrt(3));
  }
  PVector[] ctr = new PVector[4];
  for(int i=0; i < 4; i++) {
    ctr[i] = PVector.sub(v[(i + 1) % 2], v[i % 2]);
    ctr[i].rotate(rand[i] * PI / 3);
    ctr[i].add(v[i % 2]);
  }
  PShape rhomb = createShape();
  rhomb.beginShape();
  rhomb.vertex(v[0].x, v[0].y);
  rhomb.bezierVertex(ctr[0].x, ctr[0].y,
    ctr[1].x, ctr[1].y,
    v[1].x, v[1].y);
  rhomb.bezierVertex(ctr[3].x, ctr[3].y,
    ctr[2].x, ctr[2].y,
    v[0].x, v[0].y);
  rhomb.endShape();
  return rhomb;
}

void drawTilling() {
  for(PVector[] vecArr : lattice) {
    for(PVector vec : vecArr) {
      tile.resetMatrix();
      tile.translate(vec.x, vec.y);
      tile.setFill(color(random(1), 1, 1));
      shape(tile);
    }
  }
}
