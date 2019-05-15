
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
  makeHex();
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

void makeHex() {
  tile = createShape();
  tile.beginShape();
  for(int i=0; i < 6; i++) {
    PVector v = PVector.fromAngle(2 * PI * i / 6);
    v.mult(scalar / sqrt(3));
    tile.vertex(v.x, v.y);
  }
  tile.endShape(CLOSE);
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
