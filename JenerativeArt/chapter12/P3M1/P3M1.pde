
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
  makePatternP3M1();
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

void makePatternP3M1() {
  tile = createShape(GROUP);
  // float gap = random(0.01, 0.5);
  for(int i=0; i < 2; i++) {
    for(int j=0; j < 3; j++) {
      PShape tgl = makeTriangle();
      // PShape tgl = makeRecurTriangle(gap);
      tgl.scale(1, pow(-1, i));
      tgl.rotate(2 * PI * j / 3);
      tile.addChild(tgl);
    }
  }
}

PShape makeTriangle() {
  PShape tgl = loadShape("law.svg");
  return tgl;
}

//PShape makeRecurTriangle(float gap) {
//  PVector[] v = new PVector[3];
//  v[2] = new PVector(0, 0);
//  for(int i=0; i < 2; i++) {
//    v[i] = PVector.fromAngle(i * PI / 3);
//    v[i].mult(scalar / sqrt(3));
//  }
//  PShape tgl = createShape();
//  tgl.beginShape(TRIANGLE);
//  while(v[0].dist(v[i].x, v[i].y) {
//    for(int i=0; i < 3; i++) {
//      tgl.vertex(v[i].x, v[i].y);
//    }
//    v = getVector(v, gap);
//  }
//  tgl.endShape();
//  return tgl;
//}

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
