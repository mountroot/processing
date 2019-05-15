
import controlP5.*;

ControlP5 cp5;
PVector[][] lattice;
PShape tile;
PVector[] base = new PVector[2];
int row = 10;
int col;
float scalar;
color[][] tileColor;
float hor, ver;

void setup() {
  size(500, 500);
  colorMode(HSB, 1);
  scalar = height * 1.0 / row;
  controller();
  makeHexVector();
  col = ceil(row / (base[1].x - 1.0 / sqrt(3)));
  setTileColor();
}

void draw() {
  background(1, 0, 1);
  deformLattice();
  deformHex();
  drawTilling();
}

void mouseClicked() {
  drawTilling();
}

void makeHexVector() {
  base[0] = PVector.fromAngle(PI / 2);
  base[1] = PVector.fromAngle(PI / 6);
}

void deformLattice() {
  int m = ceil(row / base[1].x);
  lattice = new PVector[row + 1][m + 1];
  for(int i=0; i < row + 1; i++) {
    for(int j=0; j < m + 1; j++) {
      PVector v = PVector.mult(base[0], i * scalar);
      v.add(hor * scalar * j / sqrt(3), 0);
      lattice[i][j] = new PVector(v.x, v.y % (height + scalar));
    }
  }
}

void deformHex() {
  PVector[] v = new PVector[6];
  tile = createShape();
  tile.beginShape();
    for(int j=0; j < 6; j++) {
      v[j] = PVector.fromAngle(2 * PI * j / 6);
      v[j].mult(scalar / sqrt(3));
      v[j] = parameterizeTV08(v, j);
    }
  tile.endShape(CLOSE);
}

PVector parameterizeTV08(PVector[] v, int i) {
  if(i % 3 == 0) {
    v[i].mult(1 + hor);
  }
  if(i > 1 && i < 5) {
    v[i].add(0, -0.5 * ver * scalar / sqrt(3));
  } else {
    v[i].add(0, 0.5 * ver * scalar / sqrt(3));
  }
  return v[i];
}

void drawTilling() {
  for(int i=0; i < lattice.length; i++) {
    for(int j=0; j < lattice[0].length; j++) {
      tile.resetMatrix();
      tile.translate(lattice[i][j].x, lattice[i][j].y);
      tile.scale(pow(-1, j), 1);
      tile.setFill(tileColor[i][j]);
      shape(tile);
    }
  }
}
